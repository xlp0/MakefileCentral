two := x x
three := x x x
four := x x x x
five := x x x xy x
six := x x x x x x
LIST := foo “bar baz” bam asdf a asdf dasf dgfsgfs gf
decode = $(words $1)
plus = $1 $2
increment = x $1
decrement = $(wordlist 2,$(words $1),$1)
double = $1 $1
identity = $1
TWENTY = 20
SOMESTRING="asdfSDFi asdKIHdfa fdafldaifdIOIONDSA"

PresentWorkingDir := $(shell pwd)
LIST_OF_DIR_LAYERS = $(subst /, ,$(PresentWorkingDir))
LAYER_COUNT = $(words $(LIST_OF_DIR_LAYERS))
CURRENT_DIR = $(word $(LAYER_COUNT),$(LIST_OF_DIR_LAYERS))

dir:
	@echo $(CURRENT_DIR)
	@echo convert to $(shell echo $(CURRENT_DIR) | tr A-Z a-z )
	./run ls -la
	./run $(word 5,$(LIST_OF_DIR_LAYERS)) $(word 3,$(LIST_OF_DIR_LAYERS))

second:
	@echo $(call decode,$(call plus,$(five),$(six)))
	@echo numerically: $(shell echo $$(( 15 + 8 ))) 			# Must have two parenthesis
	@echo numerically with expr: $(shell expr $(TWENTY) + $(TWENTY)) 	# the word TWENTY is set to a string '20' 
	@echo increment $(call decode,$(call increment,$(six)))
	@echo decrement $(call decode,$(call decrement,$(four)))
	@echo decrement with a List: $(call decode,$(call decrement,$(LIST)))
	@echo double: $(call decode,$(call double,$(LIST)))
	@echo identity: $(call decode,$(LIST))
	@echo USE tr to convert string: $(shell echo $(SOMESTRING) | tr A-Z a-z )
	@echo USE tr to convert string: $(shell echo $(SOMESTRING) | tr a-z A-Z )


