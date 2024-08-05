import cython
from Cython.Build import cythonize
import pyximport
pyximport.install(language_level=3)

from termcolor import colored

import app.librus_client as librus_client
import app.text_functions as text_functions

from dotenv import load_dotenv
import os

load_dotenv()

LOGIN = os.getenv('LOGIN')
PASSWD = os.getenv('PASSWD')

if __name__ == "__main__":
    #print(colored("DEBUG: launcher.py", 'red'))
    schedule_manager = librus_client.current_schedule_manager(LOGIN, PASSWD, 
                                                              take_current_datetime=False, 
                                                              month=2, year=2024)
    # i need to have in notion only specified events
    filtered_schedule = text_functions.schedule_filter(schedule_manager.schedule_elements)

    # autoamtic planning rewiews
    # TO DO

    # parse into notion
    # TO DO