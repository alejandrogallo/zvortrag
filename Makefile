#local configuration
-include config.mk
# PARAMETERS, OVERRIDE THESE
SOURCE_DOCUMENT ?= main.tex
BIBTEX_FILE     ?= $(patsubst %.tex,%.bib,$(SOURCE_DOCUMENT))
DEPS_DIR        ?= deps
PDF_VIEWER      ?= mupdf
LATEX           ?= pdflatex
PDFLATEX        ?= pdflatex
ASYMPTOTE       ?= asy
SH              ?= bash
PY              ?= python
GNUPLOT         ?= gnuplot
pandoc          ?= pandoc
BIBTEX          ?= bibtex
# Use greadlink in osx
READLINK        ?= readlink
# Do you use pythontex?
DEPENDENCIES    ?=
FIGURES         ?=
# sources included through \include
INCLUDES        ?=
FIGS_DIR        ?= images
# it generates the figures needed
# if 0 it looks for all scripts in FIGS_DIR
AUTO_FIG_DEPS   ?= 1
AUTO_INC_DEPS   ?= 1
WITH_PYTHONTEX  ?= 0
PYTHONTEX       ?= pythontex
ECHO            ?= @echo "\033[0;35m===>\033[0m"
# if 1 run commands quietly
QUIET           ?= 0

ifneq ($(QUIET),0)
	FD_OUTPUT = 2>&1 > /dev/null
else
	FD_OUTPUT =
endif


PDF_DOCUMENT   = $(shell $(READLINK) -f $(patsubst %.tex,%.pdf,$(SOURCE_DOCUMENT)))
DVI_DOCUMENT   = $(shell $(READLINK) -f $(patsubst %.tex,%.dvi,$(SOURCE_DOCUMENT)))
MAN_DOCUMENT   = $(patsubst %.tex,%.1,$(SOURCE_DOCUMENT))
HTML_DOCUMENT  = $(patsubst %.tex,%.html,$(SOURCE_DOCUMENT))
TOC_FILE       = $(patsubst %.tex,%.toc,$(SOURCE_DOCUMENT))
BIBITEM_FILE   = $(patsubst %.bib,%.bbl,$(BIBTEX_FILE))
PYTHONTEX_FILE = $(patsubst %.tex,%.pytxcode,$(SOURCE_DOCUMENT))
FIGS_SUFFIXES  = %.pdf %.eps %.png %.jpg %.jpeg %.gif %.dvi %.bmp %.svg %.ps
PURGE_SUFFIXES = %.aux %.bbl %.blg %.fdb_latexmk %.fls %.log %.out %.ilg %.toc
BUILD_DOCUMENT = $(PDF_DOCUMENT)

# These files are to keep track of the dependencies for
# latex or pdf includes, table of contents generation or
# figure recognition
TOC_DEP        = $(DEPS_DIR)/toc.d
INCLUDES_DEP   = $(DEPS_DIR)/includes.d
FIGS_DEP       = $(DEPS_DIR)/figs.d

ifeq ($(AUTO_INC_DEPS),1)
	include $(INCLUDES_DEP)
endif

ifneq ($(AUTO_FIG_DEPS),1)
# for libs and such
	IGNORE_FIGS       = $(FIGS_DIR)/atoms.asy $(FIGS_DIR)/resources.asy
	ASY_FILES         = $(filter-out $(IGNORE_FIGS),$(shell find $(FIGS_DIR) | grep .asy))
	ASY_PDF_FILES     = $(patsubst %.asy,%.pdf,$(ASY_FILES))
	GNUPLOT_FILES     = $(filter-out $(IGNORE_FIGS),$(shell find $(FIGS_DIR) | grep .gnuplot))
	GNUPLOT_PDF_FILES = $(patsubst %.gnuplot,%.pdf,$(GNUPLOT_FILES))
	TEX_FILES         = $(filter-out $(IGNORE_FIGS),$(shell find $(FIGS_DIR) | grep .tex))
	TEX_PDF_FILES     = $(patsubst %.tex,%.pdf,$(TEX_FILES))
	FIGURES=$(TEX_PDF_FILES) $(ASY_PDF_FILES) $(GNUPLOT_PDF_FILES)
else
	include $(FIGS_DEP)
endif

.PHONY: view-pdf open-pdf $(PDF_VIEWER) todo help test force purge

# Main dependencies for BUILD_DOCUMENT
DEPENDENCIES += $(SOURCE_DOCUMENT) $(INCLUDES) $(FIGURES) $(TOC_FILE)

# Bibtex dependency
ifneq ("$(wildcard $(BIBTEX_FILE))","")
	DEPENDENCIES += $(BIBITEM_FILE)
endif

# Pythontex support
ifneq ($(WITH_PYTHONTEX),0)
	DEPENDENCIES += $(PYTHONTEX_FILE)
endif


all: $(BUILD_DOCUMENT) view-pdf ## (Default) Create BUILD_DOCUMENT

$(BUILD_DOCUMENT): $(DEPENDENCIES)

force: ## Force creation of BUILD_DOCUMENT (for bibtex)
	-rm $(BUILD_DOCUMENT)
	$(MAKE) $(BUILD_DOCUMENT)

$(BIBITEM_FILE): $(BIBTEX_FILE)
	$(ECHO) "Compiling the bibliography"
	-$(BIBTEX) $(patsubst %.bib,%,$(BIBTEX_FILE)) $(FD_OUTPUT)
	$(ECHO) Compiling again $(BUILD_DOCUMENT) to update refs
	$(MAKE) force

%.pytxcode: %.tex
	$(ECHO) "Compiling latex for pythontex"
	$(MAKE) force
	$(ECHO) "Creating pythontex"
	$(PYTHONTEX) $<

#Open a viewer if there is none open viewing $(BUILD_DOCUMENT)
view-pdf: $(PDF_VIEWER) open-pdf ## Refresh and open pdf

open-pdf: ## Open pdf build document
	-@ps aux | grep -v grep \
	| grep "$(PDF_VIEWER)" \
	| grep -q "$(BUILD_DOCUMENT)" \
	||  $(PDF_VIEWER) "$(BUILD_DOCUMENT)" 2>&1 > /dev/null &

mupdf: ## Refresh mupdf
	-@ps aux \
	| grep -v grep \
	| grep "$(PDF_VIEWER)" \
	| grep "$(BUILD_DOCUMENT)" \
	| awk '{print $$2}'\
	| xargs -n1 kill -s SIGHUP

$(FIGS_SUFFIXES): %.asy
	$(ECHO) Compiling $<
	cd $(dir $<) && $(ASYMPTOTE) -f $(shell echo $(suffix $@) | tr -d "\.") $(notdir $< ) $(FD_OUTPUT)

$(FIGS_SUFFIXES): %.gnuplot
	$(ECHO) Compiling $<
	cd $(dir $< ) && $(GNUPLOT) $(notdir $< ) $(FD_OUTPUT)

$(FIGS_SUFFIXES): %.sh
	$(ECHO) Compiling $<
	cd $(dir $< ) && $(SH) $(notdir $< ) $(FD_OUTPUT)

$(FIGS_SUFFIXES): %.py
	$(ECHO) Compiling $<
	cd $(dir $< ) && $(PY) $(notdir $< ) $(FD_OUTPUT)

$(FIGS_SUFFIXES): %.tex
	$(ECHO) Compiling $<
	cd $(dir $< ) && $(PDFLATEX) $(notdir $< ) $(FD_OUTPUT)

$(TOC_FILE): $(TOC_DEP)
	$(ECHO) Creating $(TOC_FILE)
	cd $(dir $(SOURCE_DOCUMENT) ) && $(PDFLATEX) $(notdir $(SOURCE_DOCUMENT) ) $(FD_OUTPUT)

$(TOC_DEP): $(SOURCE_DOCUMENT) $(INCLUDES_DEP)
	$(ECHO) Parsing the toc entries
	@mkdir -p $(dir $@)
	@grep -E '\\(section|subsection|subsubsection|chapter|part|subsubsubsection).' $(SOURCE_DOCUMENT) $(INCLUDES)  \
	| sed 's/.*{\(.*\)}.*/\1/' > $@.control
	@if ! diff $@ $@.control > /dev/null ; then mv $@.control $@; fi

$(INCLUDES_DEP): $(SOURCE_DOCUMENT)
	$(ECHO) Parsing the includes dependencies
	@mkdir -p $(dir $@)
	@echo INCLUDES = \\ > $@
	#@ Include statements should not have a .tex extension
	#@ so we are forced to add it
	@grep -E '\\include[^gp]' $<  \
	| sed 's/.*{\(.*\)}.*/\1.tex \\/' >> $@

$(FIGS_DEP): $(SOURCE_DOCUMENT) $(INCLUDES_DEP)
	$(ECHO) Parsing the graphics dependencies
	@mkdir -p $(dir $@)
	@echo FIGURES = \\ > $@
	@grep -E '\\include(graphic|pdf).' $(SOURCE_DOCUMENT) $(INCLUDES)  \
	| sed 's/.*{\(.*\)}.*/\1 \\/' >> $@

#.PHONY: $(DEPS_DIR)/includes.d $(DEPS_DIR)/figures.d
# vim-run: clear; make deps/includes.d ; make test

clean: ## Remove build and temporary files
	$(ECHO) Cleaning up...
	-@rm $(patsubst %.tex,%.aux,$(SOURCE_DOCUMENT)) 2> /dev/null
	-@rm $(patsubst %.tex,%.bbl,$(SOURCE_DOCUMENT)) 2> /dev/null
	-@rm $(patsubst %.tex,%.blg,$(SOURCE_DOCUMENT)) 2> /dev/null
	-@rm $(patsubst %.tex,%.fdb_latexmk,$(SOURCE_DOCUMENT)) 2> /dev/null
	-@rm $(patsubst %.tex,%.fls,$(SOURCE_DOCUMENT)) 2> /dev/null
	-@rm $(patsubst %.tex,%.log,$(SOURCE_DOCUMENT)) 2> /dev/null
	-@rm $(patsubst %.tex,%.out,$(SOURCE_DOCUMENT)) 2> /dev/null
	-@rm $(patsubst %.tex,%.ilg,$(SOURCE_DOCUMENT)) 2> /dev/null
	-@rm $(patsubst %.tex,%.toc,$(SOURCE_DOCUMENT)) 2> /dev/null
	-@rm $(PDF_DOCUMENT)
	-@rm $(DVI_DOCUMENT)
	-@rm $(HTML_DOCUMENT)
	-@rm $(MAN_DOCUMENT)
	#-@rm $(FIGURES) 2> /dev/null
	-@rm $(PYTHONTEX_FILE)
	-@rm -rf pythontex-files-main/
	-@rm -rf $(DEPS_DIR)

revealjs: $(SOURCE_DOCUMENT) ## Create a revealjs presentation
	$(ECHO) Creating revealjs presentation...
	$(PANDOC) --mathjax -s -f latex -t revealjs $(SOURCE_DOCUMENT)

man: $(SOURCE_DOCUMENT) ## Create a man document
	$(ECHO) Creating man pages...
	$(PANDOC) -s -f latex -t man $(SOURCE_DOCUMENT) -o $(MAN_DOCUMENT)

html: $(SOURCE_DOCUMENT) ## Create an html5 document
	$(ECHO) Compiling html document...
	$(PANDOC) --mathjax -s -f latex -t html5 $(SOURCE_DOCUMENT) -o $(HTML_DOCUMENT)

todo: $(INCLUDES_DEP) ## Print the todos from the main document
	$(ECHO) Parsing \\TODO{} in $(SOURCE_DOCUMENT)
	@sed -n "/\\TODO{/,/}/\
	{\
		s/.TODO/===/; \
		s/[{]//g; \
		s/[}]/===/g; \
		p\
	}" $(SOURCE_DOCUMENT) $(INCLUDES)

test: ## See some make variables for debugging
	$(ECHO) DEPENDENCIES
	$(ECHO) ============
	$(ECHO) $(DEPENDENCIES) | tr " " "\n"
	@echo $(MAKEFILE_LIST)

purge: clean
	$(ECHO) Purging files across directories... be careful
	@echo "$(PURGE_SUFFIXES)" \
	| tr "%" "*" \
	| xargs -n1  find . -name \
	| while read i; do echo $$i ; rm $$i; done


help: ## Prints help for targets with comments
	@awk 'BEGIN {FS = ":.*?## "}; /^[a-zA-Z_-]+:.*?## .*$$/{printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' Makefile


# vim: nospell fdm=marker
