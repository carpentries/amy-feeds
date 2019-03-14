## everything : rebuild all data files and then the site
everything:
	@make workshops
	@make members
	@make site


## workshops  : workshop JSON feeds from AMY data accessed from redash
workshops :
	./bin/make_workshop_feeds.sh _data/

members:
	./bin/make_members_feeds.sh _data/

## site       : build files but do not run a server.
## the files with the _plain suffix are created from the Redash query
## to make them available from the carpentries.org website we copy them
## to the `_site` folder
site :
	bundle exec jekyll build
	find _data -name '*.json' -exec cp {} _site/ \;

## install    : install missing Ruby gems using bundle.
install :
	bundle install

#-------------------------------------------------------------------------------

## clean      : clean up junk files.
clean :
	rm -rf _site
