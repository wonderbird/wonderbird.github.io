---
title: Video editing
layout: default
---

# Video editing

## Software

* [Kdenlive](https://kdenlive.org/en/) - Open Source Video Editor.
* [DaVinci Resolve](https://www.blackmagicdesign.com/products/davinciresolve/) - Professional Editing, Color, Effects and Audio Post!

## My editing workflow

1. Record the video and store it in a "raw" folder
2. Edit the video in DaVinci Resolve
3. Export the rendered video in a "intermediate" folder
4. Compress the video using ffmpeg

### 1. Record the video and store it in a "raw" folder

- For my process, the resolution should be larger than 1280 x 720 (HD 720p)

### 2. Edit the video in DaVinci Resolve

#### My Personal Settings

Because I have quite low resolution demands and I want to support PAL, my configuration is as follows:

* Master Settings
  * Timeline Resolution: 1280 x 720 HD 720p
  * Timeline Framerate: 25 fps
  * Playback Framerate: 25 fps

* Image Scaling
  * Input Scaling &rarr; Mismatched resolution files: **Scale full frame with crop**

#### Correcting the Scale and Position of Screen Recordings

After having inserted a video into the timeline apply the following transformation in the timeline:

* Zoom X und Y: 1.020
* Position X: 14.000 Position Y: -2.000

### 3. Export the rendered video in a "intermediate" folder

When exporting HD videos I use the vimeo preset.

As an alternative, for slow screen recordings in 720p I use the following settings:

* vimeo 720p Format (1080p also works)
* Framerate: 25
* Container: MP4
* Max. Bitrate: 1000 kbps
* Audio Bitrate: 160 kbps
* Multipass encoding (optional)

### 4. Compress the video using ffmpeg

FFMPEG can shrink videos significantly. The following command reduces the video to a size suited for mobile phone:

```
# Optimum quality : size ratio for screen recordings
# (for iTunes und iPhone: 720p 10:9 format, high compression)
VIDEO="somefile.mp4"; TARGETDIR="small"; mkdir -p "$TARGETDIR" && ffmpeg -i "$VIDEO" -crf 24 -vf scale=1280:720 "$TARGETDIR/$VIDEO"

# Strong compression - convert to 320x288 10:9 format for mobile
ffmpeg -i input.mov -vcodec libx264 -crf 24 -vf scale=320:288  output.avi

# Compress and convert to 480x270 16:9 format
ffmpeg -i input.mov -vcodec libx264 -crf 24 -vf scale=480:270  output.avi
```

### 5. Extract Audio Track as MP3

```shell
# -q:a 0    Variable bit rate -- see https://trac.ffmpeg.org/wiki/Encode/MP3
# -map a    Exclude video subtitles and grab only audio
ffmpeg -i sample.avi -q:a 0 -map a sample.mp3

# Constant bitrate
ffmpeg -i sample.avi -b:a 128k -map a sample.mp3
```

## Links

* [Overview about frame rates and PAL vs. NTSC (in German)](https://gwegner.de/know-how/verwirrung-um-die-frameraten-24-fps-25-fps-30-fps-pal-ntsc-wann-nimmt-man-was/)
* [How can I reduce a video's size with ffmpeg?](https://unix.stackexchange.com/questions/28803/how-can-i-reduce-a-videos-size-with-ffmpeg)
* [ffmpeg Wiki: Scaling](https://trac.ffmpeg.org/wiki/Scaling)

## Some Personal Notes

* My camera profile: 1920 x 1080, H.265 Linear PCM
* Keywords: MP4 MPG FFMPEG AVI Movie Filme Videoschnitt Export DaVinci Resolve