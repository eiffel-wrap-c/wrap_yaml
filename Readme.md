# wrap_yaml
`wrap_yaml` is an Eiffel binding of [YAML C API](https://github.com/yaml/libyaml) 
using [WrapC](https://github.com/eiffel-wrap-c/WrapC) tool.

LibYAML is a YAML parser and emitter library.


## Requirements 

*  [WrapC](https://github.com/eiffel-wrap-c/WrapC) tool.
*  [YAML C API](https://github.com/yaml/libyaml)


## Download and  Install

### Linux

Download the source package: http://pyyaml.org/download/libyaml/yaml-0.2.2.tar.gz.

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
	

## Status

Work in progress


## Examples

* [Yaml Parser](examples/parser)   `Shows how to use the Parser event API`.
* [Yaml Scanner](examples/scanner)  `Shows how to use the Parser scan token API`.
* [Yaml Loader](examples/loader)  `Shows how to use load Yaml documents.`.
* [Yaml Emitter](examples/emitter)  `Shows how to use emitter API.`
* [Yaml Dumper](examples/dumper)    `Shows a dump example`. 
  

