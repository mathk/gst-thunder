Instruction subclass: Add [

    Add class >> add: anObject and: anObject2 to: aSymbol [

	^ self new
		add: anObject and: anObject2 to: aSymbol;
		yourself
    ]

    | i j dest |

    add: anObject and: anObject2 to: aSymbol [

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

