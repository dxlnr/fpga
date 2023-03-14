pre:
	# libFTDI » FTDI USB driver with bitbang mode.
	sudo apt-get install libftdi-dev
	# Open On-Chip Debugger
	sudo apt-get install openocd

yosys:
	# Make sure to be in the correct directory.
	@cd yosys

	# Prerequisits
	@sudo apt-get install build-essential clang bison flex \
	libreadline-dev gawk tcl-dev libffi-dev git \
	graphviz xdot pkg-config python3 libboost-system-dev \
	libboost-python-dev libboost-filesystem-dev zlib1g-dev
	
	# Configure the build system to use a specific compiler
	@make config-gcc

	# Build yosys 
	make 
	sudo make install

# prjxray:
# 	@cd prjxray
# 	@git submodule update --init --recursive
# 	# just in case
# 	@sudo apt-get install cmake
# 	@make build
# 	@make
	
