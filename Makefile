bin=./bin
src=./src
jsondir=./schedules
srcs=$(wildcard $(jsondir)/*.json)
bases=$(basename $(notdir $(srcs)))
# icss=$(addprefix $(bin)/, $(addsuffix .json, $(bases))) 
mds=$(addprefix $(bin)/, $(addsuffix .md, $(bases))) 

all: $(icss) $(mds)

# $(icss): $(bin)/%.ics: %.json ./template.json $(src)/makeSchedule.js
# 	node $(src)/makeSchedule.js ical $< > $@
#

$(bin): 
	mkdir -p bin

$(mds): $(bin)/%.md: $(bin) $(jsondir)/%.json ./template.json $(src)/makeSchedule.js
	node $(src)/makeSchedule.js md $< > $@

.PHONY: clean
clean: 
	rm -r $(bin)
