import sys 
import os
sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))  # Adjust as necessary
from Program import Program

class converted(Program):

	def __init__(self):
		super().__init__(1)

	def getB(self):
		return super().getAsString(0, 1)

	def setB(self, value):
		return super().setAsString(0, 1, value)

	def setB(self, value):
		return super().setAsString(0, 1, value)

	def getDisplayB(self):
		return super().getAsString(0, 1)

	def initialize(self):
		pass
	def main(self):
		self.initialize()
		B = input()
		self.setB( B )
		if (self.getB() == ("A")):
			print("T", sep='')
		elif (self.getB() == ("C")):
			print("G", sep='')
		elif (self.getB() == ("G")):
			print("C", sep='')
		elif (self.getB() == ("T")):
			print("A", sep='')
		else:
			pass
		exit()
		exit()
converted().main()