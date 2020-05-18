# wrap_yaml
`wrap_yaml` is an Eiffel binding of [YAML C API](https://github.com/yaml/libyaml) 
using [WrapC](https://github.com/eiffel-wrap-c/WrapC) tool.

LibYAML is a YAML parser and emitter library.


## Requirements 

*  [WrapC](https://github.com/eiffel-wrap-c/WrapC) tool.
*  [YAML C API](https://github.com/yaml/libyaml)


## Download and  Install

### Linux

Download the source package: http://pyyaml.org/download/libyaml/yaml-0.2.4.tar.gz.

To build and install LibYAML, run

	$ ./configure
	$ make
	# make install

You may check out the latest development code of LibYAML from the GitHub repository https://github.com/yaml/libyaml:

$ git clone https://github.com/yaml/libyaml

If you checked out the LibYAML source code from the GitHub repository, you can build LibYAML with the commands:

	$ ./bootstrap
	$ ./configure
	$ make
	# make install

At the moment we use the convention that `libyaml` will be installed at

	/usr/local/lib/libyaml.so
	
### Windows

Using vcpkg (https://github.com/microsoft/vcpkg) tool, you can install libyaml library

	vcpkg install libyaml:x64-windows-static
	
Then copy the file `OFF.lib` to `%LIBRARY_PATH%wrap_library/library/C/include/lib` and rename the library as `yaml.lib`
Where `%LIBRARY_PATH%` is where you clone/download `wrap_yaml` source code.

## Status

Work in progress


## Examples

* [Yaml Parser](examples/parser)   `Shows how to use the Parser event API`.
* [Yaml Scanner](examples/scanner)  `Shows how to use the Parser scan token API`.
* [Yaml Loader](examples/loader)  `Shows how to use load Yaml documents.`.
* [Yaml Emitter](examples/emitter)  `Shows how to use emitter API.`
* [Yaml Dumper](examples/dumper)    `Shows a dump example`. 
  

### How to compile the C library glue code.

Before to use the examples you will need to compile the C glue code, go to 

	library/generated_wrapper/c/src

and run

	finish_freezing --library

It will copy the C lib `eif_libyaml.a` to `$ECF_CONFIG_PATH/C/spec/$(ISE_PLATFORM)/lib/`  or `eif_libyaml.lib`  to `$ECF_CONFIG_PATH/C/spec/$ISE_C_COMPILER/$ISE_PLATFORM/lib` 






