TestCase subclass: CTranslatorTest [

    testFunction [
        <category: 'testing'>

        | string th |
        th := Thunder new.
        th
            function: #'foo:bar:' parameters: {#nb->UInt. #size->UChar} return: UInt.

        string := (CTranslator on: th function) stream contents.
        self assert: string =  'unsigned int foobar (unsigned int nb, unsigned char size)
'
    ]
]

