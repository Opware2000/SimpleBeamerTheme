.PHONY: clean withversion run

INPUT=slides.md
OUTPUT=presentation.pdf
OUTPUTTEX=slides.tex
DEP=$(wildcard *.sty *.jpg *.png)
THEME=simple

$(OUTPUT): $(INPUT) $(DEP)
	pandoc -s -t beamer \
		-V theme:$(THEME) \
		-V lang:fr-FR $(INPUT)\
		-V classoption:aspectratio=169,17pt \
		--slide-level 2  \
		--highlight-style kate \
		-o $(OUTPUT) \
		--pdf-engine=xelatex 
	open $(OUTPUT)

run: $(OUTPUT)
	open $(OUTPUT)

clean:
	rm -f $(OUTPUT)
	
tex:
	pandoc -s -t beamer \
		-V theme:$(THEME) \
		-V lang:fr-FR $(INPUT)\
		-V classoption:aspectratio=169,17pt \
		--slide-level 2  \
		--highlight-style kate \
		-o $(OUTPUTTEX) \
		--pdf-engine=xelatex
	open $(OUTPUTTEX)

