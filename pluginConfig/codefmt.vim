autocmd VimEnter * Glaive codefmt black_executable="black"
autocmd VimEnter * Glaive codefmt prettier_executable="prettier"
autocmd VimEnter * Glaive codefmt clang_format_executable="clang-format"


augroup autoformat_settings
  autocmd FileType bzl AutoFormatBuffer buildifier
  autocmd FileType c,csharp,cs,cpp,proto,arduino AutoFormatBuffer clang-format
  autocmd FileType dart AutoFormatBuffer dartfmt
  autocmd FileType go AutoFormatBuffer gofmt
  autocmd FileType gn AutoFormatBuffer gn
  autocmd FileType  graphql,markdown,yaml,javascript,html,css,sass,scss,less,json,vue,jsonc,typescript,typescriptreact,javascriptreact AutoFormatBuffer prettier
  autocmd FileType java AutoFormatBuffer google-java-format
  autocmd FileType python AutoFormatBuffer black
  autocmd FileType rust AutoFormatBuffer rustfmt
augroup END

