Type subclass: Char [

    Char class >> readFrom: aByteArray at: anInteger [

	^ (aByteArray at: anInteger + 1) ifNil: [ self error: 'Memory is not initialized' ]
    ]

    Char class >> writeFrom: aByteArray at: anInteger put: anObject [

        ^ aByteArray at: anInteger + 1 put: anObject
    ]
]

