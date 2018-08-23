FROM ubuntu

RUN apt-get update && apt-get install -y \
  wget \
  gconf2 \
  gconf-service \
  libgtk2.0-0 \
  libnotify4 \
  libxtst6 \
  libnss3 \
  python \
  gvfs-bin \
  xdg-utils \
  libxss1 \
  libgnome-keyring0 \
  gir1.2-gnomekeyring-1.0 \
  libappindicator1 \
  libcurl4 \
  libsecret-1.0 \
  libasound2


RUN wget https://downloads.slack-edge.com/linux_releases/slack-desktop-3.2.1-amd64.deb -O /tmp/slack-desktop.deb
RUN dpkg -i /tmp/slack-desktop.deb

CMD ["/bin/sh", "-c", "slack", "-f", "--log-level=debug"]
