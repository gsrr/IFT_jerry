"Run git clone using pki key with passphrase."

import pty, os, sys, select


def waitfor(fd, str):
   "poll the child for input"
   poll = select.poll()
   poll.register(fd, select.POLLIN)
   while True:
      evt = poll.poll()
      if str in os.read(fd, 1024):
         return


if __name__=="__main__":

   # run this from shell with git url,target path & key passphrase
   giturl, path, passphrase = sys.argv[1:4]

   pid, fd = pty.fork()

   # executed in child
   if pid == 0:
      os.execvp("git", ["git", "clone", giturl, path])

   # executed in parent
   elif pid > 0:
      waitfor(fd, "Enter passphrase")
      os.write(fd, passphrase + "\n")
      waitfor(fd, "Resolving deltas: 100%")
      os.wait()
      os.close(fd)