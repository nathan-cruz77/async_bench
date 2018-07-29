set terminal svg

set ylabel 'Time (ms)'
set key top left
set grid

set style data histogram
set style histogram cluster gap 1

set style fill solid border rgb 'black'
set autoscale

set output 'plots/all.svg'
plot 'data/all.dat' using 2:xtic(1) title col, \
        '' using 3:xtic(1) title col, \
        '' using 4:xtic(1) title col, \
        '' using 5:xtic(1) title col, \
        '' using 6:xtic(1) title col


set output 'plots/elixir.svg'
plot '<grep -i "Language\|Elixir" data/all.dat' using 2:xtic(1) title col, \
        '' using 3:xtic(1) title col, \
        '' using 4:xtic(1) title col, \
        '' using 5:xtic(1) title col, \
        '' using 6:xtic(1) title col


set output 'plots/node.svg'
plot '<grep -i "Language\|Node" data/all.dat' using 2:xtic(1) title col, \
        '' using 3:xtic(1) title col, \
        '' using 4:xtic(1) title col, \
        '' using 5:xtic(1) title col, \
        '' using 6:xtic(1) title col


set output 'plots/python.svg'
plot '<grep -i "Language\|Python" data/all.dat' using 2:xtic(1) title col, \
        '' using 3:xtic(1) title col, \
        '' using 4:xtic(1) title col, \
        '' using 5:xtic(1) title col, \
        '' using 6:xtic(1) title col
