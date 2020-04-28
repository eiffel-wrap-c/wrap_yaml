note

	description: "This file has been generated by EWG. Do not edit. Changes will be lost!"

	generator: "Eiffel Wrapper Generator"

class YAML_EMITTER_S_STRUCT_API

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

	problem:  detachable C_STRING
			-- Access member `problem`
		require
			exists: exists
		do
			if attached c_problem (item) as l_ptr then
				create Result.make_by_pointer (l_ptr)
			end
		ensure
			result_void: Result = Void implies c_problem (item) = default_pointer
			result_not_void: attached Result as l_result implies l_result.string.same_string ((create {C_STRING}.make_by_pointer (item)).string)
		end

	set_problem (a_value: C_STRING) 
			-- Change the value of member `problem` to `a_value`.
		require
			exists: exists
		do
			set_c_problem (item, a_value.item )
		end

	write_handler: POINTER
			-- Access member `write_handler`
		require
			exists: exists
		do
			Result := c_write_handler (item)
		ensure
			result_correct: Result = c_write_handler (item)
		end

	set_write_handler (a_value: POINTER) 
			-- Change the value of member `write_handler` to `a_value`.
		require
			exists: exists
		do
			set_c_write_handler (item, a_value)
		ensure
			write_handler_set: a_value = write_handler
		end

	write_handler_data: POINTER
			-- Access member `write_handler_data`
		require
			exists: exists
		do
			Result := c_write_handler_data (item)
		ensure
			result_correct: Result = c_write_handler_data (item)
		end

	set_write_handler_data (a_value: POINTER) 
			-- Change the value of member `write_handler_data` to `a_value`.
		require
			exists: exists
		do
			set_c_write_handler_data (item, a_value)
		ensure
			write_handler_data_set: a_value = write_handler_data
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

	canonical: INTEGER
			-- Access member `canonical`
		require
			exists: exists
		do
			Result := c_canonical (item)
		ensure
			result_correct: Result = c_canonical (item)
		end

	set_canonical (a_value: INTEGER) 
			-- Change the value of member `canonical` to `a_value`.
		require
			exists: exists
		do
			set_c_canonical (item, a_value)
		ensure
			canonical_set: a_value = canonical
		end

	best_indent: INTEGER
			-- Access member `best_indent`
		require
			exists: exists
		do
			Result := c_best_indent (item)
		ensure
			result_correct: Result = c_best_indent (item)
		end

	set_best_indent (a_value: INTEGER) 
			-- Change the value of member `best_indent` to `a_value`.
		require
			exists: exists
		do
			set_c_best_indent (item, a_value)
		ensure
			best_indent_set: a_value = best_indent
		end

	best_width: INTEGER
			-- Access member `best_width`
		require
			exists: exists
		do
			Result := c_best_width (item)
		ensure
			result_correct: Result = c_best_width (item)
		end

	set_best_width (a_value: INTEGER) 
			-- Change the value of member `best_width` to `a_value`.
		require
			exists: exists
		do
			set_c_best_width (item, a_value)
		ensure
			best_width_set: a_value = best_width
		end

	unicode: INTEGER
			-- Access member `unicode`
		require
			exists: exists
		do
			Result := c_unicode (item)
		ensure
			result_correct: Result = c_unicode (item)
		end

	set_unicode (a_value: INTEGER) 
			-- Change the value of member `unicode` to `a_value`.
		require
			exists: exists
		do
			set_c_unicode (item, a_value)
		ensure
			unicode_set: a_value = unicode
		end

	line_break: INTEGER
			-- Access member `line_break`
		require
			exists: exists
		do
			Result := c_line_break (item)
		ensure
			result_correct: Result = c_line_break (item)
		end

	set_line_break (a_value: INTEGER) 
			-- Change the value of member `line_break` to `a_value`.
		require
			exists: exists
		do
			set_c_line_break (item, a_value)
		ensure
			line_break_set: a_value = line_break
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

	root_context: INTEGER
			-- Access member `root_context`
		require
			exists: exists
		do
			Result := c_root_context (item)
		ensure
			result_correct: Result = c_root_context (item)
		end

	set_root_context (a_value: INTEGER) 
			-- Change the value of member `root_context` to `a_value`.
		require
			exists: exists
		do
			set_c_root_context (item, a_value)
		ensure
			root_context_set: a_value = root_context
		end

	sequence_context: INTEGER
			-- Access member `sequence_context`
		require
			exists: exists
		do
			Result := c_sequence_context (item)
		ensure
			result_correct: Result = c_sequence_context (item)
		end

	set_sequence_context (a_value: INTEGER) 
			-- Change the value of member `sequence_context` to `a_value`.
		require
			exists: exists
		do
			set_c_sequence_context (item, a_value)
		ensure
			sequence_context_set: a_value = sequence_context
		end

	mapping_context: INTEGER
			-- Access member `mapping_context`
		require
			exists: exists
		do
			Result := c_mapping_context (item)
		ensure
			result_correct: Result = c_mapping_context (item)
		end

	set_mapping_context (a_value: INTEGER) 
			-- Change the value of member `mapping_context` to `a_value`.
		require
			exists: exists
		do
			set_c_mapping_context (item, a_value)
		ensure
			mapping_context_set: a_value = mapping_context
		end

	simple_key_context: INTEGER
			-- Access member `simple_key_context`
		require
			exists: exists
		do
			Result := c_simple_key_context (item)
		ensure
			result_correct: Result = c_simple_key_context (item)
		end

	set_simple_key_context (a_value: INTEGER) 
			-- Change the value of member `simple_key_context` to `a_value`.
		require
			exists: exists
		do
			set_c_simple_key_context (item, a_value)
		ensure
			simple_key_context_set: a_value = simple_key_context
		end

	line: INTEGER
			-- Access member `line`
		require
			exists: exists
		do
			Result := c_line (item)
		ensure
			result_correct: Result = c_line (item)
		end

	set_line (a_value: INTEGER) 
			-- Change the value of member `line` to `a_value`.
		require
			exists: exists
		do
			set_c_line (item, a_value)
		ensure
			line_set: a_value = line
		end

	column: INTEGER
			-- Access member `column`
		require
			exists: exists
		do
			Result := c_column (item)
		ensure
			result_correct: Result = c_column (item)
		end

	set_column (a_value: INTEGER) 
			-- Change the value of member `column` to `a_value`.
		require
			exists: exists
		do
			set_c_column (item, a_value)
		ensure
			column_set: a_value = column
		end

	whitespace: INTEGER
			-- Access member `whitespace`
		require
			exists: exists
		do
			Result := c_whitespace (item)
		ensure
			result_correct: Result = c_whitespace (item)
		end

	set_whitespace (a_value: INTEGER) 
			-- Change the value of member `whitespace` to `a_value`.
		require
			exists: exists
		do
			set_c_whitespace (item, a_value)
		ensure
			whitespace_set: a_value = whitespace
		end

	indention: INTEGER
			-- Access member `indention`
		require
			exists: exists
		do
			Result := c_indention (item)
		ensure
			result_correct: Result = c_indention (item)
		end

	set_indention (a_value: INTEGER) 
			-- Change the value of member `indention` to `a_value`.
		require
			exists: exists
		do
			set_c_indention (item, a_value)
		ensure
			indention_set: a_value = indention
		end

	open_ended: INTEGER
			-- Access member `open_ended`
		require
			exists: exists
		do
			Result := c_open_ended (item)
		ensure
			result_correct: Result = c_open_ended (item)
		end

	set_open_ended (a_value: INTEGER) 
			-- Change the value of member `open_ended` to `a_value`.
		require
			exists: exists
		do
			set_c_open_ended (item, a_value)
		ensure
			open_ended_set: a_value = open_ended
		end

	opened: INTEGER
			-- Access member `opened`
		require
			exists: exists
		do
			Result := c_opened (item)
		ensure
			result_correct: Result = c_opened (item)
		end

	set_opened (a_value: INTEGER) 
			-- Change the value of member `opened` to `a_value`.
		require
			exists: exists
		do
			set_c_opened (item, a_value)
		ensure
			opened_set: a_value = opened
		end

	closed: INTEGER
			-- Access member `closed`
		require
			exists: exists
		do
			Result := c_closed (item)
		ensure
			result_correct: Result = c_closed (item)
		end

	set_closed (a_value: INTEGER) 
			-- Change the value of member `closed` to `a_value`.
		require
			exists: exists
		do
			set_c_closed (item, a_value)
		ensure
			closed_set: a_value = closed
		end

	anchors: detachable YAML_ANCHORS_S_STRUCT_API 
			-- Access member `anchors`
		require
			exists: exists
		do
			if attached c_anchors (item) as l_ptr and then not l_ptr.is_default_pointer then
				create Result.make_by_pointer (l_ptr)
			end
		ensure
			result_void: Result = Void implies c_anchors (item) = default_pointer 
			result_not_void: attached Result as l_result implies l_result.item = c_anchors (item) 
		end

	set_anchors (a_value: YAML_ANCHORS_S_STRUCT_API) 
			-- Set member `anchors`
		require
			a_value_not_void: a_value /= Void
			exists: exists
		do
			set_c_anchors (item, a_value.item)
		ensure
			anchors_set: attached anchors as l_value implies l_value.item = a_value.item
		end

	last_anchor_id: INTEGER
			-- Access member `last_anchor_id`
		require
			exists: exists
		do
			Result := c_last_anchor_id (item)
		ensure
			result_correct: Result = c_last_anchor_id (item)
		end

	set_last_anchor_id (a_value: INTEGER) 
			-- Change the value of member `last_anchor_id` to `a_value`.
		require
			exists: exists
		do
			set_c_last_anchor_id (item, a_value)
		ensure
			last_anchor_id_set: a_value = last_anchor_id
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

feature {NONE} -- Implementation wrapper for struct struct yaml_emitter_s

	sizeof_external: INTEGER 
		external
			"C inline use <yaml.h>"
		alias
			"sizeof(struct yaml_emitter_s)"
		end

	c_error (an_item: POINTER): INTEGER
		require
			an_item_not_null: an_item /= default_pointer
		external
			"C inline use <yaml.h>"
		alias
			"[
				((struct yaml_emitter_s*)$an_item)->error
			]"
		end

	set_c_error (an_item: POINTER; a_value: INTEGER) 
		require
			an_item_not_null: an_item /= default_pointer
		external
			"C inline use <yaml.h>"
		alias
			"[
				((struct yaml_emitter_s*)$an_item)->error =  (yaml_error_type_t)$a_value
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
				((struct yaml_emitter_s*)$an_item)->problem
			]"
		end

	set_c_problem (an_item: POINTER; a_value: POINTER) 
		require
			an_item_not_null: an_item /= default_pointer
		external
			"C inline use <yaml.h>"
		alias
			"[
				((struct yaml_emitter_s*)$an_item)->problem =  (char const*)$a_value
			]"
		ensure
			problem_set: a_value = c_problem (an_item)
		end

	c_write_handler (an_item: POINTER): POINTER
		require
			an_item_not_null: an_item /= default_pointer
		external
			"C inline use <yaml.h>"
		alias
			"[
				((struct yaml_emitter_s*)$an_item)->write_handler
			]"
		end

	set_c_write_handler (an_item: POINTER; a_value: POINTER) 
		require
			an_item_not_null: an_item /= default_pointer
		external
			"C inline use <yaml.h>"
		alias
			"[
				((struct yaml_emitter_s*)$an_item)->write_handler =  (yaml_write_handler_t*)$a_value
			]"
		ensure
			write_handler_set: a_value = c_write_handler (an_item)
		end

	c_write_handler_data (an_item: POINTER): POINTER
		require
			an_item_not_null: an_item /= default_pointer
		external
			"C inline use <yaml.h>"
		alias
			"[
				((struct yaml_emitter_s*)$an_item)->write_handler_data
			]"
		end

	set_c_write_handler_data (an_item: POINTER; a_value: POINTER) 
		require
			an_item_not_null: an_item /= default_pointer
		external
			"C inline use <yaml.h>"
		alias
			"[
				((struct yaml_emitter_s*)$an_item)->write_handler_data =  (void*)$a_value
			]"
		ensure
			write_handler_data_set: a_value = c_write_handler_data (an_item)
		end

	c_encoding (an_item: POINTER): INTEGER
		require
			an_item_not_null: an_item /= default_pointer
		external
			"C inline use <yaml.h>"
		alias
			"[
				((struct yaml_emitter_s*)$an_item)->encoding
			]"
		end

	set_c_encoding (an_item: POINTER; a_value: INTEGER) 
		require
			an_item_not_null: an_item /= default_pointer
		external
			"C inline use <yaml.h>"
		alias
			"[
				((struct yaml_emitter_s*)$an_item)->encoding =  (yaml_encoding_t)$a_value
			]"
		ensure
			encoding_set: a_value = c_encoding (an_item)
		end

	c_canonical (an_item: POINTER): INTEGER
		require
			an_item_not_null: an_item /= default_pointer
		external
			"C inline use <yaml.h>"
		alias
			"[
				((struct yaml_emitter_s*)$an_item)->canonical
			]"
		end

	set_c_canonical (an_item: POINTER; a_value: INTEGER) 
		require
			an_item_not_null: an_item /= default_pointer
		external
			"C inline use <yaml.h>"
		alias
			"[
				((struct yaml_emitter_s*)$an_item)->canonical =  (int)$a_value
			]"
		ensure
			canonical_set: a_value = c_canonical (an_item)
		end

	c_best_indent (an_item: POINTER): INTEGER
		require
			an_item_not_null: an_item /= default_pointer
		external
			"C inline use <yaml.h>"
		alias
			"[
				((struct yaml_emitter_s*)$an_item)->best_indent
			]"
		end

	set_c_best_indent (an_item: POINTER; a_value: INTEGER) 
		require
			an_item_not_null: an_item /= default_pointer
		external
			"C inline use <yaml.h>"
		alias
			"[
				((struct yaml_emitter_s*)$an_item)->best_indent =  (int)$a_value
			]"
		ensure
			best_indent_set: a_value = c_best_indent (an_item)
		end

	c_best_width (an_item: POINTER): INTEGER
		require
			an_item_not_null: an_item /= default_pointer
		external
			"C inline use <yaml.h>"
		alias
			"[
				((struct yaml_emitter_s*)$an_item)->best_width
			]"
		end

	set_c_best_width (an_item: POINTER; a_value: INTEGER) 
		require
			an_item_not_null: an_item /= default_pointer
		external
			"C inline use <yaml.h>"
		alias
			"[
				((struct yaml_emitter_s*)$an_item)->best_width =  (int)$a_value
			]"
		ensure
			best_width_set: a_value = c_best_width (an_item)
		end

	c_unicode (an_item: POINTER): INTEGER
		require
			an_item_not_null: an_item /= default_pointer
		external
			"C inline use <yaml.h>"
		alias
			"[
				((struct yaml_emitter_s*)$an_item)->unicode
			]"
		end

	set_c_unicode (an_item: POINTER; a_value: INTEGER) 
		require
			an_item_not_null: an_item /= default_pointer
		external
			"C inline use <yaml.h>"
		alias
			"[
				((struct yaml_emitter_s*)$an_item)->unicode =  (int)$a_value
			]"
		ensure
			unicode_set: a_value = c_unicode (an_item)
		end

	c_line_break (an_item: POINTER): INTEGER
		require
			an_item_not_null: an_item /= default_pointer
		external
			"C inline use <yaml.h>"
		alias
			"[
				((struct yaml_emitter_s*)$an_item)->line_break
			]"
		end

	set_c_line_break (an_item: POINTER; a_value: INTEGER) 
		require
			an_item_not_null: an_item /= default_pointer
		external
			"C inline use <yaml.h>"
		alias
			"[
				((struct yaml_emitter_s*)$an_item)->line_break =  (yaml_break_t)$a_value
			]"
		ensure
			line_break_set: a_value = c_line_break (an_item)
		end

	c_state (an_item: POINTER): INTEGER
		require
			an_item_not_null: an_item /= default_pointer
		external
			"C inline use <yaml.h>"
		alias
			"[
				((struct yaml_emitter_s*)$an_item)->state
			]"
		end

	set_c_state (an_item: POINTER; a_value: INTEGER) 
		require
			an_item_not_null: an_item /= default_pointer
		external
			"C inline use <yaml.h>"
		alias
			"[
				((struct yaml_emitter_s*)$an_item)->state =  (yaml_emitter_state_t)$a_value
			]"
		ensure
			state_set: a_value = c_state (an_item)
		end

	c_indent (an_item: POINTER): INTEGER
		require
			an_item_not_null: an_item /= default_pointer
		external
			"C inline use <yaml.h>"
		alias
			"[
				((struct yaml_emitter_s*)$an_item)->indent
			]"
		end

	set_c_indent (an_item: POINTER; a_value: INTEGER) 
		require
			an_item_not_null: an_item /= default_pointer
		external
			"C inline use <yaml.h>"
		alias
			"[
				((struct yaml_emitter_s*)$an_item)->indent =  (int)$a_value
			]"
		ensure
			indent_set: a_value = c_indent (an_item)
		end

	c_flow_level (an_item: POINTER): INTEGER
		require
			an_item_not_null: an_item /= default_pointer
		external
			"C inline use <yaml.h>"
		alias
			"[
				((struct yaml_emitter_s*)$an_item)->flow_level
			]"
		end

	set_c_flow_level (an_item: POINTER; a_value: INTEGER) 
		require
			an_item_not_null: an_item /= default_pointer
		external
			"C inline use <yaml.h>"
		alias
			"[
				((struct yaml_emitter_s*)$an_item)->flow_level =  (int)$a_value
			]"
		ensure
			flow_level_set: a_value = c_flow_level (an_item)
		end

	c_root_context (an_item: POINTER): INTEGER
		require
			an_item_not_null: an_item /= default_pointer
		external
			"C inline use <yaml.h>"
		alias
			"[
				((struct yaml_emitter_s*)$an_item)->root_context
			]"
		end

	set_c_root_context (an_item: POINTER; a_value: INTEGER) 
		require
			an_item_not_null: an_item /= default_pointer
		external
			"C inline use <yaml.h>"
		alias
			"[
				((struct yaml_emitter_s*)$an_item)->root_context =  (int)$a_value
			]"
		ensure
			root_context_set: a_value = c_root_context (an_item)
		end

	c_sequence_context (an_item: POINTER): INTEGER
		require
			an_item_not_null: an_item /= default_pointer
		external
			"C inline use <yaml.h>"
		alias
			"[
				((struct yaml_emitter_s*)$an_item)->sequence_context
			]"
		end

	set_c_sequence_context (an_item: POINTER; a_value: INTEGER) 
		require
			an_item_not_null: an_item /= default_pointer
		external
			"C inline use <yaml.h>"
		alias
			"[
				((struct yaml_emitter_s*)$an_item)->sequence_context =  (int)$a_value
			]"
		ensure
			sequence_context_set: a_value = c_sequence_context (an_item)
		end

	c_mapping_context (an_item: POINTER): INTEGER
		require
			an_item_not_null: an_item /= default_pointer
		external
			"C inline use <yaml.h>"
		alias
			"[
				((struct yaml_emitter_s*)$an_item)->mapping_context
			]"
		end

	set_c_mapping_context (an_item: POINTER; a_value: INTEGER) 
		require
			an_item_not_null: an_item /= default_pointer
		external
			"C inline use <yaml.h>"
		alias
			"[
				((struct yaml_emitter_s*)$an_item)->mapping_context =  (int)$a_value
			]"
		ensure
			mapping_context_set: a_value = c_mapping_context (an_item)
		end

	c_simple_key_context (an_item: POINTER): INTEGER
		require
			an_item_not_null: an_item /= default_pointer
		external
			"C inline use <yaml.h>"
		alias
			"[
				((struct yaml_emitter_s*)$an_item)->simple_key_context
			]"
		end

	set_c_simple_key_context (an_item: POINTER; a_value: INTEGER) 
		require
			an_item_not_null: an_item /= default_pointer
		external
			"C inline use <yaml.h>"
		alias
			"[
				((struct yaml_emitter_s*)$an_item)->simple_key_context =  (int)$a_value
			]"
		ensure
			simple_key_context_set: a_value = c_simple_key_context (an_item)
		end

	c_line (an_item: POINTER): INTEGER
		require
			an_item_not_null: an_item /= default_pointer
		external
			"C inline use <yaml.h>"
		alias
			"[
				((struct yaml_emitter_s*)$an_item)->line
			]"
		end

	set_c_line (an_item: POINTER; a_value: INTEGER) 
		require
			an_item_not_null: an_item /= default_pointer
		external
			"C inline use <yaml.h>"
		alias
			"[
				((struct yaml_emitter_s*)$an_item)->line =  (int)$a_value
			]"
		ensure
			line_set: a_value = c_line (an_item)
		end

	c_column (an_item: POINTER): INTEGER
		require
			an_item_not_null: an_item /= default_pointer
		external
			"C inline use <yaml.h>"
		alias
			"[
				((struct yaml_emitter_s*)$an_item)->column
			]"
		end

	set_c_column (an_item: POINTER; a_value: INTEGER) 
		require
			an_item_not_null: an_item /= default_pointer
		external
			"C inline use <yaml.h>"
		alias
			"[
				((struct yaml_emitter_s*)$an_item)->column =  (int)$a_value
			]"
		ensure
			column_set: a_value = c_column (an_item)
		end

	c_whitespace (an_item: POINTER): INTEGER
		require
			an_item_not_null: an_item /= default_pointer
		external
			"C inline use <yaml.h>"
		alias
			"[
				((struct yaml_emitter_s*)$an_item)->whitespace
			]"
		end

	set_c_whitespace (an_item: POINTER; a_value: INTEGER) 
		require
			an_item_not_null: an_item /= default_pointer
		external
			"C inline use <yaml.h>"
		alias
			"[
				((struct yaml_emitter_s*)$an_item)->whitespace =  (int)$a_value
			]"
		ensure
			whitespace_set: a_value = c_whitespace (an_item)
		end

	c_indention (an_item: POINTER): INTEGER
		require
			an_item_not_null: an_item /= default_pointer
		external
			"C inline use <yaml.h>"
		alias
			"[
				((struct yaml_emitter_s*)$an_item)->indention
			]"
		end

	set_c_indention (an_item: POINTER; a_value: INTEGER) 
		require
			an_item_not_null: an_item /= default_pointer
		external
			"C inline use <yaml.h>"
		alias
			"[
				((struct yaml_emitter_s*)$an_item)->indention =  (int)$a_value
			]"
		ensure
			indention_set: a_value = c_indention (an_item)
		end

	c_open_ended (an_item: POINTER): INTEGER
		require
			an_item_not_null: an_item /= default_pointer
		external
			"C inline use <yaml.h>"
		alias
			"[
				((struct yaml_emitter_s*)$an_item)->open_ended
			]"
		end

	set_c_open_ended (an_item: POINTER; a_value: INTEGER) 
		require
			an_item_not_null: an_item /= default_pointer
		external
			"C inline use <yaml.h>"
		alias
			"[
				((struct yaml_emitter_s*)$an_item)->open_ended =  (int)$a_value
			]"
		ensure
			open_ended_set: a_value = c_open_ended (an_item)
		end

	c_opened (an_item: POINTER): INTEGER
		require
			an_item_not_null: an_item /= default_pointer
		external
			"C inline use <yaml.h>"
		alias
			"[
				((struct yaml_emitter_s*)$an_item)->opened
			]"
		end

	set_c_opened (an_item: POINTER; a_value: INTEGER) 
		require
			an_item_not_null: an_item /= default_pointer
		external
			"C inline use <yaml.h>"
		alias
			"[
				((struct yaml_emitter_s*)$an_item)->opened =  (int)$a_value
			]"
		ensure
			opened_set: a_value = c_opened (an_item)
		end

	c_closed (an_item: POINTER): INTEGER
		require
			an_item_not_null: an_item /= default_pointer
		external
			"C inline use <yaml.h>"
		alias
			"[
				((struct yaml_emitter_s*)$an_item)->closed
			]"
		end

	set_c_closed (an_item: POINTER; a_value: INTEGER) 
		require
			an_item_not_null: an_item /= default_pointer
		external
			"C inline use <yaml.h>"
		alias
			"[
				((struct yaml_emitter_s*)$an_item)->closed =  (int)$a_value
			]"
		ensure
			closed_set: a_value = c_closed (an_item)
		end

	c_anchors (an_item: POINTER): POINTER
		require
			an_item_not_null: an_item /= default_pointer
		external
			"C inline use <yaml.h>"
		alias
			"[
				((struct yaml_emitter_s*)$an_item)->anchors
			]"
		end

	set_c_anchors (an_item: POINTER; a_value: POINTER) 
		require
			an_item_not_null: an_item /= default_pointer
		external
			"C inline use <yaml.h>"
		alias
			"[
				((struct yaml_emitter_s*)$an_item)->anchors =  (yaml_anchors_t*)$a_value
			]"
		ensure
			anchors_set: a_value = c_anchors (an_item)
		end

	c_last_anchor_id (an_item: POINTER): INTEGER
		require
			an_item_not_null: an_item /= default_pointer
		external
			"C inline use <yaml.h>"
		alias
			"[
				((struct yaml_emitter_s*)$an_item)->last_anchor_id
			]"
		end

	set_c_last_anchor_id (an_item: POINTER; a_value: INTEGER) 
		require
			an_item_not_null: an_item /= default_pointer
		external
			"C inline use <yaml.h>"
		alias
			"[
				((struct yaml_emitter_s*)$an_item)->last_anchor_id =  (int)$a_value
			]"
		ensure
			last_anchor_id_set: a_value = c_last_anchor_id (an_item)
		end

	c_document (an_item: POINTER): POINTER
		require
			an_item_not_null: an_item /= default_pointer
		external
			"C inline use <yaml.h>"
		alias
			"[
				((struct yaml_emitter_s*)$an_item)->document
			]"
		end

	set_c_document (an_item: POINTER; a_value: POINTER) 
		require
			an_item_not_null: an_item /= default_pointer
		external
			"C inline use <yaml.h>"
		alias
			"[
				((struct yaml_emitter_s*)$an_item)->document =  (yaml_document_t*)$a_value
			]"
		ensure
			document_set: a_value = c_document (an_item)
		end

end
