-- enum wrapper
class YAML_EMITTER_STATE_E_ENUM_API

feature {ANY}

	is_valid_enum (a_value: INTEGER): BOOLEAN 
			-- Is `a_value' a valid integer code for this enum ?
		do
			Result := a_value = yaml_emit_stream_start_state or a_value = yaml_emit_first_document_start_state or a_value = yaml_emit_document_start_state or a_value = yaml_emit_document_content_state or a_value = yaml_emit_document_end_state or a_value = yaml_emit_flow_sequence_first_item_state or a_value = yaml_emit_flow_sequence_item_state or a_value = yaml_emit_flow_mapping_first_key_state or a_value = yaml_emit_flow_mapping_key_state or a_value = yaml_emit_flow_mapping_simple_value_state or a_value = yaml_emit_flow_mapping_value_state or a_value = yaml_emit_block_sequence_first_item_state or a_value = yaml_emit_block_sequence_item_state or a_value = yaml_emit_block_mapping_first_key_state or a_value = yaml_emit_block_mapping_key_state or a_value = yaml_emit_block_mapping_simple_value_state or a_value = yaml_emit_block_mapping_value_state or a_value = yaml_emit_end_state
		end

	yaml_emit_stream_start_state: INTEGER 
		external
			"C inline use <yaml.h>"
		alias
			"YAML_EMIT_STREAM_START_STATE"
		end

	yaml_emit_first_document_start_state: INTEGER 
		external
			"C inline use <yaml.h>"
		alias
			"YAML_EMIT_FIRST_DOCUMENT_START_STATE"
		end

	yaml_emit_document_start_state: INTEGER 
		external
			"C inline use <yaml.h>"
		alias
			"YAML_EMIT_DOCUMENT_START_STATE"
		end

	yaml_emit_document_content_state: INTEGER 
		external
			"C inline use <yaml.h>"
		alias
			"YAML_EMIT_DOCUMENT_CONTENT_STATE"
		end

	yaml_emit_document_end_state: INTEGER 
		external
			"C inline use <yaml.h>"
		alias
			"YAML_EMIT_DOCUMENT_END_STATE"
		end

	yaml_emit_flow_sequence_first_item_state: INTEGER 
		external
			"C inline use <yaml.h>"
		alias
			"YAML_EMIT_FLOW_SEQUENCE_FIRST_ITEM_STATE"
		end

	yaml_emit_flow_sequence_item_state: INTEGER 
		external
			"C inline use <yaml.h>"
		alias
			"YAML_EMIT_FLOW_SEQUENCE_ITEM_STATE"
		end

	yaml_emit_flow_mapping_first_key_state: INTEGER 
		external
			"C inline use <yaml.h>"
		alias
			"YAML_EMIT_FLOW_MAPPING_FIRST_KEY_STATE"
		end

	yaml_emit_flow_mapping_key_state: INTEGER 
		external
			"C inline use <yaml.h>"
		alias
			"YAML_EMIT_FLOW_MAPPING_KEY_STATE"
		end

	yaml_emit_flow_mapping_simple_value_state: INTEGER 
		external
			"C inline use <yaml.h>"
		alias
			"YAML_EMIT_FLOW_MAPPING_SIMPLE_VALUE_STATE"
		end

	yaml_emit_flow_mapping_value_state: INTEGER 
		external
			"C inline use <yaml.h>"
		alias
			"YAML_EMIT_FLOW_MAPPING_VALUE_STATE"
		end

	yaml_emit_block_sequence_first_item_state: INTEGER 
		external
			"C inline use <yaml.h>"
		alias
			"YAML_EMIT_BLOCK_SEQUENCE_FIRST_ITEM_STATE"
		end

	yaml_emit_block_sequence_item_state: INTEGER 
		external
			"C inline use <yaml.h>"
		alias
			"YAML_EMIT_BLOCK_SEQUENCE_ITEM_STATE"
		end

	yaml_emit_block_mapping_first_key_state: INTEGER 
		external
			"C inline use <yaml.h>"
		alias
			"YAML_EMIT_BLOCK_MAPPING_FIRST_KEY_STATE"
		end

	yaml_emit_block_mapping_key_state: INTEGER 
		external
			"C inline use <yaml.h>"
		alias
			"YAML_EMIT_BLOCK_MAPPING_KEY_STATE"
		end

	yaml_emit_block_mapping_simple_value_state: INTEGER 
		external
			"C inline use <yaml.h>"
		alias
			"YAML_EMIT_BLOCK_MAPPING_SIMPLE_VALUE_STATE"
		end

	yaml_emit_block_mapping_value_state: INTEGER 
		external
			"C inline use <yaml.h>"
		alias
			"YAML_EMIT_BLOCK_MAPPING_VALUE_STATE"
		end

	yaml_emit_end_state: INTEGER 
		external
			"C inline use <yaml.h>"
		alias
			"YAML_EMIT_END_STATE"
		end

end
