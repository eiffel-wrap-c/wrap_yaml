#!/bin/sh
#Script to automate WrapC development process.
wrap_c --verbose --script_pre_process=pre_script.sh --script_post_process=post_script.sh  --output-dir=./generated_wrapper --full-header=/usr/local/include/yaml.h --config=config.xml

