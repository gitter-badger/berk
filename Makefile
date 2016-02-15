build:
	@mkdir -p 'target/build'
	@cd 'target/build'; \
	cmake ../..; \
	make

run: build
	@./target/berk

clean:
	@rm -r 'target'

.PHONY: build run clean
