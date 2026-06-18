# Output as PDF for publication quality
set terminal pdfcairo enhanced font "Times-Roman,10" size 6,3

# ---- Plot (a): Total Prize ----
set output "total_prize.pdf"

set style data histograms
set style histogram errorbars gap 1 lw 1
set style fill pattern border -1
set boxwidth 0.8

set xlabel "Budget (miles)" font "Times-Roman,11"
set ylabel "Prize Collected" font "Times-Roman,11"
set xtics ("4000" 0, "6000" 1, "8000" 2, "10000" 3)
set yrange [0:3000]
set key top left font "Times-Roman,9"
set grid ytics lt 0 lw 0.5

plot 'prize.dat' using 2:3:xtic(1) title "Q-Learning" fs pattern 1, \
     ''          using 4:5        title "P-MARL"      fs pattern 4

# ---- Plot (b): Total Distance ----
set output "total_distance.pdf"

set ylabel "Distance (miles)" font "Times-Roman,11"
set yrange [0:12000]

plot 'distance.dat' using 2:3:xtic(1) title "Q-Learning" fs pattern 1, \
     ''             using 4:5         title "P-MARL"      fs pattern 4
