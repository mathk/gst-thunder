Instruction subclass: Load [

    Load class >> load: aType from: anObject to: aSymbol [

	^ self new
		load: aType from: anObject to: aSymbol;
		yourself
    ]

    | type source dest |

    load: aType from: anObject to: aSymbol [

	type := aType.
	source := anObject.
	dest := aSymbol
    ]

    type [

	^ type
    ]

    source [

        ^ source
    ]

    destination [

        ^ dest
    ]

    readFrom: aByteArray at: anInteger [

	^ self type readFrom: aByteArray at: anInteger
    ]

    accept: aVisitor [

        aVisitor visitLoad: self
    ]

    printOn: aStream [

        aStream
            nextPutAll: 'load ', type name.
        aStream
            nextPutAll: ' from '.
        source printOn: aStream.
        aStream
            nextPutAll: ' to '.
        dest printOn: aStream
    ]
]

