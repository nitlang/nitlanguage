echo > blank
cat \
	syntax.md blank\
	basic_type.md blank\
	structure.md blank\
	variable.md blank\
	module.md blank\
	class.md blank\
	method.md blank\
	attribute.md blank\
	constructor.md blank\
	genericity.md blank\
	virtual_type.md\
	| sed -e '/\[\[!template/d' \
	-e 's/\[\[\([^|]*\)|\([^]]*\)\]\]/\1 \\goto{\2}/g' \
       	-e 's/\[\[\([^]]*\)\]\]/\1 \\goto{\1}/g' \
	> nitreference-main.md
pandoc nitreference-main.md -f markdown -t latex --listings -o nitreference-main.tex
pdflatex nitreference.tex
pandoc nitreference-main.md -f markdown -t epub -o nitreference.epub
