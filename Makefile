
Conf_Proceedings.pdf: Conf_Proceedings.tex Conf_Papers.tex Conf_Program.tex
	pdflatex Conf_Proceedings.tex
	pdflatex Conf_Proceedings.tex
	sed -i -es/\\\\IeC\ //g Conf_Proceedings.aux
	authorindex Conf_Proceedings
	pdflatex Conf_Proceedings.tex

Conf_Papers.tex: gen_conf_papers_tex.awk Conf_Papers.csv
	./gen_conf_papers_tex.sh

Conf_Program.tex: gen_conf_program_tex.awk Conf_Program.csv
	awk -f gen_conf_program_tex.awk < Conf_Program.csv > Conf_Program.tex

clean:
	rm -f Conf_Proceedings.pdf
	rm -f Conf_Papers.tex
	rm -f *.toc
	rm -f *.ain
	rm -f *.aux *.log *.out

