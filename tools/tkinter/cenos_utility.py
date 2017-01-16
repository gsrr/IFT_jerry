from tkinter import *
import base64
import sys
 
class GUIDemo(Frame):
    def __init__(self, master=None):
        Frame.__init__(self, master)
        self.grid()
        self.createWidgets()
 
    def createWidgets(self):
        self.inputText = Label(self)
        self.inputText["text"] = "Input:"
        self.inputText.grid(row=0, column=0)
        self.inputField = Entry(self)
        self.inputField["width"] = 50
        self.inputField.grid(row=0, column=1, columnspan=5)
 
        self.outputText = Label(self)
        self.outputText["text"] = "Output:"
        self.outputText.grid(row=1, column=0)
        self.outputField = Entry(self)
        self.outputField["width"] = 50
        self.outputField.grid(row=1, column=1, columnspan=5)
         
        self.Submit = Button(self)
        self.Submit["text"] = "Submit"
        self.Submit.grid(row=2, column=6)
        self.Submit["command"] =  self.pass_generator
 
        self.displayText = Label(self)
        self.displayText["text"] = "Centos Login Utility (http://swd.infortrend/linux_login_util.py#)"
        self.displayText.grid(row=3, column=0, columnspan=7)
    
    def pass_generator(self):
        self.outputField.delete(0, "end") 
        # You can supply the argument END (or "end") instead of computing the length of the data.
        rand_string = self.inputField.get()
        tmpStr = "abcde"
        passStr = ""
        for c in tmpStr:
            passStr += chr(ord(c) + 1)
        self.outputField.insert(0, passStr)

if __name__ == '__main__':
    root = Tk()
    app = GUIDemo(master=root)
    app.mainloop()