bin=./bin
src=./src
srcs=$(wildcard sei*.json)
icss=$(addprefix $(bin)/, $(srcs:.json=.ics))

all: $(icss)

$(icss): $(bin)/%.ics: %.json ./template.json $(src)/parseSchedule.js
	node $(src)/parseSchedule.js ical $< > $@

.PHONY: clean
clean: 
	rm $(icss)
