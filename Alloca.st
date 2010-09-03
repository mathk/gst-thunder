Instruction subclass: Alloca [

    Alloca class >> type: aType [

	^ self type: aType number: 1
    ]

    Alloca class >> type: aType number: anObject [

	^ self type: aType number: anObject align: 0
    ]

    Alloca class >> type: aType align: anObject [

	^ self type: aType number: 1 align: anObject3
    ]

    Alloca class >> type: aType number: anObject align: anObject2 [

	^ self new
		alloca: aType number: anObject align: anObject2;
		yourself
    ]

    | i j dest |

    type: anObject number: anObject2 align: anObject3 [

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

        aVisitor visitAdd: self
    ]

    printOn: aStream [

        aStream
            nextPutAll: 'add '.
        i printOn: aStream.
        aStream
            nextPutAll: ' and '.
        j printOn: aStream.
	aStream
            nextPutAll: ' to '.
        dest printOn: aStream
    ]
]

