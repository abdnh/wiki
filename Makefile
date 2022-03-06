.PHONY: all serve publish

all: index.html

index.html: tiddlers plugins tiddlywiki.info
	tiddlywiki . --output . --build index

serve:
	tiddlywiki --listen

publish: index.html
	git add index.html
	git commit -m "publish"
