TestCase subclass: CTranslatorTest [

    testFunction [
        <category: 'testing'>

        | string th |
        th := Thunder new.
        th
          function: #'foo:bar:' parameters: {#nb->UInt. #size->UChar} return: UInt;
          variable: #a type: UInt;
          variable: #b type: Int.

        string := (CTranslator on: th function) stream contents.
        self assert: string =  'unsigned int foobar (unsigned int nb, unsigned char size)
{
unsigned int a;
int b;
}
'
    ]

    testMov [
        <category: 'testing'>

        | string th |
        th := Thunder new.
        th
          function: #'foo:bar:' parameters: {#nb->UInt. #size->UChar} return: UInt;
          variable: #a type: UInt;
          variable: #b type: Int;
	  mov: 123 to: #b;
	  mov: #b to: #a.

        string := (CTranslator on: th function) stream contents.
        self assert: string =  'unsigned int foobar (unsigned int nb, unsigned char size)
{
unsigned int a;
int b;
b = 123;
a = b;
}
'
    ]

    testAdd [
        <category: 'testing'>

        | string th |
        th := Thunder new.
        th
          function: #'foo:bar:' parameters: {#nb->UInt. #size->UChar} return: UInt;
          variable: #a type: UInt;
          variable: #b type: Int;
          mov: 123 to: #b;
          mov: #b to: #a;
	  add: #a and: #b to: #c.

        string := (CTranslator on: th function) stream contents.
        self assert: string =  'unsigned int foobar (unsigned int nb, unsigned char size)
{
unsigned int a;
int b;
b = 123;
a = b;
c = a + b;
}
'
    ]

    testSub [
        <category: 'testing'>

        | string th |
        th := Thunder new.
        th
          function: #'foo:bar:' parameters: {#nb->UInt. #size->UChar} return: UInt;
          variable: #a type: UInt;
          variable: #b type: Int;
          mov: 123 to: #b;
          mov: #b to: #a;
          sub: #a minus: #b to: #c.

        string := (CTranslator on: th function) stream contents.
        self assert: string =  'unsigned int foobar (unsigned int nb, unsigned char size)
{
unsigned int a;
int b;
b = 123;
a = b;
c = a - b;
}
'
    ]

    testMul [
        <category: 'testing'>

        | string th |
        th := Thunder new.
        th
          function: #'foo:bar:' parameters: {#nb->UInt. #size->UChar} return: UInt;
          variable: #a type: UInt;
          variable: #b type: Int;
          mov: 123 to: #b;
          mov: #b to: #a;
          mul: #a by: #b to: #c.

        string := (CTranslator on: th function) stream contents.
        self assert: string =  'unsigned int foobar (unsigned int nb, unsigned char size)
{
unsigned int a;
int b;
b = 123;
a = b;
c = a * b;
}
'
    ]

    testDiv [
        <category: 'testing'>

        | string th |
        th := Thunder new.
        th
          function: #'foo:bar:' parameters: {#nb->UInt. #size->UChar} return: UInt;
          variable: #a type: UInt;
          variable: #b type: Int;
          mov: 123 to: #b;
          mov: #b to: #a;
          div: #a by: #b to: #c.

        string := (CTranslator on: th function) stream contents.
        self assert: string =  'unsigned int foobar (unsigned int nb, unsigned char size)
{
unsigned int a;
int b;
b = 123;
a = b;
c = a / b;
}
'
    ]
]

