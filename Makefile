# make info {{{ #
################################################################
# $@  the name of the file to be made''
# $?  the set of dependent names that are younger than the target
# $<  the name of the related file that caused the action (the precursor to the target) - this is only for suffix rules
# $*  the shared prefix of the target and dependent - only for suffix rules
# $$  escapes macro substitution, returns a single $''.
################################################################
# }}} make info #
#  pandoc info {{{ # 
##################################################################
#json                (JSON version of native AST),
#plain               (plain text),
#markdown            (pandoc's extended markdown), mark-
#down_strict         (original  unextended  markdown),
#markdown_phpextra   (PHP Markdown extra extended markdown),
#markdown_github     (github extended  markdown),
#rst                 (reStructuredText),
#html                (XHTML 1),
#html5               (HTML 5),
#latex               (LaTeX),
#beamer              (LaTeX beamer slide show),
#context             (ConTeXt),
#man                 (groff  man),
#mediawiki           (MediaWiki markup),
#textile             (Textile),
#org                 (Emacs Org-Mode),
#texinfo             (GNU Texinfo),
#opml                (OPML),
#docbook             (DocBook),
#opendocument        (OpenDoc- ument),
#odt                 (OpenOffice text document),
#docx                (Word  docx),
#rtf                 (rich  text  format),
#epub                (EPUB v2 book),
#epub3               (EPUB v3),
#fb2                 (FictionBook2 e-book),
#asciidoc            (AsciiDoc),
#slidy               (Slidy  HTML and   javascript   slide  show),
#slideous            (Slideous  HTML  and javascript slide show),
#dzslides            (DZSlides  HTML5  +  javascript slide show),
#revealjs            (reveal.js HTML5 + javascript slide show),
#s5                  (S5 HTML and javascript slide show),
##################################################################
#  }}} pandoc info # 



# PARAMETERS, OVERRIDE THESE
SOURCE_DOCUMENT = main.tex
BIBTEX_FILE     =
FIGS_DIR        = images
PDF_VIEWER      = mupdf
PDFLATEX        = pdflatex
BIBTEX          = bibtex
PDF_DOCUMENT    = $(shell readlink -f $(patsubst %.tex,%.pdf,$(SOURCE_DOCUMENT)))
MAN_DOCUMENT    = $(patsubst %.tex,%.1,$(SOURCE_DOCUMENT))
HTML_DOCUMENT    = $(patsubst %.tex,%.html,$(SOURCE_DOCUMENT))

BUILD_DOCUMENT = $(PDF_DOCUMENT)

BIBITEM_FILE=$(patsubst %.bib,%.bbl,$(BIBTEX_FILE))

# for libs and such
IGNORE_FIGS = $(FIGS_DIR)/atoms.asy $(FIGS_DIR)/resources.asy

ASY_FILES         = $(filter-out $(IGNORE_FIGS),$(shell find $(FIGS_DIR) | grep .asy))
ASY_PDF_FILES     = $(patsubst %.asy,%.pdf,$(ASY_FILES))

GNUPLOT_FILES     = $(filter-out $(IGNORE_FIGS),$(shell find $(FIGS_DIR) | grep .gnuplot))
GNUPLOT_PDF_FILES = $(patsubst %.gnuplot,%.pdf,$(GNUPLOT_FILES))

TEX_FILES         = $(filter-out $(IGNORE_FIGS),$(shell find $(FIGS_DIR) | grep .tex))
TEX_PDF_FILES     = $(patsubst %.tex,%.pdf,$(TEX_FILES))

FIGS=$(TEX_PDF_FILES) $(ASY_PDF_FILES) $(GNUPLOT_PDF_FILES)

.PHONY: view-pdf open-pdf $(PDF_VIEWER) todo


all: $(BUILD_DOCUMENT) view-pdf

bibliography: $(BIBITEM_FILE)

$(BIBITEM_FILE): $(BIBTEX_FILE)
	@echo "Compiling the bibliography"
	-$(BIBTEX) $(patsubst %.bib,%,$(BIBTEX_FILE))

$(BUILD_DOCUMENT): $(SOURCE_DOCUMENT) $(FIGS) $(BIBITEM_FILE)
	@echo Creating $(BUILD_DOCUMENT)
	$(PDFLATEX) $<

#Open a viewer if there is none open viewing $(BUILD_DOCUMENT)
view-pdf: $(PDF_VIEWER)

open-pdf: ## Open pdf build document
	-@ps aux | grep -v grep \
	| grep "$(PDF_VIEWER)" \
	| grep -q "$(BUILD_DOCUMENT)" \
	||  $(PDF_VIEWER) "$(BUILD_DOCUMENT)" &

$(PDF_VIEWER): open-pdf

mupdf: ## Refresh mupdf
	-@ps aux | grep -v grep \
	| grep "$(PDF_VIEWER)" \
	| grep "$(BUILD_DOCUMENT)" \
	| awk '{print $$2}'\
	| xargs -n1 kill -s SIGHUP

%.pdf: %.asy
	@echo Compiling $<
	cd $(shell dirname $<) && asy -f pdf $(shell basename $< )

%.pdf: %.gnuplot
	@echo Compiling $<
	cd $(shell dirname $< ) && gnuplot $(shell basename $< )

%.pdf: %.tex
	@echo Compiling $<
	$(PDFLATEX) --output-directory $(shell dirname $< ) $<

clean: ## Remove build and temporary files
	-rm *.aux
	-rm *.bbl
	-rm *.blg
	-rm *.fdb_latexmk
	-rm *.fls
	-rm *.log
	-rm *.out
	-rm *.toc
	-rm $(PDF_DOCUMENT)
	-rm $(HTML_DOCUMENT)
	-rm $(MAN_DOCUMENT)

revealjs: $(SOURCE_DOCUMENT) ## Create a revealjs presentation
	pandoc --mathjax -s -f latex -t revealjs $(SOURCE_DOCUMENT)

man: $(SOURCE_DOCUMENT) ## Create a man document
	pandoc -s -f latex -t man $(SOURCE_DOCUMENT) -o $(MAN_DOCUMENT)

html: $(SOURCE_DOCUMENT) ## Create an html5 document
	pandoc --mathjax -s -f latex -t html5 $(SOURCE_DOCUMENT) -o $(HTML_DOCUMENT)

todo: ## Print the todos from the main document
	@sed -n "/\\TODO{/,/}/\
	{\
		s/.TODO/===/; \
		s/[{]//g; \
		s/[}]/===/g; \
		p\
	}" $(SOURCE_DOCUMENT)

test: ## See some make variables for debugging
	-@echo $(FIGS)

help: ## Prints help for targets with comments
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

# vim: nospell fdm=marker
