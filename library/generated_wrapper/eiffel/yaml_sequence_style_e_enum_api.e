-- enum wrapper
class YAML_SEQUENCE_STYLE_E_ENUM_API

feature {ANY}

	is_valid_enum (a_value: INTEGER): BOOLEAN 
			-- Is `a_value' a valid integer code for this enum ?
		do
			Result := a_value = yaml_any_sequence_style or a_value = yaml_block_sequence_style or a_value = yaml_flow_sequence_style
		end

	yaml_any_sequence_style: INTEGER 
		external
			"C inline use <yaml.h>"
		alias
			"YAML_ANY_SEQUENCE_STYLE"
		end

	yaml_block_sequence_style: INTEGER 
		external
			"C inline use <yaml.h>"
		alias
			"YAML_BLOCK_SEQUENCE_STYLE"
		end

	yaml_flow_sequence_style: INTEGER 
		external
			"C inline use <yaml.h>"
		alias
			"YAML_FLOW_SEQUENCE_STYLE"
		end

end
