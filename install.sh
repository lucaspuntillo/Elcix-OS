echo "Please make sure this is executed in your home directory."
sleep 10
sudo su
mkdir /home/Elcix/output
git clone https://github.com/HexaOneOfficial/Elcix-OS.git
cd Elcix-OS
PS3='Please enter your distro;'
options=("Arch" "Debian" "Fedora")
select opt in "${options[@]}"
do
    case $opt in
        "Arch")
            cd Arch 
            cp .zshrc .bashrc colormoix.py new ufetch.py wheather.py  /home/Elcix/output
            ;;
        "Debian")
            cd debian
            cp .zshrc .bashrc colormoix.py new ufetch.py wheather.py  /home/Elcix/output
            ;;
        "Fedora")
            cd fedora
            cp .zshrc .bashrc colormoix.py new ufetch.py wheather.py  /home/Elcix/output
            ;;
        *) echo "invalid option $REPLY";;
    esac
done

echo "your compiled output can be found in /home/Elcix/output . You can copy files from there to your home directory, and delete your old dotfiles." 
