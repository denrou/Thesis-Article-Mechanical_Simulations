reset 
set terminal postscript portrait enhanced color font 'Helvetica,18'  
set output 'fig3.eps'
set size 1.,1.
set size ratio .8

set tmargin 0
set bmargin 0
set lmargin 3
set rmargin 3
set style line 1 lc rgb 'blue' lt 1 lw 4 pt 7 ps 2.0   

set style line 2 lc rgb 'black' lt 1 lw 2 pt 12 ps 1.0   
set style line 3 lc rgb 'black' lt 1 lw 2 pt 6 ps 1.0   
set style line 4 lc rgb 'black' lt 1 lw 2 pt 4 ps 1.0   
set style line 5 lc rgb 'black' lt 1 lw 2 pt 8 ps 1.0   

set style line 22 lc rgb 'red' lt 1 lw 2 pt 12 ps 1.0   
set style line 23 lc rgb 'red' lt 1 lw 2 pt 6 ps 1.0   
set style line 24 lc rgb 'red' lt 1 lw 2 pt 4 ps 1.0   
set style line 25 lc rgb 'red' lt 1 lw 2 pt 8 ps 2.0

set style line 32 lc rgb 'black' lt 1 lw 2 pt 12 ps 1.0   
set style line 33 lc rgb 'black' lt 1 lw 2 pt 6 ps 1.0   
set style line 34 lc rgb 'black' lt 1 lw 2 pt 4 ps 1.0   
set style line 35 lc rgb 'black' lt 1 lw 2 pt 8 ps 1.0   

set style line 6 lc rgb 'red' lt 5 lw 4   
set style line 7 lc rgb '#006400' lt 2 lw 4   
set style line 8 lc rgb 'red' lt 3 lw 4

# 3,1 to draw 2 plots in 1 columne the 3th box is used for xtics
set multiplot layout 3,1 columnsfirst  title " \n"
#set key autotitle column nobox samplen 1

FILE1 = "tomo_effet_porosite_isotrope.txt"
FILE2 = "tomo_effet_porosite_anisotrope_parallele.txt"
FILE3 = "tomo_effet_porosite_anisotrope_transverse.txt"
FILE4 = "experiment_results_influence_porosity_isotrope.txt"
FILE5 = "experiment_results_influence_porosity_anisotrope_parallel.txt"
FILE6 = "experiment_results_influence_porosity_anisotrope_transverse.txt"
set xrange [40:70]

#unset title
set xlabel ''


#set nokey

set ylabel 'Strength (MPa)'
unset xtics
#first top plot
set style fill transparent solid 0.2 
set label 1 "Anisotropic //" at 57.5,18.5 rotate by -10 center front font ", 10"
set label 2 'Anisotropic {/Symbol \136}' enhanced at 57.5,3.5 rotate by -1 center front font ", 10"
set label 3 "Isotropic" at 51,14.5 rotate by -5 center front font ", 10"
plot  FILE4 u ($1*100):($3+$4):($3-$4) ls 3 with filledcurves notitle, \
      FILE5 u ($1*100):($3+$4):($3-$4) ls 4 with filledcurves notitle, \
      FILE6 u ($1*100):($3+$4):($3-$4) ls 5 with filledcurves notitle, \
      FILE1 u ($1*100):3:($2*100):4 w xyerrorbar  ls 3 title "Isotropic", \
      FILE1 u ($1*100):3 w l lt 0 lw 4 lc rgb "#0060ad" notitle, \
      FILE2 u ($1*100):3:($2*100):4 w xyerrorbar ls 2 title "Anisotropic //", \
      FILE2 u ($1*100):3 w l lt 0 lw 4 lc rgb '#dd181f' notitle, \
      FILE3 u ($1*100):3 w p ls 5 title 'Anisotropic {/Symbol \136}'
      
set label 1 at 57.5,3.9 rotate by -6
set label 2 at 57.5,1 rotate by -5
set label 3 at 51,3 rotate by -1
set xlabel 'Porosity {/Symbol e } (%)'
set ylabel 'Stiffness (GPa)'
set xtics nomirror
set yrange [0:18]
set ytics 0, 2, 16
plot  FILE4 u ($1*100):($5+$6):($5-$6) ls 3 with filledcurves notitle, \
      FILE5 u ($1*100):($5+$6):($5-$6) ls 4 with filledcurves notitle, \
      FILE6 u ($1*100):($5+$6):($5-$6) ls 5 with filledcurves title "Experimental", \
      FILE1 u ($1*100):5:($2*100):6 w xyerrorbar ls 3 notitle , \
      FILE1 u ($1*100):5 w l lt 0 lw 4 lc rgb '#0060ad' notitle, \
      FILE2 u ($1*100):5:($2*100):6 w xyerrorbar ls 2 notitle , \
      FILE2 u ($1*100):5 w l lt 0 lw 4 lc rgb '#dd181f' notitle, \
      FILE3 u ($1*100):5 w p ls 5 notitle

unset multiplot


set output
# Appel extérieur à epstopdf pour transformer le fichier eps en pdf.
!epstopdf --outfile=fig3.pdf fig3.eps
