# GDNativeStringIssue
A Godot project for testing godot::String class across multiple Dll's, with GDNativeScript. 

Issue: The passing of Strings once they get so big causes crashes across Dll's using GDNativeScript 
I noticed this problem within my own project, once the Strings starting get to the size of around 100000

tested on Godot version 3.3.2 stable 
	
OS. Windows 10.0.19041 Build 19041 

Note..I didn't set this up with scontruct sorry, I am not a master of it and haven't taken the time to learn it all yet. 

Step 1: Build the godot-cpp bindings repo, follow the standard build for this, you will need to build the release and debug lib files.
Copy the folder files from within the godot-cpp folder into the empty folder. My Dll's are expecting the files to be in this location. 

Step 2: 
Run the buildscript in the dll in a command window in admin, just in case there are errors. 
This script should build the debug and release versions and copy the debug files into the bin folder where they are expected by the godot project. 

Step 3: Open the project in the godot editor. Read what I wrote and uncomment the tests to see the results for yourself. 

Thanks to all that work on the Godot Engine and continue to support it. 

Rob
