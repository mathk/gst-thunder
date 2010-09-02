Instruction subclass: Sub [

    Sub class >> sub: anObject minus: anObject2 to: aSymbol [

	^ self new
		sub: anObject minus: anObject2 to: aSymbol;
		yourself
    ]

    | i j dest |

    sub: anObject minus: anObject2 to: aSymbol [

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

        aVisitor visitSub: self
    ]

    printOn: aStream [

        aStream
            nextPutAll: 'sub '.
        i printOn: aStream.
        aStream
            nextPutAll: ' minus '.
        j printOn: aStream.
        aStream
            nextPutAll: ' to '.
        dest printOn: aStream
    ]
]
