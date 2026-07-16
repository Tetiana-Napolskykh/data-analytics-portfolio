def input_error(func): #декоратор, обробка помилок
    def inner(*args, **kwargs): #внутрішня функція
        try:
            return func(*args, **kwargs)
        except (ValueError, KeyError, IndexError) as e:
            return f"Error: {e}"
    return inner

def parse_input(user_input):  # Розбиває рядок введення на команду та аргументи
    parts = user_input.strip().split()
    if not parts:
        return "", []
    cmd, *args = parts
    return cmd.lower(), args 

@input_error
def add_contact(args, contacts):  # Додає новий контакт або перезаписує існуючий
    name, phone = args
    contacts[name] = phone
    return "Contact added."

@input_error
def change_contact(args, contacts):  # Змінює номер телефону існуючого контакту
    name, phone = args
    contacts[name] = phone
    return "Contact updated."
  
@input_error
def show_phone(args, contacts):  # Показує номер телефону по імені
    name = args[0]
    return contacts[name]
    
@input_error
def show_all(contacts):  # Показує всі контакти з номерами
    if not contacts:
        return "No contacts saved."
    return "\n".join(f"{name}: {phone}" for name, phone in contacts.items())

def main():
    contacts = {}  # словник контактів
    print("Welcome to the assistant bot!")

    while True:
        user_input = input("Enter a command: ")
        command, args = parse_input(user_input)

        if command in ["close", "exit"]:
            print("Good bye!")
            break
        elif command == "hello":
            print("How can I help you?")
        elif command == "add":
            print(add_contact(args, contacts))
        elif command == "change":
            print(change_contact(args, contacts))
        elif command == "phone":
            print(show_phone(args, contacts))
        elif command == "all":
            print(show_all(contacts))
        else:
            print("Invalid command.")

if __name__ == "__main__":
    main()
    