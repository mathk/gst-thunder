Instruction subclass: Store [

    Store class >> store: aType value: anObject to: anObject2 [

	^ self new
		store: aType value: anObject to: anObject2;
		yourself
    ]

    | type value dest |

    store: aType value: anObject to: anObject2 [

	type := aType.
	value := anObject.
	dest := anObject2
    ]

    type [

	^ type
    ]

    value [

        ^ value
    ]

    destination [

        ^ dest
    ]

    writeFrom: aByteArray at: anInteger put: anObject [

	^ self type writeFrom: aByteArray at: anInteger put: anObject
    ]

    accept: aVisitor [

        aVisitor visitStore: self
    ]

    printOn: aStream [

        aStream
            nextPutAll: 'store ', type name.
        aStream
            nextPutAll: ' value '.
        value printOn: aStream.
        aStream
            nextPutAll: ' to '.
        dest printOn: aStream
    ]
]

