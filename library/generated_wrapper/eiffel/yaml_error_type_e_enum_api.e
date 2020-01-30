-- enum wrapper
class YAML_ERROR_TYPE_E_ENUM_API

feature {ANY}

	is_valid_enum (a_value: INTEGER): BOOLEAN 
			-- Is `a_value' a valid integer code for this enum ?
		do
			Result := a_value = yaml_no_error or a_value = yaml_memory_error or a_value = yaml_reader_error or a_value = yaml_scanner_error or a_value = yaml_parser_error or a_value = yaml_composer_error or a_value = yaml_writer_error or a_value = yaml_emitter_error
		end

	yaml_no_error: INTEGER 
		external
			"C inline use <yaml.h>"
		alias
			"YAML_NO_ERROR"
		end

	yaml_memory_error: INTEGER 
		external
			"C inline use <yaml.h>"
		alias
			"YAML_MEMORY_ERROR"
		end

	yaml_reader_error: INTEGER 
		external
			"C inline use <yaml.h>"
		alias
			"YAML_READER_ERROR"
		end

	yaml_scanner_error: INTEGER 
		external
			"C inline use <yaml.h>"
		alias
			"YAML_SCANNER_ERROR"
		end

	yaml_parser_error: INTEGER 
		external
			"C inline use <yaml.h>"
		alias
			"YAML_PARSER_ERROR"
		end

	yaml_composer_error: INTEGER 
		external
			"C inline use <yaml.h>"
		alias
			"YAML_COMPOSER_ERROR"
		end

	yaml_writer_error: INTEGER 
		external
			"C inline use <yaml.h>"
		alias
			"YAML_WRITER_ERROR"
		end

	yaml_emitter_error: INTEGER 
		external
			"C inline use <yaml.h>"
		alias
			"YAML_EMITTER_ERROR"
		end

end
