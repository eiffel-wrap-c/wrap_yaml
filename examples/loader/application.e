note
	description: "[
			yaml Parser load example Eiffel version. 
			For original C version, please see:
			https://github.com/yaml/libyaml/blob/master/tests/run-loader.c
						 
			This demo show how to use the Parser API, parsing an input stream 
			and retrieving the next YAML document.
	]"
	date: "$Date$"
	revision: "$Revision$"
	EIS: "name=loader", "src=https://github.com/yaml/libyaml/blob/master/tests/run-loader.c", "protocol=uri"

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
			i, count: INTEGER
		do
				-- Input file name
			if argument_count >= 1  then
				from
					i := 1
				until
					i > argument_count
				loop
					load_yaml (argument_array.at (i).to_string_8)
					i := i + 1
		    		count := count + 1
		    	end
		    	print ("Number of Documents: " + count.out +"%N")
		    else
            	print ("%NError: Missing files%N")
            	print ("Usage: loader %"PATH/file.yaml PATH/file2.yaml%", ...+%N")
            	error := True
            end
 		end

 	load_yaml (a_fn: STRING)
		local
			file: FILE
			l_parser: YAML_PARSER_S_STRUCT_API
			l_document: YAML_DOCUMENT_S_STRUCT_API
			done: BOOLEAN
		do
			create {RAW_FILE} file.make_with_name (a_fn)

			if file.exists then
				file.open_read
				create l_parser.make
				if	{YAML_FUNCTIONS}.yaml_parser_initialize (l_parser) = 0 then
					print ("Error initializing parser object%N")
					{EXCEPTIONS}.die (1)
				end

				{YAML_FUNCTIONS}.yaml_parser_set_input_file (l_parser, file)

				from
					create l_document.make
				until
					done
				loop
					if {YAML_FUNCTIONS}.yaml_parser_load (l_parser, l_document) = 0 then
						print ("Parse error%N")
						{EXCEPTIONS}.die (1)
					end
					if attached {YAML_NODE_S_STRUCT_API} {YAML_FUNCTIONS}.yaml_document_get_root_node (l_document) as l_node then
						if (create {YAML_NODE_TYPE_E_ENUM_API}).is_valid_enum (l_node.type) then
							print ("Valid Node Type%N")
							done := True
						else
							print  ("Get document root error%N")
							{EXCEPTIONS}.die (1)
						end
					end
					{YAML_FUNCTIONS}.yaml_document_delete (l_document)
				end
				{YAML_FUNCTIONS}.yaml_parser_delete (l_parser)
				file.close
			else
				print ("Error file [" + a_fn + "] does not  exisit %N")
			end
		end

end
