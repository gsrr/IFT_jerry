class MyBreakpoint (gdb.Breakpoint):
	def stop (self):
		try:
			print "stop"
			frame = Frame.get_selected_python_frame()
			pyop_frame = frame.get_pyop()
			if str(pyop_frame.co_name) == self.bp:
				return True
			return False
		except:
			return False
	
	def set_bp(self, name):
		self.bp = name

class PyBreakPoint(gdb.Command):
    def __init__(self):
        gdb.Command.__init__ (self,
                              "py-bk",
                              gdb.COMMAND_DATA,
                              gdb.COMPLETE_NONE)


    def invoke(self, args, from_tty):
		name = str(args)
		bp = MyBreakpoint("PyEval_EvalFrameEx")
		bp.set_bp(name)

PyBreakPoint()
