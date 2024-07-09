# import json
# import socket
# import sqlite3
#
# from flask import Flask, request, jsonify
#
# app = Flask(__name__)
#
#
# @app.route('/swipes', methods=['POST'])
# def add_swipe():
#     data = request.json
#     if not data:
#         return jsonify({"error": "Invalid JSON."}), 400
#
#     profile_id = data.get('profileId')
#     location_id = data.get('locationId')
#     bond_swipes = data.get('bondSwipes')
#
#     if not bond_swipes:
#         return jsonify({"error": "No swipes data found."}), 400
#
#     try:
#         with sqlite3.connect('swipe_info.db') as conn:
#             c = conn.cursor()
#
#             for swipe in bond_swipes:
#                 swipe_value = swipe.get('swipeValue')
#                 if swipe_value is None:
#                     continue
#                 utc_timestamp = swipe.get('utcTimeStamp')
#                 td_swipe = swipe.get('tdSwipe')
#                 user_data = td_swipe.get('user') if td_swipe else None
#
#                 if user_data:
#                     # TODO from here user can be extracted to function used here and on endpoint just to update user
#                     user_id = user_data.get('_id')
#                     existing_user = c.execute('SELECT * FROM Users WHERE userId = ?', (user_id,)).fetchone()
#
#                     if existing_user:
#                         # only update if something is different or not cause fields might change think about it
#                         print(f"User {user_id} already exists with details: {existing_user}")
#                         c.execute('''UPDATE Users SET name = ?, dateOfBirth = ?, city = ?, bio = ? WHERE userId = ?''',
#                                   (user_data.get('name'), user_data.get('birth_date'), user_data.get('city'),
#                                    user_data.get('bio'),
#                                    user_id))
#                     else:
#                         c.execute('''INSERT INTO Users (userId, name, dateOfBirth, city, bio) VALUES (?, ?, ?, ?, ?)''',
#                                   (user_id, user_data.get('name'), user_data.get('birth_date'), user_data.get('city'),
#                                    user_data.get('bio')))
#
#                     photos = user_data.get('photos')
#                     if photos:
#                         for photo in photos:
#                             photo_id = photo.get('id')
#                             c.execute('''INSERT OR IGNORE INTO Photos (photoId, userId) VALUES (?, ?)''',
#                                       (photo_id, user_id))
#
#                     c.execute('''INSERT INTO Swipes (profileId, locationId, swipeValue, tdSwipeValue, timestamp, userId)
#                                 VALUES (?, ?, ?, ?, ?, ?)''',
#                               (profile_id, location_id, swipe_value, None, utc_timestamp,
#                                user_data.get('_id') if user_data else None))
#
#             conn.commit()
#
#         return jsonify({"message": "Swipe added successfully!"})
#
#     except sqlite3.Error as e:
#         return jsonify({"error": f"Database error: {e}."}), 500
#     except Exception as e:
#         return jsonify({"error": f"Unexpected error: {e}."}), 500
#
#
# @app.route('/users_update', methods=['POST'])
# def create_or_update_user():
#     data = request.json
#     if not data:
#         return jsonify({"error": "Invalid JSON."}), 400
#
#     user_data = data.get('user')
#     user_id = user_data.get('_id')
#     user_name = user_data.get('name')
#     user_birth_date = user_data.get('birth_date')
#     if user_data.get('city'):
#         user_city = user_data.get('city').get("name")
#     else:
#         user_city = ""
#     user_bio = user_data.get('bio')
#
#     if not user_id:
#         return jsonify({"error": "No user id found."}), 400
#
#     try:
#         with sqlite3.connect('swipe_info.db') as conn:
#             c = conn.cursor()
#
#         existing_user = c.execute('SELECT * FROM Users WHERE userId = ?', (user_id,)).fetchone()
#
#         city_text = f", user city = {user_city}" if user_city else ""
#
#         print(f"{user_name}, id = {user_id}{city_text}")
#
#         if existing_user:
#             # only update if something is different or not cause fields might change think about it
#             print(f"User {user_id} already exists with details: {existing_user}")
#             c.execute('''UPDATE Users SET name = ?, dateOfBirth = ?, city = ?, bio = ? WHERE userId = ?''',
#                       (user_name, user_birth_date, user_city, user_bio, user_id))
#         else:
#             c.execute('''INSERT INTO Users (userId, name, dateOfBirth, city, bio) VALUES (?, ?, ?, ?, ?)''',
#                       (user_id, user_name, user_birth_date, user_city,
#                        user_bio))
#
#         conn.commit()
#
#         if existing_user:
#             return jsonify({"message": f"User {user_id} was updated"})
#         else:
#             return jsonify({"message": f"User {user_id} was created"})
#
#     except sqlite3.Error as e:
#         return jsonify({"error": f"Database error: {e}."}), 500
#     except Exception as e:
#         return jsonify({"error": f"Unexpected error: {e}."}), 500
#
#
# @app.route('/locations', methods=['GET'])
# def get_locations():
#     with sqlite3.connect('swipe_info.db') as conn:
#         c = conn.cursor()
#         c.execute('SELECT * FROM Locations')
#         locations = c.fetchall()
#
#     # Convert the locations to a dictionary with shortName as key
#     location_dict = {}
#     for location in locations:
#         shortName = location[3]
#         location_dict[shortName] = {
#             'locationId': location[0],
#             'latitude': location[1],
#             'longitude': location[2],
#             'city': location[4],
#             'country': location[5]
#         }
#
#     return jsonify(location_dict)
#
#
# @app.route('/get_users_cities', methods=['GET'])
# def get_users_cities():
#     data = request.json
#     user_ids = data['userIds']
#     profile_id = data['profileId']
#
#     user_ids_placeholder = ','.join(['?'] * len(user_ids))  # Create a placeholder for SQL query
#
#     query = '''SELECT u.userId, l.city, u.city
#     FROM Users u
#     LEFT JOIN Swipes s ON u.userId = s.userId AND s.profileId = ?
#     LEFT JOIN Locations l ON s.locationId = l.locationId
#     WHERE u.userId IN (%s)''' % user_ids_placeholder  # Use placeholder for IN clause
#
#     #
#     #
#     # query = '''
#     #     SELECT u.userId, l.city, u.city
#     #     FROM Users u
#     #     LEFT JOIN Swipes s ON u.userId = s.userId
#     #     LEFT JOIN Locations l ON s.locationId = l.locationId
#     #     WHERE s.profileId = ? AND u.userId IN (%s)
#     # ''' % user_ids_placeholder  # Use placeholder for IN clause
#
#     with sqlite3.connect('swipe_info.db') as conn:
#         c = conn.cursor()
#         c.execute(query, [profile_id, *user_ids])  # Provide profileId and user_ids dynamically
#         locations = c.fetchall()
#
#     users_cities = {location[0]: {'swipe_city': location[1], 'user_city': location[2]} for location in locations}
#
#     conn.close()
#
#     return jsonify(users_cities)
#
#
# def save_json_file(filename: str, json_dict: dict, folder_path="", indent=4):
#     with open(f"{folder_path}/{filename}", "w") as outfile:
#         json.dump(json_dict, outfile, indent=indent)
#
#
# if __name__ == '__main__':
#     folder_path = "C:/Users/pedro/StudioProjects/bond_swipes_manual/jsons"
#     filename = "db_info.json"
#     # Get the hostname
#     hostname = socket.gethostname()
#     # Get the IP address
#     ip_address = socket.gethostbyname(hostname)
#
#     print("Hostname:", hostname)
#     print("IP:", ip_address)
#
#     port = input("select PORT NUMBER - press enter for default 8888\n")
#     if port == "":
#         port = 8888
#
#     db_ip_port = f"{ip_address}:{port}"
#     db_info = {"ip": ip_address, "port": port}
#
#     save_json_file(filename, db_info, folder_path)
#
#     print("db ip port were saved to:")
#     print(f"{folder_path}{filename}")
#
#     app.run(host=ip_address, port=port)
import json
from datetime import datetime

from flask import Flask, request, jsonify
import sqlite3

app = Flask(__name__)


def get_language_packs(target_language_id, base_language_id):
    """
    return expressions grouped per pack for a given language with base language needed fields too
    :param target_language_id:
    :param base_language_id:
    :return:
    """
    conn = sqlite3.connect('langum.db')  # Replace 'your_database.db' with your actual database file
    cursor = conn.cursor()

    query_language = '''
SELECT PM.pack_id       AS pack_id,
       E.text           AS expression_text,
       E.sound_filename AS expression_sound,
       E.language_id    AS language_id,
       P.text           AS expression_phonetic,
       M.id             AS meaning_id,
       PTL.title        AS pack_title,
       E.id             AS expression_id,
       P.id             AS phonetic_id

FROM Meanings M
         JOIN Expressions E ON M.id = E.meaning_id
         JOIN Languages L ON E.language_id = L.id
         LEFT JOIN Phonetics P ON E.id = P.expression_id AND :base_language_id = P.language_id
         JOIN PackMeaning PM ON PM.meaning_id = M.id
         LEFT JOIN PackTitleLanguage PTL on PM.pack_id = PTL.pack_id
WHERE L.id IN (:target_language_id, :base_language_id)
  and PTL.language_id = :base_language_id;
    '''

    params = {
        'target_language_id': target_language_id,
        'base_language_id': base_language_id
    }
    cursor.execute(query_language, params)

    res_expressions = cursor.fetchall()
    conn.close()

    # Organize data into a dictionary by packId
    packs = {}
    expressions_key = "expressions"
    for row in res_expressions:
        pack_id, expression_text, expression_sound, language_id, expression_phonetic, meaning_id, pack_title, expression_id, phonetic_id = row
        if pack_id not in packs:
            packs[pack_id] = {"pack_id": pack_id, "pack_title": pack_title}

        if expressions_key not in packs[pack_id]:
            packs[pack_id][expressions_key] = {}

        if meaning_id not in packs[pack_id][expressions_key]:
            packs[pack_id][expressions_key][meaning_id] = {}

        if language_id == target_language_id:
            packs[pack_id][expressions_key][meaning_id]["expression_text"] = expression_text
            packs[pack_id][expressions_key][meaning_id]["expression_sound"] = expression_sound
            packs[pack_id][expressions_key][meaning_id]["language_id"] = language_id
            packs[pack_id][expressions_key][meaning_id]["expression_phonetic"] = expression_phonetic
            packs[pack_id][expressions_key][meaning_id]["phonetic_id"] = phonetic_id
            packs[pack_id][expressions_key][meaning_id]["meaning_id"] = meaning_id
            packs[pack_id][expressions_key][meaning_id]["expression_id"] = expression_id
        if language_id == base_language_id:
            packs[pack_id][expressions_key][meaning_id]["expression_base_text"] = expression_text
            packs[pack_id][expressions_key][meaning_id]["expression_base_sound"] = expression_sound
            packs[pack_id][expressions_key][meaning_id]["language_base_id"] = language_id

    packs_list = []
    for pack_key, pack_value in packs.items():
        expressions_list = []
        expressions_list.append(list(pack_value[expressions_key].values()))
        packs_list.append({"pack_id": pack_value["pack_id"], "pack_title": pack_value["pack_title"], expressions_key: expressions_list})

    return packs_list

@app.route('/create_evaluation', methods=['POST'])
def add_evaluation():
    data = request.get_json()

    # Extract data from the JSON request
    type_ = data.get('type')
    goal = data.get('goal')
    start = datetime.strptime(data.get('start'), '%Y-%m-%dT%H:%M:%S')
    end = datetime.strptime(data.get('end'), '%Y-%m-%dT%H:%M:%S')
    expressions = data.get('expressions', [])

    # Validate data
    if not type_ or not goal or not start or not end or not expressions:
        return jsonify({'error': 'Missing required fields'}), 400

    conn = sqlite3.connect('langum.db')  # Replace 'your_database.db' with your actual database file
    cursor = conn.cursor()

    try:
        # Create and add new evaluation
        cursor.execute('''
            INSERT INTO Evaluations (type, goal, start, end, size)
            VALUES (?, ?, ?, ?, ?)
        ''', (type_, goal, start, end, len(expressions)))

        evaluation_id = cursor.lastrowid

        # Add evaluation expressions
        for expr in expressions:
            expression_id = expr.get('expression_id')
            grade = expr.get('grade')
            duration = expr.get('duration')

            if expression_id is None or grade is None or duration is None:
                conn.rollback()
                return jsonify({'error': 'Missing fields in expressions'}), 400

            cursor.execute('''
                INSERT INTO EvaluationExpression (expression_id, evaluation_id, grade, duration)
                VALUES (?, ?, ?, ?)
            ''', (expression_id, evaluation_id, grade, duration))

        conn.commit()
        return jsonify({'message': 'Evaluation added successfully'}), 201

    except sqlite3.Error as e:
        conn.rollback()
        return jsonify({'error': str(e)}), 500

    finally:
        conn.close()

@app.route('/list_packs', methods=['GET'])
def get_packs_endpoint():
    target_language_id = request.args.get('targetLanguageId')
    base_language_id = request.args.get('baseLanguageId')

    if not target_language_id or not base_language_id:
        return jsonify({'error': 'targetLanguageId and baseLanguageId are required'}), 400

    try:
        target_language_id = int(target_language_id)
        base_language_id = int(base_language_id)
    except ValueError:
        return jsonify({'error': 'Invalid language ID format'}), 400

    packs = get_language_packs(target_language_id, base_language_id)
    return jsonify(packs)

@app.route('/create_phonetic', methods=['POST'])
def create_phonetic():
    data = request.json
    language_id = data.get('languageId')
    expression_id = data.get('expressionId')
    text = data.get('text')

    if not all([language_id, expression_id, text]):
        return jsonify({'error': 'Missing data'}), 400

    try:
        conn = sqlite3.connect('langum.db')  # Replace 'your_database.db' with your actual database file
        cursor = conn.cursor()

        # Check if the phonetic already exists
        cursor.execute('''
                   SELECT id FROM Phonetics WHERE language_id = ? AND expression_id = ?
               ''', (language_id, expression_id))
        phonetic = cursor.fetchone()

        if phonetic:
            conn.close()
            return jsonify({'error': 'Phonetic already exists'}), 409  # Conflict status code
        else:
            cursor.execute('''
                INSERT INTO Phonetics (text, language_id, expression_id)
                VALUES (?, ?, ?)
            ''', (text, language_id, expression_id))
            conn.commit()
            phonetic_id = cursor.lastrowid
            conn.close()
            return jsonify({'id': phonetic_id, 'text': text, 'language_id': language_id, 'expression_id': expression_id}), 201
    except Exception as e:
        return jsonify({'error': str(e)}), 500

@app.route('/update_phonetic_text', methods=['PATCH'])
def update_phonetic_text():
    data = request.json
    phonetic_id = data.get('phoneticId')
    text = data.get('text')

    if not all([phonetic_id, text]):
        return jsonify({'error': 'Missing phoneticId or text'}), 400

    try:
        conn = sqlite3.connect('langum.db')  # Replace 'your_database.db' with your actual database file
        cursor = conn.cursor()

        # Check if the phonetic exists
        cursor.execute('''
            SELECT * FROM Phonetics WHERE id = ?
        ''', (phonetic_id,))
        phonetic = cursor.fetchone()

        if phonetic:
            # Update the phonetic text
            cursor.execute('''
                UPDATE Phonetics SET text = ? WHERE id = ?
            ''', (text, phonetic_id))
            conn.commit()
            conn.close()

            return jsonify({'id': phonetic_id, 'text': text}), 200
        else:
            conn.close()
            return jsonify({'error': 'Phonetic not found'}), 404
    except Exception as e:
        return jsonify({'error': str(e)}), 500

if __name__ == '__main__':
    app.run(debug=True)
