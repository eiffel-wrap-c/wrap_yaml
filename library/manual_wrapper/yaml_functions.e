note
	description: "Summary description for {YAML_FUNCTIONS}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	YAML_FUNCTIONS

inherit

	YAML_FUNCTIONS_API
		rename
			yaml_parser_set_input_file as yaml_parser_set_input_file_api,
			yaml_parser_set_input_string as yaml_parser_set_input_string_api
		end

feature -- Access

	yaml_parser_set_input_file (parser: YAML_PARSER_S_STRUCT_API; file: FILE)
		do
			c_yaml_parser_set_input_file (parser.item, file.file_pointer)
		end

	yaml_parser_set_input_string (parser: YAML_PARSER_S_STRUCT_API; input: STRING)
		do
			yaml_parser_set_input_string_api (parser, input, input.count)
		end

end
