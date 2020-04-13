note
	description: "[
			yaml Dumper example Eiffel version. 
			For original C version, please see:
			https://github.com/yaml/libyaml/blob/master/tests/run-dumper.c
	]"
	date: "$Date$"
	revision: "$Revision$"
	EIS: "name=Dumper", "src=https://github.com/yaml/libyaml/blob/master/tests/run-dumper.c", "protocol=uri"

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
				i := 1
				if argument (i).same_string ("--c") then
					is_canonical := True
					i := i + 1
					if i < argument_count and then argument (i).same_string ("--u") then
						is_canonical := True
						i := i + 1
					end
				elseif argument (i).same_string ("--u") then
					is_unicode := True
					i := i + 1
				end
				from
				until
					i > argument_count
				loop
					dumper (argument_array.at (i).as_string_32)
					i := i + 1
		    		count := count + 1
		    	end
		    	print ("Number of Documents: " + count.out +"%N")
		    else
            	print ("%NError: Missing files%N")
            	print ("Usage: dumper [--c] [--u] %"PATH/file.yaml PATH/file2.yaml%", ...+%N")
            	error := True
            end
 		end

 	dumper (a_fn: STRING)
		local
			file: FILE
			l_parser: YAML_PARSER_S_STRUCT_API
			l_emitter:  YAML_EMITTER_S_STRUCT_API
			l_event: YAML_EVENT_S_STRUCT_API
			l_document: YAML_DOCUMENT_S_STRUCT_API
			buffer: STRING
			documents: ARRAY [YAML_DOCUMENT_S_STRUCT_API]
			res, done: BOOLEAN
			l_exception: EXCEPTION
			written: INTEGER
			document_number: INTEGER
			count: INTEGER
			aux_doc: YAML_DOCUMENT_S_STRUCT_API
		do
			create {RAW_FILE} file.make_with_name (a_fn)

			if file.exists then
				file.open_read
				create buffer.make_filled ('%U', buffer_size + 1)
				create documents.make_filled (create {YAML_DOCUMENT_S_STRUCT_API}.make, 1, MAX_DOCUMENTS )
				across documents as ic loop
					documents [ic.cursor_index] := create {YAML_DOCUMENT_S_STRUCT_API}.make
				end
				create l_emitter.make
				create l_parser.make
				print ("%N Loading, dumping, and loading again: " + a_fn + "%N")
				if yaml.yaml_parser_initialize (l_parser) = 0 then
					print ("Error initializing parse object%N")
					{EXCEPTIONS}.die (1)
				end

				yaml.yaml_parser_set_input_file (l_parser, file)

				if yaml.yaml_emitter_initialize (l_emitter) = 0 then
					print ("Error initializing emitter object%N")
					{EXCEPTIONS}.die (1)
				end

				if is_canonical then
					yaml.yaml_emitter_set_canonical (l_emitter, 1)
				end
				if is_unicode then
					yaml.yaml_emitter_set_unicode (l_emitter, 1)
				end
				yaml.yaml_emitter_set_output_string (l_emitter, buffer, Buffer_size, $written)

				if yaml.yaml_emitter_open (l_emitter) = 0 then
					print ("Error initializing emitter object%N")
					{EXCEPTIONS}.die (1)
				end


				from
					create l_document.make
				until
					done
				loop
					if yaml.yaml_parser_load (l_parser, l_document) = 0 then
						print ("Load error%N")
						{EXCEPTIONS}.die (1)
					end
					create aux_doc.make_by_pointer (l_document.item)
					done := not (attached yaml.yaml_document_get_root_node (l_document))

					if not done then
						if document_number >= MAX_DOCUMENTS then
							print ("Document number greater than MAX_DOCUMENTS%N")
							{EXCEPTIONS}.die (1)
						end
						if copy_document (documents [document_number + 1], l_document) /= 1 then
							print ("Error copy document%N")
							{EXCEPTIONS}.die (1)
						end
						if yaml.yaml_emitter_dump (l_emitter, l_document) /= 1 then
							if yaml.yaml_emitter_flush (l_emitter) /= 1 then
								print ("Error flushing the accumulated characters to the output.t%N")
							else
								print_out (a_fn, buffer, written, count)
							end
						end
					else
						yaml.yaml_document_delete (l_document)
					end
					document_number := document_number + 1
					count := count + 1
				end

				yaml.yaml_parser_delete (l_parser)

				-- file.close Here raise a segfault on finalized mode.

				if yaml.yaml_emitter_close (l_emitter) = 0 then
					print ("Error closing emittert%N")
					{EXCEPTIONS}.die (1)
				end
				yaml.yaml_emitter_delete (l_emitter)

				count := 0
				done := False
				if yaml.yaml_parser_initialize (l_parser) /= 1 then
					print ("Error Initializaint the parser object%N")
					{EXCEPTIONS}.die (1)
				end
				yaml.yaml_parser_set_input_string(l_parser, buffer.substring (1, written));
				from
					create l_document.make
				until
					done
				loop
					if yaml.yaml_parser_load (l_parser, l_document) = 0  then
						print_out(a_fn, buffer.substring (1, written), written, count)
						{EXCEPTIONS}.die (1)
					end
					done := not (attached yaml.yaml_document_get_root_node(l_document))
					if not done then
						if compare_documents (documents [count + 1], l_document) = False then
							print_out (a_fn, buffer.substring (1, written), written, count)
						end
					end
					yaml.yaml_document_delete(l_document);
					count := count + 1
				end
				across documents as  ic loop
					yaml.yaml_document_delete(ic.item);
				end
				print("%NPASSED (length: "+ written.out +")%N")
    		    print_out(a_fn, buffer.substring (1, written), written, -1)
   			else
				print ("%NError file [" + a_fn + "] does not  exisit%N")
			end
		end


	copy_document (document_to: YAML_DOCUMENT_S_STRUCT_API; document_from: YAML_DOCUMENT_S_STRUCT_API): INTEGER
		local
			node: YAML_NODE_S_STRUCT_API
			pair: YAML_NODE_PAIR_S_STRUCT_API
			item: POINTER --  An element of a sequence node.
			error: BOOLEAN
			l_next: POINTER
			i: INTEGER
			node_start: INTEGER
			count: INTEGER
		do
			Result := 1
			if yaml.yaml_document_initialize (document_to, document_from.version_directive, document_from.tag_directives_start, document_from.tag_directives_end, document_from.start_implicit, document_from.end_implicit) = 1 then
				from
					node := yaml.yaml_document_get_root_node (document_from)
					i := 1
				until
					node = Void or error
				loop
					if attached node as l_node then
						if l_node.type = {YAML_NODE_TYPE_E_ENUM_API}.YAML_SCALAR_NODE then
							if yaml.yaml_document_add_scalar (document_to, l_node.tag, l_node.scalar_value, l_node.scalar_length, l_node.scalar_style) = 0 then
								error := True
							end
						elseif l_node.type = {YAML_NODE_TYPE_E_ENUM_API}.YAML_SEQUENCE_NODE then
							if yaml.yaml_document_add_sequence (document_to, l_node.tag, l_node.sequence_style) = 0 then
								error := True
							end
						elseif l_node.type = {YAML_NODE_TYPE_E_ENUM_API}.YAML_MAPPING_NODE then
							if yaml.yaml_document_add_mapping (document_to, l_node.tag, l_node.mapping_style) = 0 then
								error := True
							end
						else
							error:=True
						end
						if not error then
							i := i + 1
							node := yaml.yaml_document_get_node (document_from, i)
						end
					end
				end
				from
					node := yaml.yaml_document_get_root_node (document_from)
					if attached node then
						node_start :=  node.item.to_integer_32
					end
					i := 1
				until
					node = Void or error
				loop
					if attached node as l_node then
						if l_node.type = {YAML_NODE_TYPE_E_ENUM_API}.YAML_SEQUENCE_NODE then
							from
								item := l_node.sequence_items_start
							until
								integer_32_from_pointer (item) = integer_32_from_pointer (l_node.sequence_items_top) or error
							loop
								if yaml.yaml_document_append_sequence_item (document_to, (l_node.item.to_integer_32 - node_start) // l_node.structure_size  + 1 , integer_32_from_pointer (item)) = 0 then
									error := True
								end
								item :=  item + {PLATFORM}.pointer_bytes
							end
						elseif l_node.type = {YAML_NODE_TYPE_E_ENUM_API}.YAML_MAPPING_NODE then
							from
								pair := l_node.mapping_pairs_start
								if attached l_node.mapping_pairs_top as l_top and then attached l_node.mapping_pairs_start as l_start then
									count := (l_top.item.to_integer_32 - l_start.item.to_integer_32) // l_top.structure_size
								end
							until
								count = 0 or error
							loop
								if attached pair as l_pair then
									if yaml.yaml_document_append_mapping_pair (document_to, (l_node.item.to_integer_32 - node_start) // l_node.structure_size  + 1, l_pair.key, l_pair.value) = 0 then
										error := True
									end
									if not error then
										create pair.make_by_pointer (l_pair.item + {PLATFORM}.pointer_bytes)
									end
									count := count - 1
								end
							end
						else
						end
						if not error then
							i := i + 1
							node := yaml.yaml_document_get_node (document_from, i)
						end
					end
				end
				if error then
					yaml.yaml_document_delete (document_to)
					Result := 0
				end
			else
				Result := 0
			end
		end


	compare_documents (document_1: YAML_DOCUMENT_S_STRUCT_API; document_2: YAML_DOCUMENT_S_STRUCT_API): BOOLEAN
		local
			count: INTEGER
			l_directive_1: YAML_TAG_DIRECTIVE_S_STRUCT_API
			l_directive_2: YAML_TAG_DIRECTIVE_S_STRUCT_API
			node: YAML_NODE_S_STRUCT_API
			i: INTEGER
		do
			if (attached document_1.version_directive as version_directive_1 and then
				attached document_2.version_directive as version_directive_2 and then
				version_directive_1.major = version_directive_2.major and then
				version_directive_1.minor = version_directive_2.minor) or (
				document_1.version_directive = Void and
				document_2.version_directive = Void)
			then
				Result := True
			else
				Result := False
			end
			if Result and then
				attached document_1.tag_directives_start as directive_start_1 and then attached document_2.tag_directives_start as directive_start_2 and then
				attached document_1.tag_directives_end as directive_end_1 and then attached document_2.tag_directives_end as directive_end_2
			then
				from
					l_directive_1 := directive_start_1
					l_directive_2 := directive_start_2
					count := (directive_end_1.item.to_integer_32 - directive_start_1.item.to_integer_32) // directive_start_1.structure_size
				until
					count = 0 or not Result
				loop
					if attached l_directive_1.handle as l_handle_1 and then
						attached l_directive_2.handle as l_handle_2 and then
						l_handle_1.same_string (l_handle_2)
					then
						Result := True
					else
						Result := False
					end
					if Result and then attached l_directive_1.a_prefix as l_prefix_1 and then
						attached l_directive_2.a_prefix as l_prefix_2 and then
						l_prefix_1.same_string (l_prefix_2)
					then
						Result := True
					else
						Result := False
					end
					create l_directive_1.make_by_pointer (l_directive_1.item + {PLATFORM}.pointer_bytes)
					create l_directive_2.make_by_pointer (l_directive_2.item + {PLATFORM}.pointer_bytes)
					count := count -1
				end
			end
			if Result and then compare_nodes (document_1, 1, document_2, 1, 0) = 1 then
				Result := True
			else
				Result := False
			end
		end


	compare_nodes (document_1: YAML_DOCUMENT_S_STRUCT_API; index_1: INTEGER; document_2: YAML_DOCUMENT_S_STRUCT_API; index_2: INTEGER; level: INTEGER ): INTEGER
		local
			node_1: YAML_NODE_S_STRUCT_API
			node_2: YAML_NODE_S_STRUCT_API
			i: INTEGER
			l_level : INTEGER
			item1: POINTER
			item2: POINTER
			pair1: YAML_NODE_PAIR_S_STRUCT_API
			pair2: YAML_NODE_PAIR_S_STRUCT_API
			count: INTEGER
		do
			Result := 1
			l_level := level + 1
			if l_level > 1000 then
				Result := 0
			else
				node_1 := yaml.yaml_document_get_node(document_1, index_1)
				node_2 := yaml.yaml_document_get_node(document_1, index_1)
				if attached node_1 and then attached node_2 and then
					node_1.type = node_2.type and then
					attached node_1.tag as l_tag_1 and then attached node_2.tag as l_tag_2 and then
					l_tag_1.same_string (l_tag_2)
				then
					if node_1.type = {YAML_NODE_TYPE_E_ENUM_API}.YAML_SCALAR_NODE then
						if (node_1.scalar_length = node_2.scalar_length) and then
							(attached node_1.scalar_value as l_value_1 and then
							 attached node_2.scalar_value as l_value_2 and then
							 attached l_value_1.same_string (l_value_2) or else (
							 node_1.scalar_value = Void and then
							 node_2.scalar_value = Void
							 ))
						then
							Result := 1
						else
							Result := 0
						end
					elseif node_1.type = {YAML_NODE_TYPE_E_ENUM_API}.YAML_SEQUENCE_NODE  then
						if attached node_1.sequence_items_start /= default_pointer and then
							attached node_1.sequence_items_top /= default_pointer and then
							attached node_2.sequence_items_start /= default_pointer and then
							attached node_2.sequence_items_top /=  default_pointer and then
							integer_32_from_pointer (node_1.sequence_items_top) - integer_32_from_pointer (node_1.sequence_items_start)
							= integer_32_from_pointer (node_2.sequence_items_top) - integer_32_from_pointer (node_2.sequence_items_start)
						then
							from
								item1 := node_1.sequence_items_start
								item2 := node_2.sequence_items_start
							until
								integer_32_from_pointer (item1) = integer_32_from_pointer (node_1.sequence_items_top) or Result = 0
							loop
								Result := compare_nodes (document_1, integer_32_from_pointer (item1), document_2, integer_32_from_pointer (item2), l_level)
								item1 :=  item1 + {PLATFORM}.pointer_bytes
								item2 :=  item2 + {PLATFORM}.pointer_bytes
							end
						else
							Result := 0
						end
					elseif node_1.type = {YAML_NODE_TYPE_E_ENUM_API}.YAML_MAPPING_NODE then
						if attached node_1.mapping_pairs_start as l_map1_start and then
							attached node_1.mapping_pairs_top as l_map1_top and then
							attached node_2.mapping_pairs_start as l_map2_start and then
							attached node_2.mapping_pairs_top as l_map2_top and then
							l_map1_top.item.to_integer_32- l_map1_start.item.to_integer_32
							= l_map2_top.item.to_integer_32- l_map2_start.item.to_integer_32
						then
							from
								pair1 := l_map1_start
								pair2 := l_map2_start
								count := (l_map1_top.item.to_integer_32 - l_map1_start.item.to_integer_32) // l_map1_start.structure_size
							until
								count = 0 or (Result = 0)
							loop
								if attached pair1 as l_pair1 and then
									attached pair2 as l_pair2
								then
									Result := compare_nodes (document_1, l_pair1.key, document_2, l_pair2.key, l_level)
									if Result = 1 then
										Result := compare_nodes (document_1, l_pair1.value, document_2, l_pair2.value, l_level)
									end
									if Result = 1 then
										create pair1.make_by_pointer (l_pair1.item + {PLATFORM}.pointer_bytes)
										create pair2.make_by_pointer (l_pair2.item + {PLATFORM}.pointer_bytes)
									end
									count := count - 1
								end
							end
						else
							Result := 0
						end
					end
				else
					Result := 0
				end
			end

		end


	print_out (a_fn: STRING; a_buffer: STRING; size: INTEGER; count: INTEGER)
		local
			file: FILE
			data: STRING
			data_size: INTEGER
			total_size: INTEGER
		do
			data_size := 1
			create {RAW_FILE} file.make_open_read (a_fn)
			if file.exists then
				if count >= 0 then
					print("FAILED (at the event #"+ (count + 1).out + "%NSOURCE:%N")
				end
				from
				until
					data_size <= 0 or file.end_of_file
				loop
					file.read_stream (BUFFER_SIZE)
					data := file.last_string
					data_size := data.count
					if data_size > 0 then
						print (data)
						total_size := total_size + data_size
					end
				end
				file.close
				print ("#### (length: "+ total_size.out + ")%N")
				print ("OUTPUT:" + a_buffer + "%N#### (length:" + size.out + ")%N")
			end
		end


	is_canonical: BOOLEAN

	is_unicode: BOOLEAN

	BUFFER_SIZE: INTEGER = 65536

    MAX_DOCUMENTS : INTEGER = 16


feature -- Utility

	integer_32_from_pointer (a_ptr: POINTER): INTEGER
		local
			mp: MANAGED_POINTER
		do
			create mp.make_from_pointer (a_ptr, {PLATFORM}.integer_32_bytes)
			Result := mp.read_integer_32 (0)
		end

feature {NONE} -- Implementation

	yaml: YAML_FUNCTIONS
		once
			create Result
		end

end
