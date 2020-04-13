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
            	print ("Usage: parse -f %"PATH/file.yaml%"%N")
            	error := True
            end
 		end

	parse_yaml (a_fn: STRING)
		local
			file: FILE
			l_parser: YAML_PARSER_S_STRUCT_API
			y_event: YAML_EVENT_S_STRUCT_API
			done: BOOLEAN
			count: INTEGER
		do
				-- Create the file
			create {RAW_FILE} file.make_with_name (a_fn)
			if file.exists then
				file.open_read
				create l_parser.make

					-- Initialize the parser object.
				if yaml.yaml_parser_initialize (l_parser) = 0 then
					print ("Error initializing parser object%N")
					{EXCEPTIONS}.die (1)
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
						print ("Parse error%N")
						{EXCEPTIONS}.die (1)
					end
						-- Code to process the event

						-- finished?	
					if y_event.type = {YAML_EVENT_TYPE_E_ENUM_API}.YAML_STREAM_END_EVENT then
						done := True
					end
					yaml.yaml_event_delete (y_event)
					count := count + 1
				end

				print ("Number of Events: "+ count.out +" in file : " + a_fn + "%N")
				yaml.yaml_parser_delete (l_parser)
				file.close
			else
				print ("Error file [" + a_fn + "] does not  exisit%N")
			end
		end

feature {NONE} -- Implementation

	yaml: YAML_FUNCTIONS
		once
			create Result
		end

end
