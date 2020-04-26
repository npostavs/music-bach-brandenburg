notparts := score.ly notes.ly
parts := $(filter-out $(notparts),$(wildcard $(dir)/*.ly))

$(foreach part,$(parts) $(dir)/score.ly,$(eval $(basename $(part)).pdf : $(part) $(dir)/notes.ly))

$(eval $(dir)/all : $(addsuffix .pdf,$(basename $(parts))))
.PHONY: $(dir)/all
