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

from console_inputs import create_pack_meanings_from_json, create_expressions_from_json
from shared.file_utils import file_exists
from shared.json_utils import save_json_file

app = Flask(__name__)
CORS(app)  # This will enable CORS for all routes JUST FOR WEB mobile we can delete it


def run_flask_server():
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

    db_info = {"ip": ip_address, "port": port}

    save_json_file(db_info, filename_no_extension, folder_path)

    print("db ip port were saved to:")
    print(f"{folder_path}{filename_no_extension}.json")

    app.run(host=ip_address, port=port)


if __name__ == '__main__':
    # run_flask_server()
    # create_pack_meanings_from_json()
    create_expressions_from_json()
    # generate_all_language_sounds('portuguese')
