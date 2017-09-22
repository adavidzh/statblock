# ---------------------------------------------------------
# type "make" command in Unix to create the PDF file
# ---------------------------------------------------------


# ---------------------------------------------------------

all: quick

quick:
	lualatex --shell-escape statblock.dtx

package:
	latex statblock.ins

full:
	lualatex  statblock.dtx
	makeindex -s gind.ist -o statblock.ind statblock.idx
	makeindex -s gglo.ist -o statblock.gls statblock.glo
	lualatex  --shell-escape statblock.dtx
	lualatex  statblock.dtx

complete:
	make package
	make full

clean:
	(rm -rf *.1 *.mp *.t1 *.aux *.alg *.acn *.acr *.bbl *.bcf *.blg *.glg *.glo *.gls *.glsdefs *.ilg *.ist *.log *.lof *.lot *.out *.toc *.xdy *.run.xml *.code *.idx *.ind *.tmp)

veryclean:
	make clean
	rm -f *~ *.*%
	rm -f *.pdf
	rm -f *.sty
