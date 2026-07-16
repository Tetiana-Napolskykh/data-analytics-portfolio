from pathlib import Path

def total_salary(path): #функція яка аналізує файл і повертає загальну та середню суму заробітної плати всіх розробників
    try: # блок обробки помилок
        file_path=Path(path) #шлях до файлу

        with open(file_path, 'r', encoding='utf-8') as file: # безпечне відкриття файлу на читання
            total=0
            count=0

            for line in file: #цикл для читання кожного рядка
                line=line.strip() # прибирає пробіли та \n
                if not line: # пропускає порожні рядки
                    continue
        
                try:
                    name, salary=line.split(',') #розділяє ім’я і зарплату за комою
                    total += int(salary) # додає зарплату до суми
                    count += 1 # додає зарплату до суми
                except ValueError:# рядок має неправильний формат
                    print(f"Пропущено некоректний рядок: {line}")
                    continue

        if count == 0: #у файлі немає правильних рядків
            return (0, 0) # повертає нульові значення

        average = total / count #обчислює середнє
        return total, average

    except FileNotFoundError:
        print(f"Файл '{path}' не знайдено.") # файл відсутній
        return (0, 0) # повертає нульові значення
    except Exception as e:
            print(f"Помилка: {e}") #помилка
            return (0, 0) # повертає нульові значення
    
if __name__=="__main__":
    total,average = total_salary('salary.txt')
    print(f'Sum:{total},avg:{average}')
