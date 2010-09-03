TestCase subclass: ThunderTest [

    testRegister [
	<category: 'testing'>

	| function th |
	th := Thunder new.
	th 
	  function: #foo return: UInt;
	  variable: #a type: UInt.

	function := th function.

	self assert: (function variableAt: #a) type == UInt.
	self assert: (function variableAt: #b) == function.
	self assert: (function variableAt: #b ifAbsent: [ 123 ]) == 123.
	self assert: (function variables) = #(#a) asSet.
    ]

    testMov [
	<category: 'testing'>

	| th |
	th := Thunder new.
	th
	  function: #foo return: UInt; 
	  variable: #a type: UInt.

	th mov: 123 to: #a
    ]

    testAdd [
        <category: 'testing'>

        | th |
        th := Thunder new.
        th
	  function: #foo return: UInt; 
	  variable: #a type: UInt.

        th add: 123 and: 234 to: #a
    ]

    testSub [
        <category: 'testing'>

        | th |
        th := Thunder new.
        th
	  function: #foo return: UInt; 
	  variable: #a type: UInt.

        th sub: 123 minus: 234 to: #a
    ]

    testDiv [
        <category: 'testing'>

        | th |
        th := Thunder new.
        th
	  function: #foo return: UInt; 
	  variable: #a type: UInt.

        th div: 123 by: 2 to: #a
    ]

    testMod [
        <category: 'testing'>

        | th |
        th := Thunder new.
        th
	  function: #foo return: UInt; 
	  variable: #a type: UInt.

        th mod: 123 with: 2 to: #a
    ]

    testAnd [
        <category: 'testing'>

        | th |
        th := Thunder new.
        th
	  function: #foo return: UInt; 
	  variable: #a type: UInt.

        th and: 123 with: 2 to: #a
    ]

    testOr [
        <category: 'testing'>

        | th |
        th := Thunder new.
        th
	  function: #foo return: UInt; 
	  variable: #a type: UInt.

        th or: 123 with: 2 to: #a
    ]

    testXor [
        <category: 'testing'>

        | th |
        th := Thunder new.
        th
	  function: #foo return: UInt; 
	  variable: #a type: UInt.

        th xor: 123 with: 2 to: #a
    ]

    testLsh [
        <category: 'testing'>

        | th |
        th := Thunder new.
        th
	  function: #foo return: UInt; 
	  variable: #a type: UInt.

        th lsh: 123 with: 2 to: #a
    ]

    testRsh [
        <category: 'testing'>

        | th |
        th := Thunder new.
        th
	  function: #foo return: UInt; 
	  variable: #a type: UInt.

        th rsh: 123 with: 2 to: #a
    ]

    testLoad [
        <category: 'testing'>

        | th |
        th := Thunder new.
        th
	  function: #foo return: UInt; 
	  variable: #a type: UInt.

        th load: UInt from: 16rABCDEF to: #a
    ]
]

