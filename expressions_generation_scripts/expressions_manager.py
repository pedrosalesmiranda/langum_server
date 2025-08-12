#!/usr/bin/env python3

import os
import sys
sys.path.append('..')
import database_api
from console_inputs import create_all_from_jsons
import json

target_language = "russian"
base_language = "english"
pack_meanings_to_keep = "C:/Users/psm19/PSM_DRIVE/PROG/TOP_PROJS/LANGUM/langum_server/expressions_generation_scripts/jsons/inputs/pack_meanings_to_keep"
meanings_jsons_folder_path = f"{pack_meanings_to_keep}/{target_language}_4_{base_language}"
reviewed_phonetics_jsons_folder_path ="C:/Users/psm19/PSM_DRIVE/PROG/TOP_PROJS/LANGUM/langum_server/database/reviewed_phonetics"
selected_meanings_file = ""
reviewed_phonetics_file = ""


def get_pack_meanings_files():
    try:
        files = os.listdir(meanings_jsons_folder_path)
        pack_meanings_files = [f for f in files if 'pack_meanings' in f and f.endswith('.json')]
        return pack_meanings_files
    except FileNotFoundError:
        print(f"Error: Directory '{meanings_jsons_folder_path}' not found")
        return []
    except Exception as e:
        print(f"Error reading directory: {e}")
        return []

def select_meanings_file():
    """Show submenu to select a pack_meanings file"""
    global selected_meanings_file
    
    pack_meanings_files = get_pack_meanings_files()
    
    if not pack_meanings_files:
        print("No pack_meanings files found in the directory")
        return
    
    print("\nAvailable pack_meanings files:")
    print("=" * 40)
    
    for i, filename in enumerate(pack_meanings_files, 1):
        print(f"{i}. {filename}")
    
    try:
        choice = input(f"\nSelect file (1-{len(pack_meanings_files)}): ").strip()
        choice_num = int(choice)
        
        if 1 <= choice_num <= len(pack_meanings_files):
            selected_meanings_file = pack_meanings_files[choice_num - 1]
            print(f"Selected file: {selected_meanings_file}")
        else:
            print(f"Invalid choice. Please enter 1-{len(pack_meanings_files)}")
    except ValueError:
        print("Invalid input. Please enter a number.")
    except KeyboardInterrupt:
        print("\nOperation cancelled")

def process_selected_file():
    """Process the selected meanings file using create_all_from_jsons"""
    global selected_meanings_file, meanings_jsons_folder_path, target_language, base_language
    
    if not selected_meanings_file:
        print("No meanings file selected. Please select a file first (Option 1).")
        return
    
    file_path = f"{meanings_jsons_folder_path}/{selected_meanings_file}"
    
    print(f"Processing file: {selected_meanings_file}")
    print(f"Full path: {file_path}")
    print(f"Target language: {target_language}")
    print(f"Base language: {base_language}")
    
    try:
        create_all_from_jsons(file_path, target_language, base_language)
        print("Processing completed successfully!")
    except Exception as e:
        print(f"Error processing file: {e}")


def set_languages():
    """Set target and base languages"""
    global target_language, base_language, meanings_jsons_folder_path, selected_meanings_file
    
    print("\nCurrent languages:")
    print(f"Target language: {target_language}")
    print(f"Base language: {base_language}")
    
    try:
        new_target = input(f"\nEnter target language (current: {target_language}): ").strip()
        if new_target:
            target_language = new_target
        
        new_base = input(f"Enter base language (current: {base_language}): ").strip()
        if new_base:
            base_language = new_base
        
        # Update folder path based on new languages
        meanings_jsons_folder_path= f"{pack_meanings_to_keep}/{target_language}_4_{base_language}"
        
        # Clear selected file since folder path changed
        selected_meanings_file = ""
        
        print(f"\nLanguages updated:")
        print(f"Target language: {target_language}")
        print(f"Base language: {base_language}")
        print(f"Updated folder path: {meanings_jsons_folder_path}")
        print("Note: Selected file cleared due to path change. Please select a new file.")
        
    except KeyboardInterrupt:
        print("\nOperation cancelled")

def createLanguagePackTitle():
    """Create language pack title"""
    global base_language
    try:
        database_api.copyDescriptionEngToLanguagePackTitle(base_language)
    except Exception as e:
        print(f"Error creating language pack titles: {e}")

def get_reviewed_phonetics_files():
    """Get list of reviewed phonetics files"""
    try:
        files = os.listdir(reviewed_phonetics_jsons_folder_path)
        phonetics_files = [f for f in files if f.endswith('.json')]
        return phonetics_files
    except FileNotFoundError:
        print(f"Error: Directory '{reviewed_phonetics_jsons_folder_path}' not found")
        return []
    except Exception as e:
        print(f"Error reading directory: {e}")
        return []

def select_reviewed_phonetics_file():
    """Show submenu to select a reviewed phonetics file"""
    global reviewed_phonetics_file
    
    phonetics_files = get_reviewed_phonetics_files()
    
    if not phonetics_files:
        print("No reviewed phonetics files found in the directory")
        return
    
    print("\nAvailable reviewed phonetics files:")
    print("=" * 40)
    
    for i, filename in enumerate(phonetics_files, 1):
        print(f"{i}. {filename}")
    
    try:
        choice = input(f"\nSelect file (1-{len(phonetics_files)}): ").strip()
        choice_num = int(choice)
        
        if 1 <= choice_num <= len(phonetics_files):
            reviewed_phonetics_file = f"{reviewed_phonetics_jsons_folder_path}/{phonetics_files[choice_num - 1]}"
            print(f"Selected file: {phonetics_files[choice_num - 1]}")
        else:
            print(f"Invalid choice. Please enter 1-{len(phonetics_files)}")
    except ValueError:
        print("Invalid input. Please enter a number.")
    except KeyboardInterrupt:
        print("\nOperation cancelled")

def import_expressions_from_json():
    """Import phonetics from JSON file and update existing expressions in database"""
    global reviewed_phonetics_file
    
    if not reviewed_phonetics_file:
        print("No reviewed phonetics file selected. Please select a file first.")
        return
    
    if not os.path.exists(reviewed_phonetics_file):
        print(f"Error: File '{reviewed_phonetics_file}' not found.")
        return
    
    try:
        # Read JSON file
        with open(reviewed_phonetics_file, 'r', encoding='utf-8') as f:
            phonetics_data = json.load(f)
        
        print(f"Loaded {len(phonetics_data)} phonetic entries from {reviewed_phonetics_file}")
        
        # Get all expressions from database for performance optimization
        print("Fetching all expressions from database...")
        expression_map = database_api.get_all_expressions_text_and_id()
        print(f"Found {len(expression_map)} expressions in database")
        
        # Import phonetics using database_api logic
        import sqlite3
        from phonetic_scripts.ipa_phonetics import ipa_to_portuguese_phonetic_gpt_o3
        
        conn = sqlite3.connect(database_api.database_file_path)
        cursor = conn.cursor()
        
        updated_count = 0
        not_found_count = 0
        
        for entry in phonetics_data:
            expression_text = entry['expression_text']
            phonetic_text = entry['phonetic_text']
            
            # Check if expression exists in database
            if expression_text not in expression_map:
                print(f"Expression '{expression_text}' not found in database.")
                not_found_count += 1
                continue
            
            expression_id = expression_map[expression_text]

            # Check if phonetic already exists
            cursor.execute("""
                SELECT id FROM Phonetics
                WHERE expression_id = ?
            """, (expression_id,))
            phonetic_id = cursor.fetchone()
            
            if phonetic_id:
                # Update existing phonetic
                cursor.execute("""
                    UPDATE Phonetics
                    SET text = ?
                    WHERE id = ?
                """, (phonetic_text, phonetic_id[0]))
                print(f"Updated phonetic for '{expression_text}': {phonetic_text}")
                updated_count += 1
                conn.commit()

        conn.close()
        
        print(f"\nImport completed successfully!")
        print(f"- Updated: {updated_count} phonetics")
        
    except FileNotFoundError:
        print(f"Error: File '{reviewed_phonetics_file}' not found.")
    except json.JSONDecodeError as e:
        print(f"Error parsing JSON file: {e}")
    except Exception as e:
        print(f"Error importing phonetics: {e}")

def main():
    print("Expressions Manager CLI")
    print("=" * 30)
    print(f"Current folder path: {meanings_jsons_folder_path}")
    print(f"Selected meanings file: {selected_meanings_file if selected_meanings_file else 'None'}")
    print(f"Selected phonetics file: {reviewed_phonetics_file if reviewed_phonetics_file else 'None'}")
    print(f"Target language: {target_language}")
    print(f"Base language: {base_language}")
    
    while True:
        print("\nOptions:")
        print("1. Select pack_meanings file")
        print("2. Set target and base languages")
        print("3. Process selected file")
        print("4. Create language pack title")
        print("5. Select reviewed phonetics file")
        print("6. Import phonetics from JSON")
        print("7. Exit")
        
        try:
            choice = input("\nEnter your choice (1-7): ").strip()
            
            if choice == "1":
                select_meanings_file()
            elif choice == "2":
                set_languages()
            elif choice == "3":
                process_selected_file()
            elif choice == "4":
                createLanguagePackTitle()
            elif choice == "5":
                select_reviewed_phonetics_file()
            elif choice == "6":
                import_expressions_from_json()
            elif choice == "7":
                print("Goodbye!")
                break
            else:
                print("Invalid choice. Please enter 1-7.")
        except KeyboardInterrupt:
            print("\nGoodbye!")
            break
        except EOFError:
            break

if __name__ == "__main__":
    main()