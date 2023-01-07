.PHONY: all serve publish

all: publish

index.html: tiddlers/* plugins/* tiddlywiki.info
	tiddlywiki . --output . --build index

serve:
	tiddlywiki --listen

publish: index.html atom.xml
	git add index.html atom.xml
	git commit -m "publish"

atom.xml: index.html
	tiddlywiki . --output .  --build feed
