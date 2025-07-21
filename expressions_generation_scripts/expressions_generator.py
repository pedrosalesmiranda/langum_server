from expressions_generation_scripts.console_inputs import create_all_from_topic, create_all_from_topic_and_meaning_list, \
    create_phonetics_from_json, create_all_from_json_meanings

create_all_from_json_meanings("russian", "english")

# create_all_from_topic("verbs (infinitive, present(first, second, third person) related to movement. Like: go, return, enter, exit, pass, ...", "expression or word", 40, "russian", "english")
# create_all_from_topic("used train station", "expression or word", 10, "russian", "english")
#
# create_all_from_topic("used on restaurant", "expression or word", 25, "russian", "english")
#
# create_all_from_topic("first date common answers", "expression", 18, "russian", "english")
# create_all_from_topic("first date common questions", "expression", 18, "russian", "english")
# create_all_from_topic("possessive pronouns, with noun (2 words)", "expression", 20, "russian", "english")
#

# create_all_from_topic_and_meaning_list("numbers: 1 to 19", [
#     "one", "two", "three", "four", "five", "six", "seven",
#     "eight", "nine", "ten", "eleven", "twelve", "thirteen",
#     "fourteen", "fifteen", "sixteen", "seventeen",
#     "eighteen", "nineteen", "twenty"
# ], "russian", "english")

# create_all_from_topic_and_meaning_list("numbers: 20, 30, ..., 90", [
#     "twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety"
# ], "russian", "english")
#
# create_all_from_topic_and_meaning_list("numbers: 100, 200, ..., 1000", [
#     "hundred", "two hundred", "three hundred", "four hundred", "five hundred", "six hundred", "seven hundred", "eight hundred", "nine hundred", "thousand"
# ], "russian", "english")
#
# create_all_from_topic_and_meaning_list("numbers: 100, 200, ..., 1000", [
# "first", "second", "third", "fourth", "fifth", "sixth", "seventh", "eighth", "ninth", "tenth"
# ], "russian", "english")
