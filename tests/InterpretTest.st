TestCase subclass: InterpretTest [

    testArithmetic [

        | int lf th |
        th := Thunder new.
        th 
	  function: #foo return: UInt;
	  variable: #a type: UInt;
	  variable: #b type: UInt;
	  variable: #c type: UInt;
	  variable: #d type: UInt;
	  variable: #e type: UInt;
	  mov: 123 to: #a;
	  mov: #a to: #b;
	  add: #a and: #b to: #c;
	  mov: #c to: #e;
	  add: #c and: #b to: #d;
	  or: #e with: 9 to: #d;
	  rsh: #e with: 1 to: #e.

	lf := IRInterpret on: th function.

	self assert: (lf variableValue: #a) = 123.
	self assert: (lf variableValue: #b) = 123.
	self assert: (lf variableValue: #c) = 246.
	self assert: (lf variableValue: #d) = 255.
	self assert: (lf variableValue: #e) = 123 
    ]

    testFunction [

        | int lf th |
        th := Thunder new.
        th
          function: #foo parameters: {#a->UInt. #b->UChar. #foo->UInt} return: UInt.

        lf := IRInterpret on: th function with: #(1 2 3).

        self assert: (lf variableValue: #a) = 1.
        self assert: (lf variableValue: #b) = 2.
        self assert: (lf variableValue: #foo) = 3.

        th := Thunder new.
        th
          function: #foo parameters: {#a->UInt. #b->UChar. #foo->UInt} return: UInt;
          variable: #a type: UInt;
          variable: #b type: UInt;
          variable: #c type: UInt;
          variable: #d type: UInt;
          variable: #e type: UInt.

        lf := IRInterpret on: th function with: #(1 2 3).

        self assert: (lf variableValue: #a) = nil.
        self assert: (lf variableValue: #b) = nil.
        self assert: (lf variableValue: #c) = nil.
        self assert: (lf variableValue: #d) = nil.
        self assert: (lf variableValue: #e) = nil.
        self assert: (lf variableValue: #foo) = 3
    ]

    testMemory [

        | int lf th |
        th := Thunder new.
        th
	  function: #foo return: UInt;
          variable: #a type: UInt;
          mov: 120 to: #a;
          store: Char value: 123 to: 0;
          load: Char from: 0 to: #a.

        lf := IRInterpret on: th function.

        self assert: (lf variableValue: #a) = 123.
    ]
]

