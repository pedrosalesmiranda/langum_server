#!/usr/bin/env python3

import os
from console_inputs import create_all_from_jsons

target_language = "russian"
base_language = "english"
pack_meanings_to_keep = "C:/Users/psm19/PSM_DRIVE/PROG/TOP_PROJS/LANGUM/langum_server/expressions_generation_scripts/jsons/inputs/pack_meanings_to_keep"
meanings_jsons_folder_path = f"{pack_meanings_to_keep}/{target_language}_4_{base_language}"
selected_meanings_file = ""


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

def main():
    print("Expressions Manager CLI")
    print("=" * 30)
    print(f"Current folder path: {meanings_jsons_folder_path}")
    print(f"Selected meanings file: {selected_meanings_file if selected_meanings_file else 'None'}")
    print(f"Target language: {target_language}")
    print(f"Base language: {base_language}")
    
    while True:
        print("\nOptions:")
        print("1. Select pack_meanings file")
        print("2. Set target and base languages")
        print("3. Process selected file")
        print("4. Exit")
        
        try:
            choice = input("\nEnter your choice (1-4): ").strip()
            
            if choice == "1":
                select_meanings_file()
            elif choice == "2":
                set_languages()
            elif choice == "3":
                process_selected_file()
            elif choice == "4":
                print("Goodbye!")
                break
            else:
                print("Invalid choice. Please enter 1-4.")
        except KeyboardInterrupt:
            print("\nGoodbye!")
            break
        except EOFError:
            break

if __name__ == "__main__":
    main()