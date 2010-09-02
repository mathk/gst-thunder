TestCase subclass: LinearScanRegisterAllocTest [

    testLSRA [
	<category: 'testing'>

        | int lf lsra th |
        th := Thunder new.
        th
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

        lf := LifeTimeInterval from: th.
	lsra := LinearScanRegisterAllocation on: lf registers: 3.
    ]

    testActive [
	<category: 'testing'>

	| a b c lsra i iv |
	lsra := LinearScanRegisterAllocation new
					    initialize;
					    yourself.

	lsra activeAdd: (a := Interval named: #a from: 1 to: 2).
	lsra activeAdd: (b := Interval named: #b from: 3 to: 5).
	lsra activeAdd: (c := Interval named: #c from: 2 to: 4).
	
	i := 0.
	lsra activeDo: [ :each |
	    i := i + 1.
	    self assert: each name == (#(#b #c #a) at: i) ].

	lsra activeRemove: a.
        i := 0.
        lsra activeDo: [ :each |
            i := i + 1.
            self assert: each name == (#(#b #c) at: i) ].

        lsra activeRemove: c.
        i := 0.
        lsra activeDo: [ :each |
            i := i + 1.
            self assert: each name == (#(#b) at: i) ].
    ]
]

