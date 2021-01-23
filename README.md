# Advanced R 3 and 4 Feb 2021

## Requirement to be met _before_ the course.

* Course will be delivered over a Zoom meeting so you should
  have reasonably good internet access, webcam, microphone
  and speakers.

* You should have a working installation of R and RStudio
  on the computer on which you will be attending this
  course. Please test this before hand and let us know if
  you need any help with this.

* Point your web browser to the url shown at the top
  which is the same as

* https://github.com/streptomyces/ThereYouR

## Some requests

* Please have your cameras on during the course so the
  instructor has some visual feedback.

* Ask if something is not clear.

## Timings for both days of the course.

~~~ 
Course                       0930  to   1100
Coffee break                 1100  to   1130
Course                       1130  to   1300
Lunch (not provided)         1300  to   1400
Course                       1400  to   1530
Coffee break                 1530  to   1600
Course                       1600  to   1730
~~~

## Before we start

* Who are we.

* The focus of this course is on R syntax and
  techniques rather than statistics.

## Getting the scripts and data we will be using

In Rstudio, use the drop down menu to do

    File -> New File -> R Script

In the blank R script we will write and run
the indented lines shown below. Please do this
with me. Resist the temptation to charge ahead.

~~~ {.r}
    setwd("u:/")
    unlink("Rtrain", recursive = TRUE)
    dir.create("Rtrain")

    setwd("Rtrain")

    getwd()

    unlink("*")

    list.files()
    
    download.file("http://streptomyces.s3-eu-west-1.amazonaws.com/itr.zip",
    "itr.zip")

    download.file("http://streptomyces.s3-eu-west-1.amazonaws.com/itr.pdf",
    "itr.pdf")

    list.files()

    unzip("itr.zip")
    
    setwd("itr")

    list.files()
~~~

## How will this course work?

- I will introduce methods by talking about them.
- You will run some commands along with me to see the
  methods in action.
- I will explain the commands and the syntax you have
  just seen in action.


### Sometimes there will be things for you to do on your own.

+ These tasks will be described in plain english.
+ You will have to think how to achieve them in R using
  as many steps and variables as you need.
+ Finally, I will show you how I would have done the
  tasks but keep in mind that, if you got the right results,
  your way of doing them may also be correct.


