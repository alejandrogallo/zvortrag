
# PARAMETERS, OVERRIDE THESE
SOURCE_DOCUMENT = main.tex
BIBTEX_FILE     = main.bib
FIGS_DIR        = images
PDF_VIEWER      = mupdf
LATEX           = pdflatex
PDFLATEX        = pdflatex
ASYMPTOTE       = asy
SH              = bash
PY              = python
GNUPLOT         = gnuplot
pandoc          = pandoc
BIBTEX          = bibtex
# Do you use pythontex?
WITH_PYTHONTEX  = 0
PYTHONTEX       = pythontex
DEPENDENCIES    =
AUTO_FIG_DEPS   = 1


PDF_DOCUMENT   = $(shell readlink -f $(patsubst %.tex,%.pdf,$(SOURCE_DOCUMENT)))
DVI_DOCUMENT   = $(shell readlink -f $(patsubst %.tex,%.dvi,$(SOURCE_DOCUMENT)))
MAN_DOCUMENT   = $(patsubst %.tex,%.1,$(SOURCE_DOCUMENT))
HTML_DOCUMENT  = $(patsubst %.tex,%.html,$(SOURCE_DOCUMENT))
TOC_FILE       = $(patsubst %.tex,%.toc,$(SOURCE_DOCUMENT))
BIBITEM_FILE   = $(patsubst %.bib,%.bbl,$(BIBTEX_FILE))
PYTHONTEX_FILE = $(patsubst %.tex,%.pytxcode,$(SOURCE_DOCUMENT))
BUILD_DOCUMENT = $(PDF_DOCUMENT)
FIGS_SUFFIXES  = %.pdf %.eps %.png %.jpg %.jpeg %.gif %.dvi %.bmp %.svg %.ps


ifneq ($(AUTO_FIG_DEPS),1)
# for libs and such
	IGNORE_FIGS       = $(FIGS_DIR)/atoms.asy $(FIGS_DIR)/resources.asy
	ASY_FILES         = $(filter-out $(IGNORE_FIGS),$(shell find $(FIGS_DIR) | grep .asy))
	ASY_PDF_FILES     = $(patsubst %.asy,%.pdf,$(ASY_FILES))
	GNUPLOT_FILES     = $(filter-out $(IGNORE_FIGS),$(shell find $(FIGS_DIR) | grep .gnuplot))
	GNUPLOT_PDF_FILES = $(patsubst %.gnuplot,%.pdf,$(GNUPLOT_FILES))
	TEX_FILES         = $(filter-out $(IGNORE_FIGS),$(shell find $(FIGS_DIR) | grep .tex))
	TEX_PDF_FILES     = $(patsubst %.tex,%.pdf,$(TEX_FILES))
	FIGS=$(TEX_PDF_FILES) $(ASY_PDF_FILES) $(GNUPLOT_PDF_FILES)
else
	include deps/figures.d
endif

.PHONY: view-pdf open-pdf $(PDF_VIEWER) todo help test force

# Main dependencies for BUILD_DOCUMENT
DEPENDENCIES += $(SOURCE_DOCUMENT) $(FIGS) $(TOC_FILE)

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
	@echo "Compiling the bibliography"
	-$(BIBTEX) $(patsubst %.bib,%,$(BIBTEX_FILE))
	@echo Compiling again $(BUILD_DOCUMENT) to update refs
	$(MAKE) force

%.pytxcode: %.tex
	@echo "Compiling latex for pythontex"
	$(LATEX) $<
	@echo "Creating pythontex"
	$(PYTHONTEX) $<

#Open a viewer if there is none open viewing $(BUILD_DOCUMENT)
view-pdf: $(PDF_VIEWER) open-pdf ## Refresh and open pdf

open-pdf: ## Open pdf build document
	-@ps aux | grep -v grep \
	| grep "$(PDF_VIEWER)" \
	| grep -q "$(BUILD_DOCUMENT)" \
	||  $(PDF_VIEWER) "$(BUILD_DOCUMENT)" &

mupdf: ## Refresh mupdf
	-@ps aux \
	| grep -v grep \
	| grep "$(PDF_VIEWER)" \
	| grep "$(BUILD_DOCUMENT)" \
	| awk '{print $$2}'\
	| xargs -n1 kill -s SIGHUP

$(FIGS_SUFFIXES): %.asy
	@echo Compiling $<
	cd $(dir $<) && $(ASYMPTOTE) -f $(shell echo $(suffix $@) | tr -d "\.") $(notdir $< )

$(FIGS_SUFFIXES): %.gnuplot
	@echo Compiling $<
	cd $(dir $< ) && $(GNUPLOT) $(notdir $< )

$(FIGS_SUFFIXES): %.sh
	@echo Running $< to create $@
	cd $(dir $< ) && $(SH) $(notdir $< )

$(FIGS_SUFFIXES): %.py
	@echo Running $< to create $@
	cd $(dir $< ) && $(PY) $(notdir $< )

$(FIGS_SUFFIXES) %.toc: %.tex
	@echo Creating $@ from $<
	$(PDFLATEX) --output-directory $(dir $< ) $<

deps/figures.d: $(SOURCE_DOCUMENT)
	@echo Hello World
	mkdir -p $(dir $@)
	@echo FIGS = \\ > $@
	grep '\includegraphic.' $<  | sed 's/.*{\(.*\)}.*/\1 \\/' >> $@

clean: ## Remove build and temporary files
	-@rm -rf deps
	-@rm *.aux
	-@rm *.bbl
	-@rm *.blg
	-@rm *.fdb_latexmk
	-@rm *.fls
	-@rm *.log
	-@rm *.out
	-@rm *.toc
	-@rm $(PDF_DOCUMENT)
	-@rm $(DVI_DOCUMENT)
	-@rm $(HTML_DOCUMENT)
	-@rm $(MAN_DOCUMENT)
	-@rm $(patsubst %.tex,%.pdf,$(TEX_FILES)) 2> /dev/null
	-@rm $(patsubst %.tex,%.aux,$(TEX_FILES)) 2> /dev/null
	-@rm $(patsubst %.tex,%.bbl,$(TEX_FILES)) 2> /dev/null
	-@rm $(patsubst %.tex,%.blg,$(TEX_FILES)) 2> /dev/null
	-@rm $(patsubst %.tex,%.fdb_latexmk,$(TEX_FILES)) 2> /dev/null
	-@rm $(patsubst %.tex,%.fls,$(TEX_FILES)) 2> /dev/null
	-@rm $(patsubst %.tex,%.log,$(TEX_FILES)) 2> /dev/null
	-@rm $(patsubst %.tex,%.out,$(TEX_FILES)) 2> /dev/null
	-@rm $(patsubst %.tex,%.toc,$(TEX_FILES)) 2> /dev/null
	#-@rm $(FIGS) 2> /dev/null
	-@rm $(PYTHONTEX_FILE)
	-@rm -rf pythontex-files-main/

revealjs: $(SOURCE_DOCUMENT) ## Create a revealjs presentation
	$(PANDOC) --mathjax -s -f latex -t revealjs $(SOURCE_DOCUMENT)

man: $(SOURCE_DOCUMENT) ## Create a man document
	$(PANDOC) -s -f latex -t man $(SOURCE_DOCUMENT) -o $(MAN_DOCUMENT)

html: $(SOURCE_DOCUMENT) ## Create an html5 document
	$(PANDOC) --mathjax -s -f latex -t html5 $(SOURCE_DOCUMENT) -o $(HTML_DOCUMENT)

todo: ## Print the todos from the main document
	@sed -n "/\\TODO{/,/}/\
	{\
		s/.TODO/===/; \
		s/[{]//g; \
		s/[}]/===/g; \
		p\
	}" $(SOURCE_DOCUMENT)

test: ## See some make variables for debugging
	@echo DEPENDENCIES
	@echo ============
	@echo $(DEPENDENCIES) | tr " " "\n"

help: ## Prints help for targets with comments
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

# vim: nospell fdm=marker
