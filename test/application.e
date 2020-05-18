class APPLICATION

create
	make

feature {NONE} -- Initialization

	make
		do
			print ("%N Yaml Version")
			yaml_version
			print ("%N Parse from file")
			parse_yaml_from_file
			print ("%N Parse from String")
			parse_yaml_from_string
			print ("%N Scan from file")
			scan_yaml_from_file
			print ("%N Load from file")
			load_yaml_from_file
		end

	yaml_version
		local
			l_ptr: POINTER
		do
			l_ptr := {YAML_FUNCTIONS}.yaml_get_version_string
			if l_ptr /= default_pointer then
				print ("Yaml version:" + (create {STRING}.make_from_c (l_ptr)))
			end
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
				yaml_initialization: {YAML_FUNCTIONS}.yaml_parser_initialize (l_parser) = 1
			end

			{YAML_FUNCTIONS}.yaml_parser_set_input_file (l_parser, file)

			from
				create y_event.make
			until
				done
			loop
				if {YAML_FUNCTIONS}.yaml_parser_parse (l_parser, y_event) = 0 then
					create l_exception
					l_exception.set_description ("Parse error")
					l_exception.raise
				end
				if y_event.type = {YAML_EVENT_TYPE_E_ENUM_API}.YAML_STREAM_END_EVENT then
					done := True
				end
				{YAML_FUNCTIONS}.yaml_event_delete (y_event)
				count := count + 1
			end

			print ("%NNumber of Events: " + count.out)
			{YAML_FUNCTIONS}.yaml_parser_delete (l_parser)
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
				yaml_initialization: {YAML_FUNCTIONS}.yaml_parser_initialize (l_parser) = 1
			end

			{YAML_FUNCTIONS}.yaml_parser_set_input_file (l_parser, file)

			from
				create l_token.make
			until
				done
			loop
				if {YAML_FUNCTIONS}.yaml_parser_scan (l_parser, l_token) = 0 then
					create l_exception
					l_exception.set_description ("Parse error")
					l_exception.raise
				end
				if l_token.type = {YAML_TOKEN_TYPE_E_ENUM_API}.YAML_STREAM_END_TOKEN then
					done := True
				end
				{YAML_FUNCTIONS}.yaml_token_delete (l_token)
				count := count + 1
			end

			print ("%NNumber of Tokens: " + count.out)
			{YAML_FUNCTIONS}.yaml_parser_delete (l_parser)
			file.close
		end

	load_yaml_from_file
		local
			file: FILE
			l_parser: YAML_PARSER_S_STRUCT_API
			l_document: YAML_DOCUMENT_S_STRUCT_API
			done: BOOLEAN
			l_exception: EXCEPTION
			count: INTEGER
		do
			create {RAW_FILE} file.make_open_read ("anchors.yaml")

			create l_parser.make
			check
				yaml_initialization: {YAML_FUNCTIONS}.yaml_parser_initialize (l_parser) = 1
			end

			{YAML_FUNCTIONS}.yaml_parser_set_input_file (l_parser, file)

			from
				create l_document.make
			until
				done
			loop
				if {YAML_FUNCTIONS}.yaml_parser_load (l_parser, l_document) = 0 then
					create l_exception
					l_exception.set_description ("Parse error")
					l_exception.raise
				end
				if attached {YAML_NODE_S_STRUCT_API} {YAML_FUNCTIONS}.yaml_document_get_root_node (l_document) as l_node then
					if (create {YAML_NODE_TYPE_E_ENUM_API}).is_valid_enum (l_node.type) then
						print ("%N Valid Node Type")
						done := True
					else
						create l_exception
						l_exception.set_description ("Get documet root error")
						l_exception.raise
					end
				end
				{YAML_FUNCTIONS}.yaml_document_delete (l_document)
				count := count + 1
			end

			print ("%NNumber of Documents: " + count.out)
			{YAML_FUNCTIONS}.yaml_parser_delete (l_parser)
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
				yaml_initialization: {YAML_FUNCTIONS}.yaml_parser_initialize (l_parser) = 1
			end

			{YAML_FUNCTIONS}.yaml_parser_set_input_string (l_parser, l_string)

			from
				create y_event.make
			until
				done
			loop
				if {YAML_FUNCTIONS}.yaml_parser_parse (l_parser, y_event) = 0 then
					create l_exception
					l_exception.set_description ("Parse error")
					l_exception.raise
				end
				if y_event.type = {YAML_EVENT_TYPE_E_ENUM_API}.YAML_STREAM_END_EVENT then
					done := True
				end
				{YAML_FUNCTIONS}.yaml_event_delete (y_event)
				count := count + 1
			end

			print ("%NNumber of Events: " + count.out)
			{YAML_FUNCTIONS}.yaml_parser_delete (l_parser)
		end

feature {NONE} -- Implementation

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
