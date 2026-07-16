"""
Create a function get_days_from_today(date)
 that calculates the number of days between 
 a given date and the current date.
 """

from datetime import datetime 

def get_days_from_today(date): 

    try:
        target_data=datetime.strptime(date, "%Y-%m-%d").date()
        today=datetime.today().date() 
        delta=today-target_data 
        return delta.days
    
    except ValueError:
        return ValueError ("Incorrect date format. Expected 'YYYY-MM-DD'")
    
print(get_days_from_today("2025-09-28"))
print(get_days_from_today("1985-05-30"))


"""
Write a function get_numbers_ticket(min, max, quantity)
 that helps generate a set of unique random numbers 
 for a lottery within the given parameters.
"""

import random

def get_numbers_ticket(min_val, max_val, quantity):
    
    if not (1<=min_val<=max_val<=1000 and 1<=quantity<=(max_val-min_val+1)):
        return[]
    
    numbers=random.sample(range(min_val, max_val+1), quantity)
    numbers.sort()
    return numbers

lottery_numbers = get_numbers_ticket(1, 49, 6)
print('Your lottery numbers:', lottery_numbers)

print(get_numbers_ticket(10, 5, 3))
print(get_numbers_ticket(1, 36, 5))



"""
Create a function normalize_phone(phone_number) 
that normalizes phone numbers to a standard format, 
keeping only digits and the '+' symbol at the beginning.
"""
import re

def normalize_phone(phone_number):
    phone_number=re.sub(r'[^\d]','', phone_number)

    if phone_number.startswith('+380'):
        return phone_number
    
    elif phone_number.startswith('380'):
        return '+' + phone_number
    
    else:
        return '+38' + phone_number
    
numbers = [
    "067123 4567",
    "(095) 234-5678",
    "+380 44 123 4567",
    "380501234567",
    "    +38(050)123-32-34",
    "     0503451234",
    "(050)8889900",
    "38050-111-22-22",
    "38050 111 22 11   "]

sanitized_numbers = [normalize_phone(num) for num in numbers]
print("Normalized phone numbers for SMS distribution:", sanitized_numbers)
