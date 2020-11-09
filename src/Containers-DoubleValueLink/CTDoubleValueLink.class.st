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
