This Bash script is a **File Permissions Manager** designed to help users change file and directory permissions on a Linux system using numeric permission codes (e.g., `777`, `644`). Here's a breakdown of how the script works:

### Key Features:

1. **Help Menu**:
   - The script includes a `display_help` function that explains how numeric permission codes work. It shows the breakdown of permissions for user, group, and others, and gives examples of how the numeric values correspond to permissions like `rwx` (read, write, execute).

2. **Main Functionality**:
   - The script runs in a loop, allowing the user to select a file or directory, view its current permissions, and change them using a numeric code.

3. **File/Directory Selection**:
   - The user is prompted to enter the name of a file or directory.
   - The script checks if the input is valid (i.e., if it is a file or directory) and displays its current permissions.

4. **Current Permission Display**:
   - The script breaks down the file or directory's permissions into user, group, and other categories, and shows whether each has read, write, or execute permissions.

5. **Changing Permissions**:
   - The user is prompted to enter a 3-digit numeric permission code (e.g., `755`), which is then validated. If valid, the permissions are changed using the `chmod` command.
   - The script checks if the permission change was successful and notifies the user.

6. **Repeat or Exit**:
   - After each permission change, the user is given the option to change another file's permissions or exit the script.

### Example Usage Flow:
1. User enters a file or directory name.
2. The script shows the current permissions.
3. The user enters a 3-digit numeric code (e.g., `644`) to change the permissions.
4. The script updates the permissions and confirms the change.
5. The user can choose to manage another file or exit.

This script simplifies permission management by guiding users through the process and providing clear feedback and validation.
