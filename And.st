Instruction subclass: And [

    And class >> and: anObject with: anObject2 to: aSymbol [

	^ self new
		and: anObject with: anObject2 to: aSymbol;
		yourself
    ]

    | i j dest |

    and: anObject with: anObject2 to: aSymbol [

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

        aVisitor visitAnd: self
    ]

    printOn: aStream [

        aStream
            nextPutAll: 'and '.
        i printOn: aStream.
        aStream
            nextPutAll: ' with '.
        j printOn: aStream.
        aStream
            nextPutAll: ' to '.
        dest printOn: aStream
    ]
]

