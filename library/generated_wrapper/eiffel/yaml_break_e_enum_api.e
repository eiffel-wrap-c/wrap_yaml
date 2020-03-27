-- enum wrapper
class YAML_BREAK_E_ENUM_API

feature {ANY}

	is_valid_enum (a_value: INTEGER): BOOLEAN 
			-- Is `a_value' a valid integer code for this enum ?
		do
			Result := a_value = yaml_any_break or a_value = yaml_cr_break or a_value = yaml_ln_break or a_value = yaml_crln_break
		end

	yaml_any_break: INTEGER 
		external
			"C inline use <yaml.h>"
		alias
			"YAML_ANY_BREAK"
		end

	yaml_cr_break: INTEGER 
		external
			"C inline use <yaml.h>"
		alias
			"YAML_CR_BREAK"
		end

	yaml_ln_break: INTEGER 
		external
			"C inline use <yaml.h>"
		alias
			"YAML_LN_BREAK"
		end

	yaml_crln_break: INTEGER 
		external
			"C inline use <yaml.h>"
		alias
			"YAML_CRLN_BREAK"
		end

end
