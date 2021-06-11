Extension { #name : #SequenceableCollection }

{ #category : #'*Containers-Links' }
SequenceableCollection >> isAcyclicWithRespectToAssociations: aRelation [

	| isAcyclic |
	isAcyclic := true.
	self
		topologicalSortByAssociations: aRelation
		onCycleDo: [ isAcyclic := false ].
	^ isAcyclic
]

{ #category : #'*Containers-Links' }
SequenceableCollection >> topologicalSortByAssociations: aRelation acyclicDo: aBlock [

	| ordering edges |
	edges := Array streamContents: [ :aStream | 
		         [ 
		         | isAcyclic |
		         isAcyclic := true.
		         ordering := self
			                     topologicalSortByAssociations: aRelation
			                     onCycleDo: [ :sequence :cycle | 
				                     | edge |
				                     isAcyclic := false.
				                     edge := cycle anyOne.
				                     aStream nextPut: edge.
				                     aRelation remove: edge.
				                     sequence ].
		         isAcyclic ] whileFalse ].

	^ aBlock value: ordering value: edges
]

{ #category : #'*Containers-Links' }
SequenceableCollection >> topologicalSortByAssociations: aRelation onCycleDo: cBlock [

	^ TopologicalSortAlgorithm new
		  size: self size;
		  relation: aRelation;
		  value: [ :ordering | 
			  self species streamContents: [ :aStream | 
					  ordering do: [ :anIndex | aStream nextPut: (self at: anIndex) ] ] ]
		  onCycleDo: [ :cycle | 
			  | sequence |
			  sequence := Array streamContents: [ :aStream | 
					              aStream nextPut: (self at: cycle first key).
					              cycle reverseDo: [ :anAssoc | 
							              aStream nextPut: (self at: anAssoc key) ] ].
			  cBlock cull: sequence cull: cycle ]
]
