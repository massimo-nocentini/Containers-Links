Extension { #name : #CTSlotDescriptorsVisitor }

{ #category : #'*Containers-DoubleValueLink-Visualizations' }
CTSlotDescriptorsVisitor >> visitCTDoubleValueLink: aValueLink [

	^ { (self newSlotDescriptorSelector
		   selector: #previousLink;
		   yourself) } , (self visitValueLink: aValueLink)
]
