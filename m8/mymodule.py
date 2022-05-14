from cgi import print_arguments
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
    
    
def read_test_file():
    name_of_file = input("Enter name of file:");
    file = open(name_of_file, 'w')
    file.write("This is some text");
    file.close();
    file = open('test_file.txt', 'r');
    buf = file.read();
    print(buf);
    file.close()
    
    
def read_html_title():
    
    file = open('index.html','r')
    massive = []
    substr = "title"
    while True:
        buf = file.readline()
        if not buf:
            break
        if substr in buf.strip():
            massive.append(buf.strip())
    file.close()
    for x in massive:
        print(x)
    
        
        
        
        
    
    
    
    