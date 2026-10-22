NAME    := madler_resume
LATEXMK := latexmk -pdf -interaction=nonstopmode -halt-on-error

.PHONY: all watch view clean distclean

all: $(NAME).pdf

$(NAME).pdf: $(NAME).tex
	$(LATEXMK) $<

# Rebuild automatically whenever the .tex changes
watch:
	$(LATEXMK) -pvc $(NAME).tex

view: $(NAME).pdf
	xdg-open $< >/dev/null 2>&1 &

# Remove build byproducts, keep the PDF
clean:
	latexmk -c
	rm -f $(NAME).out

# Remove everything, including the PDF
distclean: clean
	latexmk -C
