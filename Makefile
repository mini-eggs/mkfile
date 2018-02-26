default: build

build:
	ros build mkfile.ros && mkdir -p releases && mv mkfile releases/mkfile

clean:
	rm -rf releases

