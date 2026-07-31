FROM alpine

LABEL username="hamza"
LABEL mail="sacrhamza@gmail.com"
LABEL text="this is just some text"


# single line
LABEL username=" hamza "
LABEL mail="sacrhamza@gmail.com"

ARG VAR="something"
# multiline
LABEL multi.label1="value1"\
     multi.label2="value2 $VAR"
