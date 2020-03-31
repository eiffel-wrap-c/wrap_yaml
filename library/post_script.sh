#!/bin/sh
# Post processing script
#copy Makefile

echo Copy MakeFile
cp Makefile.SH  ./generated_wrapper/c/src
# copy C file is there any


cd generated_wrapper/eiffel/
rm yaml_event_s_struct_api.e
rm yaml_token_s_struct_api.e
rm io_file_struct_api.e 
rm io_codecvt_struct_api.e 
rm io_marker_struct_api.e 
rm io_wide_data_struct_api.e 
rm yaml_functions_api.e 
rm yaml_document_s_struct_api.e 
rm yaml_node_s_struct_api.e
cd ..
cd ..

cd generated_wrapper/c/src/
finish_freezing -library
