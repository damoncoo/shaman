
build:
	gox -osarch="linux/amd64 linux/arm64 darwin/amd64" -ldflags "-s -w" .
