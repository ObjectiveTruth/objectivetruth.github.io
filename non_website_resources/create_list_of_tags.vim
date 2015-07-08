:set hidden
:set silent
:first
qq
gg
/tags:
j
V
/---
:w >> ../alltags.txt
gg
q
:silent argdo normal @q
:qall
