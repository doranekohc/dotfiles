syn region ksLineComment start=+^;+ end=+$+
syn region ksLineComment start=+\/\*+ end=+\*\/+
syn region ksTag  start=+\[[^/]+  end=+\]+ fold contains=ksDoubleQuote,ksTagName,ksEqual,ksParam
syn region ksTag  start=+^@+  end=+$+ fold contains=ksDoubleQuote,ksTagName,ksEqual,ksParam
syn region ksJump  start=+^*+  end=+$+
syn region ksParam start=+\"+ end=+\"+

" タグネーム
syn keyword ksTagName contained font size name storage width height layer visible time top left target x y
syn keyword ksEqual contained ee \=
syn keyword ksDoubleQuote contained "

highlight link ksDoubleQuote String
highlight link ksLineComment Comment
highlight link ksTag   Function
highlight link ksEqual Operator
highlight link ksTagName Statement
highlight link ksJump Special
highlight link ksParam Operator
