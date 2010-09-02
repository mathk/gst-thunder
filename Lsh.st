Instruction subclass: Lsh [

    Lsh class >> lsh: anObject with: anObject2 to: aSymbol [

	^ self new
		lsh: anObject with: anObject2 to: aSymbol;
		yourself
    ]

    | i j dest |

    lsh: anObject with: anObject2 to: aSymbol [

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

        aVisitor visitLsh: self
    ]

    printOn: aStream [

        aStream
            nextPutAll: 'lsh '.
        i printOn: aStream.
        aStream
            nextPutAll: ' with '.
        j printOn: aStream.
        aStream
            nextPutAll: ' to '.
        dest printOn: aStream
    ]
]

