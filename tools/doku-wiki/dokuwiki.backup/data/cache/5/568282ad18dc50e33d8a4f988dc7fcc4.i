a:48:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:0;}i:2;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:11:"python-vim ";}i:2;i:1;}i:3;a:3:{i:0;s:12:"externallink";i:1;a:2:{i:0;s:61:"http://vimdoc.sourceforge.net/htmldoc/if_pyth.html#python-vim";i:1;N;}i:2;i:12;}i:4;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:77;}i:5;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:77;}i:6;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:36:"vim - pass argument to python script";}i:2;i:79;}i:7;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:121;}i:8;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:240:"
:py import sys
:py sys.argv = ["foo", "bar"]
:pyfile mypythonscript.py

" pass argument with variable
function! Markdown2HTML()
        python import sys; import vim; sys.argv = [vim.eval("a:arg"), "bar"]
	pyfile markdown2html.py
endfunc

";i:1;N;i:2;N;}i:2;i:121;}i:9;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:121;}i:10;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:25:"vim - get input from user";}i:2;i:370;}i:11;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:401;}i:12;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:177:"
function! Demo()
  let curline = getline('.')
  call inputsave()
  let name = input('Enter name: ')
  call inputrestore()
  call setline('.', curline . ' ' . name)
endfunction
";i:1;N;i:2;N;}i:2;i:401;}i:13;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:401;}i:14;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:30:"vim - execute by python script";}i:2;i:587;}i:15;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:623;}i:16;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:135:"
if !has('python')
	finish
endif
 
function! Markdown2HTML()
	pyfile markdown2html.py
endfunc
 
command! MKD2HTML call Markdown2HTML()
";i:1;N;i:2;N;}i:2;i:623;}i:17;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:623;}i:18;a:3:{i:0;s:12:"externallink";i:1;a:2:{i:0;s:83:"http://www.terminally-incoherent.com/blog/2013/05/06/vriting-vim-plugins-in-python/";i:1;N;}i:2;i:767;}i:19;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:20:"
vim - redraw screen";}i:2;i:854;}i:20;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:880;}i:21;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:10:"
:redraw!
";i:1;N;i:2;N;}i:2;i:880;}i:22;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:880;}i:23;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:10:"vim - loop";}i:2;i:899;}i:24;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:915;}i:25;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:162:"
:let c = 0
:for i in [1, 2, 3, 4]
:  let c += i
:endfor
:echom c

:let c = 1
:let total = 0
:while c <= 4
:  let total += c
:  let c += 1
:endwhile
:echom total
";i:1;N;i:2;N;}i:2;i:915;}i:26;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:915;}i:27;a:3:{i:0;s:12:"externallink";i:1;a:2:{i:0;s:62:"http://learnvimscriptthehardway.stevelosh.com/chapters/36.html";i:1;N;}i:2;i:1086;}i:28;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:35:"
vim -send function by user command";}i:2;i:1152;}i:29;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1193;}i:30;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:53:"
command! -nargs=1 MyCommand call s:MyFunc(<f-args>)
";i:1;N;i:2;N;}i:2;i:1193;}i:31;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1193;}i:32;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:13:"vim - if else";}i:2;i:1256;}i:33;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1275;}i:34;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:228:"
:if 10 == 11
:    echom "first"
:elseif 10 == 10
:    echom "second"
:endif

:if "foo" == "bar"
:    echom "one"
:elseif "foo" == "foo"
:    echom "two"
:endif
[[http://learnvimscriptthehardway.stevelosh.com/chapters/22.html]]
";i:1;N;i:2;N;}i:2;i:1275;}i:35;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1275;}i:36;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:22:"vim - write a function";}i:2;i:1512;}i:37;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1540;}i:38;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:89:"
:function DisplayName(name)
:  echom "Hello!  My name is:"
:  echom a:name
:endfunction
";i:1;N;i:2;N;}i:2;i:1540;}i:39;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1540;}i:40;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:22:"vim - run the function";}i:2;i:1638;}i:41;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1666;}i:42;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:32:"
:call DisplayName("Your Name")
";i:1;N;i:2;N;}i:2;i:1666;}i:43;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1666;}i:44;a:3:{i:0;s:12:"externallink";i:1;a:2:{i:0;s:62:"http://learnvimscriptthehardway.stevelosh.com/chapters/24.html";i:1;N;}i:2;i:1707;}i:45;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:0:"";}i:2;i:1773;}i:46;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1773;}i:47;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:1773;}}