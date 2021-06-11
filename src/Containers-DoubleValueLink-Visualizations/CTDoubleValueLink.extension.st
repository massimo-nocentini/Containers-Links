Extension { #name : #CTDoubleValueLink }

{ #category : #'*Containers-DoubleValueLink-Visualizations' }
CTDoubleValueLink >> instVarsNamesOrderedCollection [

	"We choose the following order in which the `value` slot is 
	the rightmost because that allows us to compose better shapes 
	pointed by its reference."

	^ { #previousLink. #value. #nextLink }
]
