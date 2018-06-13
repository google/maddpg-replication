# Copyright 2018 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

. ../tensorflow/bin/activate
xvfb-run -s "-screen 0 1400x900x24" -a python third_party/maddpg/experiments/train.py --save-dir=experiments/$1/ --load-dir=experiments/$1/ --exp-name=$1 --scenario=simple_adversary --num-episodes=60000 --benchmark-iters=25050 #--benchmark
deactivate
# ffmpeg -r 10 -i renders/test.%02d.bmp -vcodec mpeg4 -y renders/test.mp4

