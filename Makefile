install: 
	install restsdn restsdn_tui /usr/local/bin
	which gdialog >/dev/null 2>&1 || install gdialog /usr/local/bin
	grep -q "`cat restsdn.services`" /etc/services || cat restsdn.services >> /etc/services
	install restsdn.xinetd /etc/xinetd.d/restsdn
	ln -sf /usr/local/bin/restsdn_tui /usr/local/bin/restsdn_net
	ln -sf /usr/local/bin/restsdn_tui /usr/local/bin/restsdn_gui

clone:
	git clone https://github.com/florianakos/sdnbcqkd

download:
	git pull

upload:
	git add -A
	git commit
	git push origin 

tags:
	git push origin --tags
