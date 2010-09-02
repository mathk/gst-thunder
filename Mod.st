Instruction subclass: Mod [

    Mod class >> mod: anObject with: anObject2 to: aSymbol [

	^ self new
		mod: anObject with: anObject2 to: aSymbol;
		yourself
    ]

    | i j dest |

    mod: anObject with: anObject2 to: aSymbol [

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

        aVisitor visitMod: self
    ]

    printOn: aStream [

        aStream
            nextPutAll: 'mod '.
        i printOn: aStream.
        aStream
            nextPutAll: ' with '.
        j printOn: aStream.
        aStream
            nextPutAll: ' to '.
        dest printOn: aStream
    ]
]

