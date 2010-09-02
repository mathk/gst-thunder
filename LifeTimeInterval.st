IRVisitor subclass: LifeTimeInterval [

    LifeTimeInterval class >> from: aThunder [
	<category: 'instance creation'>

	^ self new
		thunder: aThunder;
		extractIntervals;
		yourself
    ]

    | i live intervals creationTime thunder |

    thunder: aThunder [
	<category: 'accessing'>

	thunder :=  aThunder
    ]

    intervals [
	<category: 'accessing'>

	^ intervals
    ]

    live [
	<category: 'accessing'>

	^ live
    ]

    creationTime [
	<category: 'accessing'>

	^ creationTime
    ]

    extractIntervals [

	i := 1.
	creationTime := OrderedCollection new.
	intervals := Dictionary new.
	live := Dictionary new.

	thunder instructionsDo: [ :each |
	    each accept: self.
	    i := i + 1 ]
    ]

    visitVariable: aSymbol [

	(intervals at: aSymbol ifAbsentPut: [
				    | int |
				    creationTime addLast: i.
				    int := Interval named: aSymbol from: i. 
				    live at: i ifAbsentPut: [ int ].
				    int ]) to: i.
    ]
]

