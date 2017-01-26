from mortar.luigi import shellscript

class MyShellScriptTask(shellscript.ShellScriptTask):

    token_path = 'path-to-token-output'

    def subprocess_commands(self):
        return 'cd my/dir; ls;'

    def requires(self):
        return [OtherTask()]
