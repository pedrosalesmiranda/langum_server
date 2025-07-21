import split_words
from phonetic_scripts.ipa_phonetics import ipa_to_portuguese_phonetic_gpt_o3, ipa_to_portuguese_phonetic

# Example words demonstrating each rule:
test_words = [
    "молоко",    # мо-ло-ко
    "кора",      # ко-ра
    "трава",     # тра-ва (no split in 'тр' because 't' is noisy, attaches to next)
    "сестра",    # се-стра (consonant cluster 'стр' -> 'с' is noisy so goes right)
    "корка",     # кор-ка (р+к -> split between sonorant r and noisy k)
    "парта",     # пар-та (р+т -> split between r and t)
    "коньки",    # конь-ки (ь stays with н in first syllable)
    "подъезд",   # подъ-езд (ъ stays with д in first syllable)
    "объект",    # объ-ект (ъ stays with б in first syllable)
    "уезжать",   # у-е-зжать (зж kept together)
    "делаться",  # де-ла-ться (ться kept together)
    "классный",  # кла-ссный (double сс -> both to next syllable)
    "теннис",    # те-ннис (double нн -> both to next)
    "майор",     # май-ор (й with previous syllable)
    "Илья",      # И-лья (ль treated as single sonorant unit, goes to next syllable)
    "солнце",    # солн-це (лнц -> break between н (sonorant) and ц (noisy))
    "Песня?",    # Пе-сня? (preserves capital and punctuation, example of multiple consonants 'сн')
]
# print([split_words.split_russian_word(w) for w in test_words])

# Full sentence with punctuation:
sentence = "Молоко? Пьеса или игра - в чём разница?"
sentence2 = "У моей соседки бабушки сгорел телевизор, я вчера заказала новый на озон, потому что ремонт стоит как новый телевизор, сейчас установила ей его."
sentence3 = "ты останавливаешься"

sentence4 = "Солдат пошёл в магазин и купил молоко и воду."
sentence5 = "После захода солнца солдат пошёл в спортзал и подготовил вертолёт."

print(split_words.split_russian_text(sentence4))
print(split_words.split_russian_text(sentence5))

# print(ipa_to_portuguese_phonetic_gpt_o3("tɨ vəzrəˈɕːæjɪʂsʲə"))
# print(ipa_to_portuguese_phonetic("tɨ vəzrəˈɕːæjɪʂsʲə"))


print(split_words.split_russian_text("её фильм его"))
print(ipa_to_portuguese_phonetic_gpt_o3("jɪˈjo fʲilʲm --- jɪˈvo ɪˈɡra"))
print(ipa_to_portuguese_phonetic("jɪˈjo fʲilʲm --- jɪˈvo ɪˈɡra"))
print("jɪˈjo fʲilʲm --- jɪˈvo ɪˈɡra")

print("mə-ɫɐ-ˈko")
print(ipa_to_portuguese_phonetic_gpt_o3("mə-ɫɐ-ˈko"))

print("и ветер все это унес")
print("i ˈvʲetʲɪr fsʲɵ ˈɛtə ʊˈnʲos")
print(ipa_to_portuguese_phonetic_gpt_o3("i ˈvʲetʲɪr fsʲɵ ˈɛtə ʊˈnʲos"))