from pathlib import Path

def get_cats_info(path): # функція яка читає файл та повертає список словників з інформацією про кожного кота
    cats_list=[] # список для зберігання словників

    try:
        file_path = Path(path)  #шлях до файлу

        with open(file_path, 'r', encoding='utf-8') as file:  # безпечне відкриття файлу на читання
            for line in file: #цикл для читання кожного рядка
                line = line.strip()  # прибирає пробіли та \n
                if not line:  # пропускає порожні рядки
                    continue

                try:
                    cat_id, name, age = line.split(',')  # розділяє поля
                    cat_dict = {
                        "id": cat_id,
                        "name": name,
                        "age": age
                    }
                    cats_list.append(cat_dict)  # додає словник у список
                except ValueError:
                    print(f"Пропущено некоректний рядок: {line}")
                    continue

        return cats_list  # повертає список словників

    except FileNotFoundError:
        print(f"Файл '{path}' не знайдено.")
        return []
    except Exception as e:
        print(f"Помилка: {e}")
        return []
    
if __name__=="__main__":
    cats = get_cats_info("cats.txt")
    for cat in cats:
        print(f"Cat {cat['name']} (id={cat['id']}) is {cat['age']} years old.")