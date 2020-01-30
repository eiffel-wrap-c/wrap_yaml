-- enum wrapper
class YAML_ENCODING_E_ENUM_API

feature {ANY}

	is_valid_enum (a_value: INTEGER): BOOLEAN 
			-- Is `a_value' a valid integer code for this enum ?
		do
			Result := a_value = yaml_any_encoding or a_value = yaml_utf8_encoding or a_value = yaml_utf16le_encoding or a_value = yaml_utf16be_encoding
		end

	yaml_any_encoding: INTEGER 
		external
			"C inline use <yaml.h>"
		alias
			"YAML_ANY_ENCODING"
		end

	yaml_utf8_encoding: INTEGER 
		external
			"C inline use <yaml.h>"
		alias
			"YAML_UTF8_ENCODING"
		end

	yaml_utf16le_encoding: INTEGER 
		external
			"C inline use <yaml.h>"
		alias
			"YAML_UTF16LE_ENCODING"
		end

	yaml_utf16be_encoding: INTEGER 
		external
			"C inline use <yaml.h>"
		alias
			"YAML_UTF16BE_ENCODING"
		end

end
