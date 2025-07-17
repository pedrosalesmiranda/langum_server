import split_words

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
print([split_words.split_russian_word(w) for w in test_words])

# Full sentence with punctuation:
sentence = "Молоко? Пьеса или игра - в чём разница?"
sentence2 = "У моей соседки бабушки сгорел телевизор, я вчера заказала новый на озон, потому что ремонт стоит как новый телевизор, сейчас установила ей его."

print(split_words.split_russian_text(sentence2))
