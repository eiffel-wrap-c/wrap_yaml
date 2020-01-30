note
	description: "[
			yaml Parser event example Eiffel version. 
			For original C version, please see:
			https://github.com/yaml/libyaml/blob/master/tests/run-parser.c
						
			This demo show how to use the Parser API, parsing an input stream 
			and retrieving the next parsing event.

	]"
	date: "$Date$"
	revision: "$Revision$"
	EIS: "name=parser", "src=https://github.com/yaml/libyaml/blob/master/tests/run-parser.c", "protocol=uri"

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
            	parse_yaml (l_val.as_string_8)
            else
            	print ("%NError: Missing file%N")
            	print ("Usage: parse -f %"PATH/file.yaml%"")
            	error := True
            end
 		end

	parse_yaml (a_fn: STRING)
		local
			file: FILE
			l_parser: YAML_PARSER_S_STRUCT_API
			y_event: YAML_EVENT_S_STRUCT_API
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

					-- Read the event sequence
				from
					create y_event.make
				until
					done
				loop
						-- Retrieve the next event
						-- Parse the input stream and produce the next parsing event
					if yaml.yaml_parser_parse (l_parser, y_event) = 0 then
						create l_exception
						l_exception.set_description ("Parse error")
						l_exception.raise
					end
						-- Code to process the event

						-- finished?	
					if y_event.type = {YAML_EVENT_TYPE_E_ENUM_API}.YAML_STREAM_END_EVENT then
						done := True
					end
					yaml.yaml_event_delete (y_event)
					count := count + 1
				end

				print ("%NNumber of Events: "+ count.out +" in file : " + a_fn)
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
