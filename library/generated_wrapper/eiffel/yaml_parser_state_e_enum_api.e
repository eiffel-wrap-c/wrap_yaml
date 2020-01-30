-- enum wrapper
class YAML_PARSER_STATE_E_ENUM_API

feature {ANY}

	is_valid_enum (a_value: INTEGER): BOOLEAN 
			-- Is `a_value' a valid integer code for this enum ?
		do
			Result := a_value = yaml_parse_stream_start_state or a_value = yaml_parse_implicit_document_start_state or a_value = yaml_parse_document_start_state or a_value = yaml_parse_document_content_state or a_value = yaml_parse_document_end_state or a_value = yaml_parse_block_node_state or a_value = yaml_parse_block_node_or_indentless_sequence_state or a_value = yaml_parse_flow_node_state or a_value = yaml_parse_block_sequence_first_entry_state or a_value = yaml_parse_block_sequence_entry_state or a_value = yaml_parse_indentless_sequence_entry_state or a_value = yaml_parse_block_mapping_first_key_state or a_value = yaml_parse_block_mapping_key_state or a_value = yaml_parse_block_mapping_value_state or a_value = yaml_parse_flow_sequence_first_entry_state or a_value = yaml_parse_flow_sequence_entry_state or a_value = yaml_parse_flow_sequence_entry_mapping_key_state or a_value = yaml_parse_flow_sequence_entry_mapping_value_state or a_value = yaml_parse_flow_sequence_entry_mapping_end_state or a_value = yaml_parse_flow_mapping_first_key_state or a_value = yaml_parse_flow_mapping_key_state or a_value = yaml_parse_flow_mapping_value_state or a_value = yaml_parse_flow_mapping_empty_value_state or a_value = yaml_parse_end_state
		end

	yaml_parse_stream_start_state: INTEGER 
		external
			"C inline use <yaml.h>"
		alias
			"YAML_PARSE_STREAM_START_STATE"
		end

	yaml_parse_implicit_document_start_state: INTEGER 
		external
			"C inline use <yaml.h>"
		alias
			"YAML_PARSE_IMPLICIT_DOCUMENT_START_STATE"
		end

	yaml_parse_document_start_state: INTEGER 
		external
			"C inline use <yaml.h>"
		alias
			"YAML_PARSE_DOCUMENT_START_STATE"
		end

	yaml_parse_document_content_state: INTEGER 
		external
			"C inline use <yaml.h>"
		alias
			"YAML_PARSE_DOCUMENT_CONTENT_STATE"
		end

	yaml_parse_document_end_state: INTEGER 
		external
			"C inline use <yaml.h>"
		alias
			"YAML_PARSE_DOCUMENT_END_STATE"
		end

	yaml_parse_block_node_state: INTEGER 
		external
			"C inline use <yaml.h>"
		alias
			"YAML_PARSE_BLOCK_NODE_STATE"
		end

	yaml_parse_block_node_or_indentless_sequence_state: INTEGER 
		external
			"C inline use <yaml.h>"
		alias
			"YAML_PARSE_BLOCK_NODE_OR_INDENTLESS_SEQUENCE_STATE"
		end

	yaml_parse_flow_node_state: INTEGER 
		external
			"C inline use <yaml.h>"
		alias
			"YAML_PARSE_FLOW_NODE_STATE"
		end

	yaml_parse_block_sequence_first_entry_state: INTEGER 
		external
			"C inline use <yaml.h>"
		alias
			"YAML_PARSE_BLOCK_SEQUENCE_FIRST_ENTRY_STATE"
		end

	yaml_parse_block_sequence_entry_state: INTEGER 
		external
			"C inline use <yaml.h>"
		alias
			"YAML_PARSE_BLOCK_SEQUENCE_ENTRY_STATE"
		end

	yaml_parse_indentless_sequence_entry_state: INTEGER 
		external
			"C inline use <yaml.h>"
		alias
			"YAML_PARSE_INDENTLESS_SEQUENCE_ENTRY_STATE"
		end

	yaml_parse_block_mapping_first_key_state: INTEGER 
		external
			"C inline use <yaml.h>"
		alias
			"YAML_PARSE_BLOCK_MAPPING_FIRST_KEY_STATE"
		end

	yaml_parse_block_mapping_key_state: INTEGER 
		external
			"C inline use <yaml.h>"
		alias
			"YAML_PARSE_BLOCK_MAPPING_KEY_STATE"
		end

	yaml_parse_block_mapping_value_state: INTEGER 
		external
			"C inline use <yaml.h>"
		alias
			"YAML_PARSE_BLOCK_MAPPING_VALUE_STATE"
		end

	yaml_parse_flow_sequence_first_entry_state: INTEGER 
		external
			"C inline use <yaml.h>"
		alias
			"YAML_PARSE_FLOW_SEQUENCE_FIRST_ENTRY_STATE"
		end

	yaml_parse_flow_sequence_entry_state: INTEGER 
		external
			"C inline use <yaml.h>"
		alias
			"YAML_PARSE_FLOW_SEQUENCE_ENTRY_STATE"
		end

	yaml_parse_flow_sequence_entry_mapping_key_state: INTEGER 
		external
			"C inline use <yaml.h>"
		alias
			"YAML_PARSE_FLOW_SEQUENCE_ENTRY_MAPPING_KEY_STATE"
		end

	yaml_parse_flow_sequence_entry_mapping_value_state: INTEGER 
		external
			"C inline use <yaml.h>"
		alias
			"YAML_PARSE_FLOW_SEQUENCE_ENTRY_MAPPING_VALUE_STATE"
		end

	yaml_parse_flow_sequence_entry_mapping_end_state: INTEGER 
		external
			"C inline use <yaml.h>"
		alias
			"YAML_PARSE_FLOW_SEQUENCE_ENTRY_MAPPING_END_STATE"
		end

	yaml_parse_flow_mapping_first_key_state: INTEGER 
		external
			"C inline use <yaml.h>"
		alias
			"YAML_PARSE_FLOW_MAPPING_FIRST_KEY_STATE"
		end

	yaml_parse_flow_mapping_key_state: INTEGER 
		external
			"C inline use <yaml.h>"
		alias
			"YAML_PARSE_FLOW_MAPPING_KEY_STATE"
		end

	yaml_parse_flow_mapping_value_state: INTEGER 
		external
			"C inline use <yaml.h>"
		alias
			"YAML_PARSE_FLOW_MAPPING_VALUE_STATE"
		end

	yaml_parse_flow_mapping_empty_value_state: INTEGER 
		external
			"C inline use <yaml.h>"
		alias
			"YAML_PARSE_FLOW_MAPPING_EMPTY_VALUE_STATE"
		end

	yaml_parse_end_state: INTEGER 
		external
			"C inline use <yaml.h>"
		alias
			"YAML_PARSE_END_STATE"
		end

end
