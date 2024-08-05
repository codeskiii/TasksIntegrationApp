import datetime
from librus_apix.schedule import get_schedule, schedule_detail
from librus_apix.client import Client, Token, new_client

cimport cython
from libc.stdlib cimport malloc, free

from termcolor import colored

@cython.boundscheck(False)
@cython.wraparound(False)
class current_schedule_manager:
    def __init__(self,
                 user_name : str,
                 user_password : str,
                 take_current_datetime : bool = True,
                 **kwargs
                 ) -> None:
        
        client: Client = new_client()
        _token: Token = client.get_token(user_name, user_password)
        
        if take_current_datetime:
            self._datetime = datetime.datetime.now()
            self._month = self._datetime.month
            self._year = self._datetime.year
        else:
            self._month = kwargs.get('month')
            self._year = kwargs.get('year')

        self._schedule = dict(get_schedule(client, self._month, self._year))
        #print(colored('DEBUG: librus api', 'red'))
        #print(self._schedule)
        self.schedule_elements = []

        for day in self._schedule:
            for event in self._schedule[day]:
                try:
                    print("Loading:", event.title)
                    prefix, href = event.href.split('/')
                    details = schedule_detail(client, prefix, href)
                    self.schedule_elements.append({
                        'title': event.title,
                        'details': details
                    })
                except Exception as e:
                    print(f'Error: {e}')

