import cython
from Cython.Build import cythonize
import pyximport
pyximport.install(language_level=3)

from termcolor import colored

import librus_client as cl
import text_functions as tf

LOGIN = '11229124u'
PASSWD = 'Piotr123.,'

if __name__ == "__main__":
    #print(colored("DEBUG: launcher.py", 'red'))
    csm = cl.current_schedule_manager(LOGIN, PASSWD, take_current_datetime=False, month=2, year=2024)
    filtered_schedule = tf.IteligentFunctions.schedule_filter(csm.schedule_elements)