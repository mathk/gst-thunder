Instruction subclass: Mul [

    Mul class >> mul: anObject by: anObject2 to: aSymbol [

	^ self new
		mul: anObject by: anObject2 to: aSymbol;
		yourself
    ]

    | i j dest |

    mul: anObject by: anObject2 to: aSymbol [

	i := anObject.
	j := anObject2.
	dest := aSymbol
    ]

    source [

        ^ i
    ]

    param [

        ^ j
    ]

    destination [

        ^ dest
    ]

    check [

        self register: dest ifAbsent: [ self error: 'Register ', dest, ' is not present' ].
        self register: src ifAbsent: [ anObject isNumber ifFalse: [ self error: 'Cannot accept ', anObject ] ]
    ]

    accept: aVisitor [

        aVisitor visitMul: self
    ]

    printOn: aStream [

        aStream
            nextPutAll: 'mul '.
        i printOn: aStream.
        aStream
            nextPutAll: ' by '.
        j printOn: aStream.
	aStream
            nextPutAll: ' to '.
        dest printOn: aStream
    ]
]

