import unittest
import hello

class TestUM(unittest.TestCase):

	def setUp(self):
		pass

	def test_hello(self):
		self.assertEqual( hello.main("hello"), "Hello World\n")

	def test_hello2(self):
		self.assertEqual( hello.main("hello2"), 'Hello World2\n')

if __name__ == '__main__':
	unittest.main()
