JQUERY_SRC=http://jqueryjs.googlecode.com/files/jquery-1.3.2.min.js

script.js: jquery.js append.js
	cat jquery.js append.js > script.js

.PHONY: clean

jquery.js:
	wget -nv $(JQUERY_SRC) -O jquery.js

clean:
	rm jquery.js script.js

# These are Macintosh specific:

open: test
	mate .

test:
	open -a Firefox $$PWD/tests/php.html
	open -a Firefox $$PWD/tests/rails.html

