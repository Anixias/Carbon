# Carbon

A human-readable data serialization format.

## Summary

The **Carbon** file format is designed for serializing data into human-readable text. **Carbon** is a [statically-typed format](https://en.wikipedia.org/wiki/Type_system#Static_typing) supporting multiple primitive data types. Files in the **Carbon** file format use a `*.cb` extension.

## Syntax

**Carbon** files are composed of a list of *definitions*. A *definition* is a named assignment. Here is an example of a *definition*:

```js
value: double => 5.0
```

The syntax for a definition is `name: (type =>) value`. The type information may be omitted in most circumstances.

### Object Layout Syntax

To specify the type of an array, you may use the *type notation* `type => [x, y, z]`. If, however, the type of the array should be an *object layout*, you may define an *object layout* anywhere in the file before the array definition. An *object layout definition* has the following syntax:

```js
layout_name?:
{
	type => name1
	type => name2
	...
	type => nameN
}
```

The `?:` operator, called the **Layout Definition Operator**, defines the types and names an object using the specified layout is expected to contain. Layouts may be used in place of primitive value types.

### Value Type Syntax

> `(?)` denotes that the symbol is optional. Symbols are *not* case-sensitive.

`type => value` may be used in place of symbols to denote the type of numerical values.
Numerical values may use `_` as a *digit separator*.

|Type|Syntax|Notes|
|---:|:---:|:---|
|`null`|`type => null`|Represents no value. A value type is *required*.|
|`sbyte`|`xB` or `sbyte => x`|8-bit signed integer|
|`byte`|`xUB` or `byte => x`|8-bit unsigned integer|
|`short`|`xS` or `short => x`|16-bit signed integer|
|`ushort`|`xUS` or `ushort => x`|16-bit unsigned integer|
|`int`|`x(I)` or `int => x`|32-bit signed integer|
|`uint`|`xU(I)` or `uint => x`|32-bit unsigned integer|
|`long`|`xL` or `long => x`|64-bit signed integer|
|`ulong`|`xUL` or `ulong => x`|64-bit unsigned integer|
|`float`|`x.xF` or `float => x.x`|32-bit real number|
|`double`|`x.x` or `double => x.x`|64-bit real number|
|`bool`|`true` or `false`|Boolean value|
|`string`|`"x"` or `'x'`|[.NET escape characters](https://docs.microsoft.com/en-us/dotnet/csharp/programming-guide/strings/#string-escape-sequences) are supported.
|`array`|`[x, y, z]`|Values may be of any type.|
|`typed-array`|`type => [x, y, z]`|Values must be of the given type.|
|`object`|`{x: a, y: b}`|Commas may be omitted.|
|`layout`|`name?: {type => x, ...}`|Commas may be omitted. See [Object Layout Syntax](#object-layout-syntax).|

## Examples

Customer information template

```js
version => 0.1

// General information
name: "John Smith"
dob: "01/02/1973"
id: ulong => 56_789
contact_information:
{
	phone_information?:
	{
		string => number
		string => type
		bool => receive_calls
	}
	
	phones: phone_information[] =>
	[
		/* Each phone has a 'number' and a 'type' */
		{
			number: "+1 555-555-1234"
			type: "cell"
			receive_calls: false
		}
		{
			number: "+1 555-555-5678"
			type: "home"
			receive_calls: true
		}
	]
	email: "johnsmith73@email.com"
}
```
