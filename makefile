all:
	latexmk -gg --pdf talk.tex 

clean:
	/usr/bin/latexmk -c -f talk.tex 
