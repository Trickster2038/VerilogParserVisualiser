import json
import graphviz
import uuid

class Project:

    def __init__(self, raw_data: str):
        self.data = json.loads(raw_data)
        self.creator = self.data["creator"] or "Undefined"
        self.modules = self.data["modules"] or {}

    def to_graphviz(self, root_node: str, depth: int=0, root_graph = None, max_depth: int=0):

        root_graph = root_graph or graphviz.Graph('parent')
        uuid_str = str(uuid.uuid4())

        if root_node[0] != "$":
            s = ((depth * "*") + root_node + "(" + self.modules[root_node]["attributes"]["src"] + ")\n")
            children = list(self.modules[root_node]["cells"].values())
            if len(list(filter(lambda x: x['type'][0] != "$", children))) != 0:
                for x in children:
                    with root_graph.subgraph(name='cluster'+root_node, node_attr={'shape': 'box'}) as c:
                        c.attr('graph', label=root_node)
                        self.to_graphviz(x['type'], depth + 1, c)
            else: 
                root_graph.node(s + "#" + uuid_str, s)
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
    proj.to_graphviz("asic_core").view()
