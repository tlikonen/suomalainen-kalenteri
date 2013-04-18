# Makefile for suomalainen-kalenteri

BASE := suomalainen-kalenteri
DESC := Finnish national and Christian holidays for calendar
VERSION := $(shell date +%Y.%-m.%-d)
MAIN := $(BASE).el
PKG := $(BASE)-pkg.el
LOADER := loader.el
FILES := $(MAIN) $(PKG) $(LOADER) README
NAME := $(BASE)-$(VERSION)

elpa: $(NAME).tar
sign: $(NAME).tar.sig

$(NAME).tar: $(FILES)
	tar --create --file $@ --transform 's,^,$(NAME)/,' $(FILES)

$(NAME).tar.sig: $(NAME).tar
	gpg --yes --detach-sign $<

$(PKG):
	@printf "(define-package \"%s\" \"%s\"\n  \"%s\")\n" \
		"$(BASE)" "$(VERSION)" "$(DESC)" >$@
	@cat $@

README: README.md
	cp -f -- $< $@

$(LOADER):
	@printf ";;;###autoload\n(eval-after-load 'calendar\n" >$@
	@printf "  '(load \"$(MAIN)\" t t))\n" >>$@
	@cat $@

tag:
	git tag -s $(VERSION) -m 'Version $(VERSION)' HEAD

clean:
	rm -f -- $(PKG) *.sig *.tar $(LOADER) README

.PHONY: elpa sign tag clean
