# SOVELLUKSEN PÄÄOHJELMA

# Kirjastojen ja modulien lataus
import datetime

# Luokka-määritykset

class Person():
    """Class for storing person information."""
    def __init__(self, firstName, lastName):
        self.firstName = firstName
        
        