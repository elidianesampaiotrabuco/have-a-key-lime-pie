from tools_py import PROJECT_ROOT
from os import path
from lxml import etree


def extract_projects(root: etree.Element):
  projects = set()

  for child in root:
    if not etree.iselement(child):
      continue

    match child.tag:
      case "project" | "extend-project":
        projects.add(child.get("name"))
      case "remove-project":
        projects.discard(child.get("name"))

  return projects


parser = etree.XMLParser()
def ask_for_xml(prompt: str):
  fp = None
  while True:
    fp = path.join(PROJECT_ROOT, input(prompt + " : "))
    if not path.exists(fp):
      print("file does not exist!!")
    else:
      break

  with open(fp, "rb") as f:
    return etree.parse(f, parser)


old_projects = extract_projects(ask_for_xml("old manifest").getroot())
new_projects = extract_projects(ask_for_xml("new manifest").getroot())
print("")

print("Additions:")
for i in (new_projects - old_projects):
  print(f"  + {i}")
print("")

print("Removals:")
for i in (old_projects - new_projects):
  print(f"  - {i}")