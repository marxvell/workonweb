FROM kasmweb/core-ubuntu-jammy:develop

LABEL version="1.0" maintainer="kingwinma<kingwinma@gmail.com>"

USER root

# update
RUN apt update && mkdir -p /home/kasm-user/Desktop

# Chrome
RUN apt install -y xdg-utils fonts-liberation libu2f-udev \
&& wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb \
&& dpkg -i google-chrome-stable_current_amd64.deb \
&& sed -i 's/Exec=\/usr\/bin\/google-chrome-stable/Exec=\/usr\/bin\/google-chrome-stable --no-sandbox/g' /usr/share/applications/google-chrome.desktop \
&& ln -s /usr/share/applications/google-chrome.desktop /home/kasm-user/Desktop/google-chrome.desktop

# Clean
RUN apt autoremove -y \
&& apt clean \
&& rm -rf *.deb
