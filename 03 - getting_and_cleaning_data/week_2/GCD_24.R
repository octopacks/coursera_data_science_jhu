con = url("http://biostat.jhsph.edu/~jleek/contact.html")
html = readLines(con)
close(con)
nchar(html[c(10, 20, 30, 100)])