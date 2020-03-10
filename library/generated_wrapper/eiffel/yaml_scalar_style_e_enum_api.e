-- enum wrapper
class YAML_SCALAR_STYLE_E_ENUM_API

feature {ANY}

	is_valid_enum (a_value: INTEGER): BOOLEAN 
			-- Is `a_value' a valid integer code for this enum ?
		do
			Result := a_value = yaml_any_scalar_style or a_value = yaml_plain_scalar_style or a_value = yaml_single_quoted_scalar_style or a_value = yaml_double_quoted_scalar_style or a_value = yaml_literal_scalar_style or a_value = yaml_folded_scalar_style
		end

	yaml_any_scalar_style: INTEGER 
		external
			"C inline use <yaml.h>"
		alias
			"YAML_ANY_SCALAR_STYLE"
		end

	yaml_plain_scalar_style: INTEGER 
		external
			"C inline use <yaml.h>"
		alias
			"YAML_PLAIN_SCALAR_STYLE"
		end

	yaml_single_quoted_scalar_style: INTEGER 
		external
			"C inline use <yaml.h>"
		alias
			"YAML_SINGLE_QUOTED_SCALAR_STYLE"
		end

	yaml_double_quoted_scalar_style: INTEGER 
		external
			"C inline use <yaml.h>"
		alias
			"YAML_DOUBLE_QUOTED_SCALAR_STYLE"
		end

	yaml_literal_scalar_style: INTEGER 
		external
			"C inline use <yaml.h>"
		alias
			"YAML_LITERAL_SCALAR_STYLE"
		end

	yaml_folded_scalar_style: INTEGER 
		external
			"C inline use <yaml.h>"
		alias
			"YAML_FOLDED_SCALAR_STYLE"
		end

end
