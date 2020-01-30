note

	description: "This file has been generated by EWG. Do not edit. Changes will be lost!"

	generator: "Eiffel Wrapper Generator"

class YAML_PARSER_S_STRUCT_API

inherit

	MEMORY_STRUCTURE

	
create

	make,
	make_by_pointer

feature -- Measurement

	structure_size: INTEGER 
		do
			Result := sizeof_external
		end

feature {ANY} -- Member Access

	error: INTEGER
			-- Access member `error`
		require
			exists: exists
		do
			Result := c_error (item)
		ensure
			result_correct: Result = c_error (item)
		end

	set_error (a_value: INTEGER) 
			-- Change the value of member `error` to `a_value`.
		require
			exists: exists
		do
			set_c_error (item, a_value)
		ensure
			error_set: a_value = error
		end

	problem:  detachable STRING
			-- Access member `problem`
		require
			exists: exists
		do
			if attached c_problem (item) as l_ptr then
				Result := (create {C_STRING}.make_by_pointer (l_ptr)).string
			end
		ensure
			result_void: Result = Void implies c_problem (item) = default_pointer
			result_not_void: attached Result as l_result implies l_result.same_string ((create {C_STRING}.make_by_pointer (item)).string)
		end

	set_problem (a_value: STRING) 
			-- Change the value of member `problem` to `a_value`.
		require
			exists: exists
		do
			set_c_problem (item, (create {C_STRING}.make (a_value)).item )
		end

	problem_offset: INTEGER
			-- Access member `problem_offset`
		require
			exists: exists
		do
			Result := c_problem_offset (item)
		ensure
			result_correct: Result = c_problem_offset (item)
		end

	set_problem_offset (a_value: INTEGER) 
			-- Change the value of member `problem_offset` to `a_value`.
		require
			exists: exists
		do
			set_c_problem_offset (item, a_value)
		ensure
			problem_offset_set: a_value = problem_offset
		end

	problem_value: INTEGER
			-- Access member `problem_value`
		require
			exists: exists
		do
			Result := c_problem_value (item)
		ensure
			result_correct: Result = c_problem_value (item)
		end

	set_problem_value (a_value: INTEGER) 
			-- Change the value of member `problem_value` to `a_value`.
		require
			exists: exists
		do
			set_c_problem_value (item, a_value)
		ensure
			problem_value_set: a_value = problem_value
		end

	problem_mark: POINTER
			-- Access member `problem_mark`
		require
			exists: exists
		do
			Result := c_problem_mark (item) 
		ensure
		end

	set_problem_mark (a_value: POINTER )
			-- Set member `problem_mark`
		require
			a_value_not_void: a_value /= default_pointer
			exists: exists
		do
			set_c_problem_mark (item, a_value)
		ensure
			problem_mark_set: problem_mark = a_value 		end

	context:  detachable STRING
			-- Access member `context`
		require
			exists: exists
		do
			if attached c_context (item) as l_ptr then
				Result := (create {C_STRING}.make_by_pointer (l_ptr)).string
			end
		ensure
			result_void: Result = Void implies c_context (item) = default_pointer
			result_not_void: attached Result as l_result implies l_result.same_string ((create {C_STRING}.make_by_pointer (item)).string)
		end

	set_context (a_value: STRING) 
			-- Change the value of member `context` to `a_value`.
		require
			exists: exists
		do
			set_c_context (item, (create {C_STRING}.make (a_value)).item )
		end

	context_mark: POINTER
			-- Access member `context_mark`
		require
			exists: exists
		do
			Result := c_context_mark (item) 
		ensure
		end

	set_context_mark (a_value: POINTER )
			-- Set member `context_mark`
		require
			a_value_not_void: a_value /= default_pointer
			exists: exists
		do
			set_c_context_mark (item, a_value)
		ensure
			context_mark_set: context_mark = a_value 		end

	read_handler: POINTER
			-- Access member `read_handler`
		require
			exists: exists
		do
			Result := c_read_handler (item)
		ensure
			result_correct: Result = c_read_handler (item)
		end

	set_read_handler (a_value: POINTER) 
			-- Change the value of member `read_handler` to `a_value`.
		require
			exists: exists
		do
			set_c_read_handler (item, a_value)
		ensure
			read_handler_set: a_value = read_handler
		end

	read_handler_data: POINTER
			-- Access member `read_handler_data`
		require
			exists: exists
		do
			Result := c_read_handler_data (item)
		ensure
			result_correct: Result = c_read_handler_data (item)
		end

	set_read_handler_data (a_value: POINTER) 
			-- Change the value of member `read_handler_data` to `a_value`.
		require
			exists: exists
		do
			set_c_read_handler_data (item, a_value)
		ensure
			read_handler_data_set: a_value = read_handler_data
		end

	eof: INTEGER
			-- Access member `eof`
		require
			exists: exists
		do
			Result := c_eof (item)
		ensure
			result_correct: Result = c_eof (item)
		end

	set_eof (a_value: INTEGER) 
			-- Change the value of member `eof` to `a_value`.
		require
			exists: exists
		do
			set_c_eof (item, a_value)
		ensure
			eof_set: a_value = eof
		end

	unread: INTEGER
			-- Access member `unread`
		require
			exists: exists
		do
			Result := c_unread (item)
		ensure
			result_correct: Result = c_unread (item)
		end

	set_unread (a_value: INTEGER) 
			-- Change the value of member `unread` to `a_value`.
		require
			exists: exists
		do
			set_c_unread (item, a_value)
		ensure
			unread_set: a_value = unread
		end

	encoding: INTEGER
			-- Access member `encoding`
		require
			exists: exists
		do
			Result := c_encoding (item)
		ensure
			result_correct: Result = c_encoding (item)
		end

	set_encoding (a_value: INTEGER) 
			-- Change the value of member `encoding` to `a_value`.
		require
			exists: exists
		do
			set_c_encoding (item, a_value)
		ensure
			encoding_set: a_value = encoding
		end

	offset: INTEGER
			-- Access member `offset`
		require
			exists: exists
		do
			Result := c_offset (item)
		ensure
			result_correct: Result = c_offset (item)
		end

	set_offset (a_value: INTEGER) 
			-- Change the value of member `offset` to `a_value`.
		require
			exists: exists
		do
			set_c_offset (item, a_value)
		ensure
			offset_set: a_value = offset
		end

	mark: POINTER
			-- Access member `mark`
		require
			exists: exists
		do
			Result := c_mark (item) 
		ensure
		end

	set_mark (a_value: POINTER )
			-- Set member `mark`
		require
			a_value_not_void: a_value /= default_pointer
			exists: exists
		do
			set_c_mark (item, a_value)
		ensure
			mark_set: mark = a_value 		end

	stream_start_produced: INTEGER
			-- Access member `stream_start_produced`
		require
			exists: exists
		do
			Result := c_stream_start_produced (item)
		ensure
			result_correct: Result = c_stream_start_produced (item)
		end

	set_stream_start_produced (a_value: INTEGER) 
			-- Change the value of member `stream_start_produced` to `a_value`.
		require
			exists: exists
		do
			set_c_stream_start_produced (item, a_value)
		ensure
			stream_start_produced_set: a_value = stream_start_produced
		end

	stream_end_produced: INTEGER
			-- Access member `stream_end_produced`
		require
			exists: exists
		do
			Result := c_stream_end_produced (item)
		ensure
			result_correct: Result = c_stream_end_produced (item)
		end

	set_stream_end_produced (a_value: INTEGER) 
			-- Change the value of member `stream_end_produced` to `a_value`.
		require
			exists: exists
		do
			set_c_stream_end_produced (item, a_value)
		ensure
			stream_end_produced_set: a_value = stream_end_produced
		end

	flow_level: INTEGER
			-- Access member `flow_level`
		require
			exists: exists
		do
			Result := c_flow_level (item)
		ensure
			result_correct: Result = c_flow_level (item)
		end

	set_flow_level (a_value: INTEGER) 
			-- Change the value of member `flow_level` to `a_value`.
		require
			exists: exists
		do
			set_c_flow_level (item, a_value)
		ensure
			flow_level_set: a_value = flow_level
		end

	tokens_parsed: INTEGER
			-- Access member `tokens_parsed`
		require
			exists: exists
		do
			Result := c_tokens_parsed (item)
		ensure
			result_correct: Result = c_tokens_parsed (item)
		end

	set_tokens_parsed (a_value: INTEGER) 
			-- Change the value of member `tokens_parsed` to `a_value`.
		require
			exists: exists
		do
			set_c_tokens_parsed (item, a_value)
		ensure
			tokens_parsed_set: a_value = tokens_parsed
		end

	token_available: INTEGER
			-- Access member `token_available`
		require
			exists: exists
		do
			Result := c_token_available (item)
		ensure
			result_correct: Result = c_token_available (item)
		end

	set_token_available (a_value: INTEGER) 
			-- Change the value of member `token_available` to `a_value`.
		require
			exists: exists
		do
			set_c_token_available (item, a_value)
		ensure
			token_available_set: a_value = token_available
		end

	indent: INTEGER
			-- Access member `indent`
		require
			exists: exists
		do
			Result := c_indent (item)
		ensure
			result_correct: Result = c_indent (item)
		end

	set_indent (a_value: INTEGER) 
			-- Change the value of member `indent` to `a_value`.
		require
			exists: exists
		do
			set_c_indent (item, a_value)
		ensure
			indent_set: a_value = indent
		end

	simple_key_allowed: INTEGER
			-- Access member `simple_key_allowed`
		require
			exists: exists
		do
			Result := c_simple_key_allowed (item)
		ensure
			result_correct: Result = c_simple_key_allowed (item)
		end

	set_simple_key_allowed (a_value: INTEGER) 
			-- Change the value of member `simple_key_allowed` to `a_value`.
		require
			exists: exists
		do
			set_c_simple_key_allowed (item, a_value)
		ensure
			simple_key_allowed_set: a_value = simple_key_allowed
		end

	state: INTEGER
			-- Access member `state`
		require
			exists: exists
		do
			Result := c_state (item)
		ensure
			result_correct: Result = c_state (item)
		end

	set_state (a_value: INTEGER) 
			-- Change the value of member `state` to `a_value`.
		require
			exists: exists
		do
			set_c_state (item, a_value)
		ensure
			state_set: a_value = state
		end

	document: detachable YAML_DOCUMENT_S_STRUCT_API 
			-- Access member `document`
		require
			exists: exists
		do
			if attached c_document (item) as l_ptr and then not l_ptr.is_default_pointer then
				create Result.make_by_pointer (l_ptr)
			end
		ensure
			result_void: Result = Void implies c_document (item) = default_pointer 
			result_not_void: attached Result as l_result implies l_result.item = c_document (item) 
		end

	set_document (a_value: YAML_DOCUMENT_S_STRUCT_API) 
			-- Set member `document`
		require
			a_value_not_void: a_value /= Void
			exists: exists
		do
			set_c_document (item, a_value.item)
		ensure
			document_set: attached document as l_value implies l_value.item = a_value.item
		end

feature {NONE} -- Implementation wrapper for struct struct yaml_parser_s

	sizeof_external: INTEGER 
		external
			"C inline use <yaml.h>"
		alias
			"sizeof(struct yaml_parser_s)"
		end

	c_error (an_item: POINTER): INTEGER
		require
			an_item_not_null: an_item /= default_pointer
		external
			"C inline use <yaml.h>"
		alias
			"[
				((struct yaml_parser_s*)$an_item)->error
			]"
		end

	set_c_error (an_item: POINTER; a_value: INTEGER) 
		require
			an_item_not_null: an_item /= default_pointer
		external
			"C inline use <yaml.h>"
		alias
			"[
				((struct yaml_parser_s*)$an_item)->error =  (yaml_error_type_t)$a_value
			]"
		ensure
			error_set: a_value = c_error (an_item)
		end

	c_problem (an_item: POINTER): POINTER
		require
			an_item_not_null: an_item /= default_pointer
		external
			"C inline use <yaml.h>"
		alias
			"[
				((struct yaml_parser_s*)$an_item)->problem
			]"
		end

	set_c_problem (an_item: POINTER; a_value: POINTER) 
		require
			an_item_not_null: an_item /= default_pointer
		external
			"C inline use <yaml.h>"
		alias
			"[
				((struct yaml_parser_s*)$an_item)->problem =  (char const*)$a_value
			]"
		ensure
			problem_set: a_value = c_problem (an_item)
		end

	c_problem_offset (an_item: POINTER): INTEGER
		require
			an_item_not_null: an_item /= default_pointer
		external
			"C inline use <yaml.h>"
		alias
			"[
				((struct yaml_parser_s*)$an_item)->problem_offset
			]"
		end

	set_c_problem_offset (an_item: POINTER; a_value: INTEGER) 
		require
			an_item_not_null: an_item /= default_pointer
		external
			"C inline use <yaml.h>"
		alias
			"[
				((struct yaml_parser_s*)$an_item)->problem_offset =  (size_t)$a_value
			]"
		ensure
			problem_offset_set: a_value = c_problem_offset (an_item)
		end

	c_problem_value (an_item: POINTER): INTEGER
		require
			an_item_not_null: an_item /= default_pointer
		external
			"C inline use <yaml.h>"
		alias
			"[
				((struct yaml_parser_s*)$an_item)->problem_value
			]"
		end

	set_c_problem_value (an_item: POINTER; a_value: INTEGER) 
		require
			an_item_not_null: an_item /= default_pointer
		external
			"C inline use <yaml.h>"
		alias
			"[
				((struct yaml_parser_s*)$an_item)->problem_value =  (int)$a_value
			]"
		ensure
			problem_value_set: a_value = c_problem_value (an_item)
		end

	c_problem_mark (an_item: POINTER): POINTER
		require
			an_item_not_null: an_item /= default_pointer
		external
			"C inline use <yaml.h>"
		alias
			"[
				&((struct yaml_parser_s*)$an_item)->problem_mark
			]"
		end

	set_c_problem_mark (an_item: POINTER; a_value: POINTER) 
		require
			an_item_not_null: an_item /= default_pointer
		external
			"C inline use <yaml.h>"
		alias
			"[
				((struct yaml_parser_s*)$an_item)->problem_mark =  *(yaml_mark_t*)$a_value
			]"
		end

	c_context (an_item: POINTER): POINTER
		require
			an_item_not_null: an_item /= default_pointer
		external
			"C inline use <yaml.h>"
		alias
			"[
				((struct yaml_parser_s*)$an_item)->context
			]"
		end

	set_c_context (an_item: POINTER; a_value: POINTER) 
		require
			an_item_not_null: an_item /= default_pointer
		external
			"C inline use <yaml.h>"
		alias
			"[
				((struct yaml_parser_s*)$an_item)->context =  (char const*)$a_value
			]"
		ensure
			context_set: a_value = c_context (an_item)
		end

	c_context_mark (an_item: POINTER): POINTER
		require
			an_item_not_null: an_item /= default_pointer
		external
			"C inline use <yaml.h>"
		alias
			"[
				&((struct yaml_parser_s*)$an_item)->context_mark
			]"
		end

	set_c_context_mark (an_item: POINTER; a_value: POINTER) 
		require
			an_item_not_null: an_item /= default_pointer
		external
			"C inline use <yaml.h>"
		alias
			"[
				((struct yaml_parser_s*)$an_item)->context_mark =  *(yaml_mark_t*)$a_value
			]"
		end

	c_read_handler (an_item: POINTER): POINTER
		require
			an_item_not_null: an_item /= default_pointer
		external
			"C inline use <yaml.h>"
		alias
			"[
				((struct yaml_parser_s*)$an_item)->read_handler
			]"
		end

	set_c_read_handler (an_item: POINTER; a_value: POINTER) 
		require
			an_item_not_null: an_item /= default_pointer
		external
			"C inline use <yaml.h>"
		alias
			"[
				((struct yaml_parser_s*)$an_item)->read_handler =  (yaml_read_handler_t*)$a_value
			]"
		ensure
			read_handler_set: a_value = c_read_handler (an_item)
		end

	c_read_handler_data (an_item: POINTER): POINTER
		require
			an_item_not_null: an_item /= default_pointer
		external
			"C inline use <yaml.h>"
		alias
			"[
				((struct yaml_parser_s*)$an_item)->read_handler_data
			]"
		end

	set_c_read_handler_data (an_item: POINTER; a_value: POINTER) 
		require
			an_item_not_null: an_item /= default_pointer
		external
			"C inline use <yaml.h>"
		alias
			"[
				((struct yaml_parser_s*)$an_item)->read_handler_data =  (void*)$a_value
			]"
		ensure
			read_handler_data_set: a_value = c_read_handler_data (an_item)
		end

	c_eof (an_item: POINTER): INTEGER
		require
			an_item_not_null: an_item /= default_pointer
		external
			"C inline use <yaml.h>"
		alias
			"[
				((struct yaml_parser_s*)$an_item)->eof
			]"
		end

	set_c_eof (an_item: POINTER; a_value: INTEGER) 
		require
			an_item_not_null: an_item /= default_pointer
		external
			"C inline use <yaml.h>"
		alias
			"[
				((struct yaml_parser_s*)$an_item)->eof =  (int)$a_value
			]"
		ensure
			eof_set: a_value = c_eof (an_item)
		end

	c_unread (an_item: POINTER): INTEGER
		require
			an_item_not_null: an_item /= default_pointer
		external
			"C inline use <yaml.h>"
		alias
			"[
				((struct yaml_parser_s*)$an_item)->unread
			]"
		end

	set_c_unread (an_item: POINTER; a_value: INTEGER) 
		require
			an_item_not_null: an_item /= default_pointer
		external
			"C inline use <yaml.h>"
		alias
			"[
				((struct yaml_parser_s*)$an_item)->unread =  (size_t)$a_value
			]"
		ensure
			unread_set: a_value = c_unread (an_item)
		end

	c_encoding (an_item: POINTER): INTEGER
		require
			an_item_not_null: an_item /= default_pointer
		external
			"C inline use <yaml.h>"
		alias
			"[
				((struct yaml_parser_s*)$an_item)->encoding
			]"
		end

	set_c_encoding (an_item: POINTER; a_value: INTEGER) 
		require
			an_item_not_null: an_item /= default_pointer
		external
			"C inline use <yaml.h>"
		alias
			"[
				((struct yaml_parser_s*)$an_item)->encoding =  (yaml_encoding_t)$a_value
			]"
		ensure
			encoding_set: a_value = c_encoding (an_item)
		end

	c_offset (an_item: POINTER): INTEGER
		require
			an_item_not_null: an_item /= default_pointer
		external
			"C inline use <yaml.h>"
		alias
			"[
				((struct yaml_parser_s*)$an_item)->offset
			]"
		end

	set_c_offset (an_item: POINTER; a_value: INTEGER) 
		require
			an_item_not_null: an_item /= default_pointer
		external
			"C inline use <yaml.h>"
		alias
			"[
				((struct yaml_parser_s*)$an_item)->offset =  (size_t)$a_value
			]"
		ensure
			offset_set: a_value = c_offset (an_item)
		end

	c_mark (an_item: POINTER): POINTER
		require
			an_item_not_null: an_item /= default_pointer
		external
			"C inline use <yaml.h>"
		alias
			"[
				&((struct yaml_parser_s*)$an_item)->mark
			]"
		end

	set_c_mark (an_item: POINTER; a_value: POINTER) 
		require
			an_item_not_null: an_item /= default_pointer
		external
			"C inline use <yaml.h>"
		alias
			"[
				((struct yaml_parser_s*)$an_item)->mark =  *(yaml_mark_t*)$a_value
			]"
		end

	c_stream_start_produced (an_item: POINTER): INTEGER
		require
			an_item_not_null: an_item /= default_pointer
		external
			"C inline use <yaml.h>"
		alias
			"[
				((struct yaml_parser_s*)$an_item)->stream_start_produced
			]"
		end

	set_c_stream_start_produced (an_item: POINTER; a_value: INTEGER) 
		require
			an_item_not_null: an_item /= default_pointer
		external
			"C inline use <yaml.h>"
		alias
			"[
				((struct yaml_parser_s*)$an_item)->stream_start_produced =  (int)$a_value
			]"
		ensure
			stream_start_produced_set: a_value = c_stream_start_produced (an_item)
		end

	c_stream_end_produced (an_item: POINTER): INTEGER
		require
			an_item_not_null: an_item /= default_pointer
		external
			"C inline use <yaml.h>"
		alias
			"[
				((struct yaml_parser_s*)$an_item)->stream_end_produced
			]"
		end

	set_c_stream_end_produced (an_item: POINTER; a_value: INTEGER) 
		require
			an_item_not_null: an_item /= default_pointer
		external
			"C inline use <yaml.h>"
		alias
			"[
				((struct yaml_parser_s*)$an_item)->stream_end_produced =  (int)$a_value
			]"
		ensure
			stream_end_produced_set: a_value = c_stream_end_produced (an_item)
		end

	c_flow_level (an_item: POINTER): INTEGER
		require
			an_item_not_null: an_item /= default_pointer
		external
			"C inline use <yaml.h>"
		alias
			"[
				((struct yaml_parser_s*)$an_item)->flow_level
			]"
		end

	set_c_flow_level (an_item: POINTER; a_value: INTEGER) 
		require
			an_item_not_null: an_item /= default_pointer
		external
			"C inline use <yaml.h>"
		alias
			"[
				((struct yaml_parser_s*)$an_item)->flow_level =  (int)$a_value
			]"
		ensure
			flow_level_set: a_value = c_flow_level (an_item)
		end

	c_tokens_parsed (an_item: POINTER): INTEGER
		require
			an_item_not_null: an_item /= default_pointer
		external
			"C inline use <yaml.h>"
		alias
			"[
				((struct yaml_parser_s*)$an_item)->tokens_parsed
			]"
		end

	set_c_tokens_parsed (an_item: POINTER; a_value: INTEGER) 
		require
			an_item_not_null: an_item /= default_pointer
		external
			"C inline use <yaml.h>"
		alias
			"[
				((struct yaml_parser_s*)$an_item)->tokens_parsed =  (size_t)$a_value
			]"
		ensure
			tokens_parsed_set: a_value = c_tokens_parsed (an_item)
		end

	c_token_available (an_item: POINTER): INTEGER
		require
			an_item_not_null: an_item /= default_pointer
		external
			"C inline use <yaml.h>"
		alias
			"[
				((struct yaml_parser_s*)$an_item)->token_available
			]"
		end

	set_c_token_available (an_item: POINTER; a_value: INTEGER) 
		require
			an_item_not_null: an_item /= default_pointer
		external
			"C inline use <yaml.h>"
		alias
			"[
				((struct yaml_parser_s*)$an_item)->token_available =  (int)$a_value
			]"
		ensure
			token_available_set: a_value = c_token_available (an_item)
		end

	c_indent (an_item: POINTER): INTEGER
		require
			an_item_not_null: an_item /= default_pointer
		external
			"C inline use <yaml.h>"
		alias
			"[
				((struct yaml_parser_s*)$an_item)->indent
			]"
		end

	set_c_indent (an_item: POINTER; a_value: INTEGER) 
		require
			an_item_not_null: an_item /= default_pointer
		external
			"C inline use <yaml.h>"
		alias
			"[
				((struct yaml_parser_s*)$an_item)->indent =  (int)$a_value
			]"
		ensure
			indent_set: a_value = c_indent (an_item)
		end

	c_simple_key_allowed (an_item: POINTER): INTEGER
		require
			an_item_not_null: an_item /= default_pointer
		external
			"C inline use <yaml.h>"
		alias
			"[
				((struct yaml_parser_s*)$an_item)->simple_key_allowed
			]"
		end

	set_c_simple_key_allowed (an_item: POINTER; a_value: INTEGER) 
		require
			an_item_not_null: an_item /= default_pointer
		external
			"C inline use <yaml.h>"
		alias
			"[
				((struct yaml_parser_s*)$an_item)->simple_key_allowed =  (int)$a_value
			]"
		ensure
			simple_key_allowed_set: a_value = c_simple_key_allowed (an_item)
		end

	c_state (an_item: POINTER): INTEGER
		require
			an_item_not_null: an_item /= default_pointer
		external
			"C inline use <yaml.h>"
		alias
			"[
				((struct yaml_parser_s*)$an_item)->state
			]"
		end

	set_c_state (an_item: POINTER; a_value: INTEGER) 
		require
			an_item_not_null: an_item /= default_pointer
		external
			"C inline use <yaml.h>"
		alias
			"[
				((struct yaml_parser_s*)$an_item)->state =  (yaml_parser_state_t)$a_value
			]"
		ensure
			state_set: a_value = c_state (an_item)
		end

	c_document (an_item: POINTER): POINTER
		require
			an_item_not_null: an_item /= default_pointer
		external
			"C inline use <yaml.h>"
		alias
			"[
				((struct yaml_parser_s*)$an_item)->document
			]"
		end

	set_c_document (an_item: POINTER; a_value: POINTER) 
		require
			an_item_not_null: an_item /= default_pointer
		external
			"C inline use <yaml.h>"
		alias
			"[
				((struct yaml_parser_s*)$an_item)->document =  (yaml_document_t*)$a_value
			]"
		ensure
			document_set: a_value = c_document (an_item)
		end

end