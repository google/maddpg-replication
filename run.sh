. ../tensorflow/bin/activate
xvfb-run -s "-screen 0 1400x900x24" -a python main.py
deactivate
ffmpeg -r 10 -i renders/test.%02d.bmp -vcodec mpeg4 -y renders/test.mp4

