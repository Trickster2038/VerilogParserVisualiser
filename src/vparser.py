import json
import graphviz
import uuid


class Project:

    def __init__(self, raw_data: str):
        self.data = json.loads(raw_data)
        self.creator = self.data["creator"] or "Undefined"
        self.modules = self.data["modules"] or {}
        self.inputs = []
        self.outputs = []
        

    def add_connections(self, root_graph, root_node, in_ports, out_ports):
        for port in in_ports:
            root_graph.edge(
                f"""connection_{port["from_bit"]}_{port["to_bit"]}""",
                f"""struct_{root_node}:in_{port["from_bit"]}_{port["to_bit"]}""", 
                label=port["name"]
                )
            # root_graph.edge("aaa", "bb")
        pass

    def stuct_to_graphviz(self, uuid_str: str, root_node: str, root_graph):
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
            # in_ports_str += f"""<TR><TD PORT="in_{port["from_bit"]}_{port["to_bit"]}">{port["name"]}</TD></TR>"""
            in_ports_str += f"""<in_{port["from_bit"]}_{port["to_bit"]}> {port["name"]} |"""
        out_ports_str = ""
        for port in out_ports:
            # out_ports_str += f"""<TR><TD PORT="out_{port["name"]}">{port["name"]}</TD></TR>"""
            out_ports_str += f"""<in_{port["from_bit"]}_{port["to_bit"]}> {port["name"]} |"""

        # tb = root_graph.node('struct_'+ root_node + '_' + uuid_str, f'''<
        # <TABLE BORDER="0" CELLBORDER="1" CELLSPACING="0">
        #     <TR>
        #         <TD>
        #             <TABLE BORDER="0" CELLBORDER="1" CELLSPACING="0">
        #                 {in_ports_str}
        #             </TABLE>
        #         </TD>
        #         <TD>{root_node}</TD>
        #         <TD>
        #             <TABLE BORDER="0" CELLBORDER="1" CELLSPACING="0">
        #                 {out_ports_str}
        #             </TABLE>
        #         </TD>
        #     </TR>
        # </TABLE>>''')
        # tb.source = "gg"

        # root_graph.body.append(f"""
        # &#123;{in_ports}&#125;| {root_node} |&#123; {out_ports} &#125;
        # """)

        # root_graph.body.append(f""";""")
        # root_graph.body.append(root_node + " [label={" + in_ports_str + "}|" + root_node + "|{" + out_ports_str + "}]")
        root_graph.body.append("struct_" + root_node + """ [label="{""" + in_ports_str + "}|" + root_node + "|{" + out_ports_str + """}"];""")
        # root_graph.body.append("""struct3 [label="hello&#92;nworld |{ b |{c|<here> d|e}| f}| g | h"];""")
        return (in_ports, out_ports)

    def to_graphviz(self, root_node: str, depth: int = 0, root_graph=None, max_depth: int = 0):

        root_graph = root_graph or graphviz.Graph('parent')
        uuid_str = str(uuid.uuid4())

        if root_node[0] != "$":
            s = ((depth * "*") + root_node +
                 "(" + self.modules[root_node]["attributes"]["src"] + ")\n")
            children = list(self.modules[root_node]["cells"].values())
            if len(list(filter(lambda x: x['type'][0] != "$", children))) != 0:
                for x in children:
                    with root_graph.subgraph(name='cluster_'+root_node, node_attr={'shape': 'record'}) as c:
                        c.attr('graph', label=root_node)
                        self.to_graphviz(x['type'], depth + 1, c)
            else:
                # root_graph.node(s + "#" + uuid_str, s)
                in_ports, out_ports = self.stuct_to_graphviz(uuid_str, root_node, root_graph)
                self.add_connections(root_graph, root_node, in_ports, out_ports)

        else:
            s = ((depth * "[!]") + root_node + "(synthetic)\n")
            root_graph.node(s + "#" + uuid_str, s)
            pass

        return root_graph


if __name__ == "__main__":
    data_path = 'yosys_output.json'
    with open(data_path, 'r') as file:
        data_txt = file.read().replace('\n', '')
    proj = Project(data_txt)
    x = proj.to_graphviz("asic_core").view()
    # dot.render(directory='doctest-output').replace('\\', '/')
    print(proj.to_graphviz("asic_core").source)
