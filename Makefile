refresh:
	make -C pages/manual
	git pull
	nitiwiki --render -v

rebuild:
	make -C pages/manual
	git pull
	nitiwiki --render --force -v

deploy: doc.zip man.zip catalog.zip
	make -C pages/manual
	unzip -o man.zip -d pages/tools
	nitiwiki --render --force -v
	unzip -o doc.zip -d tmp
	mv tmp/nitc tmp/stdlib target/doc/
	unzip -o catalog.zip -d target/catalog/

doc.zip:
	wget https://nightly.link/nitlang/nit/workflows/master/test-ci/doc.zip

man.zip:
	wget https://nightly.link/nitlang/nit/workflows/master/test-ci/man.zip

catalog.zip:
	wget https://nightly.link/nitlang/nit/workflows/master/test-ci/catalog.zip

clean:
	rm -r tmp/
	rm -r target/
