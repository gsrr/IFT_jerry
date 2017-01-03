import sys
import random

class Node:
    def __init__(self, data):
        self.data = data
        self.left = None
        self.right = None

class BST:
    def __init__(self, arr):
        self.tree = None
        self.arr = arr
   
    def _insert(self, tree, node):
        if node.data > tree.data:
            if tree.right == None:
                tree.right = node
            else:
                self._insert(tree.right, node) 
        else:
            if tree.left == None:
                tree.left = node
            else:
                self._insert(tree.left, node)

    def insert(self, node):
        if self.tree == None:
            self.tree = node
        else:
            self._insert(self.tree, node)

    def construct(self):
        for item in self.arr:
            n = Node(item)
            self.insert(n)

    def _inorder(self, tree):
        if tree != None:
            print tree.data
            if tree.left != None:
                self._inorder(tree.left)
            if tree.right != None:
                self._inorder(tree.right)
    
    def _preorder(self, tree):
        if tree == None:
            return

        if tree.left != None:
            self._preorder(tree.left)
        print tree.data
        if tree.right != None:
            self._preorder(tree.right)

    def _postorder(self, tree):
        if tree == None:
            return

        if tree.left != None:
            self._postorder(tree.left)
        if tree.right != None:
            self._postorder(tree.right)
        print tree.data

    def traverse(self, mode):
        func = getattr(self, "_" + mode)
        func(self.tree)

def test_bst():
    arr = [random.randint(0,1000) for r in xrange(10)] 
    print arr
    tree = BST(arr)
    tree.construct()
    print "inorder"
    tree.traverse("inorder")
    print "preorder"
    tree.traverse("preorder")
    print "postorder"
    tree.traverse("postorder")

def main():
    func = getattr(sys.modules[__name__], sys.argv[1])
    func()

if __name__ == "__main__":
    main()
