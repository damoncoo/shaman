
build:
	gox -osarch="linux/amd64 linux/arm64 darwin/amd64 darwin/arm64" -ldflags "-s -w" .
