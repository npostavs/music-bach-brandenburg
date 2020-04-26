paper-size ?= $(shell cat /etc/papersize)

LYFLAGS := -dpaper-size=\"$(paper-size)\"
LYFLAGS += -dno-point-and-click

.SUFFIXES:
.SUFFIXES: .ly .pdf

dirs := brandenburg1/movement-1 brandenburg1/movement-2 brandenburg2

define main
all : $(foreach dir,$(dirs),$(dir)/all)
endef

$(eval $(main))
$(foreach dir,$(dirs),$(eval include $(dir)/targets.mk))


%.pdf : %.ly
	lilypond $(LYFLAGS) --output=$* --include=$(dir $<) $<

clean :
	find $(dirs) \( -name '*.pdf' -o -name '*.midi' \) -delete
.PHONY : all clean
