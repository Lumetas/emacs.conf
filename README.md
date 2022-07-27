install emacs:
~~~
cd /usr/bin; sudo wget https://github.com/Lumetas/emacs.conf/releases/download/release/emacs.appimage ; sudo chmod +x /usr/bin/emacs
~~~
install conf:
~~~
rm -rf ~/.emacs ~/.emacs.d; cd ~; git clone https://github.com/Lumetas/emacs.conf.git ; cd emacs.conf; mv .emacs ~; mv .emacs.d ~; cd ..; rm -rf emacs.conf;
~~~
