default: build

build:
	ros build mkfile.ros --enable-compression --remove-docstrings --purify --delete-debug-info && \
	mkdir -p releases && \
	 mv mkfile releases/mkfile

clean:
	rm -rf releases

