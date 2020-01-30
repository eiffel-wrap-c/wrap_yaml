-- enum wrapper
class YAML_EVENT_TYPE_E_ENUM_API

feature {ANY}

	is_valid_enum (a_value: INTEGER): BOOLEAN 
			-- Is `a_value' a valid integer code for this enum ?
		do
			Result := a_value = yaml_no_event or a_value = yaml_stream_start_event or a_value = yaml_stream_end_event or a_value = yaml_document_start_event or a_value = yaml_document_end_event or a_value = yaml_alias_event or a_value = yaml_scalar_event or a_value = yaml_sequence_start_event or a_value = yaml_sequence_end_event or a_value = yaml_mapping_start_event or a_value = yaml_mapping_end_event
		end

	yaml_no_event: INTEGER 
		external
			"C inline use <yaml.h>"
		alias
			"YAML_NO_EVENT"
		end

	yaml_stream_start_event: INTEGER 
		external
			"C inline use <yaml.h>"
		alias
			"YAML_STREAM_START_EVENT"
		end

	yaml_stream_end_event: INTEGER 
		external
			"C inline use <yaml.h>"
		alias
			"YAML_STREAM_END_EVENT"
		end

	yaml_document_start_event: INTEGER 
		external
			"C inline use <yaml.h>"
		alias
			"YAML_DOCUMENT_START_EVENT"
		end

	yaml_document_end_event: INTEGER 
		external
			"C inline use <yaml.h>"
		alias
			"YAML_DOCUMENT_END_EVENT"
		end

	yaml_alias_event: INTEGER 
		external
			"C inline use <yaml.h>"
		alias
			"YAML_ALIAS_EVENT"
		end

	yaml_scalar_event: INTEGER 
		external
			"C inline use <yaml.h>"
		alias
			"YAML_SCALAR_EVENT"
		end

	yaml_sequence_start_event: INTEGER 
		external
			"C inline use <yaml.h>"
		alias
			"YAML_SEQUENCE_START_EVENT"
		end

	yaml_sequence_end_event: INTEGER 
		external
			"C inline use <yaml.h>"
		alias
			"YAML_SEQUENCE_END_EVENT"
		end

	yaml_mapping_start_event: INTEGER 
		external
			"C inline use <yaml.h>"
		alias
			"YAML_MAPPING_START_EVENT"
		end

	yaml_mapping_end_event: INTEGER 
		external
			"C inline use <yaml.h>"
		alias
			"YAML_MAPPING_END_EVENT"
		end

end
