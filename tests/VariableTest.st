TestCase subclass: VariableTest [

    testInstanceCreation [
	<category: 'testing'>

	| reg |
	reg := Variable named: #abc type: UInt.
	self assert: reg name = #abc.
	self assert: reg type = UInt.
    ]
]

