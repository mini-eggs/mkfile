default: build

build_linux: build
	mv mkfile releases/mkfile_linux_64

build_mac: build
	mv mkfile releases/mkfile_mac_64

build:
	ros build mkfile.ros --enable-compression --remove-docstrings --purify --delete-debug-info && \
	mkdir -p releases

clean:
	rm -rf releases
