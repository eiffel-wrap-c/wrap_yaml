class APPLICATION

create
	make

feature {NONE} -- Initialization

	make
		do
			print ("%N Parse from file")
			parse_yaml_from_file
			print ("%N Parse from String")
			parse_yaml_from_string
			print ("%N Scan from file")
			scan_yaml_from_file
		end


	parse_yaml_from_file
		local
			file: FILE
			l_parser: YAML_PARSER_S_STRUCT_API
			y_event: YAML_EVENT_S_STRUCT_API
			done: BOOLEAN
			l_exception: EXCEPTION
			count: INTEGER
		do
			create {RAW_FILE} file.make_open_read ("anchors.yaml")

			create l_parser.make
			check
				yaml_initialization: yaml.yaml_parser_initialize (l_parser) = 1
			end

			yaml.yaml_parser_set_input_file (l_parser, file)

			from
				create y_event.make
			until
				done
			loop
				if yaml.yaml_parser_parse (l_parser, y_event) = 0 then
					create l_exception
					l_exception.set_description ("Parse error")
					l_exception.raise
				end
				if y_event.type = {YAML_EVENT_TYPE_E_ENUM_API}.YAML_STREAM_END_EVENT then
					done := True
				end
				yaml.yaml_event_delete (y_event)
				count := count + 1
			end

			print ("%NNumber of Events: " + count.out)
			yaml.yaml_parser_delete (l_parser)
			file.close
		end

	scan_yaml_from_file
		local
			file: FILE
			l_parser: YAML_PARSER_S_STRUCT_API
			l_token: YAML_TOKEN_S_STRUCT_API
			done: BOOLEAN
			l_exception: EXCEPTION
			count: INTEGER
		do
			create {RAW_FILE} file.make_open_read ("anchors.yaml")

			create l_parser.make
			check
				yaml_initialization: yaml.yaml_parser_initialize (l_parser) = 1
			end

			yaml.yaml_parser_set_input_file (l_parser, file)

			from
				create l_token.make
			until
				done
			loop
				if yaml.yaml_parser_scan (l_parser, l_token) = 0 then
					create l_exception
					l_exception.set_description ("Parse error")
					l_exception.raise
				end
				if l_token.type = {YAML_TOKEN_TYPE_E_ENUM_API}.YAML_STREAM_END_TOKEN then
					done := True
				end
				yaml.yaml_token_delete (l_token)
				count := count + 1
			end

			print ("%NNumber of Tokens: " + count.out)
			yaml.yaml_parser_delete (l_parser)
			file.close
		end

	parse_yaml_from_string
		local
			l_parser: YAML_PARSER_S_STRUCT_API
			y_event: YAML_EVENT_S_STRUCT_API
			done: BOOLEAN
			l_exception: EXCEPTION
			l_string: STRING
			count: INTEGER
		do
			create l_string.make_from_string (anchors_string)

			create l_parser.make
			check
					-- Create the Parser object
				yaml_initialization: yaml.yaml_parser_initialize (l_parser) = 1
			end

			yaml.yaml_parser_set_input_string (l_parser, l_string)

			from
				create y_event.make
			until
				done
			loop
				if yaml.yaml_parser_parse (l_parser, y_event) = 0 then
					create l_exception
					l_exception.set_description ("Parse error")
					l_exception.raise
				end
				if y_event.type = {YAML_EVENT_TYPE_E_ENUM_API}.YAML_STREAM_END_EVENT then
					done := True
				end
				yaml.yaml_event_delete (y_event)
				count := count + 1
			end

			print ("%NNumber of Events: " + count.out)
			yaml.yaml_parser_delete (l_parser)
		end

feature {NONE} -- Implementation

	yaml: YAML_FUNCTIONS
		once
			create Result
		end

	anchors_string: STRING = "[
base: &base
    name: Everyone has same name

foo: &foo
    <<: *base
    age: 10

bar: &bar
    <<: *base
    age: 20
		]"

			--

end
