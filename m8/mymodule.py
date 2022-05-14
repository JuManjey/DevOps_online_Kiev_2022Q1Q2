from cgi import print_arguments
from datetime import date
from datetime import datetime
from emoji import emojize
import demoji
import re
import pickle
import platform

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
    
    
def emoji_converter():
    import emoji
    import re
    str1 = "he was, confused, and but, I smile after, sleeping"
    opt = re.sub(r'[^\w\s]','', str1)
    massive = opt.split();
    for i in range (len(massive)):
        RE_EMOJI = re.compile('[\U00010000-\U0010ffff]', flags=re.UNICODE)
        emoj_str = RE_EMOJI.sub(r'', massive[i])
        print(emoj_str)
        if (emoji.emojize(massive[i], language='alias')):
            print(":"+(emoji.emojize(massive[i], language='alias')+":"))
        else:
            print(massive[i])
            
def  emoji_converter2():
     import emoji
     import re
     message = 'he was happy and lol I smile mermaid sleeping'
     
     words = message.split( " ")
     emojis = {
        ":)" : "😀",
        ":(" : "😞",
        "lol" : "😂",
        "sick":"😨",
        "happy": "😀",
        "mermaid": "🧜‍"
     }
     outcome = " "
     for word in words:
        outcome += emojis.get(word, word) + " "
     print(outcome)

def pc_icnfo():
    import platform
    print(platform.machine())
    print(platform.version())
    print(platform.platform())
    print(platform.uname())
    print(platform.system())
    print(platform.processor())

