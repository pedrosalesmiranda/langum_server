"""
TODO
- initialize database conn cursor modulo scope not init all the time
- can be class
"""

import json
import re
from datetime import datetime
import socket
import shared.constants

from flask import Flask, send_from_directory, request, abort, jsonify
from flask_cors import CORS

from shared.file_utils import file_exists
from shared.json_utils import save_json_file

app = Flask(__name__)
CORS(app)  # This will enable CORS for all routes JUST FOR WEB mobile we can delete it

if __name__ == '__main__':

    filename_no_extension = shared.constants.FILENAME_NO_EXTENSION
    folder_path = shared.constants.TARGET_FOLDER_PATH_DB_INFO
    default_port_number = shared.constants.DEFAULT_PORT_NUMBER

    hostname = socket.gethostname()
    ip_address = socket.gethostbyname(hostname)

    print("Hostname:", hostname)
    print("IP:", ip_address)

    port = input("select PORT NUMBER - press enter for default 8888\n")
    if port == "":
        port = default_port_number

    db_ip_port = f"{ip_address}:{port}"
    db_info = {"ip": ip_address, "port": port}

    save_json_file(filename_no_extension, db_info, folder_path)

    print("db ip port were saved to:")
    print(f"{folder_path}{filename_no_extension}.json")

    app.run(host=ip_address, port=port)

# insert_expressions_console()

# generate_all_language_sounds('portuguese')

