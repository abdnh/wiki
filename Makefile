.PHONY: all serve publish

all: index.html atom.xml

index.html: tiddlers/* plugins/* tiddlywiki.info
	tiddlywiki . --output . --build index

serve:
	tiddlywiki --listen

publish: index.html atom.xml
	git add index.html atom.xml
	git commit -m "publish"

atom.xml:
	tiddlywiki . --output .  --build feed
