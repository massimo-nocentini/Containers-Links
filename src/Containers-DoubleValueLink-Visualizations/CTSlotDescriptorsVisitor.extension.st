Extension { #name : #CTSlotDescriptorsVisitor }

{ #category : #'*Containers-DoubleValueLink-Visualizations' }
CTSlotDescriptorsVisitor >> visitCTDoubleValueLink: aValueLink [

	^ { (self newSlotDescriptorSelector: #previousLink) }
	  , (self visitValueLink: aValueLink)
]
