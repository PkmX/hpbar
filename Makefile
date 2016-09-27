VERSION := 10
REL_PK3_NAME := hpbar-v$(VERSION).pk3
DEV_PK3_NAME := hpbar-dev.pk3

ACCFLAGS +=

.PHONY: all clean

all: $(DEV_PK3_NAME)

release: $(REL_PK3_NAME)

$(REL_PK3_NAME) $(DEV_PK3_NAME): CVARINFO LOADACS README.md acs/hpbar.o DECORATE graphics/HPBAR.png graphics/FILLCRIT.png graphics/FILLNORM.png graphics/FILLDAMG.png
	zip $@ $^

acs:
	mkdir acs

acs/%.o: %.acs | acs
	acc $(ACCFLAGS) $< $@

clean:
	rm -f $(DEV_PK3_NAME) acs/hpbar.o
	rmdir acs
