# HENKILÖTIETOJEN KYSELY JA TARKISTUS
# -----------------------------------

# KIRJASTOJEN JA MODULIEN LATAUS

# Module for checking finnish social security numbers
import finssn 

# LUOKKAMÄÄRITYKSET

class Person:
    """Properties of a client and a method
    for cheking the finnish social security number"""
    def __init__(self, firstName, lastName, ssNumber):
        self.firstName = firstName
        self.lastName = lastName
        self.ssNumber = ssNumber

# MAIN LOOP
while True:
    stopLoop = ''
    # Ask for user input and store answers to variables
    givenName = input('Mikä on etunimesi? ')
    surname= input('Mikä on sukunimesi? ')
    ssn = input('Syötä henkilötunnuksesi: ')
    stopLoop = input('Haluatko lopettaa, paina Q').upper()

    # Create an object from Person class

    person1 = Person(givenName, surname, ssn)
    century = finssn.centuryCode(person1.ssNumber)

    print('Etunimesi on', person1.firstName, 'olet syntynyt', century, 'luvulla')

    if stopLoop == 'Q':
        break
    