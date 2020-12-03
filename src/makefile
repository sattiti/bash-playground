# func {{{
define _clean
    -@rm -rf $1
endef
# }}}

# tasks {{{
.PHONY: clean
clean:
    -@$call(_clean, $DIR)
# }}}