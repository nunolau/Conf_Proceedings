
function arabic2roman(x, y, z) {
 
   if (!x) {return "nulla"}
   if (x > 3999) {return "max input: 3999"}
 
   for (y=1; ar[y]; y++) {
      while (x >= ar[y]) {
          x -= ar[y]; 
          z = z ro[y]
      }
   }
 
   return z
 
}

BEGIN	{
           #arabic2roman init
           split("1000 900 500 400 100 90 50 40 10 9 5 4 1", ar)
           split("m cm d cd c xc l xl x ix v iv i", ro)

           FS=";"

           print "{\\LARGE \\bfseries Conference Program}"
           print "\\vspace{0.5cm}"
           print "\\phantomsection"
           print "\\addcontentsline{toc}{chapter}{Conference Program}"
           print ""
}

/./        { 
                if(NR>4) {
                           h_init = $3
                           h_end = $4
                           subid = $5
                           session = $6
                           authors = $7
                           title = $8
                           pag = $9

                           if( pag < 10 ) outfile = "00"  pag  ".pdf"
                           else if(pag < 100) outfile = "0"  pag  ".pdf"
                           else outfile = ""  pag  ".pdf"

                           if (subid=="day") { #day
                              print "\\vspace{0.5cm}"
                              print "\\rule{\\dimexpr\\textwidth-\\parindent}{1pt}"
                              print ""
                              print "\\vspace{0.2cm}"
                              print "{\\Large \\bfseries " h_init ", " h_end "}\\hspace{0.5cm}{\\normalsize Using Western European Summer Time (WEST), add 1 for Central Europe (CEST), etc.}" 
                              print ""
                              print "\\vspace{0.1cm}"
                              print "\\rule{\\dimexpr\\textwidth-\\parindent}{1pt}"
                              print ""
                              print "\\vspace{0.1cm}"
                              last = "d"
                           }
                           else if (subid!="") {  # pub
                              print "\\hspace{0.4cm}\\begin{tabular}{p{0.9cm}p{15.5cm}}"
                              print h_init " & \\textit{" title "} \\newline " authors  
                              print "\\end{tabular}"
                              print "\\vspace{0.05cm}"
                              print ""
                              last = "p"
                           }
                           else {  # session
                              if (last=="s") {
                                  print "\\vspace{-0.22cm}"
                              }
                              else {
                                  print "\\vspace{-0.05cm}"
                              }
                              print "\\rule{\\dimexpr\\textwidth-\\parindent}{0.5pt}"
                              print "\\vspace{-0.4cm}"
                              print ""
                              print "\\begin{tabular}{p{0.9cm}p{0.15cm}p{1.0cm}p{8.1cm}l}"
                              if (title=="") {
                                  if (authors=="") {
                                      print "{\\large \\bfseries " h_init "} & {\\large \\bfseries -} & {\\large \\bfseries " h_end "} & {\\large \\bfseries " session "} & \\null"
                                  }
                                  else {
                                      print "{\\large \\bfseries " h_init "} & {\\large \\bfseries -} & {\\large \\bfseries " h_end "} & {\\large \\bfseries " session "} & {\\large \\bfseries ["authors"]}"
                                  }
                              }
                              else {
                                  if (authors=="") {
                                      print "{\\large \\bfseries " h_init "} & {\\large \\bfseries -} & {\\large \\bfseries " h_end "} & {\\large \\bfseries " session "} \\newline {\\large " title "}\\vspace{0.15cm}"
                                  }
                                  else {
                                      #print "{\\large \\bfseries " h_init "} & {\\large \\bfseries -} & {\\large \\bfseries " h_end "} & {\\large \\bfseries " session "} \\newline {\\large " title "}\\vspace{0.15cm}"
                                      print "{\\large \\bfseries " h_init "} & {\\large \\bfseries -} & {\\large \\bfseries " h_end "} & {\\large \\bfseries " session "} & {\\large \\bfseries ["authors"]}\\\\"
                                      print "\\null & \\null & \\null & \\multicolumn{2}{l}{\\large " title "}\\vspace{-0.2cm}"
                                  }
                              }
                              print "\\end{tabular}"
                              print ""
                              print "\\vspace{0.05cm}"
                              last = "s"
                           }
               }
	        }

END 	    {
                              print "\\vspace{-0.22cm}"
                              print "\\rule{\\dimexpr\\textwidth-\\parindent}{0.5pt}"
	        }
