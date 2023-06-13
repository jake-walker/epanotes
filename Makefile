all: build

build:
	hugo

generate:
	mkdir -p ./content/docs
	# copy and convert obsidian notes
	python3 -m obsidian_to_hugo --obsidian-vault-dir /Users/jakew/Sync/EPA\ Revision/ --hugo-content-dir ./content/docs
	# they're not going in the base so add a docs prefix to links
	find ./content/docs -type f -name "*.md" -exec sed -i '' 's/{{< ref "/{{< ref "docs\//g' {} \;
	# generate frontmatter from filenames
	find ./content/docs -type f -name "*.md" -exec sh -c 'sed -i "" "1s;^;---\ntitle: \"$$(basename "{}" .md)\"\n---\n\n;" "{}"' \;
	# create index files for each subdirectory
	find ./content/docs -type d -mindepth 1 -exec touch {}/_index.md \;

clean:
	rm -rf ./content/docs ./public
