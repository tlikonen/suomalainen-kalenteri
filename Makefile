# Makefile for suomalainen-kalenteri

BASE := suomalainen-kalenteri
DESC := Finnish national and Christian holidays for calendar
VERSION := $(shell date +%Y.%-m.%-d)
MAIN := $(BASE).el
PKG := $(BASE)-pkg.el
LOADER := loader.el
FILES := $(MAIN) $(PKG) $(LOADER) README.org
NAME := $(BASE)-$(VERSION)

elpa: $(PKG) $(LOADER)
	tar --create --file $(NAME).tar --transform 's,^,$(NAME)/,' $(FILES)
	gpg --yes --detach-sign $(NAME).tar

$(PKG):
	@printf '(define-package "%s" "%s"\n  "%s" nil)\n' \
		"$(BASE)" "$(VERSION)" "$(DESC)" >$@
	@cat $@

$(LOADER):
	@printf ";;;###autoload\n(eval-after-load 'calendar\n" >$@
	@printf "  '(load \"$(MAIN)\" t t))\n" >>$@
	@cat $@

tag:
	git tag -s $(VERSION) -m 'Version $(VERSION)' HEAD

clean:
	rm -f -- $(PKG) *.sig *.tar $(LOADER)

.PHONY: elpa tag clean
