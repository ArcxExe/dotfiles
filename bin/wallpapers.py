import os
import random
import subprocess
import sys
import json
path_wallpaper = f"/home/{list(os.uname())[1]}/wallpaper/"
name_dir_wallpaper = "wallpaper"
# path to wallpaper /home/{USER}/path/to/wallpaper
path_file = f"/home/{list(os.uname())[1]}/.config/hypr/hyprpaper.conf"
# path to hyprpaper /home/{USER}/path/to/hyprpaper

def get_monitor_info():
    try:
        # Выполняем команду xrandr и получаем вывод
        output = subprocess.check_output(['xrandr'], universal_newlines=True)
        # Обрабатываем вывод, чтобы найти названия мониторов
        for line in output.splitlines():
            if ' connected ' in line:
                # Извлекаем название монитора
                monitor_name = line.split(' ')[0]
                return monitor_name
    except subprocess.CalledProcessError as e:
        print(f"Ошибка при выполнении команды xrandr: {e}")


def start():
    os.system("pkill hyprpaper")
    subprocess.Popen(
        ["nohup", "/usr/bin/hyprpaper"],
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE,
        stdin=subprocess.PIPE,
    )


def write_config(file):
    with open(path_file, "w") as f:
        f.write(
            f"preload = {path_wallpaper}{file} \nwallpaper = {get_monitor_info()},{path_wallpaper}{file}\nsplash = false"
        )
        # f.write(
        #             f"preload = {path_wallpaper}{file} \nwallpaper = HDMI-A-1,{path_wallpaper}{file}\nsplash = false"
        #     )
    start()


def index_wallpapers(state=None):
    with open(path_file, "r") as conf:
        try:
            index_last_wallpaper = os.listdir(path_wallpaper).index(
                conf.readline().strip().split("/")[-1]  # Получаем последнее изображение
            )  # Получаем индекс из этого изображения
        except ValueError:
            index_last_wallpaper = 0
    try:
        next_wallpaper = os.listdir(path_wallpaper)[index_last_wallpaper + 1]
    except IndexError:
        next_wallpaper = os.listdir(path_wallpaper)[0]
    if state == "next":
        return str(next_wallpaper)
    else:
        with open(path_file, "r") as conf:
            return conf.readline().strip().split("/")[-1]


def wallpaper_next():
    os.system("pkill hyprpaper")

    write_config(index_wallpapers("next"))


def wallpaper_random():
    os.system("pkill hyprpaper")

    random_file = random.choice([f for f in os.listdir(path_wallpaper)])
    write_config(random_file)


if __name__ == "__main__":
    if len(sys.argv) == 1 or "next" in sys.argv:
        wallpaper_next()
    elif "random" in sys.argv:
        wallpaper_random()
    elif "start" in sys.argv:
        start()
    elif "index" in sys.argv:
        # print(get_monitor_info())
        print(path_wallpaper+index_wallpapers())
    elif "remove" in sys.argv:
        os.remove(f"/home/arcx/wallpaper/{index_wallpapers()}")

        wallpaper_next()
    elif "set" in sys.argv:
        if name_dir_wallpaper in sys.argv[2]:
            write_config(sys.argv[2].split("/")[1])
        else:
            write_config(sys.argv[2])

    else:
        print(
            """
        python wallpaper.py <options>
        
        Option
        
        index - return name current wallpaper
        remove - remove current wallpaper
        set <path to wallpaper> - set wallpaper 
        random - seting random wallpaper choice wallpaper-dir
        start - starting hyprpaper 
        next - seting next wallpaper
        """
        )
