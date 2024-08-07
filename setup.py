import argparse
import datetime
import json
import logging
import os
import shutil

# Setup directories and constants
DEFAULT_SOURCE_DIR = os.path.join(os.getcwd(), "home_dot_files")
TARGET_DIR = os.path.expanduser("~")
BACKUP_BASE_DIR = os.path.join(TARGET_DIR, "migration_backups")
HISTORY_BASE_DIR = os.path.join(BACKUP_BASE_DIR, "history")
LOG_BASE_DIR = os.path.join(BACKUP_BASE_DIR, "logs")
DATE_TIME = datetime.datetime.now().strftime("%Y%m%d_%H%M")
BACKUP_DIR = os.path.join(BACKUP_BASE_DIR, DATE_TIME)
SYMLINKS_FILE = os.path.join(BACKUP_DIR, "symlinks.txt")
HISTORY_FILE = os.path.join(HISTORY_BASE_DIR, f"{DATE_TIME}.json")

def ensure_directories_exist() -> None:
    """Ensure necessary directories exist."""
    os.makedirs(BACKUP_DIR, exist_ok=True)
    os.makedirs(HISTORY_BASE_DIR, exist_ok=True)
    os.makedirs(LOG_BASE_DIR, exist_ok=True)

# Ensure directories exist
ensure_directories_exist()

# Setup logging
log_file = os.path.join(LOG_BASE_DIR, f"{DATE_TIME}.log")
logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s', handlers=[
    logging.FileHandler(log_file),
    logging.StreamHandler()
])

def read_previous_history() -> list[str]:
    """Read the previous history file to find existing symlinks."""
    prev_symlinks = []
    if os.path.isdir(HISTORY_BASE_DIR):
        prev_history_files = sorted(os.listdir(HISTORY_BASE_DIR), reverse=True)
        if prev_history_files:
            prev_history_file = os.path.join(HISTORY_BASE_DIR, prev_history_files[0])
            logging.info(f"Reading previous history from {prev_history_file}")
            try:
                with open(prev_history_file, 'r') as f:
                    prev_symlinks = list(json.load(f).keys())
            except (json.JSONDecodeError, FileNotFoundError) as e:
                logging.warning(f"No previous history file found or invalid JSON: {e}")
        else:
            logging.warning("No previous history files found.")
    return prev_symlinks

def save_current_symlinks(current_symlinks: list[str]) -> None:
    """Save the current symlinks to a history file."""
    with open(HISTORY_FILE, 'w') as f:
        json.dump({k: i for i, k in enumerate(current_symlinks)}, f, indent=4)
    logging.info(f"Saving current symlinks to {HISTORY_FILE}")

def create_symlink(source_file: str, target_file: str) -> None:
    """Create a symlink from source_file to target_file."""
    if os.path.exists(target_file):
        logging.warning(f"Backing up existing file: {target_file}")
        shutil.move(target_file, BACKUP_DIR)
    logging.info(f"Creating symlink: {target_file} -> {source_file}")
    os.symlink(source_file, target_file)

def log_symlink(source_file: str, target_file: str) -> None:
    """Log the creation of a symlink."""
    with open(SYMLINKS_FILE, 'a') as f:
        f.write(f"{target_file} -> {source_file}\n")

def remove_stale_symlinks(prev_symlinks: list[str], current_symlinks: list[str]) -> None:
    """Remove symlinks that are no longer needed."""
    for prev_symlink in prev_symlinks:
        if prev_symlink not in current_symlinks and os.path.islink(prev_symlink):
            logging.warning(f"Removing stale symlink: {prev_symlink}")
            os.remove(prev_symlink)

def process_symlinks(source_dir: str, target_dir: str) -> list[str]:
    """Process and create symlinks from source_dir to target_dir."""
    current_symlinks = []

    if not os.listdir(source_dir):
        logging.error(f"No files found in the source directory: {source_dir}")
    else:
        for dotfile in os.listdir(source_dir):
            if dotfile in [".", ".."]:
                continue

            source_file = os.path.join(source_dir, dotfile)
            target_file = os.path.join(target_dir, dotfile)
            current_symlinks.append(target_file)

            if os.path.islink(target_file):
                logging.warning(f"Existing symlink will be overwritten: {target_file}")
                os.remove(target_file)

            create_symlink(source_file, target_file)
            log_symlink(source_file, target_file)

    return current_symlinks

def main() -> None:
    # Parse arguments
    parser = argparse.ArgumentParser(description="Symlink dotfiles to home directory")
    parser.add_argument('-s', '--source', type=str, default=DEFAULT_SOURCE_DIR, help='Source directory for dotfiles')
    args = parser.parse_args()
    source_dir = os.path.abspath(args.source)

    prev_symlinks = read_previous_history()
    current_symlinks = process_symlinks(source_dir, TARGET_DIR)
    remove_stale_symlinks(prev_symlinks, current_symlinks)
    save_current_symlinks(current_symlinks)

    logging.info(f"Symlinking complete. Backup and symlink log can be found in {BACKUP_DIR}.")

if __name__ == "__main__":
    main()



# # Default source directory for dot files, relative to the current working directory
# DEFAULT_SOURCE_DIR = os.path.join(os.getcwd(), "home_dot_files")
# TARGET_DIR = os.path.expanduser("~")
# BACKUP_BASE_DIR = os.path.join(TARGET_DIR, "migration_backups")
# HISTORY_BASE_DIR = os.path.join(BACKUP_BASE_DIR, "history")
# LOG_BASE_DIR = os.path.join(BACKUP_BASE_DIR, "logs")

# DATE_TIME = datetime.datetime.now().strftime("%Y%m%d_%H%M")
# BACKUP_DIR = os.path.join(BACKUP_BASE_DIR, DATE_TIME)
# SYMLINKS_FILE = os.path.join(BACKUP_DIR, "symlinks.txt")
# HISTORY_FILE = os.path.join(HISTORY_BASE_DIR, f"{DATE_TIME}.json")

# # Ensure directories exist
# os.makedirs(BACKUP_DIR, exist_ok=True)
# os.makedirs(HISTORY_BASE_DIR, exist_ok=True)
# os.makedirs(LOG_BASE_DIR, exist_ok=True)

# # Setup logging
# log_file = os.path.join(LOG_BASE_DIR, f"{DATE_TIME}.log")
# logging.basicConfig(
#     level=logging.INFO,
#     format="%(asctime)s - %(levelname)s - %(message)s",
#     handlers=[logging.FileHandler(log_file), logging.StreamHandler()],
# )


# # Function to create a symlink
# def create_symlink(source_file, target_file):
#     if os.path.exists(target_file):
#         logging.warning(f"Backing up existing file: {target_file}")
#         shutil.move(target_file, BACKUP_DIR)
#     logging.info(f"Creating symlink: {target_file} -> {source_file}")
#     os.symlink(source_file, target_file)


# # Function to log symlink creation
# def log_symlink(source_file, target_file):
#     with open(SYMLINKS_FILE, "a") as f:
#         f.write(f"{target_file} -> {source_file}\n")


# # Parse arguments
# parser = argparse.ArgumentParser(description="Symlink dotfiles to home directory")
# parser.add_argument(
#     "-s",
#     "--source",
#     type=str,
#     default=DEFAULT_SOURCE_DIR,
#     help="Source directory for dotfiles",
# )
# args = parser.parse_args()
# SOURCE_DIR = args.source

# # Convert SOURCE_DIR to absolute path
# SOURCE_DIR = os.path.abspath(SOURCE_DIR)


# # Read previous history file
# def read_previous_history():
#     prev_symlinks = []
#     if os.path.isdir(HISTORY_BASE_DIR):
#         prev_history_files = sorted(os.listdir(HISTORY_BASE_DIR), reverse=True)
#         if prev_history_files:
#             prev_history_file = os.path.join(HISTORY_BASE_DIR, prev_history_files[0])
#             logging.info(f"Reading previous history from {prev_history_file}")
#             try:
#                 with open(prev_history_file, "r") as f:
#                     prev_symlinks = list(json.load(f).keys())
#             except (json.JSONDecodeError, FileNotFoundError) as e:
#                 logging.error(f"Error reading previous history file: {e}")
#     return prev_symlinks


# # Save current symlinks to history file
# def save_current_symlinks(current_symlinks):
#     with open(HISTORY_FILE, "w") as f:
#         json.dump({k: i for i, k in enumerate(current_symlinks)}, f, indent=4)
#     logging.info(f"Saving current symlinks to {HISTORY_FILE}")


# # Main function to handle symlinking
# def main():
#     prev_symlinks = read_previous_history()
#     current_symlinks = []

#     if not os.listdir(SOURCE_DIR):
#         logging.error(f"No files found in the source directory: {SOURCE_DIR}")
#     else:
#         for dotfile in os.listdir(SOURCE_DIR):
#             if dotfile in [".", ".."]:
#                 continue

#             source_file = os.path.join(SOURCE_DIR, dotfile)
#             target_file = os.path.join(TARGET_DIR, dotfile)
#             current_symlinks.append(target_file)

#             if os.path.islink(target_file):
#                 logging.warning(f"Existing symlink will be overwritten: {target_file}")
#                 os.remove(target_file)

#             create_symlink(source_file, target_file)
#             log_symlink(source_file, target_file)

#     # Remove stale symlinks
#     for prev_symlink in prev_symlinks:
#         if prev_symlink not in current_symlinks and os.path.islink(prev_symlink):
#             logging.error(f"Removing stale symlink: {prev_symlink}")
#             os.remove(prev_symlink)

#     save_current_symlinks(current_symlinks)
#     logging.info(
#         f"Symlinking complete. Backup and symlink log can be found in {BACKUP_DIR}."
#     )


# if __name__ == "__main__":
#     main()
