all: index.html main.css

index.html: _source/index.jade
	jade _source --out ./

main.css: _source/main.styl
	stylus -c _source --out ./
