
from __future__ import unicode_literals
from prompt_toolkit import prompt
from prompt_toolkit.contrib.completers import WordCompleter

html_completer = WordCompleter(['list', 'add', 'edit', 'delete', 'listgroup'])
text = prompt('Enter HTML: ', completer=html_completer)
print('You said: %s' % text)
