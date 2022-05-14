from datetime import date
from datetime import datetime


def date_time():
    print(datetime.now());
    
def numbers():
    str_of_numbers = input("Enter:");
    print("Entered number - " + ((str)((str_of_numbers))))
    list_of_numbers=[]
    for i in str_of_numbers:
        if i != " ":
            list_of_numbers.append(i)    
    print("List of numbers - " + ((str)(list_of_numbers)))
    tuple_of_numbers=(list_of_numbers);
    print("Tuple of numbers -" + ((str)(tuple_of_numbers)))
    
    