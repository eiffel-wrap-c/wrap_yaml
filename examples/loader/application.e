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
					load_yaml (argument_array.at (i).as_string_32)
					i := i + 1
		    		count := count + 1
		    	end
		    	print ("%NNumber of Documents: " + count.out)
		    else
            	print ("%NError: Missing files%N")
            	print ("Usage: parse %"PATH/file.yaml PATH/file2.yaml%", ...")
            	error := True
            end
 		end
 		
 	load_yaml (a_fn: STRING)
		local
			file: FILE
			l_parser: YAML_PARSER_S_STRUCT_API
			l_document: YAML_DOCUMENT_S_STRUCT_API
			done: BOOLEAN
			l_exception: EXCEPTION
		do
			create {RAW_FILE} file.make_open_read (a_fn)

			if file.exists then
				create l_parser.make
				check
					yaml_initialization: yaml.yaml_parser_initialize (l_parser) = 1
				end

				yaml.yaml_parser_set_input_file (l_parser, file)

				from
					create l_document.make
				until
					done
				loop
					if yaml.yaml_parser_load (l_parser, l_document) = 0 then
						create l_exception
						l_exception.set_description ("Parse error")
						l_exception.raise
					end
					if attached {YAML_NODE_S_STRUCT_API} yaml.yaml_document_get_root_node (l_document) as l_node then
						if (create {YAML_NODE_TYPE_E_ENUM_API}).is_valid_enum (l_node.type) then
							print ("%N Valid Node Type")
							done := True
						else
							create l_exception
							l_exception.set_description ("Get document root error")
							l_exception.raise
						end
					end
					yaml.yaml_document_delete (l_document)
				end
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
