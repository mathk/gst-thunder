Instruction subclass: Rsh [

    Rsh class >> rsh: anObject with: anObject2 to: aSymbol [

	^ self new
		rsh: anObject with: anObject2 to: aSymbol;
		yourself
    ]

    | i j dest |

    rsh: anObject with: anObject2 to: aSymbol [

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

	aVisitor visitRsh: self
    ]

    printOn: aStream [

        aStream
            nextPutAll: 'rsh '.
        i printOn: aStream.
        aStream
            nextPutAll: ' with '.
        j printOn: aStream.
        aStream
            nextPutAll: ' to '.
        dest printOn: aStream
    ]
]

