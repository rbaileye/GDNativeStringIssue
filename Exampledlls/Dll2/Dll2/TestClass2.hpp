#include <File.hpp>
#include <Reference.hpp>
#include <Timer.hpp>
#include <Node.hpp>
#include <Ref.hpp>

#include <stdio.h>

using namespace godot;

class TestClass2 : public Node {
	GODOT_CLASS(TestClass2, Node)

public:

	
	Node* _routingclassptr;
	char messageowned[5000000] = { 0 };
	wchar_t messageowned2[5000000] = { 0 };

	static void _register_methods() 
	{
		register_method("_init", &TestClass2::_init);
		register_method("pass_method", &TestClass2::pass_method);
		register_method("pass_method2", &TestClass2::pass_method2);
		register_method("_startup", &TestClass2::_startup);
		register_method("signal_pass_method", &TestClass2::signal_pass_method);
	}

	void _init() {
	}

	void _startup(Object* routingNode)
	{
		//just here to conenct a class from godot to connect the signals here. 
		_routingclassptr = Object::cast_to<Node>(routingNode);
		_routingclassptr->connect("pass_signal_message", this, "signal_pass_method");
	}

	void signal_pass_method(String message)
	{
		String copyofmessage = message;

		//Length always seems to work fine. 
		int mlength = copyofmessage.length();
		Godot::print(String::num_int64(mlength));

		CharString temp = copyofmessage.ascii();
		const char* cptr = temp.get_data();

		memcpy(messageowned, cptr, mlength);

		if (mlength < 10000)
		{
			//I dont expect to write this to output if the string is large just here for the smaller guys. 
			Godot::print("memcpy of the string passed in");
			printf("%s", messageowned);
		}
	}


	void pass_method(String message) 
	{
		String copyofmessage = message;

		//Length always seems to work fine. 
		int mlength = copyofmessage.length();
		Godot::print(String::num_int64(mlength));

		CharString temp = copyofmessage.ascii();
		const char* cptr = temp.get_data();

		memcpy(messageowned, cptr, mlength);
		if (mlength < 10000)
		{
		    //I dont expect to write this to output if the string is large just here for the smaller guys.  
			Godot::print("memcpy of the string passed in");
			printf("%s", messageowned);
		}
	}

	void pass_method2(const String& message)
	{
		String copyofmessage = message;
		
		//Length always seems to work fine. 
		int mlength = copyofmessage.length();
		Godot::print(String::num_int64(mlength));

		CharString temp = copyofmessage.ascii();
		const char* cptr = temp.get_data();

		memcpy(messageowned, cptr, mlength);
		if (mlength < 10000)
		{
			//I dont expect to write this to output if the string is large(I understand the issues and limitations here. This is Just here for the smaller guys. 
			Godot::print("memcpy of the string passed in");
			printf("%s", messageowned);
		}
	}

};
