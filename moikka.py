import vuodet
# vuodet.laske_syntymävuosi()
# vuodet.nykyinen_vuosi()

# from vuodet import laske_syntymävuosi, nykyinen_vuosi
# laske_syntymävuosi(...)
# nykyinen_vuosi()

def pääfunktio():
    print("kutsutuaan henkiötiedot-funktiota")
    syntymävuosi = henkilötiedot("Bob", ikä=55, lempiväri="punainen")
    print("Palattiin funktiosta, paluuarvo:", syntymävuosi)


def henkilötiedot(nimi, ikä, lempiväri="musta"):
    print("Moikka, ", nimi)
    print("Ai, olet", ikä, "vuotta vanha.")
    print("Lempivärisi on siis", lempiväri)
    syntymävuosi = vuodet.laske_syntymävuosi(ikä)
    return 2022 - ikä


pääfunktio()


# teksti = input("Anna luku: ")   # input on funktio

# print(teksti)   # "print" on siis funktio

# if teksti.isdigit(): # isdigit = str luokan metodi, (method of str class)
#     luku = int(teksti)
# elif teksti == "yksi":
#     luku = 1
# elif teksti == "kaksi":
#     luku = 2
# elif teksti == "kymppi":
#     luku = 10
# else:
#     print("Ei ollut luku. Varmaan 0 käy sitten.")
#     luku = 0
    
# print ("Luku on:", luku)

# if luku > 10:
#     print("suurempi kuin 10")
# elif luku == 10:
#     print("on 10")
# else:
#     print("pienempi kuin 10")


    