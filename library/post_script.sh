#!/bin/sh
# Post processing script
#copy Makefile

echo Copy MakeFile
cp Makefile.SH  ./generated_wrapper/c/src

cd generated_wrapper/eiffel/
rm yaml_event_s_struct_api.e
rm yaml_token_s_struct_api.e
cd ..
cd ..

cd generated_wrapper/c/src/
finish_freezing -library
