#!/usr/bin/env python3

import yaml
from jinja2 import Environment, FileSystemLoader
import os

def load_yaml(file_path):
    with open(file_path, 'r', encoding='utf-8') as file:
        return yaml.safe_load(file)

def generate_tex(template_path, yaml_path, output_path):
    # Load the YAML data
    data = load_yaml(yaml_path)
    
    # Set up Jinja2 environment
    env = Environment(
        loader=FileSystemLoader(os.path.dirname(template_path)),
        block_start_string='{%',
        block_end_string='%}',
        variable_start_string='{{{{',
        variable_end_string='}}}}',
        comment_start_string='((#',
        comment_end_string='#))'
    )
    
    # Load and render the template
    template = env.get_template(os.path.basename(template_path))
    rendered = template.render(**data)
    
    # Write the output
    with open(output_path, 'w', encoding='utf-8') as file:
        file.write(rendered)

if __name__ == "__main__":
    template_path = "template.tex.jinja"
    yaml_path = "cv.yaml"
    output_path = "src/main.tex"
    
    generate_tex(template_path, yaml_path, output_path)
    print(f"Generated {output_path} successfully!") 