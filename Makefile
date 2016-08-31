

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
BIBTEX_FILE     = main.bib
FIGS_DIR        = images
PDF_VIEWER      = mupdf
PDFLATEX        = pdflatex
BIBTEX          = bibtex

BUILD_DOCUMENT = $(patsubst %.tex,%.pdf,$(SOURCE_DOCUMENT))

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

.PHONY: view-pdf $(PDF_VIEWER)


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
mupdf:
	-@ps aux | grep -v grep \
	| grep "$(PDF_VIEWER)" \
	| grep -q "$(BUILD_DOCUMENT)" \
	||  $(PDF_VIEWER) "$(BUILD_DOCUMENT)" &
	-@ps aux | grep -v grep \
	| grep "$(PDF_VIEWER)" \
	| grep "$(BUILD_DOCUMENT)" \
	| awk '{print $$2}'\
	| xargs -n1 kill -s SIGHUP
evince:
	-@ps aux | grep -v grep \
	| grep "$(PDF_VIEWER)" \
	| grep -q "$(BUILD_DOCUMENT)" \
	||  $(PDF_VIEWER) "$(BUILD_DOCUMENT)" &

clean:
	-rm *.aux
	-rm *.bbl
	-rm *.blg
	-rm *.fdb_latexmk
	-rm *.fls
	-rm *.log
	-rm *.out
	-rm *.pdf
	-rm *.toc

%.pdf: %.asy
	@echo Compiling $<
	cd $(shell dirname $<) && asy -f pdf $(shell basename $< )

%.pdf: %.gnuplot
	@echo Compiling $<
	cd $(shell dirname $< ) && gnuplot $(shell basename $< )

%.pdf: %.tex
	@echo Compiling $<
	$(PDFLATEX) --output-directory $(shell dirname $< ) $<

js:
	pandoc --mathjax -s -f latex -t revealjs main.tex


test:
	-@echo $(FIGS)

# vim: nospell fdm=marker
#vim-run: make
