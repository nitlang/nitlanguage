refresh:
	make -C pages/manual
	git pull
	nitiwiki --render -v

rebuild:
	make -C pages/manual
	git pull
	nitiwiki --render --force -v
