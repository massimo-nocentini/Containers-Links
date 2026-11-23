"
I am the baseline of the links. I depend on `ContainersEssentials`, and load four packages:

- `Containers-Links`, the `TopologicalSortAlgorithm` with the messages of `SequenceableCollection` that use it, and `CTSlotDescriptorsVisitorNestedLinks`.
- `Containers-Links-Tests`, their tests.
- `Containers-DoubleValueLink`, the class `CTDoubleValueLink`.
- `Containers-DoubleValueLink-Visualizations`, the description of its slots.
"
Class {
	#name : #BaselineOfContainersLinks,
	#superclass : #BaselineOf,
	#category : #BaselineOfContainersLinks
}

{ #category : #baselines }
BaselineOfContainersLinks >> baseline: spec [

	<baseline>
	spec for: #common do: [ "Externals."
		spec
			baseline: 'ContainersEssentials'
			with: [ spec repository: 'github://massimo-nocentini/Containers-Essentials:master' ].

		"Packages"
		spec
			package: 'Containers-Links'
			with: [ spec requires: #( 'ContainersEssentials' ) ];
			package: 'Containers-Links-Tests'
			with: [ spec requires: #( 'Containers-Links' ) ];
			package: 'Containers-DoubleValueLink'
			with: [ spec requires: #( 'Containers-Links' ) ];
			package: 'Containers-DoubleValueLink-Visualizations'
			with: [ spec requires: #( 'Containers-DoubleValueLink' ) ] ]
]
