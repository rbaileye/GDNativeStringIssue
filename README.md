# GDNativeStringIssue
A Godot project for testing godot::String class across multiple Dll's, with GDNativeScript. 

Issue: The passing of Strings once they get so big causes crashes across Dll's using GDNativeScript 
I noticed this problem within my own project, once the Strings starting get to the size of around 100000

Tested on Godot version 3.3.2 stable 
	
OS. Windows 10.0.19041 Build 19041 

Note..I didn't set this up with scontruct or makefile sorry, I am not a master of either, still learning as is with life.  

Step 1: Build the godot-cpp bindings, follow the standard build for this, you will need to build the release and debug for the lib files for 
the each build type expected by the Dll's.
Copy the folder files from within the godot-cpp folder into the empty folder godot-cpp folder location. My Dll's are expecting the files to be in this location. 

Step 2: 
Run the buildscript in the dll in a command window in admin, just in case there are errors. 
This script should build the debug and release versions and copy the debug files into the bin folder where they are expected by the godot project. 

Step 3: Open the project in the godot editor. Read what I wrote and uncomment the tests to see the results for yourself. 

Thanks to all that work on the Godot Engine and continue to support it. 

Rob
