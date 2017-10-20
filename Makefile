PWD := $(shell pwd)

%.prez:
	@make $(basename $@).pdf && make $(basename $@).bbl
	@rm $(basename $@).pdf && make $(basename $@).pdf
	@rm $(basename $@).pdf && make $(basename $@).pdf

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

.PHONY: %.prez clean
