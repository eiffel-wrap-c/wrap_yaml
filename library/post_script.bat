@echo on
title post_process script

cd generated_wrapper/eiffel/
del /f yaml_event_s_struct_api.e
del /f yaml_token_s_struct_api.e
del /f yaml_functions_api.e 
del /f yaml_document_s_struct_api.e 
del /f yaml_node_s_struct_api.e
del /f iobuf_struct_api.e
cd ..
cd ..

cd generated_wrapper/c/src/
finish_freezing -library
