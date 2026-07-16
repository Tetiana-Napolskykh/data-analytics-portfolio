def caching_fibonacci():
    cache = {} # порожній словник для кешу

    def finobacci(n): #oбчислює n-те число Фібоначчі з кешуванням
        if n<=0:
            return 0
        if n==1:
            return 1 # перевірка, чи значення вже є у кеші
        if n in cache:
            return cache[n]
        cache [n]= finobacci(n-1)+finobacci(n-2) # рекурсивний виклик для обчислення числа Фібоначчі
        return cache[n]
    
    return finobacci 

fib= caching_fibonacci()

'''Обчислення чисел Фібоначчі'''
print(fib(10))
print(fib(15))
print(fib(20)) 












