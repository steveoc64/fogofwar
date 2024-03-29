all: sassgen templegen app-assets appjs sv run
	echo all done

build: sassgen templegen app-assets appjs sv 

get: 
	go get -u honnef.co/go/simple/cmd/gosimple
	go get -u github.com/gopherjs/gopherjs
	go get -u github.com/gopherjs/websocket
	go get -u github.com/go-humble/temple
	go get -u github.com/go-humble/form
	go get -u github.com/go-humble/router
	go get -u github.com/steveoc64/formulate
	go get -u github.com/steveoc64/godev/echocors
	go get -u github.com/steveoc64/godev/sms
	go get -u github.com/steveoc64/godev/smt
	go get -u github.com/steveoc64/godev/db
	go get -u github.com/steveoc64/godev/config
	go get -u honnef.co/go/simple/cmd/gosimple
	go get -u github.com/labstack/echo
	go get -u github.com/labstack/echo/middleware
	go get -u github.com/labstack/echo/engine/standard
	go get -u github.com/lib/pq
	go get -u gopkg.in/mgutz/dat.v1/sqlx-runner
	go get -u github.com/nfnt/resize
	go get -u gopkg.in/gomail.v2
	go get -u github.com/logpacker/PayPal-Go-SDK
	mkdir -p scripts
	mkdir -p backup

help: 
	# sassgen    - make SASS files
	# templegen  - make Templates
	# app-assets - make Asset copy to dist	
	# appjs      - make Frontend app
	# sv         - make Server
	# run        - run  Server

clean:	
	# Delete existing build
	@mplayer -quiet audio/trash-empty.oga 2> /dev/null > /dev/null &
	rm -rf dist

sassgen: dist/public/css/app.css

dist/public/css/app.css: scss/*
	@mplayer -quiet audio/attention.oga 2> /dev/null > /dev/null
	@mkdir -p dist/public/css
	cd scss && node-sass --output-style compressed app.sass ../dist/public/css/app.css
	cd scss && node-sass app.sass ../dist/public/css/app.debug.css

templegen: app/template.go 

app/template.go: templates/*.tmpl 	
	@mplayer -quiet audio/attention.oga 2> /dev/null > /dev/null
	temple build templates app/template.go --package main

app-assets: dist/assets.log dist/config.json

dist/config.json: server/config.json
	cp server/config.json dist	

cert:
	mkdir -p cert
	openssl genrsa -out cert/actionfront.key 2048
	openssl req -new -x509 -key cert/actionfront.key -out cert/actionfront.pem -days 3650

dist/assets.log: assets/*.html assets/img/*  assets/fonts/* assets/css/* assets/manual/* assets/*.webmanifest
	@mplayer -quiet audio/attention.oga 2> /dev/null > /dev/null
	@mkdir -p dist/public/css dist/public/font dist/public/js
	cp assets/*.html dist/public
	cp assets/*.webmanifest dist/public
	cp -R assets/img dist/public
	cp -R assets/css dist/public
	cp -R assets/fonts dist/public
	cp -R assets/js dist/public
	cp -R assets/manual dist/public
	#cp bower_components/normalize.css/normalize.css dist/public/css
	@date > dist/assets.log

appjs: dist/public/app.js

dist/public/app.js: app/*.go shared/*.go 
	@mplayer -quiet audio/frontend-compile.ogg 2> /dev/null > /dev/null &
	@mkdir -p dist/public/js
	cd app && gosimple
	@echo -n Before :
	@ls -l dist/public/app.js
	GOOS=linux gopherjs build app/*.go -o dist/public/app.js -m
	@ls -l dist/public/app.js

remake: 
	@mplayer -quiet audio/server-compile.oga 2> /dev/null > /dev/null &
	rm -f dist/actionfront-server
	@gosimple server
	go build -o dist/actionfront-server server/*.go
	@ls -l dist/actionfront-server

sv: dist/actionfront-server 

dist/actionfront-server: server/*.go shared/*.go
	@mplayer -quiet audio/server-compile.oga 2> /dev/null > /dev/null &
	cd server && gosimple
	go build -o dist/actionfront-server server/*.go
	@ls -l dist/actionfront-server
	cp cert/actionfront.key cert/actionfront.pem dist

run: 
	./terminate
	@mplayer -quiet audio/running.oga 2> /dev/null > /dev/null &
	@cd dist && ./actionfront-server

testsvr: sv
	./terminate-test
	cp -Rv dist/* ~/actionfront/test
	rm ~/actionfront/test/config.json
	cp server/config.json.test ~/actonfront/test/config.json
	cd ~/actionfront/test && mv actionfront-server actionfront-test-server &&  nohup ./actionfront-test-server &

install: sv
	./terminate
	cp -Rv dist/* ~/actionfront/current
	cd ~/actionfront/current && nohup ./actionfront-server &
	tail -f -n 200 ~/logs/actionfront/* ~/actionfront/current/nohup.out

tail:
	tail -f -n 200 ~/logs/actionfront/* ~/actionfront/current/nohup.out

data:
	pg_dump actionfront > database/actionfront.sql
	pg_dump actionfront -a -t scenario > database/data/scenario.sql
	pg_dump actionfront -a -t force > database/data/force.sql
	pg_dump actionfront -a -t force_unit > database/data/force_unit.sql
	pg_dump actionfront -a -t game > database/data/game.sql
	pg_dump actionfront -a -t game_players > database/data/game_players.sql
	pg_dump actionfront -a -t game_cmd > database/data/game_cmd.sql
	pg_dump actionfront -a -t game_cmd_order > database/data/game_cmd_order.sql
	pg_dump actionfront -a -t game_objective > database/data/game_objective.sql
	pg_dump actionfront -a -t unit > database/data/unit.sql
	pg_dump actionfront -a -t tiles > database/data/tiles.sql
	pg_dump actionfront -a -t users > database/data/users.sql
	pg_dump actionfront -a -t stdimg > database/data/stdimg.sql
	pg_dump actionfront -a -t cmd_level > database/data/cmd_level.sql
	pg_dump actionfront -a -t cmd_rating > database/data/cmd_rating.sql
	pg_dump actionfront -a -t inspiration > database/data/inspiration.sql
	pg_dump actionfront -a -t condition > database/data/condition.sql
	pg_dump actionfront -a -t gt_formation > database/data/gt_formation.sql
	pg_dump actionfront -a -t utype > database/data/utype.sql
	pg_dump actionfront -a -t rating > database/data/rating.sql
	pg_dump actionfront -a -t drill > database/data/drill.sql
	pg_dump actionfront -a -t small_arms > database/data/small_arms.sql
	pg_dump actionfront -a -t gunnery > database/data/gunnery.sql
	pg_dump actionfront -a -t cav_type > database/data/cav_type.sql
	pg_dump actionfront -a -t cmd_action > database/data/cmd_action.sql
	pg_dump actionfront -a -t orders > database/data/orders.sql
	pg_dump actionfront -a -t migration > database/data/migration.sql
	ls -l database/data
