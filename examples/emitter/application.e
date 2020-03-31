note
	description: "[
			yaml Emitter example Eiffel version. 
			For original C version, please see:
			https://github.com/yaml/libyaml/blob/master/tests/run-emitter.c


	]"
	date: "$Date$"
	revision: "$Revision$"
	EIS: "name=emitter", "src=https://github.com/yaml/libyaml/blob/master/tests/run-emitter.c", "protocol=uri"

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
					emitter (argument_array.at (i).as_string_32)
					i := i + 1
		    		count := count + 1
		    	end
		    	print ("%NNumber of Documents: " + count.out)
		    else
            	print ("%NError: Missing files%N")
            	print ("Usage: emitter [--c] [--u] %"PATH/file.yaml PATH/file2.yaml%", ...")
            	error := True
            end
 		end

 	emitter (a_fn: STRING)
		local
			file: FILE
			l_parser: YAML_PARSER_S_STRUCT_API
			l_emitter:  YAML_EMITTER_S_STRUCT_API
			l_event: YAML_EVENT_S_STRUCT_API
			l_document: YAML_DOCUMENT_S_STRUCT_API
			buffer: STRING
			events: ARRAY [YAML_EVENT_S_STRUCT_API]
			res, done: BOOLEAN
			l_exception: EXCEPTION
			written: INTEGER
			event_number: INTEGER
			count: INTEGER
		do
			create {RAW_FILE} file.make_open_read (a_fn)

			if file.exists then
				create buffer.make_filled ('%U', buffer_size + 1)
				create events.make_filled (create {YAML_EVENT_S_STRUCT_API}.make, 1, max_events )
				across events as ic loop
					events [ic.cursor_index] := create {YAML_EVENT_S_STRUCT_API}.make
				end
				create l_emitter.make
				create l_parser.make
				print ("%N Parsing, emitting, and parsing again: " + a_fn)
				check
					yaml_initialization: yaml.yaml_parser_initialize (l_parser) = 1
				end

				yaml.yaml_parser_set_input_file (l_parser, file)

				check
					emiter_initialization: yaml.yaml_emitter_initialize (l_emitter) = 1
				end

				if is_canonical then
					yaml.yaml_emitter_set_canonical (l_emitter, 1)
				end
				if is_unicode then
					yaml.yaml_emitter_set_unicode (l_emitter, 1)
				end
				yaml.yaml_emitter_set_output_string (l_emitter, buffer, Buffer_size, $written)

				from
					create l_event.make
				until
					done
				loop
					if yaml.yaml_parser_parse (l_parser, l_event) = 0 then
							create l_exception
							l_exception.set_description ("Parse error")
							l_exception.raise
					end
					done := l_event.type = {YAML_EVENT_TYPE_E_ENUM_API}.YAML_STREAM_END_EVENT
					check
						event_valid: event_number < max_events
					end
					check
						success_copy: copy_event (events[event_number + 1], l_event) = 1
					end
					event_number := event_number + 1
					check
						emitter: if yaml.yaml_emitter_emit (l_emitter, l_event) = 1 then True else print_out (a_fn, buffer, written, count) end
					end

					count := count + 1
				end

				yaml.yaml_parser_delete (l_parser)
				file.close
				yaml.yaml_emitter_delete (l_emitter)

				--
				count := 0
				done := False
				check
					yaml_initialization: yaml.yaml_parser_initialize (l_parser) = 1
				end
				yaml.yaml_parser_set_input_string(l_parser, buffer.substring (1, written));
				from
				until
					done
				loop
					if yaml.yaml_parser_parse (l_parser, l_event) = 0 then
						res := print_out(a_fn, buffer.substring (1, written), written, count);
					end
					done := l_event.type = {YAML_EVENT_TYPE_E_ENUM_API}.YAML_STREAM_END_EVENT
					check
						compare_events (events [count + 1], l_event) = True
					end
					yaml.yaml_event_delete(l_event);
					count := count + 1
				end
				across events as  ic loop
					yaml.yaml_event_delete(ic.item);
				end
				print("%NPASSED (length: "+ written.out +")%N")
    		    check print_out(a_fn, buffer.substring (1, written), written, -1) = True end

			else
				print ("%NError file [" + a_fn + "] does not  exisit")
			end
		end


	copy_event (event_to: YAML_EVENT_S_STRUCT_API; event_from: YAML_EVENT_S_STRUCT_API): INTEGER
		do
			if event_from.type = {YAML_EVENT_TYPE_E_ENUM_API}.YAML_STREAM_START_EVENT then
				Result :=  yaml.yaml_stream_start_event_initialize (event_to, event_from.stream_start_encoding)
			elseif event_from.type = {YAML_EVENT_TYPE_E_ENUM_API}.YAML_STREAM_END_EVENT then
				Result :=  yaml.yaml_stream_end_event_initialize (event_to)
			elseif event_from.type = {YAML_EVENT_TYPE_E_ENUM_API}.YAML_DOCUMENT_START_EVENT then
				Result := yaml.yaml_document_start_event_initialize (event_to, event_from.document_start_version_directive, event_from.document_start_tag_directives_start, event_from.document_start_tag_directives_end, event_from.document_start_implicit )
			elseif event_from.type = {YAML_EVENT_TYPE_E_ENUM_API}.YAML_DOCUMENT_END_EVENT then
				Result := yaml.yaml_document_end_event_initialize(event_to,event_from.document_end_implicit)
			elseif event_from.type = {YAML_EVENT_TYPE_E_ENUM_API}.YAML_ALIAS_EVENT then
				if attached event_from.alias_anchor as alias_anchor then
					Result := yaml.yaml_alias_event_initialize (event_to, alias_anchor)
				end
			elseif event_from.type = {YAML_EVENT_TYPE_E_ENUM_API}.YAML_SCALAR_EVENT then
				if attached event_from.scalar_value as scalar_value then
					Result :=  yaml.yaml_scalar_event_initialize (event_to, event_from.scalar_anchor, event_from.scalar_tag, scalar_value, event_from.scalar_length, event_from.scalar_plain_implicit, event_from.scalar_quoted_implicit, event_from.scalar_style)
				end
			elseif event_from.type = {YAML_EVENT_TYPE_E_ENUM_API}.YAML_SEQUENCE_START_EVENT then
				Result := yaml.yaml_sequence_start_event_initialize (event_to, event_from.sequence_start_anchor, event_from.sequence_start_tag, event_from.sequence_start_implicit, event_from.sequence_start_style)
			elseif event_from.type = {YAML_EVENT_TYPE_E_ENUM_API}.YAML_SEQUENCE_END_EVENT then
				Result := yaml.yaml_sequence_end_event_initialize (event_to)
			elseif event_from.type = {YAML_EVENT_TYPE_E_ENUM_API}.YAML_MAPPING_START_EVENT then
				Result := yaml.yaml_mapping_start_event_initialize (event_to, event_from.mapping_start_anchor, event_from.mapping_start_tag, event_from.mapping_start_implicit, event_from.mapping_start_style)
 			elseif event_from.type = {YAML_EVENT_TYPE_E_ENUM_API}.YAML_MAPPING_END_EVENT then
            	Result := yaml.yaml_mapping_end_event_initialize(event_to)
            else
            	check event_from.type = {YAML_EVENT_TYPE_E_ENUM_API}.yaml_no_event end
            	Result := 1
			end
		end


	compare_events (event_1: YAML_EVENT_S_STRUCT_API; event_2: YAML_EVENT_S_STRUCT_API): BOOLEAN
		local
			i: INTEGER
			count: INTEGER
			l_tag1: YAML_TAG_DIRECTIVE_S_STRUCT_API
			l_tag2: YAML_TAG_DIRECTIVE_S_STRUCT_API
			l_ptr1: POINTER
			l_ptr2: POINTER
		do
			if event_1.type = event_2.type then
				if event_1.type = {YAML_EVENT_TYPE_E_ENUM_API}.YAML_STREAM_START_EVENT then
					Result := True
				elseif event_1.type = {YAML_EVENT_TYPE_E_ENUM_API}.YAML_DOCUMENT_START_EVENT then
					if  ((attached event_1.document_start_version_directive as l_start_1_version_directive and then
						attached event_2.document_start_version_directive as l_start_2_version_directive and then
						l_start_1_version_directive.major = l_start_2_version_directive.major and then
						l_start_1_version_directive.minor = l_start_2_version_directive.minor)
						or ((event_1.document_start_version_directive = Void and then event_2.document_start_version_directive = Void)))
					then
						Result := True
					end
					if Result and then attached event_1.document_start_tag_directives_end as tag1_end and then
						attached event_1.document_start_tag_directives_start as tag1_start and then
						attached event_2.document_start_tag_directives_end as tag2_end and then
						attached event_2.document_start_tag_directives_start as tag2_start and then
						(tag1_end.item.to_integer_32 - tag1_start.item.to_integer_32 = tag2_end.item.to_integer_32 - tag2_start.item.to_integer_32 )
					then
						from
							l_tag1 := tag1_start
							l_tag2 := tag2_start
							count := tag1_end.item.to_integer_32 - tag1_start.item.to_integer_32
							l_ptr1 := tag1_start.item
							l_ptr2 := tag2_start.item
							i := 1
						until
							i > count or not Result
						loop
							if (attached l_tag1.handle as l_handle_1 and then
								attached l_tag2.handle as l_handle_2 and then
								l_handle_1.same_string (l_handle_2)) or (
								l_tag1.handle = Void and then
								l_tag2.handle = Void)
							then
								Result := True
							else
								Result := False
							end
							if Result and then  (attached l_tag1.a_prefix as l_prefix_1 and then
								attached l_tag2.a_prefix as l_prefix_2 and then
								l_prefix_1.same_string (l_prefix_2)) or (
								l_tag1.a_prefix = Void and then
								l_tag2.a_prefix = Void)
							then
								Result := True
							else
								Result := False
							end
							if Result then
								($l_ptr1).memory_copy (l_tag1.item + i, l_tag1.structure_size)
								($l_ptr2).memory_copy (l_tag2.item + i, l_tag2.structure_size)
								create l_tag1.make_by_pointer (l_ptr1)
								create l_tag2.make_by_pointer (l_ptr2)
							end
							i := i + 1
						end
					elseif Result and then event_1.document_start_tag_directives_end = Void and then
						event_1.document_start_tag_directives_start = Void and then
						event_2.document_start_tag_directives_end = Void and then
						event_2.document_start_tag_directives_start = Void
					then
						Result := True
					else
						Result := False
					end
				elseif event_1.type = {YAML_EVENT_TYPE_E_ENUM_API}.YAML_DOCUMENT_END_EVENT then
					Result := True
				elseif event_1.type = {YAML_EVENT_TYPE_E_ENUM_API}.YAML_ALIAS_EVENT then
					if (attached event_1.alias_anchor as alias_anchor_1 and then
						attached event_2.alias_anchor as alias_anchor_2 and then
						alias_anchor_1.same_string (alias_anchor_2)) or (
							event_1.alias_anchor = Void and then
							event_2.alias_anchor = Void)
					then
						Result := True
					else
						Result := False
					end
				elseif event_1.type = {YAML_EVENT_TYPE_E_ENUM_API}.YAML_SCALAR_EVENT then
					if (attached event_1.scalar_anchor as scalar_anchor_1 and then
						attached event_2.scalar_anchor as scalar_anchor_2 and then
						scalar_anchor_1.same_string (scalar_anchor_2)) or (
						event_1.scalar_anchor = Void and then
						event_2.scalar_anchor = Void
						)
					then
						Result := True
					else
						Result := False
					end
					if Result and then
						(attached event_1.scalar_tag as scalar_tag_1 and then
						 attached event_2.scalar_tag as scalar_tag_2 and then
						 scalar_tag_1.same_string (scalar_tag_2)) or (
						 event_1.scalar_tag = Void and then
						 event_2.scalar_tag = Void )
					then
						Result := True
					else
						Result := False
					end
					if Result and then (event_1.scalar_plain_implicit = event_2.scalar_plain_implicit and then
						event_1.scalar_quoted_implicit = event_2.scalar_quoted_implicit and then
						event_1.scalar_style = event_2.scalar_style)
					then
						Result := True
					else
						Result := False
					end
				elseif event_1.type = {YAML_EVENT_TYPE_E_ENUM_API}.YAML_SEQUENCE_START_EVENT then
					if (attached event_1.sequence_start_anchor as start_anchor_1 and then
						attached event_2.sequence_start_anchor as start_anchor_2 and then
						start_anchor_1.same_string (start_anchor_2)) or (
						event_1.sequence_start_anchor = Void and then
						event_2.sequence_start_anchor = Void
						)
					then
						Result := True
					else
						Result := False
					end
					if Result and then (
						attached event_1.sequence_start_tag as start_tag_1 and then
						attached event_2.sequence_start_tag as start_tag_2 and then
						start_tag_1.same_string (start_tag_2)) or (
						event_1.sequence_start_tag = Void and then
						event_2.sequence_start_tag = Void)
					then
						Result := True
					else
						Result := False
					end
					if Result and then (event_1.sequence_start_implicit = event_2.sequence_start_implicit
						and then event_1.sequence_start_style = event_2.sequence_start_style)
 					then
 						Result := True
 					else
 						Result := False
					end
				elseif event_1.type = {YAML_EVENT_TYPE_E_ENUM_API}.YAML_MAPPING_START_EVENT then
					if attached event_1.mapping_start_anchor as start_anchor_1 and then
						attached event_2.mapping_start_anchor as start_anchor_2 and then
						start_anchor_1.same_string (start_anchor_2) or (
						event_1.mapping_start_anchor  = Void and then
						event_1.mapping_start_anchor  = Void
						)
					then
						Result := True
					else
						Result := False
					end
					if Result and then
						(attached event_1.mapping_start_tag as start_tag_1 and then
						 attached event_2.mapping_start_tag as start_tag_2 and then
						 start_tag_1.same_string (start_tag_2)) or (
						 event_1.mapping_start_tag = Void and then
						 event_2.mapping_start_tag = Void
						 )
					then
						Result := True
					else
						Result := False
					end
					if Result and then
						(event_1.mapping_start_implicit = event_2.mapping_start_implicit and then
						event_1.mapping_start_style = event_2.mapping_start_style)
					then
						Result := True
					else
						Result := False
					end
				else
					Result := True
				end
			end
		end

	print_out (a_fn: STRING; a_buffer: STRING; size: INTEGER; count: INTEGER): BOOLEAN
		local
			file: FILE
			data: STRING
			data_size: INTEGER
			total_size: INTEGER
		do
			Result := True
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
    MAX_EVENTS : INTEGER = 1024

feature {NONE} -- Implementation

	yaml: YAML_FUNCTIONS
		once
			create Result
		end

end
