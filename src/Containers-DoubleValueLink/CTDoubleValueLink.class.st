"
I am a `ValueLink` that knows its `previousLink` too. I do not keep the two directions consistent: who sets my `nextLink` sets the `previousLink` of the other link as well.

```smalltalk
| first second |
first := CTDoubleValueLink new value: 1; yourself.
second := CTDoubleValueLink new
	value: 2;
	previousLink: first;
	yourself.
first nextLink: second.
first nextLink previousLink == first ""true""
```

I am equal to another link when we are equal as `ValueLink` objects and our previous links are the same object.
"
Class {
	#name : #CTDoubleValueLink,
	#superclass : #ValueLink,
	#instVars : [
		'previousLink'
	],
	#category : #'Containers-DoubleValueLink'
}

{ #category : #comparing }
CTDoubleValueLink >> = anotherObject [
	^ super = anotherObject and: [ 
		  self previousLink == anotherObject previousLink ]
]

{ #category : #comparing }
CTDoubleValueLink >> hash [
	^ super hash bitXor: previousLink identityHash
]

{ #category : #accessing }
CTDoubleValueLink >> previousLink [
	^ previousLink
]

{ #category : #accessing }
CTDoubleValueLink >> previousLink: anObject [
	previousLink := anObject
]
