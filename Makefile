all: stream res res/repetitions-with-omissions

stream:
	mkdir -p stream

res:
	mkdir -p res

stream/corpus: raw/corpus-normalized
	bin/private-only < $< | bin/special-to-space > $@
	
res/repetitions-with-omissions: stream/corpus
	bin/repetitions-with-omissions < $< > $@

clean:
	rm stream/*
	rm res/*
