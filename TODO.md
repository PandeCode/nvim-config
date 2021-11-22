sound effects on events like opera gx (lua sound module)

https://github.com/ThePrimeagen/refactoring.nvim/blob/master/lua/refactoring/query.lua
https://tree-sitter.github.io/tree-sitter/using-parsers#query-syntax
https://tree-sitter.github.io/tree-sitter/playground
https://github.com/nvim-treesitter/nvim-treesitter#extra-features
https://github.com/nvim-treesitter/nvim-treesitter/blob/master/doc/nvim-treesitter.txt
https://github.com/nvim-treesitter/nvim-treesitter#available-modules
https://github.com/ThePrimeagen/harpoon
https://github.com/romgrk/nvim-treesitter-context
https://github.com/theHamsta/nvim-treesitter-pairs

https://github.com/milisims/tree-sitter-org
https://github.com/kristijanhusak/orgmode.nvim
https://github.com/dhruvasagar/vim-table-mode
https://github.com/lukas-reineke/headlines.nvim
https://github.com/michaelb/sniprun
https://github.com/meain/vim-printer
https://github.com/rlch/github-notifications.nvim
https://github.com/rcarriga/nvim-notify



Vim Grammar
Using vim is like talking to your editor in number verb modifier object sentences, turned into acronyms

Number
Enter nonzero number before the command, to repeat the command number times.

Verbs
key	function	verb form
v	visual select	transitive
c	change, enter insert mode	transitive
d	delete	transitive
y	yank / copy	transitive
x	delete char	non-transitive
i	insert, enter insert mode, before the cursor	non-transitive
a	append, enter insert mode, after the cursor	non-transitive
p	paste	non-transitive
n N	find next/previous search results of / or ?	non-transitive
Modifiers
key	function
i	inside
a	around
t	till find a character, not including the character
f	find a character, including the character
/	search downwards, find a string or regex
?	search upwards, find a string or regex
Objects
key	function
w	word
s	sentence
b	block / parentheses
p	paragraph
t	tag, for html/xml tags
G	go to the last line
number G	go to the number line
g g	go to the first line, the same as 1 G
0	number 0, to the first character of current line
$	to the last character of current line
Examples
Key
key sequence (command mode)	function
x	delete the current character
p	paste
Number + Key
key sequence (command mode)	function
8 x	delete the next 8 characters
2 j	move down the cursor by 2 lines
Key + Object
key sequence (command mode)	function
d w	delete to the end of the (next) word
c w	delete to the end of the (next) word, enter insert mode
Key + Modifier + Object
key sequence (command mode)	function
d i w	delete the current word
c i w	change the word, enters insert mode
c i s	change current sentence
c i "	change inside " "
c i {	change inside { }
c / f o o	change until next occurrence of foo
c t 8	change everything from here until number 8
c f 8	like above, but also remove the number
c a p	change the current paragraph
v a p	visually select this paragraph

Verbs
https://riptutorial.com/vim/example/27570/using--verbs--and--nouns--for-text-editing
https://www.technblogy.com/2019/11/20/programming-in-vim-number-verbs-modifiers-objects-concept/
