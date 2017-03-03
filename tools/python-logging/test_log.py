import logging
logger = logging.Logger("test1")
fh = logging.FileHandler('spam.log')
logger.addHandler(fh)
logger.setLevel(logging.INFO)
logger.info("test info")

t2 = logging.Logger("test2")
f2 = logging.FileHandler('spam2.log')
t2.addHandler(f2)
t2.setLevel(logging.INFO)
t2.info("test 2 info")
