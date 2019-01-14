# Docker Slack

Its probably easier to use the web UI, but for those interested...

Run slack on other distributions of linux than Debian

create a bin file in your home directory if you dont have one already
`PATH=$HOME/.bin:$PATH`

Then add the following lines to `$HOME/.bin/slack`. The first run should pull the image and start. Closing the window with `bspc node -c` for example wont actually stop docker and you may have to kill the docker container manually.

```
#!/bin/bash

function slack {
  XAUTH=/tmp/docker.Xauthority
  touch $XAUTH
  xauth nlist :0 | sed -e 's/^..../ffff/' | xauth -f $XAUTH nmerge - && \

  docker run -it -d --rm \
    -v "${HOME}/.config/Slack:/root/.config/Slack" \
    -v /etc/localtime:/etc/localtime:ro \
    --group-add audio --group-add video \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v $XAUTH:/root/.Xauthority \
    -e DISPLAY=$DISPLAY \
    --device /dev/snd \
    --device /dev/dri \
    --name=slack \
    --ipc=host \
    --net=host \
    sammerry/slack
}

slack
```

