# maddpg-replication

This is a partial replication of ["Multi-Agent Actor-Critic for Mixed Cooperative-Competitive Environments" (Lowe, Wu, Tamar, Harb, Abbeel, Mordatch 2017)](https://arxiv.org/abs/1706.02275). That paper introduced an algorithm called MADDPG (multi-agent deep deterministic policy gradient) for training multiple agents that can interact intelligently. The authors released [source code](https://github.com/openai/maddpg) for replicating the paper. This repository documents the process of running that code and the results.

Although I (Nisan Stiennon) am affiliated with Google, this is not an official Google product.

# Results

Check out the [Jupyter notebook](maddpg_replication.ipynb) for results.

Each directory in [experiments/](experiments) contains:
* A video of each 1000th episode, like [this one](experiments/simple_adversary_mm2/episode_00060000.mp4?raw=true).
* The trained model, comprising files named:
  * checkpoint
  * .data-00000-of-00001
  * .index
  * .meta
* Rewards for every 1000th episode, for making reward graphs:
  * agrewards.pkl, average reward over the episode for each agent
  * rewards.pkl, average reward over the episode for all agents
* Scenario-specific performance data from the fully-trained model in benchmark.pkl

Here are the experiments used in the Jupyter notebook:
* [simple_adversary3](experiments/simple_adversary3)
* [simple_adversary_dd](experiments/simple_adversary_dd)
* [simple_adversary_dd1](experiments/simple_adversary_dd1)
* [simple_adversary_dd2](experiments/simple_adversary_dd2)
* [simple_adversary_dd3](experiments/simple_adversary_dd3)
* [simple_adversary_dd4](experiments/simple_adversary_dd4)
* [simple_adversary_dm](experiments/simple_adversary_dm)
* [simple_adversary_dm1](experiments/simple_adversary_dm1)
* [simple_adversary_dm2](experiments/simple_adversary_dm2)
* [simple_adversary_dm3](experiments/simple_adversary_dm3)
* [simple_adversary_dm4](experiments/simple_adversary_dm4)
* [simple_adversary_md](experiments/simple_adversary_md)
* [simple_adversary_md1](experiments/simple_adversary_md1)
* [simple_adversary_md2](experiments/simple_adversary_md2)
* [simple_adversary_md3](experiments/simple_adversary_md3)
* [simple_adversary_md4](experiments/simple_adversary_md4)
* [simple_adversary_mm1](experiments/simple_adversary_mm1)
* [simple_adversary_mm2](experiments/simple_adversary_mm2)
* [simple_adversary_mm3](experiments/simple_adversary_mm3)
* [simple_adversary_mm4](experiments/simple_adversary_mm4)
* [simple_spread_3d0](experiments/simple_spread_3d0)
* [simple_spread_3d1](experiments/simple_spread_3d1)
* [simple_spread_3d2](experiments/simple_spread_3d2)
* [simple_spread_3m0](experiments/simple_spread_3m0)
* [simple_spread_3m1](experiments/simple_spread_3m1)
* [simple_spread_3m2](experiments/simple_spread_3m2)

# Instructions

I used a [Google Compute Engine](https://cloud.google.com/) n1-standard-2 virtual machine (2 vCPUs, 7.5 GB memory). Install these packages:

Python packages:
  * tensorflow
    * ([virtualenv installation with python 3](https://www.tensorflow.org/install/install_linux#InstallingVirtualenv))
    * I installed the other packages while in the virtual environment.
  * gym
  * multiagent-particle-envs
  * maddpg
  * Pillow
  * jupyter_http_over_ws
  * matplotlib
  * numpy
  * pandas
  * pickle
  * scipy

Linux packages:
  * ffmpeg

Also clone this repo. run.sh assumes that this repo's top directory is a sibling directory to the tensorflow directory containing bin/activate.

To run an experiment, edit [run.sh](run.sh) and adjust any command-line flags. Then, from this repo's top directory run `./run.sh <experiment_name>`, where <experiment_name> can be anything you like. This will create a new directory with that name under experiments/.

You'll have to download the videos from your VM to view them. See [these instructions](https://cloud.google.com/compute/docs/instances/connecting-to-instance) for connecting with gcloud or ssh if you're using GCE.

To execute the Jupyter notebook, set up port forwarding from your local machine (where your browser is) to the cloud machine (where you cloned this repo). I did this by following the above instructions for ssh and running

`ssh -i <identification_file> -L 8888:localhost:8888 <username>@<cloud_ip_address>`

on my local machine.

Once you've set up port forwarding, go to this repo's top directory and run `jupyter notebook --port=8888`. Paste the url it gives you into your browser and then navigate to the .ipynb notebook.

# References

Ryan Lowe, Yi Wu, Aviv Tamar, Jean Harb, Pieter Abbeel, Igor Mordatch. "Multi-Agent Actor-Critic for Mixed Cooperative-Competitive Environments". Neural Information Processing Systems (NIPS) (2017). ([arXiv preprint](https://arxiv.org/abs/1706.02275))
