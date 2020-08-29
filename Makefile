# Makefile for suomalainen-kalenteri

NAME := suomalainen-kalenteri
DESC := Finnish national and Christian holidays for calendar
VERSION := $(shell date +%Y.%-m.%-d)
PKG := $(NAME)-pkg.el
LOADER := loader.el

elpa: $(PKG) $(LOADER)

$(PKG):
	@printf "(define-package \"%s\" \"%s\"\n  \"%s\")\n" \
		"$(NAME)" "$(VERSION)" "$(DESC)" >$@
	@cat $@

$(LOADER): $(NAME).el
	@printf ";;;###autoload\n(eval-after-load 'calendar\n" >$@
	@printf "  '(load \"$(NAME)\" t t))\n" >>$@
	@cat $@

new-version: $(PKG)
	git commit -m "Versio $(VERSION)" -- $(PKG)
	git tag -s $(VERSION) -m '$(VERSION)' HEAD

.PHONY: elpa $(PKG) new-version
