-- enum wrapper
class YAML_MAPPING_STYLE_E_ENUM_API

feature {ANY}

	is_valid_enum (a_value: INTEGER): BOOLEAN 
			-- Is `a_value' a valid integer code for this enum ?
		do
			Result := a_value = yaml_any_mapping_style or a_value = yaml_block_mapping_style or a_value = yaml_flow_mapping_style
		end

	yaml_any_mapping_style: INTEGER 
		external
			"C inline use <yaml.h>"
		alias
			"YAML_ANY_MAPPING_STYLE"
		end

	yaml_block_mapping_style: INTEGER 
		external
			"C inline use <yaml.h>"
		alias
			"YAML_BLOCK_MAPPING_STYLE"
		end

	yaml_flow_mapping_style: INTEGER 
		external
			"C inline use <yaml.h>"
		alias
			"YAML_FLOW_MAPPING_STYLE"
		end

end
