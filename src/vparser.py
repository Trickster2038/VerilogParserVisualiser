import json

class Project:

    tree = ""

    def __init__(self, raw_data: str):
        self.data = json.loads(raw_data)
        self.creator = self.data["creator"] or "Undefined"
        self.modules = self.data["modules"] or {}
    
    # def build_tree(self, depth, max_depth=0)

    def to_graphviz(self, root_node: str, depth: int=0, max_depth: int=0):
        if depth == 0:
            Project.tree = ""

        if root_node[0] != "$":
            Project.tree += ((depth * "  " + "|_") + root_node + "(" + self.modules[root_node]["attributes"]["src"] + ")\n")
            if self.modules[root_node]["cells"] != {}:
                for x in self.modules[root_node]["cells"].values():
                # if x['type'][0] != "$":
                    self.to_graphviz(x['type'], depth + 1)
                # print(x['type'])
        else:
            Project.tree += ((depth * "  " + "|_") + root_node + "(synthetic)\n")


        

        return Project.tree



if __name__ == "__main__":
    data_path = 'yosys_output.json'
    with open(data_path, 'r') as file:
        data_txt = file.read().replace('\n', '')
    proj = Project(data_txt)
    # print(str(proj.data["creator"]))
    print(proj.to_graphviz("asic_core"))
