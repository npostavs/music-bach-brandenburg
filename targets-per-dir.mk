notparts := $(addprefix $(dir)/,score.ly notes.ly definitions.ly)
parts := $(filter-out $(notparts),$(wildcard $(dir)/*.ly))

$(foreach part,$(parts) $(dir)/score.ly,$(eval $(basename $(part)).pdf : $(part) $(dir)/notes.ly))

$(eval $(dir)/all : $(addsuffix .pdf,$(basename $(parts) $(dir)/score.ly)))
.PHONY: $(dir)/all
