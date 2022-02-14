#!/usr/bin/env python3

from argparse import ArgumentParser
from pathlib import Path

from jinja2 import Environment, FileSystemLoader, select_autoescape

CONTEXT = {
    "name": "Thomas Smith",
    "nav": {
        "index.html": "Home",
        "projects.html": "Projects",
        "contact.html": "Contact"
    }
}

def get_args():
    parser = ArgumentParser(description="Process Jinja templates")
    parser.add_argument(
        "templates",
        type=Path,
        help="a directory containing Jinja templates to build")
    parser.add_argument(
        "-o",
        dest="output",
        type=Path,
        required=True,
        help="a directory to which to output Jinja templates")
    return parser.parse_args()

def main():
    args = get_args()

    def filter_template(name):
        return name != "base.html" and name.endswith(".html")

    loader = FileSystemLoader(args.templates)
    env = Environment(
        loader=loader,
        autoescape=select_autoescape(),
        trim_blocks=True,
        keep_trailing_newline=True)

    args.output.mkdir(parents=True, exist_ok=True)
    for template_name in env.list_templates(filter_func=filter_template):
        with (args.output / template_name).open("w") as file:
            template = env.get_template(template_name)
            file.write(template.render(CONTEXT))

if __name__ == "__main__":
    main()
