import json
from logging import root
import graphviz
import uuid


class Project:

    def __init__(self, raw_data: str):
        self.data = json.loads(raw_data)
        self.creator = self.data["creator"] or "Undefined"
        self.modules = self.data["modules"] or {}
        self.inputs = []
        self.outputs = []
        self.parents = []
        self.parents_connected = []
        self.top_module = None

    def connect_to_parent(self, root_graph, parent, parent_uuid, preparent, preparent_uuid):
        if (parent + "_" + parent_uuid) in self.parents_connected:
            return 0
        else:
            self.parents_connected.append(parent + "_" + parent_uuid)

            cells = self.modules[preparent]["cells"].values()
            parent_cell = list(filter(lambda x: x['type'] == parent, cells))[0]
            ports = parent_cell["connections"]
            for port_name in ports:
                preparent_port = {
                        "name": port_name,
                        "from_bit": ports[port_name][0],
                        "to_bit": ports[port_name][-1]
                    }
                port = {
                        "name": port_name,
                        "from_bit": self.modules[parent]["ports"][port_name]["bits"][0],
                        "to_bit": self.modules[parent]["ports"][port_name]["bits"][-1]
                    }
                if parent_cell["port_directions"][port_name] == "input":
                    root_graph.body.append(
                        f"""connection_{preparent + "_" + preparent_uuid}_{preparent_port["from_bit"]}_{preparent_port["to_bit"]}"""
                        + " -- " +
                        f"""struct_in_ports_{parent + "_" + parent_uuid}:in_port_{port["from_bit"]}_{port["to_bit"]} [label={port["name"]}_outer]"""
                        )
                else:
                    # pass
                    root_graph.body.append(
                        f"""struct_out_ports_{parent + "_" + parent_uuid}:out_port_{port["from_bit"]}_{port["to_bit"]}""" + " -- " +
                        f"""connection_{preparent + "_" + preparent_uuid}_{preparent_port["from_bit"]}_{preparent_port["to_bit"]} [label={port["name"]}_outer]"""
                        )
        return 0

    def add_ports(self, root_graph, root_node, root_uuid):
        if (root_node + "_" + root_uuid) in self.parents:
            return 0
        else:
            self.parents.append(root_node + "_" + root_uuid)

            print("ports of: " + root_node)
            in_ports = []
            out_ports = []
            ports = self.modules[root_node]["ports"]
            for port_name in ports:
                if ports[port_name]["direction"] == "input":
                    in_ports.append({
                        "name": port_name,
                        "from_bit": self.modules[root_node]["ports"][port_name]["bits"][0],
                        "to_bit": self.modules[root_node]["ports"][port_name]["bits"][-1]
                    })
                else: 
                    out_ports.append({
                        "name": port_name,
                        "from_bit": self.modules[root_node]["ports"][port_name]["bits"][0],
                        "to_bit": self.modules[root_node]["ports"][port_name]["bits"][-1]
                    })
            in_ports_str = ""
            out_ports_str = ""
            for port in in_ports:
                in_ports_str += f"""<in_port_{port["from_bit"]}_{port["to_bit"]}> {port["name"]} |"""
            for port in out_ports:
                out_ports_str += f"""<out_port_{port["from_bit"]}_{port["to_bit"]}> {port["name"]} |"""

                # root_graph.body.append(f"""connection_{port["from_bit"]}_{port["to_bit"]} [shape=point]""")
                # root_graph.body.append(
                #         f"""struct_{root_node}:in_port_{port["from_bit"]}_{port["to_bit"]} [label={port["name"]}]""" + " -- " +
                #         f"""connection_{port["from_bit"]}_{port["to_bit"]}"""
                #         )

            root_graph.body.append("struct_in_ports_" + root_node + "_" + root_uuid + """ [label="{""" + "{" + in_ports_str + "}" + """}"];""")
            root_graph.body.append("struct_out_ports_" + root_node + "_" + root_uuid + """ [label="{""" + "{" + out_ports_str + "}" + """}"];""")

            for port in in_ports:
                root_graph.body.append(f"""connection_{root_node + "_" + root_uuid}_{port["from_bit"]}_{port["to_bit"]} [shape=point]""")
                root_graph.body.append(
                        f"""struct_in_ports_{root_node + "_" + root_uuid}:in_port_{port["from_bit"]}_{port["to_bit"]}""" + " -- " +
                        f"""connection_{root_node + "_" + root_uuid}_{port["from_bit"]}_{port["to_bit"]} [label={port["name"]}_inner_{root_node}]"""
                        )
            
            for port in out_ports:
                root_graph.body.append(f"""connection_{root_node + "_" + root_uuid}_{port["from_bit"]}_{port["to_bit"]} [shape=point]""")
                root_graph.body.append(
                        f"""connection_{root_node + "_" + root_uuid}_{port["from_bit"]}_{port["to_bit"]}"""
                        + " -- " +
                        f"""struct_out_ports_{root_node + "_" + root_uuid}:out_port_{port["from_bit"]}_{port["to_bit"]} [label={port["name"]}_inner]"""
                        )

            # root_graph.body.append("struct_" + root_node + f"""_in_ports [label="{in_ports_str}" """)
            return 0
        

    def add_connections(self, uuid_str, root_node, root_graph, parent, parent_uuid, preparent, preparent_uuid, in_ports, out_ports):
        # if preparent != None:
        if False:
            for port in in_ports:
                cells = self.modules[preparent]["cells"].values()
                parent_cell = list(filter(lambda x: x['type'] == parent, cells))[0]
                port_name = port["name"]
                parent_in_port = {
                    "name": port_name,
                    "from_bit": parent_cell["connections"][port_name][0],
                    "to_bit": parent_cell["connections"][port_name][-1]
                }
                # root_graph.body.append(f"""connection_{parent + "_" + parent_uuid}_{parent_in_port["from_bit"]}_{parent_in_port["to_bit"]} [shape=point]""")
                root_graph.body.append(
                        f"""connection_{parent + "_" + parent_uuid}_{parent_in_port["from_bit"]}_{parent_in_port["to_bit"]}""" + " -- " +
                        f"""struct_{root_node + "_" + uuid_str + "_" + parent_uuid}:in_{port["from_bit"]}_{port["to_bit"]} [label={port["name"]}]"""
                        )
        else:
            for port in in_ports:
                cells = self.modules[parent]["cells"].values()
                parent_cell = list(filter(lambda x: x['type'] == root_node, cells))[0]
                port_name = port["name"]
                parent_in_port = {
                    "name": port_name,
                    "from_bit": parent_cell["connections"][port_name][0],
                    "to_bit": parent_cell["connections"][port_name][-1]
                }
                # root_graph.body.append(f"""connection_{parent + "_" + parent_uuid}_{port["from_bit"]}_{port["to_bit"]} [shape=point]""")
                root_graph.body.append(
                        f"""connection_{parent + "_" + parent_uuid}_{parent_in_port["from_bit"]}_{parent_in_port["to_bit"]}""" + " -- " +
                        f"""struct_{root_node + "_" + uuid_str + "_" + parent_uuid}:in_{port["from_bit"]}_{port["to_bit"]} [label={port["name"]}]"""
                        )
        for port in out_ports:
            cells = self.modules[parent]["cells"].values()
            parent_cell = list(filter(lambda x: x['type'] == root_node, cells))[0]
            port_name = port["name"]
            parent_out_port = {
                "name": port_name,
                "from_bit": parent_cell["connections"][port_name][0],
                "to_bit": parent_cell["connections"][port_name][-1]
            }
            root_graph.body.append(f"""connection_{parent + "_" + parent_uuid}_{parent_out_port["from_bit"]}_{parent_out_port["to_bit"]} [shape=point]""")
            root_graph.body.append(
                f"""struct_{root_node + "_" + uuid_str + "_" + parent_uuid}:out_{port["from_bit"]}_{port["to_bit"]}""" + " -- " +
                f"""connection_{parent + "_" + parent_uuid}_{parent_out_port["from_bit"]}_{parent_out_port["to_bit"]} [label={port["name"]}]"""
                )
        return 0

    def stuct_to_graphviz(self, uuid_str: str, root_node: str, root_graph, parent, parent_uuid, preparent, preparent_uuid):
        module = self.modules[root_node]
        in_ports = []
        out_ports = []
        for port in module["ports"]:
            if module["ports"][port]["direction"] == "input":
                in_ports.append({
                    "name": port,
                    "from_bit": module["ports"][port]["bits"][0],
                    "to_bit": module["ports"][port]["bits"][-1]
                })
            else:
                out_ports.append({
                    "name": port,
                    "from_bit": module["ports"][port]["bits"][0],
                    "to_bit": module["ports"][port]["bits"][-1]
                })
        in_ports_str = ""
        for port in in_ports:
            in_ports_str += f"""<in_{port["from_bit"]}_{port["to_bit"]}> {port["name"]} |"""
        out_ports_str = ""
        for port in out_ports:
            out_ports_str += f"""<out_{port["from_bit"]}_{port["to_bit"]}> {port["name"]} |"""

        root_graph.body.append("struct_" + root_node + "_" + uuid_str + "_" + parent_uuid + """ [label="{""" + "{" + in_ports_str + "}|" + root_node + "|{" + out_ports_str + "}" + """}"];""")

        self.add_connections(uuid_str, root_node, root_graph, parent, parent_uuid, preparent, preparent_uuid, in_ports, out_ports)
        return (in_ports, out_ports)
    
    def add_synth_connections(self, synth_elem, synth_uuid_str, root_graph, in_ports, out_ports, parent, parent_uuid):
        struct = "struct_" + synth_elem['type'][1:] + "_" + synth_uuid_str + \
            "_" + parent + "_" + parent_uuid 

        parent_cell = synth_elem
        for port in in_ports:
                port_name = port["name"]
                parent_in_port = {
                    "name": port_name,
                    "from_bit": parent_cell["connections"][port_name][0],
                    "to_bit": parent_cell["connections"][port_name][-1]
                }
                root_graph.body.append(f"""connection_{parent + "_" + parent_uuid}_{port["from_bit"]}_{port["to_bit"]} [shape=point]""")
                root_graph.body.append(
                        f"""connection_{parent + "_" + parent_uuid}_{parent_in_port["from_bit"]}_{parent_in_port["to_bit"]}""" + " -- " +
                        f"""{struct}:in_{port["from_bit"]}_{port["to_bit"]} [label={port["name"]}]"""
                        )
        for port in out_ports:
                port_name = port["name"]
                parent_out_port = {
                    "name": port_name,
                    "from_bit": parent_cell["connections"][port_name][0],
                    "to_bit": parent_cell["connections"][port_name][-1]
                }
                root_graph.body.append(f"""connection_{parent + "_" + parent_uuid}_{port["from_bit"]}_{port["to_bit"]} [shape=point]""")
                root_graph.body.append(
                    f"""{struct}:out_{port["from_bit"]}_{port["to_bit"]}""" + " -- " +
                    f"""connection_{parent + "_" + parent_uuid}_{parent_out_port["from_bit"]}_{parent_out_port["to_bit"]} [label={port["name"]}]"""
                    )
        pass

    def synth_to_graphviz(self, synth_elem, root_graph, parent, parent_uuid):
        in_ports = []
        out_ports = []
        synth_uuid_str = str(uuid.uuid4()).replace("-", "_")
        for port in synth_elem['port_directions']:
            if synth_elem['port_directions'][port] == "input":
                in_ports.append({
                    "name": port,
                    "from_bit": synth_elem["connections"][port][0],
                    "to_bit": synth_elem["connections"][port][-1]
                })
            else:
                out_ports.append({
                    "name": port,
                    "from_bit": synth_elem["connections"][port][0],
                    "to_bit": synth_elem["connections"][port][-1]
                })
        in_ports_str = ""
        for port in in_ports:
            in_ports_str += f"""<in_{port["from_bit"]}_{port["to_bit"]}> {port["name"]} |"""
        out_ports_str = ""
        for port in out_ports:
            out_ports_str += f"""<out_{port["from_bit"]}_{port["to_bit"]}> {port["name"]} |"""

        root_graph.body.append("struct_" + synth_elem['type'][1:] + "_" + synth_uuid_str + \
            "_" + parent + "_" + parent_uuid + \
            """ [label="{""" + "{" + in_ports_str + "}|" + synth_elem['type'][1:] + "|{" + out_ports_str + "}" + """}"];""")

        self.add_synth_connections(synth_elem, synth_uuid_str, root_graph, \
            in_ports, out_ports, parent, parent_uuid)
        pass

    def to_graphviz(self, root_node: str, depth: int = 0, root_graph=None, max_depth: int = 0, \
        parent=None, parent_uuid=None, preparent=None, preparent_uuid=None):

        self.top_module = self.top_module or root_node

        root_graph = root_graph or graphviz.Graph('parent', engine="dot")
        root_graph.attr("graph", splines='polyline')
        root_graph.attr("graph", rankdir='LR')
        # root_graph.attr("graph", remincross="true")
        root_graph.attr("graph", overlap='scalexy')
        uuid_str = str(uuid.uuid4()).replace("-", "_")

        if root_node[0] != "$":
        # if True:
            s = ((depth * "*") + root_node +
                 "(" + self.modules[root_node]["attributes"]["src"] + ")\n")
            children = list(self.modules[root_node]["cells"].values())
            if len(list(filter(lambda x: x['type'][0] != "$", children))) != 0:
            # if True:
                with root_graph.subgraph(name='cluster_'+root_node, node_attr={'shape': 'record'}) as c:
                    c.attr('graph', label=root_node)
                    for x in children:
                        self.to_graphviz(x['type'], depth + 1, c, parent=root_node, parent_uuid=uuid_str, \
                            preparent=parent, preparent_uuid=parent_uuid)
                        if (x['type'][0] == '$') and (parent != None):
                            self.synth_to_graphviz(x, c, root_node, uuid_str)
                    # self.add_ports(root_graph, root_node, uuid_str)
            else:
                # root_graph.node(s + "#" + uuid_str, s)
                in_ports, out_ports = self.stuct_to_graphviz(uuid_str, root_node, root_graph,\
                    parent, parent_uuid, preparent, preparent_uuid)
                # self.add_connections(root_graph, root_node, in_ports, out_ports)
            if parent != None:
                    self.add_ports(root_graph, parent, parent_uuid)
            if preparent != None:
                    print("connect")
                    self.connect_to_parent(root_graph, parent, parent_uuid, preparent, preparent_uuid)

        else:
            # s = ((depth * "[!]") + root_node + "(synthetic)\n")
            # root_graph.node(s + "#" + uuid_str, s)
            # in_ports, out_ports = self.stuct_to_graphviz(uuid_str, root_node, root_graph,\
            #         parent, parent_uuid, preparent, preparent_uuid)
            pass

        return root_graph


if __name__ == "__main__":
    data_path = 'yosys_output.json'
    with open(data_path, 'r') as file:
        data_txt = file.read().replace('\n', '')
    proj = Project(data_txt)
    x = proj.to_graphviz("asic_core").view()
    
    # x = proj.to_graphviz("asic_core").unflatten(stagger=3).view()
    # dot.render(directory='doctest-output').replace('\\', '/')
    # print(proj.to_graphviz("asic_core").source)
