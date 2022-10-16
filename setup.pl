#!/usr/bin/perl
# Purpose: Generate a C project, complete with: src/ inc/ build CMakeList.txt
# Usage: perl setup.pl
# Name: Patrick Mims
# Date: 10.15.22
# #

use strict;
use warnings;

my @items = ("src", "inc", "build");
my constant $DIR ='/home/patrick/Code/C/Exercises/17-Advanced-Pointers/17-1/';
my constant $fileName = "CMakeLists.txt";

if(-e $fileName) {
    print("Error ".$fileName." exists!\n");
} else { 
    open FH, ">>$fileName" or die "touch $fileName: $!\n";
        print FH "cmake_minimum_required(VERSION 3.24)\n";
        print FH "\n";
        print FH "project(main)\n";
        print FH "\n";
        print FH "set(CMAKE_C_FLAGS \${CMAKE_C_FLAGS})\n";
        print FH "\n";
        print FH "include_directories(include)\n";
        print FH "\n";
        print FH "file(GLOB SOURCES \"src/*.c\")\n";
        print FH "\n";
        print FH "add_executable(\${PROJECT_NAME} \${SOURCES})\n";
    close FH;

    for(@items) {
        print("Success [".$_."] created.\n");
        mkdir($DIR.$_);
    }
}

# add command line argument
# ./setup.pl clean
# this will delete all directories IF they're empty
# this is for testing purposes

# also add a CMakeLists.txt file
