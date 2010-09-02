Object subclass: LinearScanRegisterAllocation [

    LinearScanRegisterAllocation class >> on: aLifeTime registers: anInteger [

	^ self new
		initialize;
		lifeTime: aLifeTime;
		registers: anInteger;
		linearScanRegisterAllocation;
		yourself
    ]

    | active activeSet activeSize lifeTime location r register |

    initialize [

	activeSize := 0.
        activeSet := Set new.
        active := Dictionary new.
        register := Dictionary new.
	location := Dictionary new
    ]

    lifeTime: aLifeTime [

	lifeTime := aLifeTime
    ]

    registers: anInteger [

	r := anInteger
    ]

    activeSize [

	^ activeSize
    ]

    activeAdd: anInterval [

	activeSize := activeSize + 1.
	activeSet add: anInterval to.
	(active at: anInterval to ifAbsentPut: [ OrderedCollection new ]) add: anInterval
    ]

    activeRemove: anInterval [

	activeSize := activeSize - 1.
        (active at: anInterval to) remove: anInterval.
        (active at: anInterval to) isEmpty ifTrue: [ activeSet remove: anInterval to ].
    ]

    activeDo: aOneArgBlock [

	activeSet asSortedCollection reverseDo: [ :i |
	    (active at: i) do: aOneArgBlock ]
    ]

    linearScanRegisterAllocation [

	lifeTime creationTime do: [ :i |
	    | item | 
	    item := (lifeTime live at: i).
	    'linearScanRegisterAllocation' displayNl.
	    self expireOldIntervalFor: item.
	    self activeSize = r 
		ifTrue: [ self splitIntervalFor: item ]
		ifFalse: [ 
		    register at: item put: 1.
		    self activeAdd: item ] ]
    ]

    expireOldIntervalFor: anInterval [

	| delete |
	delete := OrderedCollection new.
	self activeDo: [ :each |
		each to >= anInterval from ifTrue: [ ^ self ].
		delete add: each ].
	delete do: [ :each | 
		self activeRemove: each.
		register removeKey: each. ]
    ]

    splitIntervalFor: anInterval [

	| spill |
	spill := (active at: activeSet asSortedCollection last) last.
	spill to > anInterval to 
	    ifTrue: [
		register at: anInterval put: (register at: spill).
		location at: spill put: 0. "Location Stack"
		self 
		    activeRemove: spill;
		    activeAdd: anInterval ]
	    ifFalse: [
		location at: anInterval put: 0. "Location Stack" ]
    ]
]

