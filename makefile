# this is a comment

TARGET=problem statement
HTML=main_html

default: pdf 

both: pdf html

dvi: ${TARGET}.tex 
#	run latex twice to get references correct
	latex ${TARGET}.tex
#	bibtex $(TARGET)
	latex $(TARGET).tex
	latex $(TARGET).tex

ps: dvi
	dvips -R -Poutline -t letter ${TARGET}.dvi -o ${TARGET}.ps

pdf: ps
	ps2pdf ${TARGET}.ps

tar:
	tar -csjf ${TARGET}.tar.bz2 ${TARGET}.tex makefile 

clean-dvi:
	rm -f ${TARGET}.aux
	rm -f ${TARGET}.log
	rm -f ${TARGET}.dvi
	rm -f ${TARGET}.out

clean-ps: clean-dvi
	rm -f ${TARGET}.ps

clean-pdf: clean-ps
	rm -f ${TARGET}.pdf

clean: clean-pdf
	rm -f ${TARGET}.blg
	rm -f ${TARGET}.bbl

