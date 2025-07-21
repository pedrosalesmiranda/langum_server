from phonetic_scripts.ipa_phonetics import ipa_to_portuguese_phonetic_gpt_o3

rs_word_ipa_phonetic_list = most_common_russian_nouns = most_common_russian_nouns = [
    ("её книга", "jɪˈjo ˈknʲigə", "her book"),
    ("человек", "t͡ɕɪlɐˈvʲek", "person"),
    ("время", "ˈvrʲemʲə", "time"),
    ("год", "ɡot", "year"),
    ("дело", "ˈdʲelə", "business / matter / case"),
    ("день", "dʲenʲ", "day"),
    ("рука", "rʊˈka", "hand / arm"),
    ("работа", "rɐˈbotə", "work / job"),
    ("слово", "ˈsɫovə", "word"),
    ("место", "ˈmʲestə", "place"),
    ("лицо", "lʲɪˈt͡so", "face / person"),
    ("глаз", "ɡɫas", "eye"),
    ("жизнь", "ʐɨznʲ", "life"),
    ("нога", "nɐˈɡa", "leg / foot"),
    ("голова", "ɡəlɐˈva", "head"),
    ("дом", "dom", "house / home"),
    ("сторона", "stərɐˈna", "side"),
    ("вопрос", "vɐˈpros", "question"),
    ("страна", "strɐˈna", "country"),
    ("мир", "mʲir", "world / peace"),
    ("женщина", "ˈʐɛnɕːɪnə", "woman"),
    ("ребёнок", "rʲɪˈbʲɵnək", "child"),
    ("мужчина", "mʊˈɕːinə", "man"),
    ("голос", "ˈɡoləs", "voice"),
    ("город", "ˈɡorət", "city"),
    ("машина", "mɐˈʂɨnə", "car / machine"),
    ("вода", "vɐˈda", "water"),
    ("отец", "ɐˈtʲet͡s", "father"),
    ("мать", "matʲ", "mother"),
    ("друг", "druk", "friend (male)"),
    ("ночь", "not͡ɕ", "night"),
    ("земля", "zʲɪˈmlʲa", "earth / land"),
    ("конец", "kɐˈnʲet͡s", "end"),
    ("стол", "stol", "table"),
    ("нужда", "nʊʐˈda", "need / necessity"),
    ("вещь", "vʲeɕː", "thing"),
    ("окно", "ɐkˈno", "window"),
    ("сила", "ˈsʲilə", "strength / power"),
    ("деньги", "ˈdʲenʲɡʲɪ", "money"),
    ("образ", "ˈobrəs", "image / form"),
    ("любовь", "lʲʊˈbofʲ", "love"),
    ("путь", "putʲ", "path / way / journey"),
    ("улица", "ˈuɫʲɪt͡sə", "street"),
    ("закон", "zɐˈkon", "law"),
    ("писатель", "pʲɪˈsatʲɪlʲ", "writer"),
    ("история", "ɪˈstorʲɪjə", "history / story"),
    ("солнце", "ˈsontsə", "sun"),
    ("врач", "vraʨ", "doctor"),
    ("школа", "ˈʂkoɫə", "school"),
    ("армия", "ˈarmʲɪjə", "army"),
    ("язык", "jɪˈzɨk", "language / tongue"),
    ("ребята", "rʲɪˈbʲatə", "guys / kids / folks")
]

for trio in rs_word_ipa_phonetic_list:
    print(f"{trio[2]}: {trio[0]}")
    print(f"{trio[1]}: {ipa_to_portuguese_phonetic_gpt_o3(trio[1])}")
    print("")


