<!--
Maintainer:   jeffskinnerbox@yahoo.com / www.jeffskinnerbox.me
Version:      0.1
-->


![work-in-progress](http://worktrade.eu/img/uc.gif "These materials require additional work and are not ready for general use.")

---

# Convert Python Script into Shell Command
* [Packaging Python Scripts into CLI Commands](https://ediblesec.com/packaging-python-scripts-into-cli-commands/)
* [You can use the argparse package to easily turn a python script into a command-line program](http://omgenomics.com/python-command-line-program/)
* [Turn an application or script into a shell command](https://stackoverflow.com/questions/6163087/turn-an-application-or-script-into-a-shell-command)






# Altoids Tin Spy Camera

## Install JSMpeg
* [Dominic Szablewski - JSMpeg: Why a JavaScript Video Decoder Actually Makes Sense](https://vimeo.com/144499042)
* http://jsmpeg.com/
* https://github.com/phoboslab/jsmpeg
* http://weheart.digital/build-simple-live-streaming-solution/

```bash
# clone the jsmpeg repository
cd ~/src
git clone https://github.com/phoboslab/jsmpeg.git

cd ~/src/jsmpeg
npm install ws

????
```

## Install FFmpeg
```bash
# first remove any old version of FFmpeg
sudo apt-get --yes remove ffmpeg

# install dependancies
sudo apt-get $OPTS install yasm nasm

# install ffmpeg source
cd $HOME/src
git clone https://github.com/FFmpeg/FFmpeg.git

# create the configuration
cd $HOME/src/FFmpeg
./configure

# FFmpeg with Makefile. This takes several minutes.
make

# install ffmpeg and all its libraries and tools
sudo make install
```

## Install GStreamer
```bash
# install gstreamer
sudo apt-get --yes install libgstreamer1.0-0 gstreamer1.0-libav gstreamer1.0-doc gstreamer1.0-tools
sudo apt-get --yes install gstreamer1.0-plugins-*
sudo apt-get --yes install gstreamer0.10-plugins-*
```

## Install GStreamer Examples
## Install mjpg-streamer
* [GitHub: mjpg-streamer](https://github.com/jacksonliam/mjpg-streamer)
```bash
# install dependancies
sudo apt-get install cmake libjpeg8-dev

# build and install all plugins
cd mjpg-streamer-experimental
make
sudo make install
```

## Install pistreaming

# ffmpeg
FFmpeg is a collection of libraries and tools to process multimedia content
such as audio, video, subtitles and related metadata.
The online documentation is available in the main [website](https://ffmpeg.org)
and in the [wiki](https://trac.ffmpeg.org).

* `libavcodec` provides implementation of a wider range of codecs.
* `libavformat` implements streaming protocols, container formats and basic I/O access.
* `libavutil` includes hashers, decompressors and miscellaneous utility functions.
* `libavfilter` provides a mean to alter decoded Audio and Video through chain of filters.
* `libavdevice` provides an abstraction to access capture and playback devices.
* `libswresample` implements audio mixing and resampling routines.
* `libswscale` implements color conversion and scaling routines.

* [ffmpeg](https://ffmpeg.org/ffmpeg.html) is a command line toolbox to
  manipulate, convert and stream multimedia content.
* [ffplay](https://ffmpeg.org/ffplay.html) is a minimalistic multimedia player.
* [ffprobe](https://ffmpeg.org/ffprobe.html) is a simple analysis tool to inspect
  multimedia content.
* [ffserver](https://ffmpeg.org/ffserver.html) is a multimedia streaming server
  for live broadcasts.
* Additional small tools such as `aviocat`, `ismindex` and `qt-faststart`.

# GStreamer
[GStreamer][76] is a framework for creating streaming media applications.
The GStreamer framework is designed to make it easy to write applications
that handle audio or video or both.
It isn't restricted to audio and video,
and can process any kind of data flow.
Its main advantages are that the pluggable components can be mixed and matched
into arbitrary pipelines so that it's possible to write a
full-fledged video or audio editing application.
You can also use the pipelining capabilities of GStreamer
to take the video output from a Raspberry Pi camera module
and encode the video in H.264 format before passing it on to Janus.
GStreamer is a pipeline-based multimedia framework that links together
a wide variety of media processing systems to complete complex workflows.
For instance, GStreamer can be used to build a system that reads files in one format,
processes them, and exports them in another.
The formats and processes can be changed in a plug and play fashion.
(See this [diagram of the pipeline processing][77] for an example.)
This processing can be done on the [shell command line][82] or via
[Python bingdings][80] or [C bindings][81].
[76]:https://gstreamer.freedesktop.org/
[77]:http://developers-club.com/posts/236805/
[80]:http://www.jonobacon.org/2006/08/28/getting-started-with-gstreamer-with-python/
[81]:https://arashafiei.files.wordpress.com/2012/12/gst-doc.pdf
[82]:http://wiki.oz9aec.net/index.php/Gstreamer_cheat_sheet

# JSMpeg
JSMpeg is a Video Player written in JavaScript. It consists of an
MPEG-TS demuxer, MPEG1 video & MP2 audio decoders,
WebGL & Canvas2D renderers and WebAudio sound output.
It makes no attempt to be a video player or codec so
the latency is only dependend on your source,
the network conditions and how fast your browser,
GPU and monitor can spit out frames.
JSMpeg can load static videos via Ajax
and allows low latency streaming (~50ms) via WebSockets.

# mjpg-streamer
This is a fork of http://sourceforge.net/projects/mjpg-streamer/
with added support for the Raspberry Pi camera via the input_raspicam plugin.

mjpg-streamer is a command line application that copies JPEG frames from one
or more input plugins to multiple output plugins. It can be used to stream
JPEG files over an IP-based network from a webcam to various types of viewers
such as Chrome, Firefox, Cambozola, VLC, mplayer, and other software capable
of receiving MJPG streams.

It was originally written for embedded devices with very limited resources in
terms of RAM and CPU. Its predecessor "uvc_streamer" was created because
Linux-UVC compatible cameras directly produce JPEG-data, allowing fast and
perfomant M-JPEG streams even from an embedded device running OpenWRT. The
input module "input_uvc.so" captures such JPG frames from a connected webcam.
mjpg-streamer now supports a variety of different input devices.

# pistreaming
This is a demonstration for low latency streaming of the Pi's camera module to
any reasonably modern web browser, utilizing Dominic Szablewski's excellent
[JSMPEG project](https://github.com/phoboslab/jsmpeg). Other dependencies are
the Python [ws4py library](http://ws4py.readthedocs.org/),
my [picamera library](http://picamera.readthedocs.org/)
(specifically version 1.7 or above), and [FFmpeg](http://ffmpeg.org).


