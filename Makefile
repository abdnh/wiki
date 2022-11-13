.PHONY: all serve publish feed

all: index.html

index.html: tiddlers/* plugins/* tiddlywiki.info
	tiddlywiki . --output . --build index

serve:
	tiddlywiki --listen

publish: index.html feed
	git add index.html atom.xml
	git commit -m "publish"

feed:
	tiddlywiki . --output .  --build feed
