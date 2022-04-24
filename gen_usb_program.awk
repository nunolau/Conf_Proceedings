
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
           curday=1


           system(". ./config.txt; sed s/\\${conferencename}/\"${conferencename}\"/ usb_program_header.html | sed s/\\${acronym}/\"${acronym}\"/ | sed s/\\${city}/\"${city}\"/ | sed s/\\${monthday}/\"${monthday}\"/ | sed s/\\${country}/\"${country}\"/ | sed s/\\${isbn}/\"${isbn}\"/ | sed s/\\${catalognumber}/\"${catalognumber}\"/ | sed s/\\${year}/\"${year}\"/");

           print "<table width=\"1100\">"
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

                           if (subid=="day") {
                              print "<tr><td colspan=\"2\" valign=\"top\"><a id=\"day" curday "\" /a><div class=\"daytitle\">" h_init ", " h_end " " session "</div></td></tr>" 
                              curday=curday+1
                           }
                           else if (subid!="") {
                              print "<tr><td valign=\"top\"><span class=\"title\" name=\"schedule\" hour=\"" h_init "-" h_end "\" >" h_init "-" h_end "</span></td>"
                              print "<td valign=\"top\"><span class=\"title\">" title "</span>" 
                              print "<span class=\"author\">" authors "</span>"
                              print "<span class=\"pdflink\">Full text: <a href=\"files/" outfile "\">pdf</a></span></td></tr>" 
                           }
                           else { # session
                              print "<tr><td valign=\"top\"><div class=\"sessiontitle\" name=\"schedule\" hour=\"" h_init "-" h_end "\">" h_init "-" h_end "</div></td>"
                              if (authors=="") { # no chairs
                                  if (title=="") {
                                      print "<td valign=\"top\"><div class=\"sessiontitle\"> " session " </div></td></tr>" 
                                  }
                                  else {
                                      print "<td valign=\"top\"><div class=\"sessiontitle\"> " session "<div>" title "</div> </div></td></tr>" 
                                  }
                              }
                              else {  # with chairs
                                  if (title=="") {
                                      print "<td valign=\"top\"><div class=\"sessiontitle\"> " session "<div> [" authors "] </div> </div></td></tr>" 
                                  }
                                  else {
                                      if (pag!="") {
                                         print "<td valign=\"top\"><div class=\"sessiontitle\"> " session "<div> <a href=\"files/" outfile "\" >" title "</a></div> <div> [" authors "] </div> </div></td></tr>" 
                                      }
                                      else {
                                         print "<td valign=\"top\"><div class=\"sessiontitle\"> " session "<div>" title "</div> <div> [" authors "] </div> </div></td></tr>" 
                                      }
                                  }
                              }
                           }
               }
	        }

END 	    {
               print "</table>"
               system(". ./config.txt; sed s/\\${conferencename}/\"${conferencename}\"/ usb_footer.html | sed s/\\${acronym}/\"${acronym}\"/ | sed s/\\${city}/\"${city}\"/ | sed s/\\${monthday}/\"${monthday}\"/ | sed s/\\${country}/\"${country}\"/ | sed s/\\${isbn}/\"${isbn}\"/ | sed s/\\${catalognumber}/\"${catalognumber}\"/ | sed s/\\${year}/\"${year}\"/");
	        }
