-- enum wrapper
class YAML_NODE_TYPE_E_ENUM_API

feature {ANY}

	is_valid_enum (a_value: INTEGER): BOOLEAN 
			-- Is `a_value' a valid integer code for this enum ?
		do
			Result := a_value = yaml_no_node or a_value = yaml_scalar_node or a_value = yaml_sequence_node or a_value = yaml_mapping_node
		end

	yaml_no_node: INTEGER 
		external
			"C inline use <yaml.h>"
		alias
			"YAML_NO_NODE"
		end

	yaml_scalar_node: INTEGER 
		external
			"C inline use <yaml.h>"
		alias
			"YAML_SCALAR_NODE"
		end

	yaml_sequence_node: INTEGER 
		external
			"C inline use <yaml.h>"
		alias
			"YAML_SEQUENCE_NODE"
		end

	yaml_mapping_node: INTEGER 
		external
			"C inline use <yaml.h>"
		alias
			"YAML_MAPPING_NODE"
		end

end
