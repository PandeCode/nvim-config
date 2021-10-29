if exists("b:current_syntax")
	finish
endif

syn match keysInfo "->.*"
syn match keysString "'.*'"
syn match keysInt "\d-\d"

syn region keysComment start=/^\s*#/ end=/$/

syn keyword keyCommoners A B C D E F G H I J K L M N O P Q R S T U V W X Y Z a b c d e f g h i j k l m n o p q r s t u v w x y z

syn keyword keysKeyword  F1 F2 F3 F4 F5 F6 F7 F8 F9 F10 F11 F12  TILDE GREATER GREATER_THAN LESS LESS_THAN OPEN_SQUARE_BRACKET CLOSE_SQUARE_BRACKET FORWARDSLASH BACKSLASH FORWARD_SLASH BACK_SLASH  PERIOD COMMA BACKTICK GRAVE ESCAPE PRINT RETURN SPACE

syn keyword keysType MOD ALT CTRL SHIFT NUM


hi def link keyCommoners Boolean
hi def link keysComment Comment
hi def link keysInfo    Macro
hi def link keysInt     Number
hi def link keysKeyword Keyword
hi def link keysString  String
hi def link keysType    Type

"hi def link   Number
"hi def link   Boolean
"hi def link   Label
"hi def link   Constant

let b:current_syntax = "keys"
