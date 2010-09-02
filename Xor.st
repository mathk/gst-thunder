Instruction subclass: Xor [

    Xor class >> xor: anObject with: anObject2 to: aSymbol [

	^ self new
		xor: anObject with: anObject2 to: aSymbol;
		yourself
    ]

    | i j dest |

    xor: anObject with: anObject2 to: aSymbol [

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

        aVisitor visitXor: self
    ]

    printOn: aStream [

        aStream
            nextPutAll: 'xor '.
        i printOn: aStream.
        aStream
            nextPutAll: ' with '.
        j printOn: aStream.
        aStream
            nextPutAll: ' to '.
        dest printOn: aStream
    ]
]

