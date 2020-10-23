Class {
	#name : #CTDoubleValueLink,
	#superclass : #ValueLink,
	#instVars : [
		'previousLink'
	],
	#category : #'Containers-DoubleValueLink'
}

{ #category : #accessing }
CTDoubleValueLink >> previousLink [
	^ previousLink
]

{ #category : #accessing }
CTDoubleValueLink >> previousLink: anObject [
	previousLink := anObject
]
