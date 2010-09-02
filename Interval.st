Object subclass: Interval [

    Interval class >> named: aSymbol from: anInteger [

	^ self new
		name: aSymbol;
		from: anInteger;
		yourself
    ]

    Interval class >> named: aSymbol from: anInteger to: anInteger2 [

        ^ (self named: aSymbol from: anInteger)
				    to: anInteger2;
				    yourself
    ]

    | name from to |

    name: aSymbol [

	name := aSymbol
    ]

    name [

	^ name
    ]

    from: anInteger [

	from := anInteger
    ]

    from [

	^ from
    ]

    to: anInteger [

	to := anInteger
    ]

    to [

	^ to
    ]

    printOn: aStream [

	aStream 
	    nextPutAll: name, ' from ', from displayString, ' to ', to displayString
    ]

]

