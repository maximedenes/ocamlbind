#############################################################################
##  v      #                   The Coq Proof Assistant                     ##
## <O___,, #                INRIA - CNRS - LIX - LRI - PPS                 ##
##   \VV/  #                                                               ##
##    //   #  Makefile automagically generated by coq_makefile V8.5beta1   ##
#############################################################################

# WARNING
#
# This Makefile has been automagically generated
# Edit at your own risks !
#
# END OF WARNING

#
# This Makefile was generated by the command line :
# coq_makefile -f Make -o Makefile 
#

.DEFAULT_GOAL := all

# 
# This Makefile may take arguments passed as environment variables:
# COQBIN to specify the directory where Coq binaries resides;
# TIMECMD set a command to log .v compilation time;
# TIMED if non empty, use the default time command as TIMECMD;
# ZDEBUG/COQDEBUG to specify debug flags for ocamlc&ocamlopt/coqc;
# DSTROOT to specify a prefix to install path.

# Here is a hack to make $(eval $(shell works:
define donewline


endef
includecmdwithout@ = $(eval $(subst @,$(donewline),$(shell { $(1) | tr -d '\r' | tr '\n' '@'; })))
$(call includecmdwithout@,$(COQBIN)coqtop -config)

TIMED=
TIMECMD=
STDTIME?=/usr/bin/time -f "$* (user: %U mem: %M ko)"
TIMER=$(if $(TIMED), $(STDTIME), $(TIMECMD))

vo_to_obj = $(addsuffix .o,\
  $(filter-out Warning: Error:,\
  $(shell $(COQBIN)coqtop -q -noinit -batch -quiet -print-mod-uid $(1))))

##########################
#                        #
# Libraries definitions. #
#                        #
##########################

OCAMLLIBS?=-I "src"
COQLIBS?=\
  -R "theories" OCamlBind\
  -I "src"
COQDOCLIBS?=\
  -R "theories" OCamlBind

##########################
#                        #
# Variables definitions. #
#                        #
##########################

COQEPLUGINOPT=src/ocamlbindPlugin.cmxs
COQEPLUGIN=src/ocamlbindPlugin.cma
CMO_TARGETS=$(CMX_TARGETS:.cmx=.cmo)
CMX_TARGETS=\
  src/ocamlbindConstants.cmx \
  src/ocamlbindState.cmx \
  src/ocamlbind.cmx

OPT?=
COQDEP?="$(COQBIN)coqdep" -c
COQFLAGS?=-q $(OPT) $(COQLIBS) $(OTHERFLAGS) $(COQ_XML)
COQCHKFLAGS?=-silent -o
COQDOCFLAGS?=-interpolate -utf8
COQC?=$(TIMER) "$(COQBIN)coqc"
GALLINA?="$(COQBIN)gallina"
COQDOC?="$(COQBIN)coqdoc"
COQCHK?="$(COQBIN)coqchk"
COQMKTOP?="$(COQBIN)coqmktop"

COQSRCLIBS?=-I "$(COQLIB)kernel" -I "$(COQLIB)lib" \
  -I "$(COQLIB)library" -I "$(COQLIB)parsing" -I "$(COQLIB)pretyping" \
  -I "$(COQLIB)interp" -I "$(COQLIB)printing" -I "$(COQLIB)intf" \
  -I "$(COQLIB)proofs" -I "$(COQLIB)tactics" -I "$(COQLIB)tools" \
  -I "$(COQLIB)toplevel" -I "$(COQLIB)stm" -I "$(COQLIB)grammar" \
  -I "$(COQLIB)config" \
  -I "$(COQLIB)/plugins/btauto" \
  -I "$(COQLIB)/plugins/cc" \
  -I "$(COQLIB)/plugins/decl_mode" \
  -I "$(COQLIB)/plugins/derive" \
  -I "$(COQLIB)/plugins/extraction" \
  -I "$(COQLIB)/plugins/field" \
  -I "$(COQLIB)/plugins/firstorder" \
  -I "$(COQLIB)/plugins/fourier" \
  -I "$(COQLIB)/plugins/funind" \
  -I "$(COQLIB)/plugins/micromega" \
  -I "$(COQLIB)/plugins/nsatz" \
  -I "$(COQLIB)/plugins/omega" \
  -I "$(COQLIB)/plugins/quote" \
  -I "$(COQLIB)/plugins/ring" \
  -I "$(COQLIB)/plugins/romega" \
  -I "$(COQLIB)/plugins/rtauto" \
  -I "$(COQLIB)/plugins/setoid_ring" \
  -I "$(COQLIB)/plugins/subtac" \
  -I "$(COQLIB)/plugins/syntax" \
  -I "$(COQLIB)/plugins/xml"
ZFLAGS=$(OCAMLLIBS) $(COQSRCLIBS) -I $(CAMLP4LIB)

CAMLC?=$(OCAMLC) -c -rectypes -thread
CAMLOPTC?=$(OCAMLOPT) -c -rectypes -thread
CAMLLINK?=$(OCAMLC) -rectypes -thread
CAMLOPTLINK?=$(OCAMLOPT) -rectypes -thread
GRAMMARS?=grammar.cma
ifeq ($(CAMLP4),camlp5)
CAMLP4EXTEND=pa_extend.cmo q_MLast.cmo pa_macro.cmo unix.cma threads.cma
else
CAMLP4EXTEND=
endif
PP?=-pp '$(CAMLP4O) -I $(CAMLLIB) -I $(CAMLLIB)threads/ $(COQSRCLIBS) compat5.cmo \
  $(CAMLP4EXTEND) $(GRAMMARS) $(CAMLP4OPTIONS) -impl'

##################
#                #
# Install Paths. #
#                #
##################

ifdef USERINSTALL
XDG_DATA_HOME?="$(HOME)/.local/share"
COQLIBINSTALL=$(XDG_DATA_HOME)/coq
COQDOCINSTALL=$(XDG_DATA_HOME)/doc/coq
else
COQLIBINSTALL="${COQLIB}user-contrib"
COQDOCINSTALL="${DOCDIR}user-contrib"
COQTOPINSTALL="${COQLIB}toploop"
endif

######################
#                    #
# Files dispatching. #
#                    #
######################

VFILES:=theories/reifiable.v\
  theories/ocamlbind.v

-include $(addsuffix .d,$(VFILES))
.SECONDARY: $(addsuffix .d,$(VFILES))

VO=vo
VOFILES:=$(VFILES:.v=.$(VO))
VOFILES1=$(patsubst theories/%,%,$(filter theories/%,$(VOFILES)))
GLOBFILES:=$(VFILES:.v=.glob)
GFILES:=$(VFILES:.v=.g)
HTMLFILES:=$(VFILES:.v=.html)
GHTMLFILES:=$(VFILES:.v=.g.html)
OBJFILES=$(call vo_to_obj,$(VOFILES))
ALLNATIVEFILES=$(OBJFILES:.o=.cmi) $(OBJFILES:.o=.cmo) $(OBJFILES:.o=.cmx) $(OBJFILES:.o=.cmxs)
NATIVEFILES=$(foreach f, $(ALLNATIVEFILES), $(wildcard $f))
NATIVEFILES1=$(patsubst theories/%,%,$(filter theories/%,$(NATIVEFILES)))
ML4FILES:=src/ocamlbind.ml4

-include $(addsuffix .d,$(ML4FILES))
.SECONDARY: $(addsuffix .d,$(ML4FILES))

MLFILES:=src/ocamlbindState.ml\
  src/ocamlbindConstants.ml

-include $(addsuffix .d,$(MLFILES))
.SECONDARY: $(addsuffix .d,$(MLFILES))

MLLIBFILES:=src/ocamlbindPlugin.mllib

-include $(addsuffix .d,$(MLLIBFILES))
.SECONDARY: $(addsuffix .d,$(MLLIBFILES))

MLIFILES:=src/ocamlbindState.mli

-include $(addsuffix .d,$(MLIFILES))
.SECONDARY: $(addsuffix .d,$(MLIFILES))

ALLCMOFILES:=$(ML4FILES:.ml4=.cmo) $(MLFILES:.ml=.cmo)
CMOFILES=$(filter-out $(addsuffix .cmo,$(foreach lib,$(MLLIBFILES:.mllib=_MLLIB_DEPENDENCIES) $(MLPACKFILES:.mlpack=_MLPACK_DEPENDENCIES),$($(lib)))),$(ALLCMOFILES))
CMOFILESINC=$(filter $(wildcard src/*),$(CMOFILES)) 
CMXFILES=$(CMOFILES:.cmo=.cmx)
OFILES=$(CMXFILES:.cmx=.o)
CMAFILES:=$(MLLIBFILES:.mllib=.cma)
CMAFILESINC=$(filter $(wildcard src/*),$(CMAFILES)) 
CMXAFILES:=$(CMAFILES:.cma=.cmxa)
CMIFILES=$(sort $(ALLCMOFILES:.cmo=.cmi) $(MLIFILES:.mli=.cmi))
CMIFILESINC=$(filter $(wildcard src/*),$(CMIFILES)) 
CMXSFILES=$(CMXFILES:.cmx=.cmxs) $(CMXAFILES:.cmxa=.cmxs)
CMXSFILESINC=$(filter $(wildcard src/*),$(CMXSFILES)) 
ifeq '$(HASNATDYNLINK)' 'true'
HASNATDYNLINK_OR_EMPTY := yes
else
HASNATDYNLINK_OR_EMPTY :=
endif

#######################################
#                                     #
# Definition of the toplevel targets. #
#                                     #
#######################################

all: $(VOFILES) $(CMOFILES) $(CMAFILES) $(if $(HASNATDYNLINK_OR_EMPTY),$(CMXSFILES)) 

mlihtml: $(MLIFILES:.mli=.cmi)
	 mkdir $@ || rm -rf $@/*
	$(OCAMLDOC) -html -rectypes -d $@ -m A $(ZDEBUG) $(ZFLAGS) $(^:.cmi=.mli)

all-mli.tex: $(MLIFILES:.mli=.cmi)
	$(OCAMLDOC) -latex -rectypes -o $@ -m A $(ZDEBUG) $(ZFLAGS) $(^:.cmi=.mli)

quick: $(VOFILES:.vo=.vio)

vio2vo:
	$(COQC) $(COQDEBUG) $(COQFLAGS) -schedule-vio2vo $(J) $(VOFILES:%.vo=%.vio)
checkproofs:
	$(COQC) $(COQDEBUG) $(COQFLAGS) -schedule-vio-checking $(J) $(VOFILES:%.vo=%.vio)
gallina: $(GFILES)

html: $(GLOBFILES) $(VFILES)
	- mkdir -p html
	$(COQDOC) -toc $(COQDOCFLAGS) -html $(COQDOCLIBS) -d html $(VFILES)

gallinahtml: $(GLOBFILES) $(VFILES)
	- mkdir -p html
	$(COQDOC) -toc $(COQDOCFLAGS) -html -g $(COQDOCLIBS) -d html $(VFILES)

all.ps: $(VFILES)
	$(COQDOC) -toc $(COQDOCFLAGS) -ps $(COQDOCLIBS) -o $@ `$(COQDEP) -sort -suffix .v $^`

all-gal.ps: $(VFILES)
	$(COQDOC) -toc $(COQDOCFLAGS) -ps -g $(COQDOCLIBS) -o $@ `$(COQDEP) -sort -suffix .v $^`

all.pdf: $(VFILES)
	$(COQDOC) -toc $(COQDOCFLAGS) -pdf $(COQDOCLIBS) -o $@ `$(COQDEP) -sort -suffix .v $^`

all-gal.pdf: $(VFILES)
	$(COQDOC) -toc $(COQDOCFLAGS) -pdf -g $(COQDOCLIBS) -o $@ `$(COQDEP) -sort -suffix .v $^`

validate: $(VOFILES)
	$(COQCHK) $(COQCHKFLAGS) $(COQLIBS) $(notdir $(^:.vo=))

beautify: $(VFILES:=.beautified)
	for file in $^; do mv $${file%.beautified} $${file%beautified}old && mv $${file} $${file%.beautified}; done
	@echo 'Do not do "make clean" until you are sure that everything went well!'
	@echo 'If there were a problem, execute "for file in $$(find . -name \*.v.old -print); do mv $${file} $${file%.old}; done" in your shell/'

.PHONY: all opt byte archclean clean install uninstall_me.sh uninstall userinstall depend html validate

####################
#                  #
# Special targets. #
#                  #
####################

byte:
	$(MAKE) all "OPT:=-byte"

opt:
	$(MAKE) all "OPT:=-opt"

userinstall:
	+$(MAKE) USERINSTALL=true install

install-natdynlink:
	install -d "$(DSTROOT)"$(COQLIBINSTALL)/OCamlBind; \
	for i in $(CMXSFILESINC); do \
	 install -m 0755 $$i "$(DSTROOT)"$(COQLIBINSTALL)/OCamlBind/`basename $$i`; \
	done

install-toploop: $(MLLIBFILES:.mllib=.cmxs)
	 install -d "$(DSTROOT)"$(COQTOPINSTALL)/
	 install -m 0755 $?  "$(DSTROOT)"$(COQTOPINSTALL)/

install:$(if $(HASNATDYNLINK_OR_EMPTY),install-natdynlink)
	cd "theories" && for i in $(NATIVEFILES1) $(GLOBFILES1) $(VFILES1) $(VOFILES1); do \
	 install -d "`dirname "$(DSTROOT)"$(COQLIBINSTALL)/OCamlBind/$$i`"; \
	 install -m 0644 $$i "$(DSTROOT)"$(COQLIBINSTALL)/OCamlBind/$$i; \
	done
	for i in $(CMAFILESINC) $(CMIFILESINC) $(CMOFILESINC); do \
	 install -m 0644 $$i "$(DSTROOT)"$(COQLIBINSTALL)/OCamlBind/`basename $$i`; \
	done

install-doc:
	install -d "$(DSTROOT)"$(COQDOCINSTALL)/OCamlBind/html
	for i in html/*; do \
	 install -m 0644 $$i "$(DSTROOT)"$(COQDOCINSTALL)/OCamlBind/$$i;\
	done
	install -d "$(DSTROOT)"$(COQDOCINSTALL)/OCamlBind/mlihtml
	for i in mlihtml/*; do \
	 install -m 0644 $$i "$(DSTROOT)"$(COQDOCINSTALL)/OCamlBind/$$i;\
	done

uninstall_me.sh:
	echo '#!/bin/sh' > $@ 
	printf 'cd "$${DSTROOT}"$(COQLIBINSTALL)/OCamlBind && \\\nfor i in $(CMXSFILESINC); do rm -f "`basename "$$i"`"; done && find . -type d -and -empty -delete\ncd "$${DSTROOT}"$(COQLIBINSTALL) && find "OCamlBind" -maxdepth 0 -and -empty -exec rmdir -p \{\} \;\n' >> "$@"
	printf 'cd "$${DSTROOT}"$(COQLIBINSTALL)/OCamlBind && rm -f $(NATIVEFILES1) $(GLOBFILES1) $(VFILES1) $(VOFILES1) && \\\nfor i in $(CMAFILESINC) $(CMIFILESINC) $(CMOFILESINC); do rm -f "`basename "$$i"`"; done && find . -type d -and -empty -delete\ncd "$${DSTROOT}"$(COQLIBINSTALL) && find "OCamlBind" -maxdepth 0 -and -empty -exec rmdir -p \{\} \;\n' >> "$@"
	printf 'cd "$${DSTROOT}"$(COQDOCINSTALL)/OCamlBind \\\n' >> "$@"
	printf '&& rm -f $(shell find "html" -maxdepth 1 -and -type f -print)\n' >> "$@"
	printf 'cd "$${DSTROOT}"$(COQDOCINSTALL) && find OCamlBind/html -maxdepth 0 -and -empty -exec rmdir -p \{\} \;\n' >> "$@"
	printf 'cd "$${DSTROOT}"$(COQDOCINSTALL)/OCamlBind \\\n' >> "$@"
	printf '&& rm -f $(shell find "mlihtml" -maxdepth 1 -and -type f -print)\n' >> "$@"
	printf 'cd "$${DSTROOT}"$(COQDOCINSTALL) && find OCamlBind/mlihtml -maxdepth 0 -and -empty -exec rmdir -p \{\} \;\n' >> "$@"
	chmod +x $@

uninstall: uninstall_me.sh
	sh $<

clean:
	rm -f $(ALLCMOFILES) $(CMIFILES) $(CMAFILES)
	rm -f $(ALLCMOFILES:.cmo=.cmx) $(CMXAFILES) $(CMXSFILES) $(ALLCMOFILES:.cmo=.o) $(CMXAFILES:.cmxa=.a)
	rm -f $(addsuffix .d,$(MLFILES) $(MLIFILES) $(ML4FILES) $(MLLIBFILES) $(MLPACKFILES))
	rm -f $(OBJFILES) $(OBJFILES:.o=.native) $(NATIVEFILES)
	rm -f $(VOFILES) $(VOFILES:.vo=.vio) $(GFILES) $(VFILES:.v=.v.d) $(VFILES:=.beautified) $(VFILES:=.old)
	rm -f all.ps all-gal.ps all.pdf all-gal.pdf all.glob $(VFILES:.v=.glob) $(VFILES:.v=.tex) $(VFILES:.v=.g.tex) all-mli.tex
	- rm -rf html mlihtml uninstall_me.sh

archclean:
	rm -f *.cmx *.o

printenv:
	@"$(COQBIN)coqtop" -config
	@echo 'CAMLC =	$(CAMLC)'
	@echo 'CAMLOPTC =	$(CAMLOPTC)'
	@echo 'PP =	$(PP)'
	@echo 'COQFLAGS =	$(COQFLAGS)'
	@echo 'COQLIBINSTALL =	$(COQLIBINSTALL)'
	@echo 'COQDOCINSTALL =	$(COQDOCINSTALL)'

Makefile: Make
	mv -f $@ $@.bak
	"$(COQBIN)coq_makefile" -f $< -o $@


###################
#                 #
# Implicit rules. #
#                 #
###################

$(MLIFILES:.mli=.cmi): %.cmi: %.mli
	$(CAMLC) $(ZDEBUG) $(ZFLAGS) $<

$(addsuffix .d,$(MLIFILES)): %.mli.d: %.mli
	$(OCAMLDEP) -slash $(OCAMLLIBS) "$<" > "$@" || ( RV=$$?; rm -f "$@"; exit $${RV} )

$(ML4FILES:.ml4=.cmo): %.cmo: %.ml4
	$(CAMLC) $(ZDEBUG) $(ZFLAGS) $(PP) -impl $<

$(filter-out $(addsuffix .cmx,$(foreach lib,$(MLPACKFILES:.mlpack=_MLPACK_DEPENDENCIES),$($(lib)))),$(ML4FILES:.ml4=.cmx)): %.cmx: %.ml4
	$(CAMLOPTC) $(ZDEBUG) $(ZFLAGS) $(PP) -impl $<

$(addsuffix .d,$(ML4FILES)): %.ml4.d: %.ml4
	$(COQDEP) $(OCAMLLIBS) "$<" > "$@" || ( RV=$$?; rm -f "$@"; exit $${RV} )

$(MLFILES:.ml=.cmo): %.cmo: %.ml
	$(CAMLC) $(ZDEBUG) $(ZFLAGS) $<

$(filter-out $(addsuffix .cmx,$(foreach lib,$(MLPACKFILES:.mlpack=_MLPACK_DEPENDENCIES),$($(lib)))),$(MLFILES:.ml=.cmx)): %.cmx: %.ml
	$(CAMLOPTC) $(ZDEBUG) $(ZFLAGS) $<

$(addsuffix .d,$(MLFILES)): %.ml.d: %.ml
	$(OCAMLDEP) -slash $(OCAMLLIBS) "$<" > "$@" || ( RV=$$?; rm -f "$@"; exit $${RV} )

$(filter-out $(MLLIBFILES:.mllib=.cmxs),$(MLFILES:.ml=.cmxs) $(ML4FILES:.ml4=.cmxs) $(MLPACKFILES:.mlpack=.cmxs)): %.cmxs: %.cmx
	$(CAMLOPTLINK) $(ZDEBUG) $(ZFLAGS) -shared -o $@ $<

$(MLLIBFILES:.mllib=.cmxs): %.cmxs: %.cmxa
	$(CAMLOPTLINK) $(ZDEBUG) $(ZFLAGS) -linkall -shared -o $@ $<

$(MLLIBFILES:.mllib=.cma): %.cma: | %.mllib
	$(CAMLLINK) $(ZDEBUG) $(ZFLAGS) -a -o $@ $^

$(MLLIBFILES:.mllib=.cmxa): %.cmxa: | %.mllib
	$(CAMLOPTLINK) $(ZDEBUG) $(ZFLAGS) -a -o $@ $^

$(addsuffix .d,$(MLLIBFILES)): %.mllib.d: %.mllib
	$(COQDEP) $(OCAMLLIBS) "$<" > "$@" || ( RV=$$?; rm -f "$@"; exit $${RV} )

$(VOFILES): %.vo: %.v
	$(COQC) $(COQDEBUG) $(COQFLAGS) $*

$(GLOBFILES): %.glob: %.v
	$(COQC) $(COQDEBUG) $(COQFLAGS) $*

$(VFILES:.v=.vio): %.vio: %.v
	$(COQC) -quick $(COQDEBUG) $(COQFLAGS) $*

$(GFILES): %.g: %.v
	$(GALLINA) $<

$(VFILES:.v=.tex): %.tex: %.v
	$(COQDOC) $(COQDOCFLAGS) -latex $< -o $@

$(HTMLFILES): %.html: %.v %.glob
	$(COQDOC) $(COQDOCFLAGS) -html $< -o $@

$(VFILES:.v=.g.tex): %.g.tex: %.v
	$(COQDOC) $(COQDOCFLAGS) -latex -g $< -o $@

$(GHTMLFILES): %.g.html: %.v %.glob
	$(COQDOC) $(COQDOCFLAGS)  -html -g $< -o $@

$(addsuffix .d,$(VFILES)): %.v.d: %.v
	$(COQDEP) $(COQLIBS) "$<" > "$@" || ( RV=$$?; rm -f "$@"; exit $${RV} )

$(addsuffix .beautified,$(VFILES)): %.v.beautified:
	$(COQC) $(COQDEBUG) $(COQFLAGS) -beautify $*

# WARNING
#
# This Makefile has been automagically generated
# Edit at your own risks !
#
# END OF WARNING

