# CHECK ROUTINES FOR FINNISH SOCIAL SECURITY NUMBER

# LIBRARIES AND MODULES

# FUNCTIONS

def centuryCode(ssnumber):
    """Extracts the century of birth from
    finnish social security number
    Args:
        ssnumber (string): a social security number
    Returns:
        int: century 1800, 1900 or 2000
    """
    cCode = ssnumber[6]
    codeDict = {'+' : 1800, '-' : 1900, 'A' : 2000}
    century = codeDict[cCode]
    return century

def dateOfBirth(ssnumber):
    """Extracts the date of birth from a social security number
    Args:
        ssnumber (string): finnish social security number
    Returns:
        string: the date of birth
    """
    dayPart = ssnumber[0:2]
    monthPart = ssnumber[2:4]
    yearPart = ssnumber[4:6]
    birth = dayPart + '.' + monthPart + '.' + yearPart
    return birth





if __name__ == "__main__":
    ssnumber = '130728A478N'
    print('syntymävuosisata on', centuryCode(ssnumber))
    print('Syntymäpäivä on', dateOfBirth(ssnumber))
    