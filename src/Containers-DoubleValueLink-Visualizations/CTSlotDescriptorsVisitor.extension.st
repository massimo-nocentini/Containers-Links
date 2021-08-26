Extension { #name : #CTSlotDescriptorsVisitor }

{ #category : #'*Containers-DoubleValueLink-Visualizations' }
CTSlotDescriptorsVisitor >> visitCTDoubleValueLink: aValueLink [

	^ { #previousLink asSlotDescriptor }
	  , (self visitValueLink: aValueLink)
]
