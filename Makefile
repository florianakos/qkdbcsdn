install: restsdn_ui-hu.mo
	install restsdn restsdn_tui /usr/local/bin
	which gdialog >/dev/null 2>&1 || install gdialog /usr/local/bin
	grep -q "`cat restsdn.services`" /etc/services || cat restsdn.services >> /etc/services
	install restsdn.xinetd /etc/xinetd.d/calc
	ln -sf /usr/local/bin/restsdn_tui /usr/local/bin/restsdn_net
	ln -sf /usr/local/bin/restsdn_tui /usr/local/bin/restsdn_gui
	install restsdn_ui-hu.mo /usr/share/locale/hu/LC_MESSAGES/restsdn_ui.mo

restsdn_tui.pot: restsdn_tui
	xgettext -o restsdn_tui.pot -L Shell restsdn_tui

restsdn_tui-hu.mo: restsdn_tui-hu.po
	msgfmt -o restsdn_tui-hu.mo restsdn_tui-hu.po

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
