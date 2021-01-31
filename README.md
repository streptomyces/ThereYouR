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
    
    download.file("https://streptomyces.s3-eu-west-1.amazonaws.com/adr.zip",
    "adr.zip")

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

+ These tasks will be described in semi-plain english.

+ You will have to think how to achieve them in R using as
many steps and variables as you need.

+ Finally, I will show you how I would have done the tasks.

### There is (almost always) more than one way to do it.

+ Your way of doing things might be different from mine but
correct nevertheless. There isn't one correct way. It is a
matter of style.

+ RStudio (as a company) is contributing lots of alternative
functions to those providing similar functionalities in
converntional R packages. The _tidyverse_ metapackage which
includes _ggplot2_ and several other widely used packages.

+ For any given task, some find it easier to do it using
 _tidyverse_ while other prefer more conventional functions.



