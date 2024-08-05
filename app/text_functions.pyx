cimport cython
from libc.stdlib cimport malloc, free

#import google.generativeai as genai

from termcolor import colored

class IteligentFunctions():
    def __init__(self) -> None:
        pass

    @stathicmethod
    def schedule_filter(self,
                        schedule: list ,
                        short_tests : bool = True,
                        tests : bool = True
                        ) -> list:
        #print("DEBUG: _schedule_filter")
        #print(schedule)
        
        output = []
        for schedule_element in schedule:
            #print(schedule_element)
            if 'Rodzaj' in schedule_element['details']:
                if short_tests and schedule_element['details']['Rodzaj'] == 'kartkówka':
                    output.append(schedule_element)

                elif tests and schedule_element['details']['Rodzaj'] == 'sprawdzian':
                    output.append(schedule_element)
                
                else:
                    print(f"Error: unexpected schedule element {schedule_element['details']['Rodzaj']}")
            else:
                print(f"Error: {schedule_element['title']} has no 'Rodzaj' field")
        
        return output

    #def _create_event_based_prompt(self, event : dict) -> str:
    #    print(colored(event, 'blue'))
    #    prompt = f""" Napisz zadania które należy wykonać by nauczyć 
    #    się na: {event['details']['Rodzaj']} z przedmiotu: {event['details']['Przedmiot']}.
    #    Opis który dostałem {event['details']['Opis']}. 
    #    Zaplanuj naukę, powtórzenia itd. 
    #    Każdzy element planu poprzedź znakiem: '-' """
    #    
    #    return prompt
    
    #def _get_llm_response(self, prompt : str) -> str:
    #    return self._model.generate_content(prompt)

    #def _get_tasks_from_string(self, nw : str = '-') -> list:
    #    pass
    
    def get_tasks(self, schedule: list) -> None:
        filtred_schedule = self._schedule_filter(schedule)
        
        #print(colored('responses: ', 'red'))
        for event in filtred_schedule:
            #prompt = self._create_event_based_prompt(event)
            #response = self._get_llm_response(prompt)
            print(f"LLM response for event {event['title']}: {response}")