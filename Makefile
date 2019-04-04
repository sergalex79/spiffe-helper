# Enable go modules
export GO111MODULE=on

.PHONY: all utils build test clean distclean

build:
	echo '$@ is ' $@
	go install $@
	cd $@; go build

all: utils vendor build test

install:

utils:
	go get github.com/Masterminds/glide
	go get github.com/goreleaser/goreleaser

vendor: glide.yaml glide.lock
	glide install

test:
	go test

clean:
	go clean

distclean:
	go clean -i
	rm -rf vendor dist

release:
	goreleaser || true
