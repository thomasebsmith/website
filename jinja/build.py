#!/usr/bin/env python3

from argparse import ArgumentParser, Namespace
from pathlib import Path

from jinja2 import Environment, FileSystemLoader, select_autoescape

CONTEXT = {
    "name": "Thomas Smith",
    "nav": {
        "index.html": "Home",
        "projects.html": "Projects",
        "contact.html": "Contact"
    },
    "root_url": "https://thomasebsmith.github.io"
}

def get_args() -> Namespace:
    """Get the command line arguments passed to this program"""
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

def compile_templates(templates_dir: Path, output_dir: Path):
    """Compile the templates in templates_dir, outputting to output_dir"""
    def filter_template(name):
        return name != "base.html" and name.endswith(".html")

    loader = FileSystemLoader(templates_dir)
    env = Environment(
        loader=loader,
        autoescape=select_autoescape(),
        trim_blocks=True,
        keep_trailing_newline=True)

    output_dir.mkdir(parents=True, exist_ok=True)
    for template_name in env.list_templates(filter_func=filter_template):
        with (output_dir / template_name).open("w") as file:
            template = env.get_template(template_name)
            file.write(template.render(CONTEXT))

def main():
    """Build the Jinja templates for this site"""
    args = get_args()
    compile_templates(args.templates, args.output)

if __name__ == "__main__":
    main()
