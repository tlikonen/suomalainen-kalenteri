# Makefile for suomalainen-kalenteri

BASE := suomalainen-kalenteri
DESC := Finnish national and Christian holidays for calendar
VERSION := $(shell date +%Y.%-m.%-d)
MAIN := $(BASE).el
PKG := $(BASE)-pkg.el
LOADER := loader.el
FILES := $(MAIN) $(PKG) $(LOADER) README
NAME := $(BASE)-$(VERSION)

elpa: $(PKG) $(LOADER)
tar: $(NAME).tar
sign: $(NAME).tar.sig
elc: $(BASE).elc

$(NAME).tar: $(FILES)
	tar --create --file $@ --transform 's,^,$(NAME)/,' $(FILES)

$(NAME).tar.sig: $(NAME).tar
	gpg --yes --detach-sign $<

$(PKG):
	@printf "(define-package \"%s\" \"%s\"\n  \"%s\")\n" \
		"$(BASE)" "$(VERSION)" "$(DESC)" >$@
	@cat $@

$(LOADER): Makefile $(MAIN)
	@printf ";;;###autoload\n(eval-after-load 'calendar\n" >$@
	@printf "  '(load \"$(BASE)\" t t))\n" >>$@
	@cat $@

README: README.md
	cp -f -- $< $@

$(BASE).elc: %.elc: %.el
	emacs -Q --batch -f batch-byte-compile $<

new-version: $(PKG)
	git commit -m "Versio $(VERSION)" -- $(PKG)
	git tag -s $(VERSION) -m '$(VERSION)' HEAD

clean:
	rm -f -- *.sig *.tar *.elc README

.PHONY: elpa tar sign tag clean $(PKG) new-version
