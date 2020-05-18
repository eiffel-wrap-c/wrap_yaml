note
	description: "Summary description for {YAML_FUNCTIONS}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	YAML_FUNCTIONS

inherit

	YAML_FUNCTIONS_API
		rename
			yaml_parser_set_input_string as yaml_parser_set_input_string_api,
			yaml_document_start_event_initialize as yaml_document_start_event_initialize_api,
			yaml_scalar_event_initialize as yaml_scalar_event_initialize_api,
			yaml_sequence_start_event_initialize as yaml_sequence_start_event_initialize_api,
			yaml_mapping_start_event_initialize as yaml_mapping_start_event_initialize_api,
			yaml_emitter_set_output_string as yaml_emitter_set_output_string_api,
			yaml_document_initialize as yaml_document_initialize_api,
			yaml_document_add_scalar as yaml_document_add_scalar_api,
			yaml_document_add_sequence as yaml_document_add_sequence_api,
			yaml_document_add_mapping as yaml_document_add_mapping_api
		end

feature -- Access

	yaml_parser_set_input_file (parser: YAML_PARSER_S_STRUCT_API; file: FILE)
		do
			c_yaml_parser_set_input_file (parser.item, file.file_pointer)
		ensure
			instance_free: class
		end

	yaml_parser_set_input_string (parser: YAML_PARSER_S_STRUCT_API; input: STRING)
		do
			yaml_parser_set_input_string_api (parser, input, input.count)
		ensure
			instance_free: class
		end

	yaml_document_start_event_initialize (event: YAML_EVENT_S_STRUCT_API; version_directive: detachable YAML_VERSION_DIRECTIVE_S_STRUCT_API; tag_directives_start: detachable YAML_TAG_DIRECTIVE_S_STRUCT_API; tag_directives_end: detachable YAML_TAG_DIRECTIVE_S_STRUCT_API; implicit: INTEGER): INTEGER
		local
			vd_ptr: POINTER
			tag_start: POINTER
			tag_end: POINTER
		do
			if attached version_directive then
				vd_ptr := version_directive.item
			end
			if attached tag_directives_start then
				tag_start := tag_directives_start.item
			end
			if attached tag_directives_end then
				tag_end := tag_directives_end.item
			end
			Result := c_yaml_document_start_event_initialize (event.item, vd_ptr, tag_start, tag_end, implicit)
		ensure
			instance_free: class
		end

	yaml_scalar_event_initialize (event: YAML_EVENT_S_STRUCT_API; anchor: detachable STRING; tag: detachable STRING; value: STRING; length: INTEGER; plain_implicit: INTEGER; quoted_implicit: INTEGER; style: INTEGER): INTEGER
		local
			l_anchor: POINTER
			l_tag: POINTER
			value_c_string: C_STRING
		do
			if attached anchor then
				l_anchor := (create {C_STRING}.make (anchor)).item
			end
			if attached tag then
				l_tag := (create {C_STRING}.make (tag)).item
			end
			create value_c_string.make (value)
			Result := c_yaml_scalar_event_initialize (event.item, l_anchor, l_tag, value_c_string.item, length, plain_implicit, quoted_implicit, style)
		ensure
			instance_free: class
		end

	yaml_sequence_start_event_initialize (event: YAML_EVENT_S_STRUCT_API; anchor: detachable STRING; tag: detachable STRING; implicit: INTEGER; style: INTEGER): INTEGER
		local
			l_anchor: POINTER
			l_tag: POINTER
		do
			if attached anchor then
				l_anchor := (create {C_STRING}.make (anchor)).item
			end
			if attached tag then
				l_tag := (create {C_STRING}.make (tag)).item
			end
			Result := c_yaml_sequence_start_event_initialize (event.item, l_anchor, l_tag, implicit, style)
		ensure
			instance_free: class
		end

	yaml_mapping_start_event_initialize (event: YAML_EVENT_S_STRUCT_API; anchor: detachable STRING; tag: detachable STRING; implicit: INTEGER; style: INTEGER): INTEGER
		local
			l_anchor: POINTER
			l_tag: POINTER
		do
			if attached anchor then
				l_anchor := (create {C_STRING}.make (anchor)).item
			end
			if attached tag then
				l_tag := (create {C_STRING}.make (tag)).item
			end
			Result := c_yaml_mapping_start_event_initialize (event.item, l_anchor, l_tag, implicit, style)
		ensure
			instance_free: class
		end

	yaml_emitter_set_output_string (emitter: YAML_EMITTER_S_STRUCT_API; output: STRING; size: INTEGER; size_written: POINTER)
		do
			c_yaml_emitter_set_output_string (emitter.item, output.area.base_address, size, size_written)
		ensure
			instance_free: class
		end

	yaml_emitter_set_output_string_2 (emitter: YAML_EMITTER_S_STRUCT_API; output: MANAGED_POINTER; size: INTEGER; size_written: POINTER)
		do
			c_yaml_emitter_set_output_string (emitter.item, output.item, size, size_written)
		ensure
			instance_free: class
		end

	yaml_document_initialize (document: YAML_DOCUMENT_S_STRUCT_API; version_directive: detachable YAML_VERSION_DIRECTIVE_S_STRUCT_API; tag_directives_start: detachable YAML_TAG_DIRECTIVE_S_STRUCT_API; tag_directives_end: detachable YAML_TAG_DIRECTIVE_S_STRUCT_API; start_implicit: INTEGER; end_implicit: INTEGER): INTEGER
		local
			l_vd: POINTER
			l_ts: POINTER
			l_te: POINTER
		do
			if attached version_directive then
				l_vd := version_directive.item
			end
			if attached tag_directives_start then
				l_ts := tag_directives_start.item
			end
			if attached tag_directives_end then
				l_te := tag_directives_end.item
			end
			Result := c_yaml_document_initialize (document.item, l_vd, l_ts, l_te, start_implicit, end_implicit)
		ensure
			instance_free: class
		end

	yaml_document_add_scalar (document: YAML_DOCUMENT_S_STRUCT_API; tag: detachable STRING; value: detachable STRING; length: INTEGER; style: INTEGER): INTEGER
		local
			l_tag: POINTER
			l_value: POINTER
		do
			if attached tag then
				l_tag := (create {C_STRING}.make (tag)).item
			end
			if attached value then
				l_value := (create {C_STRING}.make (value)).item
			end
			Result := c_yaml_document_add_scalar (document.item, l_tag, l_value, length, style)
		ensure
			instance_free: class
		end

	yaml_document_add_sequence (document: YAML_DOCUMENT_S_STRUCT_API; tag: detachable STRING; style: INTEGER): INTEGER
		local
			l_tag: POINTER
		do
			if attached tag then
				l_tag := (create {C_STRING}.make (tag)).item
			end
			Result := c_yaml_document_add_sequence (document.item, l_tag, style)
		ensure
			instance_free: class
		end

	yaml_document_add_mapping (document: YAML_DOCUMENT_S_STRUCT_API; tag: detachable STRING; style: INTEGER): INTEGER
		local
			l_tag: POINTER
		do
			if attached tag then
				l_tag := (create {C_STRING}.make (tag)).item
			end
			Result := c_yaml_document_add_mapping (document.item, l_tag, style)
		ensure
			instance_free: class
		end

end
