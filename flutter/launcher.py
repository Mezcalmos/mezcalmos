from sys import argv , platform
exec_           = lambda c:__import__("os").system(c)
get_lan_ip      = lambda: __import__("socket").gethostbyname(socket.gethostname())

app             = "taxi"
web             = False
lanhost         = False

# Default NT (win) #################
_clear_ = "cls"
####################################

if not platform.startswith('win') and self.os != 'nt':
    print("[OS] Running on none Windows OS!")
    _clear_ = "clear"
else :
    print("[OS] Running on Windows!");



def Usage():
    print(f"Usage: {argv[0]} --app=[default=taxi] --web=[default=false] --lan=[default=false]")

def Launch():
    _web        = "-d chrome " if web else ""
    _lanhost    = f" --dart-define=HOST={lanhost} " if lanhost else ""
    exec_(f"flutter run {_web}--dart-define=APP_SP={app}{_lanhost}")

if('--help' in argv):
    Usage()
    exit(0)

exec_(_clear_)

if(argv.__len__() == 1):
    exec_(f"flutter run --dart-define=APP_SP={app}")
else:
    for arg in argv[1:]:
        if arg.startswith('--app='):
            app=arg.split('=')[1]
        
        elif arg.startswith('--web='):
            web = True if arg.split('=')[1] == "true" else False
        
        elif arg.startswith('--lan='):
            lanhost = True if arg.split('=')[1] == "true" else False

    # Simple NAND to make sure everything in place !
    if not (web & lanhost):
        Launch()
    else:
        print("[!] Err > Building for web means --lan=false !")
        ans = input("Would you like to fix it ? y/n > ")
        if ans == "y":
            lanhost = not lanhost
            Launch()
        else:
            exit(-1)
