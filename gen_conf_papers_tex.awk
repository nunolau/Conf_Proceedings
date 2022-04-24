# if the same author uses different names in differnt papers this function will make the author index consider him the same person
# sameauthor array should be initialized in BEGIN
function checkAuthorNames(authorsand)
{
    split(authorsand, autharray, " +and +")
    
    cauth=1
    for (a in autharray) {
        auth = autharray[a]
        if (auth in sameauthor) {
            auth = sameauthor[auth]
        }

        lastname = auth
        sub("^.* ","",lastname)
        othernames = auth
        sub(" [^ ]*$","",othernames)

        auth = lastname ", " othernames

        if (cauth==1) result = auth
        else result = result " and " auth 	

        cauth = cauth+1
    }

    return result
}

BEGIN	   {
                 FS=";"
                 sameauthor["John Smith"]="John S Smith"
                 # add aliases as needed
	       }
	
/./        { 
                    if(NR>1) {
                           subid = $1
                           title = $3
                           authors = $2
                           offsetx = $9
                           offsety = $10
                           crule = $13
                           scale = $14
                           header = $15
  
                           authorsand = authors

                           gsub(","," and ",authorsand)

                           authorsand = checkAuthorNames(authorsand)

                           if(subid < 10) filename = "00" subid "/paper_" subid ".pdf"
                           else if(subid < 100) filename = "0" subid "/paper_" subid ".pdf"
                           else filename = subid "/paper_" subid ".pdf"
                           print "%submission " subid
                           print "\\newpage"
                           print "\\aimention{" authorsand "}"
                           if(header==1) { 
                                    print "\\lhead{\\small \\textbf{\\headerlineone\\newline"
                                    print "\\headerlinetwo\\newline"
                                    print "\\headerlinethree\\newline \\null}}"
                           }
                           if(header==2) { 
                                    print "\\lhead{\\small \\textbf{\\year\\ \\conferencename\\ (\\acronym)\\newline"
                                    print "\\headerlinethree\\newline \\null}}"
                           }
                           print "\\lfoot{\\small \\textbf{\\isbn/\\$XX.00 \\textcopyright \\year\\  22 IEEE}}"
                           print "\\includepdf[pages=1,offset=" offsetx "cm " offsety "cm,scale=" scale ",addtotoc={1,chapter,60,{ \\emph{" title "} \\newline " authors "},paper" subid "}]{" filename "}"
                           print "\\lfoot{}"
                           if(crule==1)
                              print "\\includepdf[pages=2-,offset=" offsetx "cm " offsety "cm,scale=" scale ",pagecommand={\\crule[white]{15cm}{2.6cm}}]{" filename "}"
                           else
                              print "\\includepdf[pages=2-,offset=" offsetx "cm " offsety "cm,scale=" scale "]{" filename "}"
                    }
	        }

END 	    {
	        }
