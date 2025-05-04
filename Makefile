.PHONY: all clean typst public

all: typst public
typst: $(patsubst src/%/main.typ,build/%.pdf,$(shell find src -name main.typ))
public: $(patsubst public/%,build/%,$(shell find public -type f))

# build/%: public/% build
# 	cp "$<" "$@"

build/%.pdf: src/%/main.typ 
	mkdir -p "$(dir $@)"
	typst compile --font-path fonts --root . "$<" "$@"

clean:
	rm -rf build
