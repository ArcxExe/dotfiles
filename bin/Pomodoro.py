from datetime import datetime
import time
from colorama import Fore
import subprocess
import os
import sys


def hide_cursor():
    sys.stdout.write("\033[?25l")
    sys.stdout.flush()


def show_cursor():
    sys.stdout.write("\033[?25h")
    sys.stdout.flush()


def send_notify(text: str, title: str) -> None:
    subprocess.run(["notify-send", title, text])


def current_time(stop_time=0):
    current_datetime = datetime.now()
    current_hour = current_datetime.hour
    current_minute = current_datetime.minute
    if stop_time == 0:
        print(
            f"{Fore.BLUE}Now time:{Fore.RESET}{Fore.MAGENTA} {current_hour}:{current_minute:02}{Fore.RESET}"
        )
    elif stop_time == 10:
        return f"{current_hour}:{current_minute}"
    else:
        stop_minute = stop_time % 60
        stop_hour = stop_time // 60
        if current_minute + stop_minute >= 60:
            end_time_minute = (current_minute + stop_minute) % 60
            return f"we'll finish: {current_hour+stop_hour+1}:{end_time_minute:02}"
        return f"{Fore.BLUE}we'll finish:{Fore.RESET}{Fore.MAGENTA} {current_hour+stop_hour}:{current_minute+stop_minute:02}{Fore.RESET}"


def work():
    print(Fore.CYAN, "--" * 10, Fore.RESET)
    print(Fore.RED + "Start work!" + Fore.RESET)
    global stop_minute
    current_time()
    stop_minute = int(
        input(f"{Fore.BLUE}How many minutes will one session last?{Fore.RESET} ")
    )
    print(current_time(stop_minute))
    # a = stop_minute
    print(f"{Fore.CYAN}Start session Pomodoro!{Fore.RESET}")
    while stop_minute != 0:
        time.sleep(60)  
        stop_minute = stop_minute - 1
        if not stop_minute == 1 and not stop_minute == 0:
            print(
                f"{Fore.YELLOW}Left :{Fore.MAGENTA} {stop_minute} min {Fore.RESET}"
            )
        else:
            print(
                f"{Fore.YELLOW}Left:{Fore.MAGENTA} {stop_minute}  min {Fore.RESET}"
            )

    send_notify("💤 It's time to rest! ", "⏲️ Pomodoro timer")


def sleep():
    print(Fore.LIGHTBLUE_EX, "--" * 10, Fore.RESET)
    print(f"{Fore.RED}Good work!{Fore.RESET}")
    stop_sleep = int(input(f"{Fore.BLUE}How many minutes will we rest?{Fore.RESET}"))
    while stop_sleep != 0:
        time.sleep(60)  # FIX:
        stop_sleep = stop_sleep - 1
        print(
            f"{Fore.YELLOW}Left:{Fore.RESET}{Fore.MAGENTA} {stop_sleep} min {Fore.RESET}"
        )
    send_notify("  Start work", " Pomodoro Timer")
    os.system("clear")


def pomodoro_timer():
    session = int(input(f"{Fore.BLUE}Phow many sessions will there be Pomodoro?{Fore.RESET} "))
    for i in range(session):
        os.system("clear")
        print(
            f"{Fore.BLUE}session number {Fore.RESET} {Fore.GREEN}{i+1} {Fore.RESET}"
        )
        work()
        sleep()
    else:
        work()
    print(Fore.GREEN + "Work is end." + Fore.RESET)


def toggl_timer():
    start_time = current_time(stop_time=10)
    seconds = 0
    desc = input(f"{Fore.BLUE} What will you do now? ")
    try:
        while True:
            hide_cursor()
            os.system("clear")
            seconds += 1
            print(f"{Fore.BLUE}{desc}{Fore.RESET}")
            # print(f"{Fore.MAGENTA}{seconds}{Fore.RESET}")
            minutes, second = divmod(seconds, 60)
            hours, minutes = divmod(minutes, 60)
            print(f"{Fore.GREEN}{hours:02d}:{minutes:02d}:{second:02d}{Fore.RESET}")
            time.sleep(1)
    except:
        show_cursor()
        os.system("clear")
        print(f"{Fore.BLUE}You started in {Fore.RESET} {Fore.GREEN}{start_time}")
        print(
            f"{Fore.BLUE}You've worked {Fore.RESET}{Fore.GREEN}{hours:02d}:{minutes:02d}:{second:02d}{Fore.RESET}"
        )


if __name__ == "__main__":
    if "pomo" in sys.argv:
        pomodoro_timer()
    elif "toggl" in sys.argv:
        toggl_timer()
    else:
        print(
            f"After the file name, select which timer you want to use \n \t{Fore.BLUE}Pomodoro Timer => ...{Fore.MAGENTA} pomo{Fore.BLUE} \n\tToggl Timer => ...{Fore.MAGENTA} toggl {Fore.RESET}"
        )
