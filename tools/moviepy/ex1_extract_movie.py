# https://zulko.github.io/moviepy/crash_course/crash_course.html
import os
import sys
from moviepy.editor import *


def main():
    # Load myHolidays.mp4 and select the subclip 00:00:50 - 00:00:60
    clip = VideoFileClip("myHolidays.mp4").subclip(50,60)

    # Composite video clips
    video = concatenate([clip])

    # Write the result to a file
    video.write_videofile("myHolidays_edited.avi",fps=24, codec='mpeg4')

if __name__ == "__main__":
    main()
