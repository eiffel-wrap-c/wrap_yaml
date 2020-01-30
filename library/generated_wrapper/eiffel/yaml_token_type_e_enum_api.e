-- enum wrapper
class YAML_TOKEN_TYPE_E_ENUM_API

feature {ANY}

	is_valid_enum (a_value: INTEGER): BOOLEAN 
			-- Is `a_value' a valid integer code for this enum ?
		do
			Result := a_value = yaml_no_token or a_value = yaml_stream_start_token or a_value = yaml_stream_end_token or a_value = yaml_version_directive_token or a_value = yaml_tag_directive_token or a_value = yaml_document_start_token or a_value = yaml_document_end_token or a_value = yaml_block_sequence_start_token or a_value = yaml_block_mapping_start_token or a_value = yaml_block_end_token or a_value = yaml_flow_sequence_start_token or a_value = yaml_flow_sequence_end_token or a_value = yaml_flow_mapping_start_token or a_value = yaml_flow_mapping_end_token or a_value = yaml_block_entry_token or a_value = yaml_flow_entry_token or a_value = yaml_key_token or a_value = yaml_value_token or a_value = yaml_alias_token or a_value = yaml_anchor_token or a_value = yaml_tag_token or a_value = yaml_scalar_token
		end

	yaml_no_token: INTEGER 
		external
			"C inline use <yaml.h>"
		alias
			"YAML_NO_TOKEN"
		end

	yaml_stream_start_token: INTEGER 
		external
			"C inline use <yaml.h>"
		alias
			"YAML_STREAM_START_TOKEN"
		end

	yaml_stream_end_token: INTEGER 
		external
			"C inline use <yaml.h>"
		alias
			"YAML_STREAM_END_TOKEN"
		end

	yaml_version_directive_token: INTEGER 
		external
			"C inline use <yaml.h>"
		alias
			"YAML_VERSION_DIRECTIVE_TOKEN"
		end

	yaml_tag_directive_token: INTEGER 
		external
			"C inline use <yaml.h>"
		alias
			"YAML_TAG_DIRECTIVE_TOKEN"
		end

	yaml_document_start_token: INTEGER 
		external
			"C inline use <yaml.h>"
		alias
			"YAML_DOCUMENT_START_TOKEN"
		end

	yaml_document_end_token: INTEGER 
		external
			"C inline use <yaml.h>"
		alias
			"YAML_DOCUMENT_END_TOKEN"
		end

	yaml_block_sequence_start_token: INTEGER 
		external
			"C inline use <yaml.h>"
		alias
			"YAML_BLOCK_SEQUENCE_START_TOKEN"
		end

	yaml_block_mapping_start_token: INTEGER 
		external
			"C inline use <yaml.h>"
		alias
			"YAML_BLOCK_MAPPING_START_TOKEN"
		end

	yaml_block_end_token: INTEGER 
		external
			"C inline use <yaml.h>"
		alias
			"YAML_BLOCK_END_TOKEN"
		end

	yaml_flow_sequence_start_token: INTEGER 
		external
			"C inline use <yaml.h>"
		alias
			"YAML_FLOW_SEQUENCE_START_TOKEN"
		end

	yaml_flow_sequence_end_token: INTEGER 
		external
			"C inline use <yaml.h>"
		alias
			"YAML_FLOW_SEQUENCE_END_TOKEN"
		end

	yaml_flow_mapping_start_token: INTEGER 
		external
			"C inline use <yaml.h>"
		alias
			"YAML_FLOW_MAPPING_START_TOKEN"
		end

	yaml_flow_mapping_end_token: INTEGER 
		external
			"C inline use <yaml.h>"
		alias
			"YAML_FLOW_MAPPING_END_TOKEN"
		end

	yaml_block_entry_token: INTEGER 
		external
			"C inline use <yaml.h>"
		alias
			"YAML_BLOCK_ENTRY_TOKEN"
		end

	yaml_flow_entry_token: INTEGER 
		external
			"C inline use <yaml.h>"
		alias
			"YAML_FLOW_ENTRY_TOKEN"
		end

	yaml_key_token: INTEGER 
		external
			"C inline use <yaml.h>"
		alias
			"YAML_KEY_TOKEN"
		end

	yaml_value_token: INTEGER 
		external
			"C inline use <yaml.h>"
		alias
			"YAML_VALUE_TOKEN"
		end

	yaml_alias_token: INTEGER 
		external
			"C inline use <yaml.h>"
		alias
			"YAML_ALIAS_TOKEN"
		end

	yaml_anchor_token: INTEGER 
		external
			"C inline use <yaml.h>"
		alias
			"YAML_ANCHOR_TOKEN"
		end

	yaml_tag_token: INTEGER 
		external
			"C inline use <yaml.h>"
		alias
			"YAML_TAG_TOKEN"
		end

	yaml_scalar_token: INTEGER 
		external
			"C inline use <yaml.h>"
		alias
			"YAML_SCALAR_TOKEN"
		end

end
