# Makefile for suomalainen-kalenteri

BASE := suomalainen-kalenteri
DESC := Finnish national and Christian holidays for calendar
VERSION := $(shell date +%Y.%-m.%-d)
MAIN := $(BASE).el
PKG := $(BASE)-pkg.el
LOADER := loader.el
FILES := $(MAIN) $(PKG) $(LOADER)
NAME := $(BASE)-$(VERSION)

elpa: $(FILES)
tar: elpa $(NAME).tar
sign: $(NAME).tar.sig

$(NAME).tar: $(FILES) README
	tar --create --file $@ --transform 's,^,$(NAME)/,' $(FILES)

$(NAME).tar.sig: $(NAME).tar
	gpg --yes --detach-sign $<

$(PKG):
	@printf "(define-package \"%s\" \"%s\"\n  \"%s\")\n" \
		"$(BASE)" "$(VERSION)" "$(DESC)" >$@
	@cat $@

$(LOADER):
	@printf ";;;###autoload\n(eval-after-load 'calendar\n" >$@
	@printf "  '(load \"$(MAIN)\" t t))\n" >>$@
	@cat $@

README: README.md
	cp -f -- $< $@

tag:
	git tag -s $(VERSION) -m 'Version $(VERSION)' HEAD

clean:
	rm -f -- *.sig *.tar README

.PHONY: elpa tar sign tag clean $(PKG) $(LOADER)
