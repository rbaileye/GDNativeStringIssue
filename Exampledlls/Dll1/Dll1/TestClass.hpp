#include <File.hpp>
#include <Reference.hpp>
#include <Timer.hpp>
#include <Node.hpp>
#include <Ref.hpp>

#include <stdio.h>

using namespace godot;

class TestClass : public Node {
	GODOT_CLASS(TestClass, Node)

public:

	char _messagebig[5000000] = { 0 };
	char _messagesmall[10000] = { 0 };
	String _holder;

	static void _register_methods() 
	{
		register_method("_init", &TestClass::_init);
		register_method("test_big_string", &TestClass::test_big_string);
		register_method("test_small_string", &TestClass::test_small_string);
		register_signal<TestClass>((char*)"pass_message", "dasmessage", GODOT_VARIANT_TYPE_STRING);
	}

	void _init() {}

	void test_big_string()
	{
		for (int i = 0; i < 4999998; i++)
		{
			_messagebig[i] = 'A';
		}
		 _holder = _messagebig;
		emit_signal("pass_message", _holder);
		
	}

	void test_small_string()
	{
		for (int i = 0; i < 9999; i++)
		{
			_messagesmall[i] = 'A';
		}
		_holder = _messagesmall;
		emit_signal("pass_message", _holder);

	}

};
