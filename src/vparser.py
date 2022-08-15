import json
from re import S
import graphviz

class Project:

    def __init__(self, raw_data: str):
        self.data = json.loads(raw_data)
        self.creator = self.data["creator"] or "Undefined"
        self.modules = self.data["modules"] or {}

        self.tree = ""
        self.tree_graph = graphviz.Graph('schema_gv', filename='scheme.gv', engine='dot')
        self.tree_graph.attr(rankdir='LR')
    
    # def build_tree(self, depth, max_depth=0)

    def to_graphviz(self, root_node: str, depth: int=0, root_graph = None, max_depth: int=0):
        if depth == 0:
            self.tree = ""

        root_graph = root_graph or graphviz.Graph('parent')
        # root_graph.attr('graph', label=root_node)

        
            # c.node('foo'+str(depth), 'bar'+str(depth))
            # c.edge('foo', 'bar')

        if root_node[0] != "$":
            s = ((depth * "+" + "|_") + root_node + "(" + self.modules[root_node]["attributes"]["src"] + ")\n")
            self.tree += s 
            root_graph.node(s, s) # c.node(s, s)
            if self.modules[root_node]["cells"] != {}:
                for x in self.modules[root_node]["cells"].values():
                    with root_graph.subgraph(name='cluster'+root_node, node_attr={'shape': 'box'}) as c:
                        c.attr('graph', label=root_node)
                        self.to_graphviz(x['type'], depth + 1, c)
        else:
            self.tree += ((depth * "+" + "|_") + root_node + "(synthetic)\n")

        return root_graph



if __name__ == "__main__":
    data_path = 'yosys_output.json'
    with open(data_path, 'r') as file:
        data_txt = file.read().replace('\n', '')
    proj = Project(data_txt)
    print(proj.to_graphviz("asic_core"))
    proj.to_graphviz("asic_core").view()
