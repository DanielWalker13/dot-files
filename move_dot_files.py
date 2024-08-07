import os
import shutil
import argparse
import datetime

def copy_files(file_list: str, destination: str) -> None:
    """
    Copies files listed in the file_list to the destination directory.

    Args:
    file_list (str): Path to the text file containing the list of files to copy.
    destination (str): Destination directory to copy files to.
    """
    with open(file_list, 'r') as f:
        files = f.read().splitlines()
        for file in files:
            if '*' in file:  # Handle wildcard cases (e.g., .zcompdump-*)
                for item in os.listdir(os.path.expanduser("~")):
                    if item.startswith(file.split('*')[0]):
                        full_item_path = os.path.join(os.path.expanduser("~"), item)
                        if os.path.isfile(full_item_path):
                            copy_file(full_item_path, destination)
            else:
                full_path = os.path.join(os.path.expanduser("~"), file)
                if os.path.exists(full_path):
                    copy_file(full_path, destination)

def copy_file(file_path: str, destination: str) -> None:
    """
    Copies a single file or directory to the destination directory.
    If the file or directory already exists at the destination, it is moved to a backup folder.

    Args:
    file_path (str): Path to the file or directory to copy.
    destination (str): Destination directory to copy the file or directory to.
    """
    dest_path = os.path.join(destination, os.path.basename(file_path))
    backup_folder = os.path.join(destination, "backups", datetime.datetime.now().strftime("%Y-%m-%d"))

    if not os.path.exists(os.path.join(destination, "backups")):
        os.makedirs(os.path.join(destination, "backups"))

    # Move existing file or directory to backup if it exists
    if os.path.exists(dest_path):
        if not os.path.exists(backup_folder):
            os.makedirs(backup_folder)
        shutil.move(dest_path, backup_folder)
        manage_backups(os.path.join(destination, "backups"))

    # Copy the file or directory to the destination
    if os.path.isdir(file_path):
        shutil.copytree(file_path, dest_path, dirs_exist_ok=True)
    else:
        shutil.copy2(file_path, dest_path)

def manage_backups(backup_path: str) -> None:
    """
    Manages the backup folders, keeping only the seven most recent ones.

    Args:
    backup_path (str): Path to the backup folder.
    """
    backups = sorted(
        [d for d in os.listdir(backup_path) if os.path.isdir(os.path.join(backup_path, d))],
        key=lambda x: os.path.getmtime(os.path.join(backup_path, x))
    )

    while len(backups) > 7:
        oldest_backup = backups.pop(0)
        shutil.rmtree(os.path.join(backup_path, oldest_backup))

def main() -> None:
    """
    Main function that parses arguments and coordinates the copying of dotfiles.
    """
    parser = argparse.ArgumentParser(description="Copy dotfiles to a specified destination")
    parser.add_argument('--src', '-s', required=True, help="Source text file containing the list of files to copy")
    parser.add_argument('--dest', '-d', required=True, help="Destination directory to copy files to")
    args = parser.parse_args()

    source = args.src
    destination = os.path.expanduser(args.dest)

    if not os.path.exists(destination):
        os.makedirs(destination)

    print(f"Copying files from {source} to {destination}...")

    # Copy files listed in the source file
    copy_files(source, destination)

    print("Copying complete!")

if __name__ == "__main__":
    main()

