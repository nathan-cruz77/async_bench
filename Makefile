total_memory = `free -h | head -n 2 | tail -n 1 | cut -f 11 -d' '`
total_cores = `lscpu | head -n 4 | tail -n 1 | cut -f15 -d' '`

# Versions
elixir_version = `elixir --version | tail -n 1`
node_version = `node --version`
python_version = `python3 --version`

all: sysinfo python elixir node

sysinfo:
	@echo "\n"
	@echo "*******************************************"
	@echo "|           System information            |"
	@echo "*******************************************"
	@echo "|                   |                     |"
	@echo "|      Memory       |        " $(total_memory) "      |"
	@echo "|                   |                     |"
	@echo "|-------------------+---------------------|"
	@echo "|                   |                     |"
	@echo "|      Threads      |          " $(total_cores) "        |"
	@echo "|                   |                     |"
	@echo "*******************************************"
	@echo "\n"

python:
	@echo "Testing python (" $(python_version) ")"
	python3 source/async.py
	@echo "\n"

elixir:
	@echo "Testing elixir (" $(elixir_version) ")"
	elixir source/async.exs
	@echo "\n"

node:
	@echo "Testing node (" $(node_version) ")"
	node source/async.js

plot:
	@gnuplot plotter.gp 2>/dev/null
