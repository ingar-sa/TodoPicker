import random

def write_todo(new_todo, file_name):
    with open(file_name, 'a') as file:
        file.write(f"{new_todo}\n")

def pull_todo(file_name):
    with open(file_name, 'r+') as file:
        lines = file.readlines()

    if len(lines) == 0:
        return "List empty"

    todo = lines.pop(random.randint(0, len(lines) - 1))

    with open(file_name, 'w') as file:
        file.writelines(lines)

    return todo

# TODO(ingar): Add support for only removing the file from the list when the user says it has been completed
def main():
    file_name = input("Hello. Enter the file name of the todo list: ") + ".txt"
    while True:
        user_input = input("\n\nWrite 'add' to add a new todo.\nWrite 'pull' to pull a todo.\nWrite 'file' to choose another todo list.\nWrite 'exit' to exit.\n\n > ")
        if user_input == "add":
            new_todo = input("\nEnter the todo: ")
            if not new_todo == "":
                write_todo(new_todo, file_name)
        elif user_input == "pull":
            random_todo = pull_todo(file_name)
            print(f"\nYour new todo is: {random_todo}")
        elif user_input == "file":
            file_name = input("\nEnter the file name of the todo list: ") + ".txt"
        elif user_input == "exit":
            exit()

if __name__ == "__main__":
    main()

