TestCase subclass: PrinterTest [

    testVarPrinter [
	<category: 'testing'>

        | string th |
        th := Thunder new.
        th 
	    variable: #a type: UInt;
	    variable: #b type: Int.

	string := (IRPrinter on: th) stream contents.
	self assert: string =  'b Int
a UInt
'
    ]

    testMovPrinter [
        <category: 'testing'>

        | string th |
        th := Thunder new.
        th 
            variable: #a type: UInt;
            variable: #b type: Int;
	    mov: #a to: #b.

        string := (IRPrinter on: th) stream contents.
        self assert: string =  'b Int
a UInt
mov #a to #b'
    ]

    testArithmeticPrinter [
        <category: 'testing'>

	#(#'add:and:to:' #'sub:minus:to:'
	#'mul:by:to:' #'div:by:to:'
	#'mod:with:to:' #'and:with:to:'
	#'or:with:to:' #'xor:with:to:'
	#'lsh:with:to:' #'rsh:with:to:') do: [ :each |
	    | i inst string th |
	    th := Thunder new.
	    th
		variable: #a type: UInt;
		variable: #b type: Int;
		variable: #c type: Char;
		perform: each with: #a with: #b with: #c.

	    string := (IRPrinter on: th) stream contents.

	    i := 0.
	    inst := String new.
	    each keywords do: [ :sym |
		i := i + 1.
		inst := inst, (sym copyFrom: 1 to: sym size - 1) asString, ' ', (#(#a #b #c) at: i) displayString.
		i = 3 ifFalse: [ inst := inst, ' ' ] ].
	    self assert: string =  ('c Char
b Int
a UInt
', inst) ]
    ]

    testLoadPrinter [
        <category: 'testing'>

        | i inst string th |
        th := Thunder new.
        th
            variable: #a type: UInt;
            variable: #b type: Int;
            variable: #c type: Char;
            load: UInt from: #a to: #c.

        string := (IRPrinter on: th) stream contents.
        self assert: string =  ('c Char
b Int
a UInt
load UInt from #a to #c')
    ]

    testStorePrinter [
        <category: 'testing'>

        | i inst string th |
        th := Thunder new.
        th
            variable: #a type: UInt;
            variable: #b type: Int;
            variable: #c type: Char;
            store: UInt value: #a to: #c.

        string := (IRPrinter on: th) stream contents.
        self assert: string =  ('c Char
b Int
a UInt
store UInt value #a to #c')
    ]
]
