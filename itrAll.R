# vim: set tw=60 nosmartindent: ###
# {{{ README (README.md);
# Advanced R 3 and 4 Feb 2021

## Requirement to be met _before_ the course.

* Course will be delivered over a Zoom meeting so you should
  have reasonably good internet access, webcam, microphone
  and speakers.

* Have an up-to-date installation of R and RStudio
  on the computer on which you will be attending this
  course.

* On the first day of the course, as soon as you join the
  Zoom meeting, point your web browser to the URL shown
  below.

### https://streptomyces.github.io/ThereYouR/

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
  techniques, not statistics.


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
There are (almost always) more than one way to do it. 
Your way of doing things might be different from mine but
correct nevertheless.

## Things mentioned below will be done during the course
### Please don't do them before hand. 

#### Getting the scripts and data we will be using during the course

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
    
    download.file("https://github.com/streptomyces/ThereYouR/raw/master/adr.zip", 
    "adr.zip")

    list.files()

    unzip("adr.zip")

    list.files()
~~~
# }}}

# {{{ RStudio (rstudio.md)
# RStudio

### Four panes

* Source editor
* Console
* Environment and History
* File, Plots, Help etc.

### RStudio pane layout

Use the drop down menus to do the following.

    Tools -> Global Options -> Pane layout

Arrange to have *Source* on the top left and *Console*
on the top right. With this arrangement we can minimise
two bottom panes most of the time and have more of
screen space.

### Getting started

* Comments begin with #. Everything after a # is ignored
  by R.

* Type commands in the _source_ editor.

* To run a command from the _source_ editor place the
  cursor anywhere on that line and press `Control-Enter`.

* You can also select multiple lines and then press
  `Control-Enter` to run all the selected lines.

* Finally, you can use `Control-Shift-Enter` to source the
  entire script.

* The action happens in the _Console_ pane. i.e. any
  output from R is shown in the console frame. You can
  also type commands directly in the console but this
  is not recommended because changing and re-running
  commands directly in the console is inconvenient.

* R keeps a history of your commands which you can see in
  the history tab of RStudio.

* You can select and run commands from the history tab as
  well. Just press enter on the current line or select some
  lines and press enter.

* However you run a command, it is like typing it into
  the console and pressing Enter.

# }}}

# {{{ R (r.md)
# R

* R is the interpreter for the R language.

* Words combine to make _expressions_ which are _evaluated_.

* Evaluated value is printed on the console or, it may be
assigned to an object.

* R is case-sensitive. `geneName` is not the same as
`GeneName`.

### Some syntax identifying features

~~~ 
Function      Unquoted word followed      mean()
              by parentheses

Variable      Unquoted word               gene.lens

String        Quoted alphanumeric         "whiA"
literals      characters

Numeric       Unquoted digits and         2345, 42L,
literals      scientific notation         1e6, 1e-6
~~~

* Parentheses, (), are required in function calls even if
you are not passing any arguments to the function being
called. `ls()` works but `ls` does not, at least not in
the way you want it to.

* Parentheses makes it easy to identify individual
function calls in long and complex R statements where
function calls are embedded within other function calls.

* Unquoted words which are not reserved words are assumed
to be variable names.
`help(Syntax)`; `help(reserved)`; `help(Quotes)`;

* Other than reserved words, almost no restrictions on
names. Choose sensible names.

    mean <- c(2,3,4,5); # example of bad name.
    mean(mean);

* Commands can continue over multiple lines.

* Semicolons are only needed if you put two commands on one line.

    x <- 3; y <- x * 3; x; y

* Matching parentheses and quotes are automatically
inserted. You can disable this in options. I do.

`Tools -> Global Options -> Code -> Editing`

* If you get inside a complicated command which you
cannot finish, try Escape (Control-C in Linux) to bail out.
This usually happens because of unmatched parentheses or
quotes.

## Use names as needed

- While doing the tasks during this course you will
  not always be explicitly asked to name your variables.

- Please name variables as needed e.g. if a task says make a
  vector of the numbers 1 to 10 do `x <- seq(1,10)` instead
  of `seq(1,10)`

Then you can refer to `x` in the subsequent steps of the
task.
# }}}

# {{{ Data structures (struct)
#######################
### Data structures ###
#######################

# Most analyses in R start with reading some data into R.

# Collections of the basic data types.

# Several data structures are provided in R as classes.

# It is possible to make your own but we will not be doing
# so. The ones provided are sufficient for what we do.

# They range in complexity and flexibility.

# Reading data from a text file.
vnz.df <- read.csv("data/vnz_genes.csv", header = T,
stringsAsFactors = F)

# Writing data to a text file.
write.csv(vnz.df, "out/vnz_genes.csv", quote = F,
row.names = F);

### Tidyverse style ###

# Reading data from a text file.
vnz.tib <- read_csv("data/vnz_genes.csv");

# Writing data to a text file.
write_csv(vnz.tib, "out/vnz_genes.csv",
quote_escape = "none")

# }}}

# {{{ Basic data types (types)
########################
### Basic data types ###
########################

# Character (strings of characters)
# Numeric
  ## Integers
  ## Double (double precision floating point numbers)
# Logical. Boolean. TRUE or FALSE only.
# Complex
# Raw

# We will not using the Complex and Raw types.

# We don't have to worry whether our numeric variables are
# integers or doubles, except when it does matter!

# Explain x <- 42L

x <- 42;

y <- 42L;

typeof(x);

typeof(y);

# It is not possible to make a variable of one of the basic
# data types. You can only have vectors of these types.

# }}}

# {{{ Classes (classes)
###############
### Classes ###
###############

# Data structures with associated functions (methods).

# e.g. Some of the methods in the the class data.frame are

# [             [[            [[<-          [<-           $<-          
# aggregate     anyDuplicated as.data.frame as.list       as.matrix    
# by            cbind         coerce        dim           dimnames     
# dimnames<-    droplevels    duplicated    edit          format       

# A class is a recipe for making objects and a "constructor"
# method is usually available but often you will bring them
# into existence simply by assignment.

### Classes provided by base R ###

## Vector Classes ##
# character
# complex
# double
# expression
# integer
# list
# logical
# numeric
# raw


# function
# NULL


# }}}

# {{{ Objects (objects)
###############
### Objects ###
###############

# Objects are "instances" of classes.

# Objects of a class have all the methods of the class
# available to them.

# Objects can be of more than one class. Then they have
# methods of all the classes available to them.

# There are no simple variables in R.

# Even if you need to store just one value you use a data
# structure that is capable of storing multiple values.
# }}}

# {{{ Variables, names, symbols, bindings (variables)
###############################################
### Variables, names, symbols and, bindings ###
###############################################

# Variables are objects.

# Symbols (or names) are handles or labels for variables
# through which we can access the variables.

# After an assignment like: x <- 42

#     the name "x" has the value 42.

#     the value 42 has a label attached to it with "x"
#     written on it

#     The symbol "x" is bound to the value 42.

#     Assuming a clean session of R, the symbol "y" is
#     unbound.

# Don't imagine x to be a container containing the value 42.

# Objects live in memory and have memory addresses. Symbols
# let us refer to variables much more easily than would be
# possible through memory addresses.

# To symbols (names) may refer to the same memory address.
# In fact this is what happens after

y <- x;

# What happens when rm is invoked?

rm(x);

# On a given machine, memory addresses are unique, but
# variable names are not. Within one session of R you can
# have more than one variables named "x" and the right one
# should be used everytime we refer to "x".
# }}}

# {{{ Vectors (vectors)
###############
### Vectors ###
###############

# Ordered collection of values.

# Contiguous cells containing data.

# All values have to be of the same type.

# They can hold values of any of the basic types.

# One way of making a vector is by using the c() function.
# (concatenate).

x <- c(10, 20, 30)

# Cells are accessible through subscripting / indexing.
# e.g. if vector x contains 10, 20 and 30 then

x[1] # refers to 10,
x[2] # refers to 20 and,
x[3] # refers to 30

# Indexing begins from one, not zero.


x <- c(2.9, 4.1, 3.9, 4.5, 3.7, 45.3, 21.6);

x;

x[1];

x[7];

x[4:6]   # ":" is the range operator. Step by 1 only.


# The simplest data type in R is a vector.

y <- 5.4; # is the same as y <- c(5.4);

y;

y[1];

z <- c("ftsZ", "sigE", "bldN", "whiA", "whiB", "rdlA", "chpA");
z;
z[3];

length(x)
length(z)


### Named Vectors ###

# Elements of a vector can be named

names(x) <- z;
x;

x["whiA"]; # is the same as x[4];

v <- c("whiA", "rdlA");

x[v];

#################################
### Do the following yourself ###
#################################

# 1. Objects x, y and z should still be in existence at this
# stage. Do a listing of objects to confirm this.

# 2. Examine the output of unname(x).

# 3. Make a copy of x in vecx. We will use it when we look
# at functions.

# }}}

# {{{ Functions (functions)
#################
### Functions ###
#################

# Functions do things for us.

# Need arguments to work on.

# May assume default arguments if none are provided.

# May return something which you may wish to store as a
# new object.

# If you are not assigning the returned value to an object
# then the returned value may be printed on the console.
# invisible()

# Some functions used primarily for their side-effects
# rather than their return value.

# User defined functions.

bmi <- function(kilograms, metres) {
  return(kilograms / metres ** 2);
}

bmi

### Components of functions ###

#  1. Formal argument list.
#  2. Body
#  3. Environment


### Arguments

# Arguments are values or objects a function acts on. The
# process of getting arguments into functions is called
# argument passing.

# Supplied arguments are matched to formal arguments in a
# three pass process.

#  1. Exact matching on tags
#  2. Partial matching on tags
#  3. Positional matching.

# We will use the seq() function of R as an example.

help(seq);

# positional arguments
seq(2, 10);

seq(2, 10, 2);

# Positional and named arguments
seq(2, 10, by = 2);

# Named arguments only
seq(from = 2, to = 10, by = 2);

# Positional and named arguments
seq(2, to = 10, by = 2);

# Positional and named arguments
seq(2, by = 2, 10);

# Partial matching of argument names
seq(2, fr = 4, to = 20);


#######################################
### Calling bmi() is different ways ###
#######################################
bmi(65, 1.68);
bmi(kilograms = 65, metres = 1.68)
bmi(metres = 1.68, kilograms = 65)
bmi(kilo = 65, met = 1.68)
bmi(m = 1.68, k = 65)
bmi(m = 1.68, 65)


####################################
### Return values from functions ###
####################################

# If a function returns something and you want to keep it
# you have to assign it to a (new) object. Pre-existing
# objects will be over-written!

x <- seq(2, 10);
x;
y = seq(3, 30, by = 3);
y;


# Some functions do not return anything (NULL).
x <- seq(10, 100, by = 5);
cat(x, "\n");
catret <- cat(x, "\n");
catret;

# Demonstrate invisible here.

bmii <- function(kilograms, metres) {
  invisible(kilograms / metres ** 2);
}

bmi(m = 1.65, 65);
bmii(m = 1.65, 65);
bmx <- bmii(m = 1.65, 65);
bmx

##############################################
### A note about assignment operators in R ###
##############################################

x <- seq(10, 100, by = 5);
x
# Works, but for the wrong reason.
x <- seq(10, 100, by <- 5);
x

# Fails. Wrong sign in by argument.
rm(x);
x <- seq(10, by <- 5, 100);
x

# Works. But unintended result.
rm(x);
x <- seq(10, by <- 5, -1);
x

# Alt-minus key combination gives you the
# assignment operator in RStudio
 
# Use <- or = on the command line.
# Always use = in function calls and function definitions.

# Function calls as arguments

rep(4, times = 4);

rep(seq(1,4), times = 4);

rep(seq(1,4), each = 4);

#################################
### Do the following yourself ###
#################################

# 1. Run the code below.
#
x <- y <- z <- 42
#
# 2. Check the values of x, y and z.


# 1. Generate the sequence -20 to 50 increasing in steps
# of 5 and name it ds.

# 2. Check the value of ds.

######################################################

# The function cel2fah  written below takes one argument,
# the temperature in degrees Celsius, and returns the same
# temperature in Fahrenheit.

cel2fah <- function(cel) {
fah <- (cel * 1.8) + 32;
return(fah)
}

# Test cel2fah by calling it as below.

#    a. cel2fah(100)
#    b. cel2fah(0)
#    c. cel2fas(ds)


# Functions as objects. Try the below.

curve(cel2fah, -20, 50, xlab = "Celsius",
      ylab = "Fahrenheit", lwd = 3, col = "royalblue")

# Above, we passed a function as an argument
# to another function. help("curve").

# Another example of passing a function as an argument to
# another function.

deg2rad <- function(deg) {
return(deg * 2 * pi / 360);
}
curve(sin, deg2rad(0), deg2rad(360), col = "red", lwd = 3,
      ylab = "f(x)", xlab = "x in radians");
curve(cos, deg2rad(0), deg2rad(360), col = "blue", lwd = 3, add = T);


########################
### ... (three dots) ###
########################
# help("dots");

dotdemo1 <- function(x, ...) {
  cat("x is: ", x, "\n");
  dots <- list(...);
  cat("Then: ", dots[[1]], "\n");
}
dotdemo1("stuff", "morestuff");

dotdemo2 <- function(x, ...) {
  cat("x is: ", x, "\n");
  dots <- list(...);
  cat("y: ", dots$y, "\n");
  cat("y: ", dots[[1]], "\n");
  cat("Then: ", dots[[2]], "\n");
}
dotdemo2(x = "stuff", y = "morestuff", 23);

dotdemo3 <- function(x, ...) {
  cat("x is: ", x, "\n");
  cat("Then: ", ..1, "\n");
}
dotdemo3(x = "stuff", 23);

##############################
### Operators as functions ###
##############################

x <- 2;
y <- 3;

x + y

'+'(x,y)
'*'(x,y)


'['(vecx, 4);
'['(vecx, "whiA");
# }}}

# {{{ Scope and Environments (scope)
##############################
### Scope and Environments ###
##############################

# Lexical scope: Functions are evaluated in the environment
# in which they are defined.
#
# The environment provides values for any unbound symbols in
# a function when the function is evaluated.

funcgen <- function(g = 9.8) {
  time2ground <- function(height = 1, initial = 0) {
    fvsq <- (initial ** 2) + (2 * g * height);
    final = sqrt(fvsq);
    t2g = (final - initial) / g;
    return(t2g);
  }
  return(time2ground);
}

ttg.earth <- funcgen(9.8);  # function
ttg.mars <- funcgen(3.72);  # function

ttg.earth(10);
ttg.mars(10);

environment(ttg.earth);
environment(ttg.mars);

ls(envir = environment(ttg.mars));
get("g", envir = environment(ttg.mars));
get("g", envir = environment(ttg.earth));

parent.env(environment(ttg.earth));
parent.env(environment(ttg.mars));
environment(funcgen);

# Current session environment is available in .GlobalEnv

# The effective environment is a nesting of environments.

parent.env(.GlobalEnv);
parent.env(parent.env(.GlobalEnv));
parent.env(parent.env(parent.env(.GlobalEnv)));

#################################
### The search path. search() ###
#################################

time2ground(10);

search();

attach(environment(ttg.earth));

search();

time2ground(10);
# }}}

# {{{ Querying the nature of objects (queryingType)
######################################
### Querying the nature of objects ###
######################################

# Mode

# The mode of an object signifies the type of data in it.
# numeric, character, logical, complex and raw.
x <- seq(1, 5, by = 0.5);
mode(x);
y <- as.integer(x);
mode(y);

# Type and Storage mode

# These two are approximately the same.
storage.mode(x);
typeof(x);

storage.mode(y);
typeof(y);

# Class

# The class of an object is the kind of data structure it is. For
# vectors it is the same as the mode. list, data.frame, matrix,
# function. Class of an object determines how functions treat it.

class(x);
class(y);

# str() is useful to display the internal structure of R objects.
# Especially useful for data frames and more complex objects.

str(vnz.df);

# }}}

# {{{ Packages (packages)
################
### Packages ###
################

# R classes and functions written by others for you to
# use.

# Provide namespaces which roughly translate into
# environments on the search() hierarchy thus avoiding
# symbol clashes.

# Packaged to be loaded on demand to minimise resource
# use.

# When you load a package additional functions defined
# in the package become available for you to use.
# Sometimes existing functions might be over-ridden.

# CRAN has a repository of R packages.

# Bioconductor is a repository of packages for
# bioinfomatics. Bioconductor has its own installer.

### Installing edgeR ###

# Check before doing the below.

if (!requireNamespace("BiocManager", quietly = TRUE))
    install.packages("BiocManager")
BiocManager::install("edgeR")

#################################
### Using packages. library() ###
#################################

library("edgeR");

# Load the namespace of the package with name
# ‘package’ and attach it on the search list.

# The reverse is

detach("package:edgeR", unload = TRUE)

# Sometimes you will see a function being called as

#        packagename::funcname()
# e.g.   readxl::read_excel()

# In such cases the package is loaded (into memory) but it
# is not attached to the search path. This is good for one
# time use of a function and to avoid namespace conflicts
# resulting in masking.

# Also good for accessing masked functions.

# e.g. stats::filter() to use the filter function in the
# stats package while it is masked by the one in dplyr
# package.
# }}}

# {{{ Reading documentation (documentation)
#############################
### Reading documentation ###
#############################

# Go to the "Help" tab in the bottom right
# pane then search for "seq". You can also
# do the below to see the help in the "Help"
# tab.

help("seq")
help("plot")


# Below shows all the packages which have anything to do
# with "sequence".

help.search("sequence")


### Sometimes there is runnable example code. ###

example("hist")


### There are lots of bundled example data sets ###

data() # lists available data sets.

data("cars") # loads the named data set.
ls()
head(cars)

### Finding methods ###

# All definitions for a generic method in the search
# path.

methods("plot"); # plot is a generic function.
?plot.histogram

# All methods available in a class.
methods(class = "histogram");
methods(class = "data.frame");

# Packages are not the same as classes. Classes are
# defined in packages and more than one may be defined
# in one package.

# Before calling library("edgeR");

library(help = "edgeR")

# Above should tell you what classes and functions are
# available in the edgeR package. Then you can see
# the help for those as below.

help("DGEList", package = "edgeR")
help("DGEList-class", package = "edgeR")


# After calling library("edgeR");
library("edgeR");
methods(class = "DGEList");
help("DGEList-class")
help("DGEList")
help("subsetting", package = "edgeR");

methods(class = "DGEGLM");
help("DGEGLM-class")
help("DGEGLM")
# }}}

# {{{ Recycling (recycling)
######################################
### Recycling in Vector operations ###
######################################


#################################
### Do the following yourself ###
#################################

# 1. Assign the sequence from 1 to 5 to x.
# 2. Assign the sequence 21 to 25 to y.
# 3. Examine the result of y * x.

#############################################################
  
# 4. Assign the sequence 21 to 30 to z.
# 5. Confirm the lengths of x and z using the function length().
# 6. Examine the result of z * x.

#############################################################
  
# 7. Assign the sequence from 1 to 7 to u.
# 8. Examine the result of z * u.

#############################################################
#############################################################
# In operations involving two vectors of unequal length, elements of the
# shorter vector get recycled.
# If the longer vector is not an integer multiple of the shorter vector
# you get a warning but the operation is valid and successful.
# }}}

# {{{ Rounding etc. (rounding)
#####################
### Rounding etc. ###
#####################

# round()
pi
round(pi)
round(pi, 3);

# signif()
signif(pi)
signif(pi, 6);
signif(pi, 3);

# floor()
floor(pi)

# ceiling()
ceiling(pi)
# }}}

# {{{ paste etc. (paste).
############################
### paste() and paste0() ###
############################

# Always return a character vector.

x <- LETTERS[1:10]
y <- seq(1,10);

paste(x);
paste(y);   # A character vector.
typeof(paste(y));

str_c(x);
str_c(y);

paste(x, y);
str_c(x, y, sep = " ")

paste0(x, y);  # No separator.
str_c(x, y)

y <- seq(1,5);
paste0(x, y);  # y is shorter than x, hence recycling.
str_c(x, y)

z <- c("-K1", "-K2");
paste0(x, y, z); # z is also recycled as needed.
str_c(x, y, z);


# You can "collapse" the resulting vector to a single
# string.

paste0(x, y, collapse = " ");
str_c(x, y, collapse = " ");

#################################
### Do the following yourself ###
#################################

mtl <- LETTERS[1:8] # microtitre letters
mtn <- seq(1,12)    # microtitre numbers

# Using rep() and paste0() and the two vectors made
# above, make a vector of all the addresses on a 96
# well microtitre plate.

# A1 to A12 then B1 to B12 ... H1 to H12.

# Hint: call to rep() will go inside the call to paste0()
# and will also use the named argument "each".
# }}}

# {{{ Lists (lists)
#############
### Lists ###
#############

# Lists are generic vectors.

# Generally when we say "vector" we mean "atomic
# vectors".

# Individual elements of a list can contain any type of
# R object of any complexity, including other lists.

# This allows for the creation of objects of arbitrary
# complexity.

# Functions returning a lot of related information
# often return their results as lists.

x <- seq(1,20, by = 5);
y <- c("one", "two", "three");
i <- list(x, y);

i;
i[1];   # list
i[[1]]; # vector
class(i[1]);
class(i[[1]]);

names(i) <- c("numbers", "strings");

i["numbers"];
i[["numbers"]];
names(i);


j <- list(numbers = x, strings = y, serial = seq(1,20));

j[["serial"]][3:10];
j$serial;
j$serial[15:20];

################
### unlist() ###
################

unlist(j); # all atomic components of j in a vector
# Notice coercion above.

k <- list(x = x, y = seq(200, 400, by = 10));
k
unlist(k)
class(unlist(k))

#################################
### Do the following yourself ###
#################################

# 1. Make a vector of characters A to N by appropriately
# subsetting LETTERS.

# 2. Make a vector of integers from 10 to 20.

# 3. Make a list named li, with two named elements, alpha
# containing the vector made in step 1 above and, beta
# containing the vector made in step 2 above.

# 4. Display the names of the elements in the list made
# above.

# 5. In one step, extract the fourth element from the
# alpha member of li.
# }}}

# {{{ Attributes (attributes)
##################
### Attributes ###
##################

# Objects can have attributes attached to them.

# Think of them as arbitrary name = value pairs.

# attributes()

# attr()

# The following are used by R.

# 1. Names. names().

# 2. Dimensions. dim(). Matrices and Arrays which we
# will see later on are vectors with the dim attribute
# attached to them.

# 3. Dimnames. dimnames(). If dimensions are named
# the names are stored in the dimnames attribute of the
# array or matrix.

# 4. Class. class(). The name of the class an object
# belongs to is stored in and attribute named class.

###################################################
### Step and think through the statements below ###
###################################################

x <- seq(1,10);
x
class(x);
class(x) <- c(class(x), "itr");
class(x);

attr(x, "purpose")
attr(x, "purpose") <- "testing";
attr(x, "purpose")
attr(x, "purpose") <- c(attr(x, "purpose"), "training")
attr(x, "purpose")

attributes(x);
# }}}

# {{{ Data frames and tibbles (dataframes)
###############################
### Data Frames and tibbles ###
###############################

# Like two dimensional tables where columns are vectors.

# Columns can be of different types.

# All values in any one column have to be of the same type.

# All columns have to be of the same length.

# Commonly used for getting data into R from text files.

# Tibbles don't have row names.

##############################
### Reading MS Excel files ###
##############################

# Package named readxl provides functions for reading
# Microsoft Excel files.

# If the package readxl is not installed then you can
# install it by doing the following.

# install.packages("readxl");

# Determine for format of the excel file. .xlsx or .xls
excel_format("data/file.xlsx")

# See names of sheets in the excel file.
excel_sheets("data/file.xlsx")


# Read the sheet named "hyphal_width".
hwt <- read_excel("data/file.xlsx", sheet = "hyphal_width")

# Read the first sheet in the file.
hwt <- read_xlsx("data/file.xlsx", sheet = 1)

hwt

class(hwt)

# Demonstrate consequences on not having a header in the
# excel spreadsheet.

nht <- read_excel("data/noheader.xlsx", sheet = "hyphal_width")
nht # Really bad. You have lost the first row.

nht <- read_excel("data/noheader.xlsx", sheet = "hyphal_width",
                 col_names = FALSE);
nht # Notice the column names.

# You can use colnames() to change the column names to more
# meaningful ones.

colnames(nht) <- c("hw", "strain", "microscope");

#########################
### Reading CSV files ###
#########################

# In the past I have had problems reading MS Excel files in
# R. In such cases you can write a csv from from Excel and
# then use read.csv() or read_csv() to read the csv file
# into a data frame or tibble.

# In MS Excel, after making sure that there is a line of
# header at the top, export your worksheet of interest
# as a csv file.

# Use read.csv() in R to read the csv file into a data
# frame. read.csv() assumes the presence of a header.

# Use read_csv() in R to read the csv file into a tibble.
# read_csv() assumes the presence of a header.

# Some other named arguments to read.csv() which might
# be useful are stringsAsFactors and row.names. We will
# come to these later.

# data frame
hwf <- read.csv("data/hw.csv");
head(hwf);
nrow(hwf);

# tibble
hwt <- read_csv("data/hw.csv");
hwt;

# If your csv file or spreadsheet has no column names make
# sure you use "col_names = FALSE" or "header = FALSE".

nhf <- read.csv("data/noheader.csv");
head(nhf);
nrow(nhf);

nht <- read_csv("data/noheader.csv", col_names = FALSE);
nht;

colnames(nht) <- c("hw", "strain", "microscope");

#################################
### Do the following yourself ###
#################################

# The sheet named "expression" in the file file.xlsx
# contains the columns named "gene", "control" and
# "treatment".

# 1. Read this sheet into a tibble named "expt";

# 2. Try the commands colnames(), nrow(), ncol()
# with expt as the only argument.

# 3. Try the command class(expt).
# }}}

# {{{ Factors (factors)
###############
### Factors ###
###############

# Think of them as categorical variables.

numbers <- c(1.200261, 1.479827, 1.482392, 1.716793, 1.518791, 1.000030,
             1.933209, 1.841415, 1.315890, 1.849663);

category <- c("A", "A", "B", "B", "B", "A",
              "C", "C", "A", "B");

factr <- factor(category);

typeof(category);

class(category);

typeof(factr);

class(factr);

#####################################################
  
tapply(numbers, factr, mean);

tapply(numbers, category, mean);

levels(factr);

levels(category)


# Allow you to assign individual elements of a vector to
# groups or categories.

# Using factors you can do calculations such as mean(),
# sd() etc. on a group-by-group basis.

#################################
### Do the following yourself ###
#################################

# 1. Find out the class of hwf$strain.

# 2. Determine the number of distinct strains in hwf.

# 3. Use tapply() to calculate the mean of the hyphal
# widths for each of the strains in hwf.

# 4. Use tapply() to calculate the standard deviation of
# the hyphal widths for each of the strains in hwf.

### Tidyverse style ###

# Tidyverse functions read_excel and read_csv etc. do not
# make factors when they read data in. If you need to, you
# can convert the columns you want to factors as below.
# read_csv() has an option (col_types) to let you specify
# column types when you are reading data in.

hwt <- mutate(hwt, strain = factor(strain),
       microscope = factor(microscope))

# group_by() and summarise() by piping
group_by(hwt, strain) %>%
summarise(grmean = mean(hw));

group_by(hwt, microscope) %>%
summarise(grmean = mean(hw));

# Via an intermediate variable.
bygr <- group_by(hwt, strain);
summarise(bygr, grmean = mean(hw));
# }}}

# {{{ Statistical models (statmods)
###############################
### Statistical Models in R ###
###############################

# Normal
# rnorm(): random generation function
# pnorm(): probability density function
# dnorm(): density function
# qnorm(): quantile function
# Similarly for uniform, binomial, gamma, t, etc.

### Example: Normal distribution.

x <- rnorm(500, mean = 15, sd = 5);

pnorm(35, mean = 15, sd = 5);  # P(X <= 35).

pnorm(35, mean = 15, sd = 5, lower.tail = FALSE);  # P(X > 35)

dnorm(seq(1,10), mean = 5, sd = 1)

#################################
### Do the following yourself ###
#################################

# 1. Generate 2000 normally distributed random numbers
# from a population where the mean is 18 and standard
# deviation is 3 and keep them in a vector named x.

# 2. Confirm that x has 2000 elements without listing
# them all.

# 3. Find the minimum, maximum, mean and median of x.

# 4. The function for standard deviation is sd(). Use this
# function to find the standard deviation of x. Should
# be approximately 3.

# 5. The function for square root is sqrt(). Standard
# error of the mean (SEM) is calculated as the SD
# divided by the square root of the sample size. Without
# using any variable other than x, find the SEM. Should
# be approximately 0.06.
# }}}

# {{{ Truth in R (logical)
##################
### Truth in R ###
##################

x <- rnorm(10, mean = 5, sd = 1);
x;

x <= 5;
x > 5;

g <- x <= 5;
g

# There is a data type called "logical".

typeof(g);

x[g];

#############################################################

### any() and all() ###

any(g);
all(g);

fl <- as.integer(c(1, 2, 3, 4, 5, -6));
any(fl);
all(fl);

fl <- as.integer(c(1, 2, 3, 4, 5, 0));
any(fl);
all(fl);

fl <- as.integer(c(-1, 0, 0, 0));
any(fl);
all(fl);

### Strings cannot be used as logicals.

s <- c("str1", "", "str3");

as.logical(s);         # NA

####################################
### Testing for numeric equality ###
####################################

x <- seq(1,10, by = 0.25);
y <- x;

x == y;
identical(x,y);
all.equal(x,y);

# Divide x by 39.473 then multiply the result by 39.473
z <- x / 39.473
x <- z * 39.473

### identical() and all.equal()
x == y;
identical(x,y);
all.equal(x,y);

# all.equal() never returns FALSE. It either returns TRUE or a string.

x <- rnorm(10, mean = 5, sd = 0.0001);
y <- rnorm(10, mean = 5.0001, sd = 0.0001);

# Below returns a string or TRUE
all.equal(x,y);
all.equal(x,y, tolerance = 1e-4);


# Below return FALSE or TRUE
isTRUE(all.equal(x,y));
isTRUE(all.equal(x,y, tolerance = 1e-4))


# It might be best to decide how much difference you are
# willing to ignore and then do something like below.

any(abs(x-y) > 1e-3)
any(abs(x-y) > 1e-4)
x
y
abs(x - y)

#################################
### Do the following yourself ###
#################################

# 0. rm(m,n);

# 1. Store the value of 0.5 - 0.3 into m

# 2. Store the value of 0.3 - 0.1 into n

# 3. Use == to test the equality of m and n.

# 4. Use identical() to test the equality of m and n.

# 5. Use all.equal() to test the equality of m and n.

# 6. What is the output of isTRUE(all.equal(m,n))?

# Refer to the documentation of all.equal() to find out
# the default value of the tolerance argument.

#############################################################
#############################################################

# Use isTRUE(all.equal()), not ==, when comparing floating
# point numbers.

# }}}

# {{{ VAT calculation (vatcalc)

# R provides "if" for branching in functions.

x <- 42L;
if(x == 42) {
  cat("\nWelcome to the intergalactic warpcraft!\n");
} else {
  cat("\nGrow your own wings!!\n");
}

#################################
### Do the following yourself ###
#################################

# Write a function named vat, which takes three arguments.

# vat <- function(x = 100, add = TRUE, rate = 20)

# to return the amount before or after VAT depending upon
# whether the argument add is TRUE or FALSE. x is the amount
# and rate is the VAT rate in percent.

# All three arguments have default values so that when
# called without any arguments it should return 120.

# }}}

# {{{ Subsetting data frames (subsetting)
##############################
### Subsetting data frames ###
##############################

### Subscripts are used to get subsets of data frames
#   (and other types of objects) in R.

df <- data.frame(x = runif(26, min = 3, max = 12),
                 y = runif(26, min = 30, max = 120));
rownames(df) <- LETTERS;
head(df);

# dataframe[rownum, colnum]

df[3, 2]

# dataframe["rowname", "colname"]

df["C", "y"]

### You get all columns if no columns are specified.
# dataframe[rownum, ]
# dataframe["rowname", ]

df[5,]
df["E",]

### You get all rows if no rows are specified.
# dataframe[, colnum]
# dataframe[, "colname"]

df[, "x"]
df[, 1]

### Multiple rows and columns are specified as vectors.

rows <- seq(17,24);
coln <- c(1);
df[rows, coln];

colhead <- c("x");
df[rows, colhead];

### The dollar notation can only be used with single column names.
#   This is actually very common.
# dataframe$colname

df$x 


### If you ask for multiple columns you always get a data frame in return.
#   Even if you have asked for a single row.

df[c(1,2,3), c("x", "y")]
df[2, c("x", "y")]

### Single columns are returned as vectors.

#################################
### Do the following yourself ###
#################################

# 1. Make a vector, ronum, containing the numbers 21 to 30
# and 51 to 60 by concatenating (remember c()?) two
# calls to seq().

# 2. Use the vector ronum, made above to get a subset data
# frame from hwf consisting of only row numbers in ronum
# Do
# hwf <- read.csv("data/hw.csv");
# if you have lost hwf;

# 3. From hwf, extract the strain associated with the
# hyphal width in row number 58 and store it in a vector
# named strain58. Check the class and mode of strain58.


### Tidyverse style ###

slice(hwt, ronum);

# hwt[ronum,] # also works.

hwt[58, "strain"]
# }}}

# {{{ NA, NaN, Inf, NULL (null)
##########################
### NA, NaN, Inf, NULL ###
##########################

x <- seq(from = 2, to = 10, by = 2);
x <- c(x, NA);
x;
mean(x);
sum(x);
sd(x);

####################################################

books <- c("Practical Ethics", "A Theory of Justice",
           "The Wealth of Nations", "What Money Can't Buy",
           "Jonathan Livingston Seagull");

authors <- c("Peter Singer", "John Rawls", NA,
             "Michael Sandel", "Richard Bach");

sold <- c(0.6, 0.2, NA, 0.7, 0.7);

ba <- data.frame(books = books, authors = authors, sold = sold);

ba

# What is the class of NA?

class(NA);
class(ba[3, "authors"]);
class(ba[3, "sold"]);

#################################
### Do the following yourself ###
#################################

# 1. Call the mean(), sum() and sd() functions as above
# but with the additional named argument "na.rm = TRUE"
# e.g. sum(x, na.rm = TRUE)

# 2. Examine the output of summary(x).

# 3. Examine the output of is.na(x).

 
### Inf and -Inf are reserved words in R.

#################################
### Do the following yourself ###
#################################

# 1. Examine the output of 2/0

# 2. Examine the output of -2/0

# 3. Examine the output of is.finite(2/0)

# 4. Examine the output of is.finite(0/2)

# 5. Store the output of 2/0 in i.

# 6. Test that i is infinite.


### NaN (Not a Number) is a reserved word in R.

0/0
x <- log2(-10)
x

# 2. Examine the output of is.nan(x).

# 3. Examine the output of is.na(x).

### NULL

# Complete absence of any value or object.

######################################################
### Think about the output of the following blocks ###
######################################################

is.null(0)

retval <- cat("Just some text\n");
retval

is.null(0/0)

is.null(authors[3]);
# }}}

# {{{ Matrices (matrices)
################
### Matrices ###
################

# Like data frames, these are two dimensional tables with rows and
# columns.

# All elements in a matrix have to be of the same type.

### Making a matrix by using matrix().

x <- seq(1,50);
x;

m <- matrix(x, nrow = 5, ncol = 10);

rownames(m) <- paste("R", seq(1, 5), sep = "");
colnames(m) <- paste("C", seq(1, 10), sep = "");

rownames(m);
colnames(m);


### Making a matrix by adding the dim attribute to a vector.

m <- seq(51,100);
dim(m) <- c(5,10);
m;

attributes(m);
class(m);

rn <- paste("R", seq(1, 5), sep = "");
cn <- paste("C", seq(1, 10), sep = "");
dimnames(m) <- list(rn, cn);

attributes(m);
str(m);
# }}}

# {{{ Subsetting matrices (subsetmat)
###########################
### Subsetting matrices ###
###########################

# matrix[rownum, colnum]

# If you do not specify any rows to get, you get all rows.

# If you do not specify any columns to get, you get all columns.

# Just like subsetting data frames, except that if you ask for a single
# row you get a vector.

m[1,2];

m["R1", "C2"];

row3 <- m[3,]; row3;

class(row3);

col1 <- m[, 1]; col1;

class(col1);

### Using more than one rows and columns for subsetting a matrix

# To extract any arbitrary part of your matrix as a matrix you
# may use vectors of rownums and colnums as below.

m[c(2,3), c(2,4)];

s <- m[c("R2","R3"), c("C2", "C4")];

s;

class(s);

attributes(s);

#################################
### Do the following yourself ###
#################################

# 1. Store the sequence 1 to 28 to a vector d.

# 2. Use matrix() to make a matrix x from d having 7 columns and
#    4 rows such that the first row reads 1,2,3,4,5,6,7 as shown
#    below. Refer to the help of matrix() to find out the named
#    argument you need to use.

#   1    2    3    4    5    6    7
#   8    9   10   11   12   13   14
#  15   16   17   18   19   20   21
#  22   23   24   25   26   27   28

# 3. Set the column names to Mon, Tue, Wed...

# 4. Set the row names to Week1, Week2, Week3...

# 5. Examine the matrix x.

#       Mon Tue Wed Thu Fri Sat Sun
# Week1   1   2   3   4   5   6   7
# Week2   8   9  10  11  12  13  14
# Week3  15  16  17  18  19  20  21
# Week4  22  23  24  25  26  27  28

# 6. Extract the date on the Friday of the third week.
# 7. Store all the dates falling on Wednesday to wed.
# 8. Examine wed.
# }}}

# {{{ Arrays (arrays)
##############
### Arrays ###
##############

# Like matrices but can have more than just two dimensions.
# You can think of a 3 dimensional array as a collection
# of matrices.
# Function named array().

a <- array(rnorm(60), c(3,2,10),
           dimnames=list (
             paste("R", seq(1, 3), sep = ""),
             paste("C", seq(1, 2), sep = ""),
             paste("M", seq(1, 10), sep = "")
           )
);




a["R1","C2","M5"];   # vector with one value

a["R2","C2",];    # vector

a[,,"M6"];     # matrix


# Another way to make the same array.

rm(a);
a <- rnorm(60);
dim(a) <- c(2,3,10);
a;

class(a);

attributes(a);

str(a);

a[1,2,5];   # vector with just one value
a[2,2,];    # vector
a[,,6];     # matrix

class(a[1,2,5]);
class(a[2,2,]);
class(a[,,6]);    # matrix
# }}}

# {{{ Calculating a new column (calcnewcol)
################################
### Calculating a new column ###
################################

# The file data/expression.csv has the same contents as the
# "expression" sheet of file.xlsx.

data <- read.csv("data/expression.csv", header = TRUE, row.names = 1)
head(data)
nf <- cbind(data, logFC = data$treatment - data$control)
head(nf)


#################################
### Do the following yourself ###
#################################

# 1. Instead of getting a new data frame as above, you
# can assign a new column to your original data frame
# (named "data" in this case). This is done by assigning
# a vector to a new column name. Delete data then read
# the file into the data again. Now add a column named
# logFC to data by directly assigning to data$logFC.


# 2. Confirm that "logFC" column has been added to data.


# 3. The products of all the genes in "data" are written
# in the file "products.csv".


# 4. Read the file "data/products.csv" into a data frame
# named temp. Use the named arguments row.names = 1,
# stringsAsFactors = FALSE.


# 5. Add the product column from temp to data but keep
# in mind that the order of genes in temp is not the
# same as in data. Hint: Use rownames(data) to subset
# temp.

# The data frame "data" is needed in the later
# exercises. Keep it.

###################
### dplyr style ###
###################

tib <- read_csv("data/expression.csv", col_names = TRUE);

tib1 <- mutate(tib, logFC = treatment - control);
tib1

# Or, we could simply overwrite tib.

tib <- mutate(tib, logFC = treatment - control);
tib

# dplyr joins #

temptib <- read_csv("data/products.csv")
temptib
left_join(tib, temptib, by = "gene")

# Simulating one unwanted column in temptib.
temptib <- mutate(temptib, unwanted = rep("unwanted",
                  nrow(temptib)));
temptib

# If we have unwanted columns in temptib
# without column selection
left_join(tib, temptib, by = "gene")
# with column selection
left_join(tib, select(temptib, gene, product),
                  by = "gene")

### Piping ###
# Useful for discarding intermediate objects.
# Easier to apply on several objects.

select(tib, gene, logFC) %>% 
  left_join(select(temptib, gene, product), by = "gene")

tib <- tib %>% left_join(select(temptib, gene, product),
                         by = "gene")
tib;
# }}}

# {{{ Sorting (sorting)
###########################
### Sorting a data frame ###
############################

# Three related functions: sort(), order(), rank()

### sort() ###

set.seed(56)
x <- as.integer(runif(10, 1, 50) * 7)
x
sx <- sort(x)
sx

### The order of numbers in x itself is unchanged by the sort
### operation. sx is a new vector.

### rank() ###

rx <- rank(x)

rx

### order() ###

ox <- order(x);

ox;

# For the same vector x, compare the output of rank() and order()
# x, ox and rx.


# To sort a data frame by some column, we cannot simply use
# sort().

# 1. First we get the order of rows by calling order() on the
#    column we wish to sort by.

# 2. Then we use the order to sort the entire data frame.

ordvec <- order(data$logFC);
sdata <- data[ordvec, ];
head(sdata);
tail(sdata);

#################################
### Do the following yourself ###
#################################

# Run the following block if you have lost or broken the
# data frame named "data" made earlier.
data <- read.csv("data/expression.csv", header = TRUE, row.names = 1)
data$logFC <- data$treatment - data$control;
temp <- read.csv("data/products.csv", row.names = 1,
                    stringsAsFactors = FALSE);
data$product <- temp[rownames(data), "product"]


# 1. It would be more meaningful to sort data on absolute log
#    fold change and to have the highest change at the top.

# 2. The function for getting absolute values is abs().

# 3. Consult the help for order() to find the named argument you
#    need to use to order in decreasing order.

# 4. Now sort data by decreasing value of absolute logFC.



# If you have ties in the column you are sorting by then you
# might wish to use a second column to break the ties.
 
# Below, I am copying data to data2 and setting some control
# values to 50.

data2 <- data;
data2[c("SCO0500", "SCO0501", "SCO0502", "SCO0503") , "control"] <- 50;

# Suppose we wish to sort this data frame in decreasing order by
# the control expression but in increasing order by the absolute
# logFC.

ordvec <- order(-data2$control, abs(data2$logFC))
sdata2 <- data2[ordvec, ]
head(sdata2)

###################
### dplyr style ###
###################

stib <- arrange(tib, logFC);
stib

stib <- arrange(tib, desc(abs(logFC)));
stib

tib2 <- as_tibble(data2, rownames = "gene");
stib2 <- arrange(tib2, desc(control), abs(logFC));
stib2

# }}}

# {{{ Conditional subsetting (subsetcond)
##############################
### Conditional subsetting ###
##############################

# Run the following block if you have lost or broken the
# data frame named "data" made earlier.
data <- read.csv("data/expression.csv", header = TRUE,
                 row.names = 1)
data$logFC <- data$treatment - data$control;
temp <- read.csv("data/products.csv", row.names = 1,
                    stringsAsFactors = FALSE);
data$product <- temp[rownames(data), "product"]


head(data);
nrow(data)


up1.tf <- data$logFC >= 1;
up1 <- data[up1.tf, ];
nrow(up1);
head(up1)

up1c7.tf <- data$logFC >= 1 & data$control >= 7 ;
up1c7 <- data[up1c7.tf, ];
nrow(up1c7)
head(up1c7)

### dplyr style ###

up1c7.tib <- filter(tib, logFC > 1 & control >= 7);

# }}}

# {{{ which and subset (which_subset)
############################
### which() and subset() ###
############################

which17 <- which(data$logFC >= 1 & data$control >= 7);
class(which17)
which17
up1c7 <- data[which17, ];
nrow(up1c7)
head(up1c7)

################
### subset() ###
################

fc1c7 <- subset(data, logFC >= 1 & control >= 7);
fc1c7;
fc1c7 <- subset(data, data$logFC >= 1 & data$control >= 7);
fc1c7;

# filter() also works on data frames.
x <- filter(data, logFC > 1 & control >= 7);
class(x);

xt <- filter(tib, logFC > 1 & control >= 7);
class(xt);


#################################
### Do the following yourself ###
#################################

# 1. Make a new data frame containing just the control and
#    treatment columns from data.

# 2. Use rowMeans() on this new data frame to get the average of
#    control and treatment for each row.

# 3. Add a column named "avexp" to data containing the vector
#    obtained in the step above.

# 4. Select rows from data where avexp is more than or equal to 6
#    and abs(logFC) is more than or equal to 4.

# 5. How many rows do you get in the step above?

####################################
### Vectorised or non-vectorised ###
####################################

set.seed(3141593); # So that we have the same random numbers.
x <- runif(10, min = 3, max = 6);
y <- runif(10, min = 12, max = 20);
df <- data.frame(x = x, y = y);
df
subset(df, x > 4 & y > 15);
subset(df, x > 4 && y > 15);

subset(df, x < 4 | y < 15);
subset(df, x < 4 || y < 15);

# What is the output of 
# 1. df$x > 4 & df$y > 15
# 2. df$x > 4 && df$y > 15
# 3. df$x < 4 | df$y < 15
# 4. df$x < 4 || df$y < 15

###################
### dplyr style ###
###################

### group_by() and summarise() ###

group_by(stib, lfc3 = abs(logFC) >= 3) %>%
summarise(count = n());

stib %>% group_by(lfc3 = abs(logFC) >= 3) %>%
          summarise(count = n());

# Take care not to put the pipe at the start of a line.

### filter() ###

# Note dplyr::filter() masks functions of the same
# name in base and stats packages.

# At least two-fold upregulated.

stib %>% filter(logFC >= 1)
filter(stib, logFC >= 1)

stib %>% filter(logFC >= 1) %>% summarise(count = n())

# Reminder to demonstrate the consequence of putting
# the pipe at the start of a line.

stib %>% filter(logFC >= 1 & control >= 7) %>%
  summarise(count = n())


stib %>% filter(logFC >= 1 & control >= 7
    & str_detect(product, "regulator|sigma|transcription")
    ); 

# Below is the same as above.
filter(stib, logFC >= 1 & control >= 7
    & str_detect(product, "regulator|sigma|transcription")
    ); 

# The outputs of the above two are assignable.

hiup2 <- filter(stib, logFC >= 1 & control >= 7
    & str_detect(product, "regulator|sigma|transcription")
    ); 
hiup2

### Inverting (logical NOT)

stib %>% filter(logFC >= 1 & control >= 7
    & !str_detect(product, "hypothetical")
    ); 

# }}}

# {{{ Regular Expressions (regex)
###########################
### Regular Expressions ###
###########################

# Suppose we want all genes with logFC more than 2.5 AND which
# are not "hypothetical proteins".

notHypoth2.5 <- data[
  abs(data$logFC) >= 2.5 &
    data$product != "hypothetical protein"
  , ];

head(notHypoth2.5);
nrow(notHypoth2.5);


# In reality the situation is usually not so simple.

# There might be more than one space between "hypothetical" and
# "protein"?

# Inconsistent capitalisation, e.g. "hypothetical" starting with
# a capital "H".

# Alternative spellings.

# Most characters in a RE match themselves but some have special
# meanings.

# To use the special ones literally you need to escape them with
# "\". e.g. \$ for the dollar symbol.

### Quantifiers ###

# ?     Zero or once.                              
# *     Zero or more.                              
# +     Once or more.                              
# {n}   Exactly n times.                           
# {m,n} At least m times but no more than n times. 
# {m,}  At least m times.                          


### Metacharacters ###
 
# .   Any character                               
# ^   Beginning of the string.                    
# $   End of the string.                          


### Character classes ###

# []  Group of characters e.g. [A-Z].             
# [^] Not in the group of characters e.g. [^0-9]. 

### Abbreviations ###

# \s   Any white space [ \t\n\r\f]
# \d   Any digit [0-9]
# \w   Any word character [0-9a-zA-Z_]
# There are others.

f <- c(
"favourite colour",
"Favourite Colour",
"favorite color",
"favorite colored dress",
"favourite  coloured dress",
"nice colored dress"
);

# The indexes which match.
grep("colour", f);
str_which(f, "colour");

# The values which match.
grep("colour", f, value = TRUE);
str_subset(f, "colour");

# One or zero 'u'.
grep("colou?r", f, value = TRUE);
str_subset(f, "colou?r");

# $ to anchor match at end of string.
grep("colou?r$", f, value = TRUE);
str_subset(f, "colou?r$");

grep("favou?rite colou?r$", f, value = TRUE);
str_subset(f, "favou?rite colou?r$");

# + after the space mean one or more spaces.
# And, case-insensitive matching.
grep("favou?rite +colou?r", f, value = TRUE, ignore.case = TRUE);
str_subset(f, regex("favou?rite +colou?r", ignore_case = TRUE));

# using \s for space. Otherwise same as above.
grep("favou?rite\\s+colou?r", f, value = TRUE, ignore.case = TRUE);
str_subset(f, regex("favou?rite\\s+colou?r", ignore_case = TRUE));

# logical (TRUE or FALSE) output.
grepl("favou?rite\\s+colou?r", f, ignore.case = TRUE);
str_detect(f, regex("favou?rite\\s+colou?r", ignore_case = TRUE));

# Substitution
spacefixed <- gsub(" {2,}", " ", f);
spacefixed1 <- str_replace_all(f, " {2,}", " ");

spellfixed <- gsub("vori", "vouri", spacefixed);
spellfixed1 <- str_replace_all(spacefixed, "vori", "vouri");

selector <- !grepl(
"hypothetical +protein",
data$product, ignore.case = TRUE);

selector <- !str_detect(data$product,
regex("hypothetical +protein", ignore_case = T));


notHypoth2.5 <- data[abs(data$logFC) >= 2.5
& selector , ]

nrow(notHypoth2.5)
head(notHypoth2.5)
min(abs(notHypoth2.5$logFC))

# There is a lot more to regular expressions than we
# have demonstrated above. They are a truly general
# purpose high value skill to acquire. All programming
# languages worth learning / using have them in some
# form or another.

### Some useful regular expression related functions in
### R.

# grep()
# regexpr()
# gregexpr()
# sub()
# gsub()
# And the alternatives in the package stringr of Tidyverse.
# }}}

# {{{ apply et al. (apply)
######################
### apply() et al. ###
######################

### apply() ###
x <- runif(60, min = 20, max = 30)
dim(x) <- c(15, 4);
x

apfun <- function(arg1) {
return(arg1 - mean(arg1));
}
apply(x, 1, apfun);
t(apply(x, 1, apfun));

y <- cbind(x, t(apply(x, 1, apfun)));
y


### lapply() and sapply() ###

strepgenes <- read.csv("data/strepGenes.txt", header = F,
                       stringsAsFactors = F, col.names =
                       c("all.names"));

x <- head(strepgenes, 1); # for explaining
str_split(x$all.names, "\\s+"); # for explaining


canoname <- function(x) {
spl <- str_split(x, "\\s+");
splitvec <- spl[[1]];
cano <- splitvec[!grepl("SVEN_|SVEN15_|vnz_|^-$",
    splitvec, perl = TRUE)];
return(cano);
}

lapply(strepgenes$all.names, canoname);

unlist(lapply(strepgenes$all.names, canoname));

sapply(strepgenes$all.names, canoname);

unname(sapply(strepgenes$all.names, canoname));

temp <- cbind(strepgenes,
cano = unname(sapply(strepgenes$all.names, canoname)));

### tapply() ###

# We saw this when doing Factors.
# }}}

# {{{ RNA-Seq (rnaseq)
###############
### RNA-Seq ###
###############

# Use of the package edgeR to analyse RNASeq data

# edgeR is a Bioconductor package you can read about it
# here
# https://www.bioconductor.org/packages/release/bioc/html/edgeR.html
# Start with the User Guide. You may have to read the
# Reference Manual to do somethings.

# Using these two it is possible to develop a sequence
# of R commands which will do the analysis you desire on
# the data you have. This is a general pattern in
# Bioconductor packages.

### The experiment ###

# Antibiotic producing Streptomycetes often encode for more
# than one antibiotic but only one is expressed. Often, if
# this one is deleted another gene cluster will become
# activated and the organism will produce a different
# antibiotic.
 
# In this experiment we want to find out what genes are
# activated when the gene cluster producing the major
# antibiotic is deleted.
 
# dClus is the strain in which the cluster has been deleted.
# WT is the wild type strain.

# The reference genome is that of the wild type strain.

## Subread ##

# subread-buildindex make index for the reference genome.
# subread-align to align reads in fastq files to the index.
# featureCounts to get a table of number of reads mapping to
# each gene in the reference genome.

# Below are the columns in featcounts.tsv.

# 0	Geneid
# 1	Chr
# 2	Start
# 3	End
# 4	Strand
# 5	Length
# 6	dClus.d5.1
# 7	dClus.d5.2
# 8	dClus.d5.3
# 9	dClus.d2.1
# 10	dClus.d2.2
# 11	dClus.d2.3
# 12	WT.d5.1
# 13	WT.d5.2
# 14	WT.d5.3
# 15	WT.d2.1
# 16	WT.d2.2
# 17	WT.d2.3


### Analysis in R ###

# Read in the counts.
rdf <- read.delim("data/featcounts.tsv", row.names = "Geneid");
gene.lengths <- rdf[, "Length"];
names(gene.lengths) <- rownames(rdf);

# Delete
st.deleted <- seq(6650, 6690);
st.deleted <- str_c("Stri_", st.deleted);
rdf[st.deleted, ];

x <- rdf[, 6:ncol(rdf)];

# Reorder the columns so that replicates are next to each other.
cn <- colnames(x);
socn <- sort(cn);
socn;
x <- x[, socn];

# Groups
samp <- c("d2", "d5", "w2", "w5"); # needed later to make design.
group <- factor(rep(samp, each = 3))

# DGEList
y <- DGEList(counts = x, group = group);

# Filter out low counts. Then I also filter out
# all the RNAs. 
kept <- filterByExpr(y)
kept[str_detect(names(kept), "RNA")] <- F;

table(kept);
kept[!kept];

# help(subsetting, package = edger) to understand the line below.
y <- y[kept,,keep.lib.sizes=FALSE]

# Read products from 2 column file into data frame products.
# Add gene lengths and products to y$genes dataframe.
products <- read.delim("data/gene_products.tsv", stringsAsFactor = F,
header = T, row.names = 1);

y$genes <- data.frame(Length = gene.lengths[rownames(y)],
Product = products[rownames(y), "Product"]);

# Normalisation factors
y <- calcNormFactors(y)

#################################
### Do the following yourself ###
#################################

# 1. Examine the output of methods(class = class(y))

# 2. Amongst a lot of other things, the above will show
# you methods named rpkm() and rpkmByGroup()

# 4. Now use rpkmByGroup() to get the RPKMs and write them
# out to a tsv file using the write_tsv function. You will
# need as_tibble() here.

###############################
### Differential Expression ###
###############################

# Model matrix and design.
design <- model.matrix(~0+group, data = y$samples)
colnames(design) <- samp;

# Estimate dispersion and then get fit (glmQLFit()).
y <- estimateDisp(y,design)
fit <- glmQLFit(y, design)

# Contrasts we are interested in (makeContrasts()).
st.contrasts = makeContrasts(
day2=d2-w2,
day5=d5-w5,
levels = colnames(design)
);

# Test (glmQLFTest());
qlf <- glmQLFTest(fit, contrast = st.contrasts)

# Toptags (topTags) and output.
outlist = list();
for(rdc in colnames(st.contrasts)) {
qlf <- glmQLFTest(fit, contrast = st.contrasts[, rdc])
qtt = topTags(qlf, n = nrow(y), sort.by = "PValue")
outlist[[rdc]] <- qtt$table
}

names(outlist)

outdir <- c("out");
for(cname in names(outlist)) {
odf <- outlist[[cname]];
ofn <- file.path(outdir, str_c(cname, "_DGE.txt"));
otib <- as_tibble(odf, rownames = "Gene");
write_tsv(otib, ofn, quote_escape = "none");
}

# Collecting the RPKMs of the most highly changed genes

rpkms <- read.delim("out/rpkms.tsv", header = T, row.names = 1);
bylfc.day5 <- outlist$day5[
order(abs(outlist$day5$logFC), decreasing = T), ];

rpkms.bylfc <- rpkms[rownames(bylfc.day5), ]
head(rpkms.bylfc, n = 30);

filter(rpkms.bylfc, d2 >= 5 | d5 >= 5) %>%
top_n(30)

##################
### Why logFC? ###
##################

# Linear scale is asymmetric.

# Two fold up-regulation is 2

# Two fold down-regulation is 0.5

# So the entire down-regulation side is squeezed between
# 0 and 1.

plot(de.table$logFC, pch = 20)
plot(2**(de.table$logFC), pch = 20)

lfc <- sample(de.table$logFC, length(de.table$logFC));
plot(lfc, pch = 20)
plot(2**(lfc), pch = 20)

# Table of linear to log2 values.
x <- c(seq(2,16), seq(20, 200, by = 20));
lx <- log2(x);
lin2log <- data.frame(x = x, log2.x = lx)
lin2log

# Table of log2 to linear values
log2lin <- data.frame(log2.x = seq(0, 10, by = 0.5),
                      x = 2**(seq(0,10, by = 0.5))
                      );
log2lin


# Keep the following in mind when working with logFC and
# linearFC.

# 1. You cannot take the log of a negative number.

# 2. Log of numbers less than 1 is negative.

# 3. Log of 1 is zero.

# 4. Log of zero is -Inf.

# 5. Raise the base to the logFC value to get the linear
# fold change.
# }}}

# {{{ Plotting devices (devices)
########################
### Plotting devices ###
########################

### Plotting Devices ###

# Plotting functions such as plot() draw to a plotting
# device.

# If no plotting device(s) exists then one of the
# default type is created.

# Devices are identified by numbers.

# At any time you have only one active plotting device
# although more may be in existence.

# dev.* functions control plotting devices.

# e.g. dev.new() will give you a new plotting device of
# the default type.

# e.g. dev.set() is called with an argument which is the
# device number you wish to make active.

# You can use windows() to get a plotting device for
# your current display. On Linux this command is x11()
# and on OSX it is quartz().

# dev.off() can be used to close any plotting device. If
# no argument is given, the active plotting device is
# closed.

# graphics.off() is used to close all plotting devices.

# It is important to close devices if they are connected
# to a file such as a png or a jpeg file.

#################################
### Do the following yourself ###
#################################

# 1. x <- seq(1, 1e4, by = 5)

# 2. y <- log10(x)

# 3. Get a new plotting device by using dev.new()

# 4. Get a new plotting device by using windows()

# 5. Examine the output of dev.list()

# 6. plot(x,y)

# 7. Use dev.set() to make the other plotting device
# active.

# 8. Again, plot(x,y)

# 9. Use dev.off() to close the active device.

# 10. Use graphics.off() to close all plotting devices.
# }}}

# {{{ Base graphics (graphics)
#####################
### Base graphics ###
#####################

# Several commands, plot(), boxplot(), points(), lines(),
# abline() and several others.

# plot() is usually the starting function call.

# points(), lines(), abline() etc. can add to the plot
# initially made by plot.

# plot() can behave differently depending upon what
# arguments are passed to it.

graphics.off()
x <- rnorm(1000, mean  = 20, sd = 2);
plot(x);
boxplot(x);

m <- matrix(x, nrow = 200, ncol = 5);
plot(m[,1], m[,2]);

plot(m[,1], m[,3]);

boxplot(m)
#################################
### Plotting parameters par() ###
#################################

# e.g. colour, title, margins, plots per device, font
# sizes, etc.

# The function par() is used to set the plotting
# parameters.

# Calls to par() affect the active plotting device.

# Calls to par() may be made before, in-between and
# along with calls to plot(), points(), lines() etc.

# The changed parameters affect all subsequent commands
# acting on the plot.

# help("par") lists a lot of parameters that can be set
# via par().

graphics.off();
par(mfrow = c(1,2), bty = "n");
x <- rnorm(50);
par(pch = c(19));
plot(x);
# Examine the plot here and then proceed.
par(pch = c(20), col = "red");
plot(x, main = "This time in red")


#################################
### Do the following yourself ###
#################################

# 1. Get a new plotting device so that all parameters
#    are at their default values.

# 2. x <- seq(2,100, by = 2).

# 3. Use the pch argument to par to set the plotting
#    character to 19.

# 4. Plot x.

# 5. Now set the plotting character to 23 and the
#    plotting colour to "darkred" (the argument to par()
#    for setting the colour is col).

# 6. points() is used to add points to an existing
#    plot. Use points to add points for x/2 to the plot.

# 7. Use points to add points for x/1.75 to the plot
#    but this time use the argument col = "darkgreen" as
#    well so that they get rendered in dark green.
# }}}

# {{{ Specifying colours (colours)
##########################
### Specifying colours ###
##########################

# Using the 10 digits in base 10 (0 to 9), the highest
# two digit number we can express is 99.

10^2

### Counting in base 16 (hexadecimal or hex) ###

# Using 16 digits in base 16 (0 to 9 then A to F), the
# highest two digit number we can express is 255.

16^2

# 0 decimal is 00 in hex and 255 decimal is FF in hex.

# In binary, we need 8 bits (one byte) to count upto
# 255.

2^8

# So two hex digits can be used to express all the
# values possible using a single byte (0 to 255)

#  Colours are made by mixing red, green and,
#  blue channels.

#  Each channel can be anything from 0 to 255
#  (00 to FF in hex).

# An alpha channel can be added for controlling
# transparency of the colour.

#  Be careful with the spelling of colo(u)r.

# The R function rgb() lets you generate colours without
# the need to think in hex or even on a scale of 0 to
# 255.

# Fully opaque red.
rgb(255,0,0, maxColorValue = 255);
rgb(255,0,0,255, maxColorValue = 255);

# Fully opaque green. maxColorValue defaults to 1.
rgb(0,1,0, maxColorValue = 1);
rgb(0,1,0,1, maxColorValue = 1);

# Find it easier to think in percent?
rgb(0,100,0, maxColorValue = 100);
rgb(0,100,0,100, maxColorValue = 100);

barplot(c(1,2), col = c(
  rgb(100,100,0, maxColorValue = 100),
  rgb(0,100,100,100, maxColorValue = 100)
));  


reds <- seq(0.1, 1, 0.05);
greens <- seq(1, 0.1, -0.05);
blues <- c(0);

colmix <- rgb(reds, greens, blues);
names(colmix) <- paste("CO", seq(1, length(colmix)), sep = "");
colmix
ht <- runif(19, min = 5, max = 20)
barplot(ht, col = colmix)


### Function generator ###

crpfun <- colorRampPalette(c(rgb(0,0,1,1), rgb(1,0,0,1)),
                           alpha = TRUE);

crpfun <- colorRampPalette(c("blue", "red"),
                           alpha = TRUE);

crpfun(19)
ht <- rep(1, 19);
barplot(ht, col = crpfun(19))

# colorRampPalette(c(rgb(0,0,1,1), rgb(1,0,0,1)), alpha = TRUE)(19)

# }}}

# {{{ ggplot2 (ggplot2)
###############
### ggplot2 ###
###############

# Part of a collection of packages called tidyverse.

# The "gg" in ggplot2 stands for Grammar of Graphics.

# Much more structured and formal than the collection of
# graphics commands in base R.

### Three essential components of a ggplot ###

# 1. Data. Usually a dataframe or a tibble.

# 2. Aesthetic mappings. Think of them as mapping of
# data to axes and colour and shape of points. Function:
# aes().

# 3. Layers. Actual rendering on the plotting device.
# Functions: geom_*(). The kind of plot you want.
# Multiple layers are allowed and indeed, common.

### Function ggplot() ###

# Usually called with two arguments, data and aesthetic
# mapping.

# Data, of course, is your dataframe and you get an
# aesthetic mapping by calling aes(). Calls to aes() can
# be used as argument to ggplot() or to geom_*(). If
# included in ggplot() the values are inherited by all
# layers.

### Layers ###

# To the result of the call to ggplot() we can add
# layers.

### Theme ###

# Function theme().

# Control the overall appearance of a plot.

rm(list = ls());
df <- read.csv("data/tfaG.csv");
head(df);

# This is not the best way to organise your data for
# ggplot2. If you have a dataframe like.

#   hour       wt     tfaG
# 1    1 2.597158 2.830137
# 2    2 2.636187 2.800135
# 3    3 2.837971 2.917881
# 4    4 2.711013 2.703749
# 5    5 2.882070 2.838809
# 6    6 2.724614 2.028673


# Reform it to something like this.

#     hour strain  logexpr
# 1      1     wt 2.597158
# 2      2     wt 2.636187
# 3      3     wt 2.837971
# ...
# 118   58   tfaG 2.246144
# 119   59   tfaG 2.755333
# 120   60   tfaG 2.775126

# Think like this: everything on the x-axis goes in one
# column no matter how many categories those values
# belong to. The categories can be specified in other
# columns. Similarly for the values intended for the
# y-axis. This is often referred to as the "tidy" data
# format.

# Below is one way of getting from df to gdf.

gdf <- data.frame(hour = rep(df$hour, 2),
      strain = c(rep(colnames(df)[2], nrow(df)),
      rep(colnames(df)[3], nrow(df))),
      logexpr = c(df$wt, df$tfaG)
)
head(gdf)
class(gdf$strain)

### Plotting begins ###

p1 <- ggplot(gdf, aes(x = hour, y = logexpr, colour = strain)) +
  geom_point() +
  geom_path()

# Axis labels xlab(), ylab()
# expression(); help("plotmath");

l2e <- expression(log[2]~Expression); # help("plotmath");
p1 + xlab("Hours of growth") + ylab(l2e);

# Theme
p1 + theme_bw()

p2 <- ggplot(gdf, aes(hour, logexpr, colour = strain,
              shape = strain)) +
              geom_point(size = 3) +
              geom_path(size = 1.2)


# Plotting colours and legend
gdfcols <- c("#129628", "#961254");
p3 <- p2 + scale_colour_manual(name = "Strain id",
values = c(gdfcols),
aesthetics = c("colour", "fill"),
labels = c("tfaG deletion strain", "M600")) +
scale_shape_discrete(name = "Strain id",
labels = c("tfaG deletion strain",
"M600")) + theme_bw() +
xlab("Hours of growth") + ylab(l2e);

# Main title
plot.title <- c("Expression of SpoF in M600 and tfaG");
plot.title <- paste(plot.title, "deletion strains\nover 60");
plot.title <- paste(plot.title, "hours of growth in shaken flask");

p4 <- p3 + ggtitle(plot.title);

# Theme
p5 <- p4 +
  theme_bw() +
  theme(plot.title = element_text(size = 24, face = "bold",
                                  hjust = 0.5)) +
  theme(axis.title = element_text(size = 18, face = "bold",
                                  vjust = 0.5)) +
  theme(axis.text = element_text(size = 15, face = "plain",
                                 vjust = 0.5)) +
  theme(legend.text = element_text(size = 15, face = "bold",
                                   hjust = 0.5)) +
  theme(legend.key.size = unit(15, "mm")) +
  theme(legend.title = element_text(size = 18, face = "bold",
                                    hjust = 0.5)) +
  theme(plot.margin = margin(1, 1, 1, 1, "cm")) +
  theme(panel.grid = element_blank())

p5
ggsave("out/expression.pdf", p5)
ggsave("out/expression.png", p5)

## p + xlim(5, 20) + ylim(0, 50)

# }}}

# {{{ Spore lengths (sporelens)
#####################
### Spore lengths ###
#####################

sldf <- read.csv("data/sporelen.csv", header = T)

# Actually the "strain" column has two pieces of information
# in it; strain and medium. We need to separate these out
# into two factors.

# Use of regular expressions below.
str <- sub("\\d+$", "", sldf$strain, perl = TRUE);
medium <- sub("^[A-Z]+", "M", sldf$strain, perl = TRUE);

sldf$strain <- factor(str);
sldf$medium <- factor(medium);
head(sldf);

# Now we have the data in a form that can be used in
# function calls. We are going to use this data for plotting
# but this form of data is also the form you need if you
# wish to do ANOVA.

# Run aov() and anova()
# medium.aov <- aov(spore.len ~ medium, data = sldf);
# anova(medium.aov);
#
# strain.aov <- aov(spore.len ~ strain, data = sldf);
# anova(strain.aov)


# Scatter plot spore.len against medium
ggplot(sldf, aes(x = medium, y = spore.len,
                 colour = medium)) +
  geom_point()

# Scatter plot log2(spore.len) against medium
ggplot(sldf, aes(x = medium, y = log2(spore.len),
                 colour = medium)) +
  geom_point()

# Scatter plot log2(spore.len) against strain
ggplot(sldf, aes(x = strain, y = log2(spore.len),
                 colour = strain)) +
  geom_point()

# Separate boxplots of spore.len against growth medium
# using facet_wrap().
ggplot(sldf, aes(x = medium, y = log2(spore.len),
                 colour = medium, fill = medium)) +
  geom_boxplot() + facet_wrap(~strain)


#################################
### Do the following yourself ###
#################################

# 1. Make a boxplot keeping the x axis as strain but
# changing colour and fill to medium. (Don't use
# facet_wrap()).

# 2. Make another boxplot keeping the x axis as medium
# and changing colour and fill to strain.

# 3. How can you keep both the above plots in view so
# that you can compare them?

# 4. Try geom_violin() instead of geom_boxplot().


crpfun <- colorRampPalette(
  c("red", "yellow", "brown", "violet", "blue", "green"),
    alpha = FALSE, space = "Lab");
crpfun(6)

ggplot(sldf, aes(x = medium, y = log2(spore.len),
                 colour = strain, fill = strain)) +
  geom_boxplot() +
  scale_colour_manual(values = (crpfun(6))) +
  scale_fill_manual(values = (crpfun(6)))


# Do we have enough data? Plotting counts.
# geom_bar() counts.

ggplot(sldf, aes(x = medium)) +
  geom_bar(colour = "darkblue", fill = "darkblue") +
  facet_wrap(~strain)

ggplot(sldf, aes(x = strain)) +
  geom_bar(colour = "brown", fill = "brown") +
  facet_wrap(~medium)


# geom_col() does not count. Use this if you have
# counts.

countvec <- integer();
for(s in levels(sldf$strain)) {
s.count <- nrow(subset(sldf, strain == s))
countvec[s] = s.count;
}
countvec

cdf <- data.frame(count = countvec, strain = names(countvec))
cdf

# Or
cdf <- stack(countvec);
colnames(cdf) <- c("count", "strain");
cdf


ggplot(cdf, aes(x = strain, y = count)) +
  geom_col()
# }}}

# {{{ Histograms (histograms)
##################
### Histograms ###
##################

# The data in septaldist.csv contains the inter-septal
# distances measured in the wild type and a mutant
# strain of Streptomyces. The first column contains the
# distances in micrometers and the second column contains
# either "wt" or "mut" (factor).

df <- read.csv("data/septaldist.csv");
head(df)
tail(df)
wt <- df[df$strain == "wt", 1]
mut <- df[df$strain == "mut", 1]

# We have the two vectors made above and we wish to plot
# their histograms next to each other so that we can see
# the overlap between them. hist() has an argument named
# add which adds to an existing histogram rather than
# plot a new one. So we decide to use this.

hist(wt, breaks = 20, col = "#00009955",
     main = "Histograms of WT and Mutant");

# Notice the add argument below.
hist(mut, breaks = 20, col = "#00990055", add = TRUE);


# Most of the histogram for the mutant is beyond the
# limit of the x axis. So we decide to extend the limits
# of the x-axis.

hist(wt, breaks = 20, col = "#00009955",
     xlim = c( min(c(wt,mut)), max(c(wt,mut)) ),
     main = "Histograms of WT and Mutant");
hist(mut, breaks = 30, col = "#00990055", add = TRUE);

# Now we are losing the tops of the central bars of the
# mutant histogram. So we need to extend the y-axis as
# well. The problem is that the y-axis range gets
# decided in the call to hist(). It cannot be determined
# by the looking at data.

# We need to find out the height of the tallest bar in
# the histogram and adjust the upper limit of the y-axis
# before the histogram is actually drawn. For this we
# need to save the return values of the calls to hist()
# and also suppress actual plotting when hist() is
# called.

hwt <- hist(wt, breaks = 20, plot = FALSE);
hmut <- hist(mut, breaks = 30, plot = FALSE);

# Examine hwt and hmut here.

xlm <- c( min(c(wt,mut)), max(c(wt,mut)) );
ylm <- c( min(c(hwt$counts, hmut$counts)), max(c(hwt$counts, hmut$counts)) );

plot(hwt, col = "#00009955",
     xlim = xlm, ylim = ylm, xlab = "Septal distance",
     main = "Histograms of WT and Mutant"
);

plot(hmut, col = "#00990055", add = TRUE);

### Putting the final plot in a png file.

png(filename = "out/intersept.png", width = 1200, height = 800);
plot(hwt, col = "#00009955",
     xlim = xlm, ylim = ylm, xlab = "Septal distance",
     main = "Histograms of WT and Mutant"
);

plot(hmut, col = "#00990055", add = TRUE);
dev.off()

# There are similar functions for jpeg, tiff, pdf,
# postscript (ps) etc.
#
# Journals often want Encapsulated Postscript (eps) files.
# setEPS() calls ps.options() with reasonable defaults.
# Then you can call postscript() just like you called
# png() above to get an eps file of your plot.


### Using the ggplot2 library ###

ggplot(df, aes(sep.dist, fill = strain)) +
  geom_histogram(alpha = 0.3, bins = 60, colour = "grey80")

ggplot(df, aes(sep.dist, fill = strain)) +
  geom_histogram(alpha = 1, bins = 40, colour = "grey80") +
  facet_wrap(~strain)



h1 <- ggplot(df, aes(sep.dist, fill = strain)) +
  geom_histogram(alpha = 0.3, bins = 60, color = "grey70")
h1


# Main title
mt <- "Histogram of interseptal distances in mutant"
mt <- paste(mt, "and wild type strains");

# Axis labels
h1 <- h1 + labs(x = "Interseptal Distance", y = "Count",
                title = mt);
h1

h2 <- ggplot(df, aes(strain, sep.dist, colour = strain)) +
  geom_boxplot()

h3 <- ggplot(df, aes(strain, sep.dist, colour = strain)) +
  geom_violin()


# Writing ggplot2 objects to a file.

pdffn <- c("out/hist123.pdf");
pdf(pdffn)
print(h1)
print(h2)
print(h3)
dev.off()

# ggsave()

pdffn <- c("out/hist1.pdf");
ggsave(pdffn, h1)
# }}}

# {{{ Closing comments (close)
########################
### Closing comments ###
########################

# Like any other skill, the best way to maintain and
# advance your R skills is by using it regularly. Try to get
# together with a friend and use R regularly. You will learn
# a lot faster if you practice in pairs. 

# Don't try to remember things. That is what computers are
# for. Develop the skill to read documentation quickly. It
# more important than you think. Not just in R.

# R manuals webpage.
# https://cran.r-project.org/manuals.html

# PDF of the Introduction to R book.
# https://cran.r-project.org/doc/manuals/r-release/R-intro.pdf

# RNA-Seq data analysis using edgeR.
# https://f1000research.com/articles/5-1438

# Some things are easier done in a general purpose
# programming language such as Perl or Python.

# }}}

__END__


# {{{ Attaching a data frame (attach)
##############################
### Attaching a data frame ###
##############################

# It is a convenience feature allowing you to refer to df$column
# as just column.


rm(list = ls());

control <- seq(1, 100);

df <- read.csv("data/expression.csv", row.names = "gene");

head(df);

attach(df);    # Note the warning following this command.

head(control);   # This control is not coming from the data frame df.

rm(control);

head(control);

search()

detach(df)

search()
# }}}

# {{{ Clearing your work space (rm)
################################
### Clearing your work space ###
################################

### Scenario 1 ###

x <- rnorm(20, mean = 20, sd = 3);
y <- rnorm(20, mean = 10, sd = 3);

# The above x and y are two objects sitting around from older work.

# Below you create x and y again for some new analysis.
# But the assignment to y fails because of a syntax error.

x <- rnorm(20, mean = 212, sd = 3);
y <- rnorm(20, mean = 210, , sd = 3);   # Assignment fails.

z <- x - y;  # This is being evaluated using the new x and the old y!

z;


### Scenario 2 ###

rm(list=ls());

x <- rnorm(20, mean = 212, sd = 3);
y <- rnorm(20, mean = 210, , sd = 3);  # Assignment fails.

z <- x - y; # Fails.
z;

# You make the correction needed and run again.

x <- rnorm(20, mean = 210, sd = 3);
y <- rnorm(20, mean = 212, sd = 3);

z <- x - y;

z;
# }}}

