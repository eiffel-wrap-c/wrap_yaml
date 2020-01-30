note

	description: "This file has been generated by EWG. Do not edit. Changes will be lost!"

	generator: "Eiffel Wrapper Generator"

class YAML_VERSION_DIRECTIVE_S_STRUCT_API

inherit

	MEMORY_STRUCTURE

	
create

	make,
	make_by_pointer

feature -- Measurement

	structure_size: INTEGER 
		do
			Result := sizeof_external
		end

feature {ANY} -- Member Access

	major: INTEGER
			-- Access member `major`
		require
			exists: exists
		do
			Result := c_major (item)
		ensure
			result_correct: Result = c_major (item)
		end

	set_major (a_value: INTEGER) 
			-- Change the value of member `major` to `a_value`.
		require
			exists: exists
		do
			set_c_major (item, a_value)
		ensure
			major_set: a_value = major
		end

	minor: INTEGER
			-- Access member `minor`
		require
			exists: exists
		do
			Result := c_minor (item)
		ensure
			result_correct: Result = c_minor (item)
		end

	set_minor (a_value: INTEGER) 
			-- Change the value of member `minor` to `a_value`.
		require
			exists: exists
		do
			set_c_minor (item, a_value)
		ensure
			minor_set: a_value = minor
		end

feature {NONE} -- Implementation wrapper for struct struct yaml_version_directive_s

	sizeof_external: INTEGER 
		external
			"C inline use <yaml.h>"
		alias
			"sizeof(struct yaml_version_directive_s)"
		end

	c_major (an_item: POINTER): INTEGER
		require
			an_item_not_null: an_item /= default_pointer
		external
			"C inline use <yaml.h>"
		alias
			"[
				((struct yaml_version_directive_s*)$an_item)->major
			]"
		end

	set_c_major (an_item: POINTER; a_value: INTEGER) 
		require
			an_item_not_null: an_item /= default_pointer
		external
			"C inline use <yaml.h>"
		alias
			"[
				((struct yaml_version_directive_s*)$an_item)->major =  (int)$a_value
			]"
		ensure
			major_set: a_value = c_major (an_item)
		end

	c_minor (an_item: POINTER): INTEGER
		require
			an_item_not_null: an_item /= default_pointer
		external
			"C inline use <yaml.h>"
		alias
			"[
				((struct yaml_version_directive_s*)$an_item)->minor
			]"
		end

	set_c_minor (an_item: POINTER; a_value: INTEGER) 
		require
			an_item_not_null: an_item /= default_pointer
		external
			"C inline use <yaml.h>"
		alias
			"[
				((struct yaml_version_directive_s*)$an_item)->minor =  (int)$a_value
			]"
		ensure
			minor_set: a_value = c_minor (an_item)
		end

end
