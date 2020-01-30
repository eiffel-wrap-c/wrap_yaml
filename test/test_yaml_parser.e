note
	description: "[
		Eiffel tests that can be executed by testing tool.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"

class
	TEST_YAML_PARSER

inherit
	EQA_TEST_SET
		redefine
			on_prepare,
			on_clean
		end

feature {NONE} -- Events

	on_prepare
			-- <Precursor>
		do
		end

	on_clean
			-- <Precursor>
		do
		end

feature -- Test routines

	test_parser_initialization
			-- Test Yaml Parser Initialization.
		local
			l_parser: YAML_PARSER_S_STRUCT_API
		do
			create l_parser.make
			assert ("Expected 1 = success", yaml.yaml_parser_initialize (l_parser) = 1 )
			yaml.yaml_parser_delete (l_parser)

--			yaml.yaml_parser_set_input_file (l_parser, file: IO_FILE_STRUCT_API)
		end

feature {NONE} -- Implementation

	yaml: YAML_FUNCTIONS_API
		once
			create Result
		end
end


