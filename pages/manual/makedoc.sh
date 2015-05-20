echo > blank
cat \
	syntax.mdwn blank\
	basic_type.mdwn blank\
	structure.mdwn blank\
	variable.mdwn blank\
	module.mdwn blank\
	class.mdwn blank\
	method.mdwn blank\
	attribute.mdwn blank\
	constructor.mdwn blank\
	genericity.mdwn blank\
	virtual_type.mdwn\
	| sed -e '/\[\[!template/d' \
	-e 's/\[\[\([^|]*\)|\([^]]*\)\]\]/\1 \\goto{\2}/g' \
       	-e 's/\[\[\([^]]*\)\]\]/\1 \\goto{\1}/g' \
	> nitreference-main.md
pandoc nitreference-main.md -f markdown -t latex --listings -o nitreference-main.tex
pdflatex nitreference.tex
pandoc nitreference-main.md -f markdown -t epub -o nitreference.epub
