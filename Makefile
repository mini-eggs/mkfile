default: build

build:
	ros build mkfile.ros

test:
	sbcl --script main.lisp
