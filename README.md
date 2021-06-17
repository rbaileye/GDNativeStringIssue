# GDNativeStringIssue
A Godot project for testing godot::String class across multiple Dll's, with GDNativeScript. 

Issue: The passing of Strings once they get so big causes crashes across Dll's using GDNativeScript 
I noticed this problem within my own project, once the Strings starting get to the size of around 100000

Tested on Godot version 3.3.2 stable 
	
OS. Windows 10.0.19041 Build 19041 

Note..I didn't set this up with scontruct or makefile, sorry. I am not a master of either, still learning as is life.  

Note 2!! This build process script assumes you have either VisualStudio2017 or 2019 community edition for build paths. If you have something different you can change 
it or just build it with visual studio or just take the source files and build it how ever you want. Just copy the dll's into the main GDNativeScriptStringIssue\bin 
path where the .gdnlib and .gdns files reside. 

Step 1: Build the godot-cpp bindings, follow the standard build for this
 https://github.com/godotengine/godot-cpp/tree/3.3

You will need to build the release and debug for the lib files for the each build type expected by the Dll's.
Copy the folder files from within the godot-cpp folder into my empty folder godot-cpp folder location with the copyfileshere.cmd. 
My Dll's are expecting the files to be in this location. 

Step 2: 
Run the buildscript.cmd in the Exampledlls folder in admin command window, just in case there are errors. 
This script should build the debug and release versions and copy the debug files into the bin folder where they are expected by the godot project. 

Step 3: Open the project in the godot editor(assuming you have this built already). Read what I wrote and uncomment the tests to see the results for yourself. 

Thanks to all that work on the Godot Engine and continue to support it. 

Rob
