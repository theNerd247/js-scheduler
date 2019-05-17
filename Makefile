bin=./bin
srcs=$(wildcard sei*.json)
icss=$(srcs:.json=.ics)

.PHONY: clean

all: $(icss)

%.ics: %.json ./template.json ../src/parseSchedule.js
	node ../src/parseSchedule.js ical $< > $@
