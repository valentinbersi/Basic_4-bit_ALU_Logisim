LOGISIM := logisim-evolution
CIRCUIT := --toplevel-circuit "checker"
FLAGS := -tty

.PHONY = test cmptest clean

test: out.txt expected-output.txt
	diff -q -s $^

cmptest: out.txt expected-output.txt
	diff -s $^

out.txt: ALU.circ
	$(LOGISIM) $(CIRCUIT) $(FLAGS) table $< > $@

clean:
	rm out.txt