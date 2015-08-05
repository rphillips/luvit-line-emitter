APP_FILES=$(shell find lib tests -type f -name '*.lua')

all: lit $(APP_FILES)

test: lit
	./lit install
	./luvi . -m tests/run.lua

lit:
	curl -L https://github.com/luvit/lit/raw/2.2.4/get-lit.sh | sh

lint: $(APP_FILES)
	find lib tests -name "*.lua" | xargs luacheck

.PHONY: clean lint
