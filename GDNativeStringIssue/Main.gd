extends Node

var classstring

signal pass_signal_message(message)

func _ready():
	Dlltestclass.connect("pass_message", self, "pass_to_next_dll" )
	
	Dlltestclass2._startup(self)
	
	#uncomment to test small string = 10000 
	#Dlltestclass.test_small_string()
	
	#uncomment to test big string size = 5000000
	#Dlltestclass.test_big_string()
	
	########################################################################################
	#tested on Godot version 3.3.2 stable 
	
	#OS. Windows 10.0.19041 Build 19041 
	
	#this project is single-threaded, as is my main project, so no funny business 
	#around that. 
	
	#I noticed this inconsistency with strings when I started passing 
	#response messages of around size 100000, sometimes it worked sometimes 
	#it failed and closed the application.
	
	#When I came across this in my main project I didn't even get these errors 
	#the client would just close with no errors on the debugger. 
	
	####################The testing ###############
	#This is where I will take the string of size 5,000,000 around what I assume would be the max 
	#size I would need of an message. 
	#from dll1 and try to pass it to dll2 through signals or just method calls, which appears to be fine 
	#coming through the first signal message to a godot class. 
	
	#At first I thought it was a timing issue around the lifetime of Strings 
	#but I copy to a class string in this class to do some testing around that, and it 
	#doesnt appear to be that.
	
	#But when I try to pass that string or a copy of it through another dll and boom 
	#an explosion happens. 
	
	#if the strings are smaller there doesnt appear to be an issue. You can uncomment 
	#above to test them.  
	
	#I tried to debug through to find out what was happening in the engine, but the 
	#CowData<char>::size (C:\git\godot-3.3-stable\godot-3.3-stable\core\cowdata.h:132)
	#is constantly being used by the different parts of the engine and was difficult 
	#to breakpoint around. 
	
	########################################################################################
	

func pass_to_next_dll(message) ->void:
	
	#to test issues with class string, this assignment seems to be consistent. 
	classstring = message
	
	#this in cpp is method(String message) 
	#uncomment to test 
	#Dlltestclass2.pass_method(classstring)
	
	#this in cpp is method(const String& message) 
	#uncomment to test
	#Dlltestclass2.pass_method2(classstring)
	
	#lets try to pass the String from the godot engine to the other dll.  
	#uncomment to test
	#emit_signal("pass_signal_message", classstring)
	
	

