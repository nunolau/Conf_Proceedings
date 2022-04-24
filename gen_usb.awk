
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

           proceedingspdf="Conf_Proceedings.pdf"
           #arabic2roman init
           split("1000 900 500 400 100 90 50 40 10 9 5 4 1", ar)
           split("m cm d cd c xc l xl x ix v iv i", ro)

           FS=";"


           #system("cp CONF_*.png CONF_Online/images");
           system("cp " proceedingspdf " CONF_Online/files");
           system(". ./config.txt; sed s/\\${conferencename}/\"${conferencename}\"/ usb_header.html | sed s/\\${acronym}/\"${acronym}\"/ | sed s/\\${city}/\"${city}\"/ | sed s/\\${monthday}/\"${monthday}\"/ | sed s/\\${country}/\"${country}\"/ | sed s/\\${isbn}/\"${isbn}\"/ | sed s/\\${catalognumber}/\"${catalognumber}\"/ | sed s/\\${year}/\"${year}\"/");

           cur_pag=1

           print "<a id=\"frontmatter\"></a>"
           print "<div class=\"chapternumber\">Front Matter</div>"

           #cover
           npages = 1

	       pagi = cur_pag
           pagf = cur_pag + npages -1
           if( cur_pag < 10 ) outfile = "00"  cur_pag  ".pdf"
           else if(cur_pag < 100) outfile = "0"  cur_pag  ".pdf"
           else outfile = ""  cur_pag  ".pdf"
           pdftk_comm = "pdftk " proceedingspdf " cat " pagi "-" pagf " output CONF_Online/files/" outfile
           
           #print  pdftk_comm
           system(pdftk_comm);

           print "<span class=\"title\">Cover</span>" 
           print "<span class=\"pages\">pages " arabic2roman(pagi) "-" arabic2roman(pagf) "</span> <span class=\"pdflink\">Full text: <a href=\"files/" outfile "\">pdf</a></span>" 


           cur_pag=cur_pag+npages

           #title page
           npages = 1

	       pagi = cur_pag
           pagf = cur_pag + npages -1
           if( cur_pag < 10 ) outfile = "00"  cur_pag  ".pdf"
           else if(cur_pag < 100) outfile = "0"  cur_pag  ".pdf"
           else outfile = ""  cur_pag  ".pdf"
           pdftk_comm = "pdftk " proceedingspdf " cat " pagi "-" pagf " output CONF_Online/files/" outfile
           
           #print  pdftk_comm
           system(pdftk_comm);

           print "<span class=\"title\">Title page</span>" 
           print "<span class=\"pages\">pages " arabic2roman(pagi) "-" arabic2roman(pagf) "</span> <span class=\"pdflink\">Full text: <a href=\"files/" outfile "\">pdf</a></span>" 

           cur_pag=cur_pag+npages

           #copyright page
           npages = 1

	       pagi = cur_pag
           pagf = cur_pag + npages -1
           if( cur_pag < 10 ) outfile = "00"  cur_pag  ".pdf"
           else if(cur_pag < 100) outfile = "0"  cur_pag  ".pdf"
           else outfile = ""  cur_pag  ".pdf"
           pdftk_comm = "pdftk " proceedingspdf " cat " pagi "-" pagf " output CONF_Online/files/" outfile
           
           #print  pdftk_comm
           system(pdftk_comm);

           print "<span class=\"title\">Copyright page</span>" 
           print "<span class=\"pages\">pages " arabic2roman(pagi) "-" arabic2roman(pagf) "</span> <span class=\"pdflink\">Full text: <a href=\"files/" outfile "\">pdf</a></span>" 

           cur_pag=cur_pag+npages

           #welcome message
           npages = 1

	       pagi = cur_pag
           pagf = cur_pag + npages -1
           if( cur_pag < 10 ) outfile = "00"  cur_pag  ".pdf"
           else if(cur_pag < 100) outfile = "0"  cur_pag  ".pdf"
           else outfile = ""  cur_pag  ".pdf"
           pdftk_comm = "pdftk " proceedingspdf " cat " pagi "-" pagf " output CONF_Online/files/" outfile
           
           #print  pdftk_comm
           system(pdftk_comm);

           print "<span class=\"title\">Welcome Message</span>" 
           print "<span class=\"pages\">pages " arabic2roman(pagi) "-" arabic2roman(pagf) "</span> <span class=\"pdflink\">Full text: <a href=\"files/" outfile "\">pdf</a></span>" 

           cur_pag=cur_pag+npages

           #committees
           npages = 1

	       pagi = cur_pag
           pagf = cur_pag + npages -1
           if( cur_pag < 10 ) outfile = "00"  cur_pag  ".pdf"
           else if(cur_pag < 100) outfile = "0"  cur_pag  ".pdf"
           else outfile = ""  cur_pag  ".pdf"
           pdftk_comm = "pdftk " proceedingspdf " cat " pagi "-" pagf " output CONF_Online/files/" outfile
           
           #print  pdftk_comm
           system(pdftk_comm);

           print "<span class=\"title\">CONF'YYYY Committees</span>" 
           print "<span class=\"pages\">pages " arabic2roman(pagi) "-" arabic2roman(pagf) "</span> <span class=\"pdflink\">Full text: <a href=\"files/" outfile "\">pdf</a></span>" 

           cur_pag=cur_pag+npages

           #conference program
           npages = 3

	       pagi = cur_pag
           pagf = cur_pag + npages -1
           if( cur_pag < 10 ) outfile = "00"  cur_pag  ".pdf"
           else if(cur_pag < 100) outfile = "0"  cur_pag  ".pdf"
           else outfile = ""  cur_pag  ".pdf"
           pdftk_comm = "pdftk " proceedingspdf " cat " pagi "-" pagf " output CONF_Online/files/" outfile
           
           #print  pdftk_comm
           system(pdftk_comm);

           print "<span class=\"title\">Conference Program</span>" 
           print "<span class=\"pages\">pages " arabic2roman(pagi) "-" arabic2roman(pagf) "</span> <span class=\"pdflink\">Full text: <a href=\"files/" outfile "\">pdf</a></span>" 

           cur_pag=cur_pag+npages

           #table of contents
           npages = 1

	       pagi = cur_pag
           pagf = cur_pag + npages -1
           if( cur_pag < 10 ) outfile = "00"  cur_pag  ".pdf"
           else if(cur_pag < 100) outfile = "0"  cur_pag  ".pdf"
           else outfile = ""  cur_pag  ".pdf"
           pdftk_comm = "pdftk " proceedingspdf " cat " pagi "-" pagf " output CONF_Online/files/" outfile
           
           #print  pdftk_comm
           system(pdftk_comm);

           cur_pag=cur_pag+npages
           pagesfront = cur_pag-1

           print "<span class=\"title\">Table of Contents</span>" 
           print "<span class=\"pages\">pages " arabic2roman(pagi) "-" arabic2roman(pagf) "</span> <span class=\"pdflink\">Full text: <a href=\"files/" outfile "\">pdf</a></span>" 

           print "<a id=\"mainmatter\"></a>"
           print "<div class=\"chapternumber\">Main Matter</div>"

           #invited paper 1
           #npages = 1

	       #pagi = cur_pag
           #pagf = cur_pag + npages -1
           #if( cur_pag < 10 ) outfile = "00"  cur_pag  ".pdf"
           #else if(cur_pag < 100) outfile = "0"  cur_pag  ".pdf"
           #else outfile = ""  cur_pag  ".pdf"
           #pdftk_comm = "pdftk " proceedingspdf " cat " pagi "-" pagf " output CONF_Online/files/" outfile
           
           #print  pdftk_comm
           #system(pdftk_comm);

           #print "<span class=\"title\">TITLE</span>" 
           #print "<span class=\"author\">KEYNOTE</span>" 
           #print "<span class=\"pages\">pages " (pagi-pagesfront) "-" (pagf-pagesfront) "</span> <span class=\"pdflink\">Full text: <a href=\"files/" outfile "\">pdf</a></span>" 


           #cur_pag=cur_pag+npages

           #invited paper 2
           #npages = 1

	       #pagi = cur_pag
           #pagf = cur_pag + npages -1
           #if( cur_pag < 10 ) outfile = "00"  cur_pag  ".pdf"
           #else if(cur_pag < 100) outfile = "0"  cur_pag  ".pdf"
           #else outfile = ""  cur_pag  ".pdf"
           #pdftk_comm = "pdftk " proceedingspdf " cat " pagi "-" pagf " output CONF_Online/files/" outfile
           
           #print  pdftk_comm
           #system(pdftk_comm);

           #print "<span class=\"title\">TITLE</span>" 
           #print "<span class=\"author\">KEYNOTE</span>" 
           #print "<span class=\"pages\">pages " (pagi-pagesfront) "-" (pagf-pagesfront) "</span> <span class=\"pdflink\">Full text: <a href=\"files/" outfile "\">pdf</a></span>" 


           cur_pag=cur_pag+npages
	}
	
/./        { 
                    if(NR>1) {
                           subid = $1
                           title = $3
                           authors = $2
                           npages = $8
                           offsetx = $9
                           offsety = $10

			               pagi = cur_pag
                           pagf = cur_pag + npages -1

                           if( cur_pag < 10 ) outfile = "00"  cur_pag  ".pdf"
                           else if(cur_pag < 100) outfile = "0"  cur_pag  ".pdf"
                           else outfile = ""  cur_pag  ".pdf"

                           if(subid < 10) filename = "0" subid "/paper0" subid ".pdf"
                           else filename = subid "/paper" subid ".pdf"

                           pdftk_comm = "pdftk " proceedingspdf " cat " pagi "-" pagf " output CONF_Online/files/" outfile
                           #pdftk_comm = "pdftk " filename " cat 1 output CONF_Online/" outfile
  
                           #print  pdftk_comm
                           system(pdftk_comm);

                           print "<span class=\"title\">" title "</span>" 
                           print "<span class=\"author\">" authors "</span>" 
                           print "<span class=\"pages\">pages " (pagi-pagesfront) "-" (pagf-pagesfront) "</span> <span class=\"pdflink\">Full text: <a href=\"files/" outfile "\">pdf</a></span>" 

                           cur_pag = cur_pag + npages
                           
                    }
	        }

END 	        {
           print "<a id=\"backmatter\"></a>"
           print "<div class=\"chapternumber\">Back Matter</div>"
           #author index 
           npages = 1

	       pagi = cur_pag
           pagf = cur_pag + npages -1
           if( cur_pag < 10 ) outfile = "00"  cur_pag  ".pdf"
           else if(cur_pag < 100) outfile = "0"  cur_pag  ".pdf"
           else outfile = ""  cur_pag  ".pdf"
           pdftk_comm = "pdftk " proceedingspdf " cat " pagi "-" pagf " output CONF_Online/files/" outfile
           
           #print  pdftk_comm
           system(pdftk_comm);

           print "<span class=\"title\">Author Index</span>" 
           print "<span class=\"pages\">pages " (pagi-pagesfront) "-" (pagf-pagesfront) "</span> <span class=\"pdflink\">Full text: <a href=\"files/" outfile "\">pdf</a></span>" 

           cur_pag=cur_pag+npages

           system(". ./config.txt; sed s/\\${conferencename}/\"${conferencename}\"/ usb_footer.html | sed s/\\${acronym}/\"${acronym}\"/ | sed s/\\${city}/\"${city}\"/ | sed s/\\${monthday}/\"${monthday}\"/ | sed s/\\${country}/\"${country}\"/ | sed s/\\${isbn}/\"${isbn}\"/ | sed s/\\${catalognumber}/\"${catalognumber}\"/ | sed s/\\${year}/\"${year}\"/");
	        }
