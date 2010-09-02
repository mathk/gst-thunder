Instruction subclass: Or [

    Or class >> or: anObject with: anObject2 to: aSymbol [

	^ self new
		or: anObject with: anObject2 to: aSymbol;
		yourself
    ]

    | i j dest |

    or: anObject with: anObject2 to: aSymbol [

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

    accept: aVisitor [

        aVisitor visitOr: self
    ]

    printOn: aStream [

        aStream
            nextPutAll: 'or '.
        i printOn: aStream.
        aStream
            nextPutAll: ' with '.
        j printOn: aStream.
        aStream
            nextPutAll: ' to '.
        dest printOn: aStream
    ]
]

