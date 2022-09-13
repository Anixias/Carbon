#version 0.1

field_override?:
{
	string => override
	data
}

field?:
{
	string => name
	string => id
	string => type
	data
}

object?:
{
	string => name
	string => id
	string => parent
	bool => is_type
	field[] => fields
	field_override[] => field_overrides
}

collection?:
{
	string => name
	string => id
	object[] => objects
}

collections: collection[] =>
[
	{
		name: "Items"
		id: "05617547-77c0-45a6-a871-062cea688e38"
		objects:
		[
			{
				name: "Items"
				id: "a6fdf63a-02c7-48a5-8925-07150ed0cc3d"
				parent: null
				is_type: true
				fields:
				[
					{
						name: "Name"
						id: "c0e57ff5-2c1c-41e7-ba1a-0b2a20bc92f6"
						type: "String"
						data: "Undefined"
					}
				]
				field_overrides: []
			}
			{
				name: "Equipment"
				id: "a564534f-4007-4062-b54b-5ad5eb73dcf7"
				parent: "a6fdf63a-02c7-48a5-8925-07150ed0cc3d"
				is_type: true
				fields:
				[
					{
						name: "Slot"
						id: "2d89faae-f8aa-4cdf-aaf3-824d8d50bd58"
						type: "String"
						data: ""
					}
				]
				field_overrides:
				[
					{
						override: "c0e57ff5-2c1c-41e7-ba1a-0b2a20bc92f6"
						data: "Undefined Equipment"
					}
				]
			}
		]
	}
]