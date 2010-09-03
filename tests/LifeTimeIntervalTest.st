TestCase subclass: LifeTimeIntervalTest [

    testLifeTime [

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
	  mov: #e to: #d.

	lf := LifeTimeInterval from: th function.

	{#a->(1@3). #b->(2@5). #c->(3@5). #d->(5@6). #e->(4@6)} do: [ :each |
	    self assert: (lf intervals at: each key) from = each value x.
	    self assert: (lf intervals at: each key) to = each value y.
	    self assert: (lf live at: each value x) name = each key.
	    self assert: (lf live at: each value x) == (lf intervals at: each key) ].

	self assert: lf creationTime = lf creationTime sorted
    ]
]

