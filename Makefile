binaries := binaries
excutable := shaman

build:
	gox  -output "${binaries}/{{.OS}}/{{.Arch}}/${excutable}" -osarch="linux/amd64 linux/arm64 darwin/amd64 darwin/arm64 linux/s390x" -ldflags "-s -w" .

docker:
	@docker buildx build --platform linux/amd64,linux/arm64,linux/s390x  -t damoncoo/shaman -t ghcr.io/damoncoo/shaman:latest . --push
