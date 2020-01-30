note
	description: "[
			yaml Scanner token example Eiffel version. 
			For original C version, please see:
			https://github.com/yaml/libyaml/blob/master/tests/run-scanner.c
						
			This demo show how to use the Parser Scanner API, scanning an input stream 
			and retrieving the next token.

	]"
	date: "$Date$"
	revision: "$Revision$"
	EIS: "name=scanner", "src=https://github.com/yaml/libyaml/blob/master/tests/run-scanner.c", "protocol=uri"

class
	APPLICATION

inherit
	ARGUMENTS_32

create
	make

feature {NONE} -- Initialization

	make
			-- Run application.
		local
			error: BOOLEAN
		do
				-- Input file name
			if attached separate_character_option_value ('f') as l_val then
            	scan_yaml (l_val.as_string_8)
            else
            	print ("%NError: Missing file%N")
            	print ("Usage: scanner -f %"PATH/file.yaml%"")
            	error := True
            end
 		end

	scan_yaml (a_fn: STRING)
		local
			file: FILE
			l_parser: YAML_PARSER_S_STRUCT_API
			l_token: YAML_TOKEN_S_STRUCT_API
			done: BOOLEAN
			l_exception: EXCEPTION
			count: INTEGER
		do
				-- Create the file
			create {RAW_FILE} file.make_open_read (a_fn)
			if file.exists then
				create l_parser.make
				check
						-- Initialize the parser object.
					yaml_initialization: yaml.yaml_parser_initialize (l_parser) = 1
				end

					-- Set the input file
				yaml.yaml_parser_set_input_file (l_parser, file)

					-- Read the token sequence
				from
					create l_token.make
				until
					done
				loop
						-- Retrieve the next token
						-- Scan the input stream and produce the next token.
					if yaml.yaml_parser_scan (l_parser, l_token) = 0 then
						create l_exception
						l_exception.set_description ("Parse error")
						l_exception.raise
					end
						-- Code to process the token

						-- finished?	
					if l_Token.type = {YAML_TOKEN_TYPE_E_ENUM_API}.YAML_STREAM_END_TOKEN then
						done := True
					end
					yaml.yaml_token_delete (l_token)
					count := count + 1
				end

				print ("%NNumber of Tokens: "+ count.out +" in file : " + a_fn)
				yaml.yaml_parser_delete (l_parser)
				file.close
			else
				print ("%NError file [" + a_fn + "] does not  exisit")
			end
		end

feature {NONE} -- Implementation

	yaml: YAML_FUNCTIONS
		once
			create Result
		end

end
