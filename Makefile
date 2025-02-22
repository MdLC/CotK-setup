ROOM_LAYERS := 0,1,2,3,4,5,6,7,8,9
FINAL_NO_WIRES_LAYERS := $(ROOM_LAYERS),10,11,12,13,14,15,16
CHAIRS_CENTER_LAYERS := $(ROOM_LAYERS),10,11,13

OUTPUTS := chairs/chairs-center.svg \
		   chairs/chairs-final.svg \
		   chairs/chairs-sides-back.svg \
		   chairs/chairs-sides-remaining.svg

.PHONY: all
all: $(OUTPUTS)

.PHONY: clean
clean:
	rm -f $(OUTPUTS)

chairs/chairs-center.svg: templates/setup-template.drawio.svg
	draw.io --export --layers $(CHAIRS_CENTER_LAYERS),17 --output $@ $<

chairs/chairs-final.svg: templates/setup-template.drawio.svg
	draw.io --export --layers $(FINAL_NO_WIRES_LAYERS) --output $@ $<

chairs/chairs-sides-back.svg: templates/setup-template.drawio.svg
	draw.io --export --layers $(CHAIRS_CENTER_LAYERS),14,18 --output $@ $<

chairs/chairs-sides-remaining.svg: templates/setup-template.drawio.svg
	draw.io --export --layers $(CHAIRS_CENTER_LAYERS),14,15,19 --output $@ $<