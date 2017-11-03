DIST := dist
PWD := $(shell pwd)

# Runs pdflatex + bibtex + 2 x pdflatex to generate the final file
all:
	@find . -type f -name "*.tex" -exec echo {} \; | sed -e s/tex/pdf/ | xargs -P 4 -L 1 make
	@find . -type f -name "*.tex" -exec echo {} \; | sed -e s/tex/bbl/ | xargs -P 4 -L 1 make
	@find . -type f -name "*.pdf" -delete
	@find . -type f -name "*.tex" -exec echo {} \; | sed -e s/tex/pdf/ | xargs -P 4 -L 1 make
	@find . -type f -name "*.pdf" -delete
	@find . -type f -name "*.tex" -exec echo {} \; | sed -e s/tex/pdf/ | xargs -P 4 -L 1 make
	@mkdir -p $(DIST)
	@find . -type f -name "*.pdf" -exec mv {} $(DIST) \;

%.pdf: %.tex
	@cd $(dir $@) && pdflatex -interaction=nonstopmode -halt-on-error $(notdir $^) && cd $(PWD)

%.bbl: %.aux
	@cd $(dir $@) && bibtex $(notdir $^) && cd $(PWD)

clean:
	@find . -type f \( -name "*.pdf" \
		-or -name "*.aux" -or -name "*.bbl" -or -name "*.blg" \
		-or -name "*.log" -or -name "*.nav" -or -name "*.out" \
		-or -name "*.snm" -or -name "*.toc" -or -name "*.vrb" \) \
		-delete
	@rm -r $(DIST)

.PHONY: all clean
