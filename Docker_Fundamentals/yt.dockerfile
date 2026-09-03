FROM python

RUN apt update && apt -y install tmux ffmpeg
RUN pip3 install yt-dlp

CMD ["/bin/sh"]
