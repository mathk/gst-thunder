Type subclass: UChar [

    UChar class >> cname [

        ^ 'unsigned char'
    ]

    UChar class >> readFrom: aByteArray at: anInteger [

        ^ (aByteArray at: anInteger + 1) ifNil: [ self error: 'Memory is not initialized' ]
    ]
]

