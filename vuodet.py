import datetime

def laske_syntymävuosi(ikä):
    return nykyinen_vuosi() - ikä

def nykyinen_vuosi():
    tänään = datetime.date.today()
    return tänään.year