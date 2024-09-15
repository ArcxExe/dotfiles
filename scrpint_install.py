import subprocess
import os

def install_yay():
    # Устанавливаем необходимые зависимости
    print("Установка зависимостей...")
    subprocess.run(['sudo', 'pacman', '-S', '--needed', 'base-devel', 'git'], check=True)

    # Клонируем репозиторий yay
    print("Клонирование репозитория yay...")
    subprocess.run(['git', 'clone', 'https://aur.archlinux.org/yay.git'], check=True)

    # Переходим в директорию yay
    os.chdir('yay')

    # Создаем и устанавливаем пакет yay
    print("Установка yay...")
    subprocess.run(['makepkg', '-si', '--noconfirm'], check=True)

    print("yay успешно установлен!")

def install_packages():
    subprocess.run(['yay','--needed','--noconfirm','-','<','~/Dotfile/pkglist.txt'])
    # try:
    #     with open(pkglist_file, 'r') as file:
    #         packages = file.read().splitlines()
    #
    #     # Установка пакетов через pacman
    #     if packages:
    #         print("Установка пакетов...")
    #         subprocess.run(['sudo', 'pacman', '-S', '--noconfirm'] + packages)
    #         print("Пакеты успешно установлены.")
    #     else:
    #         print("Список пакетов пуст.")
    #
    # except FileNotFoundError:
    #     print(f"Файл {pkglist_file} не найден.")
    # except Exception as e:
    #     print(f"Произошла ошибка: {e}")
    #
def install_hypr_plugins():
    subprocess.run(['hyprpm','update'])
    subprocess.run(["hyprpm", "add" ,"https://github.com/pyt0xic/hyprfocus"],input="y\n",text=True,check=True)
    subprocess.run(['hyprpm','enable','hyprfocus'])
    subprocess.run(['hyprpm','reload'])
    print("Succes")
def move_dir():
    subprocess.run(["sudo","mv",'~/Dotfile/opt/*','/opt/']) #script
    subprocess.run(["sudo",'mv','~/Dotfile/iceberg-dark','/usr/share/foot/themes/'])# foot themes
    subprocess.run(['mv','~/Dotfile/.config/','~/.config/']) #config
    subprocess.run(['mv','~/Dotfile/.tmux.conf',"~/Dotfile/wallpaper/",'~/']) #tmux
    subprocess.run(['git', 'clone', 'https://github.com/tmux-plugins/tpm','~/.tmux/plugins/tpm'])#tmp
    subprocess.run(["sudo",'mv','~/Dotfile/etc/tlp.conf','/etc/',"&&",'tlp','start']) #tlp
    print("Move dir Succes")


if __name__ == '__main__':
    if input("You ready install this dorfile? True/False"):
        print("Installing")
        install_yay()
        install_packages()
        install_hypr_plugins()
        move_dir()
        subprocess.run(["python",'~/.local/bin/wallpapers.py','start'])
