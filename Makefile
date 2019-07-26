bin=./bin
src=./src
srcs=$(wildcard sei*.json)
icss=$(addprefix $(bin)/, $(srcs:.json=.ics))
mds=$(addprefix $(bin)/, $(srcs:.json=.md))

all: $(icss) $(mds)

$(icss): $(bin)/%.ics: %.json ./template.json $(src)/makeSchedule.js
	node $(src)/makeSchedule.js ical $< > $@

$(mds): $(bin)/%.md: %.json ./template.json $(src)/makeSchedule.js
	node $(src)/makeSchedule.js md $< > $@

.PHONY: clean
clean: 
	rm $(icss)
