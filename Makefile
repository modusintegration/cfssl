BUILD=$(shell date +%FT%T%z)
COMMIT=$(shell git rev-list -1 HEAD)
DESCRIBE=$(shell git describe --tags --always --long --dirty)
LDFLAGS_version=-ldflags="-X 'github.com/cloudflare/cfssl/version.Describe=HOLA' -X 'version.Build=${BUILD}' -X 'version.Commit=${COMMIT}'"


.PHONY: all
all: bin/cfssl bin/cfssl-bundle bin/cfssl-certinfo bin/cfssl-newkey bin/cfssl-scan bin/cfssljson bin/mkbundle bin/multirootca

bin/%: $(shell find . -type f -name '*.go')
	@mkdir -p $(dir $@)
	go build -ldflags="-X 'github.com/cloudflare/cfssl/cli/version.Describe=$(DESCRIBE)' -X 'github.com/cloudflare/cfssl/cli/version.Build=$(BUILD)' -X 'github.com/cloudflare/cfssl/cli/version.Commit=$(COMMIT)'"  -o $@ ./cmd/$(@F)

.PHONY: clean
clean:
	rm -rf bin
