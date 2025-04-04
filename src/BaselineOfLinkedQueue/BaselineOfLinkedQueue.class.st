"
I am a baseline
"
Class {
	#name : 'BaselineOfContainersLinkedQueue',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfContainersLinkedQueue',
	#package : 'BaselineOfContainersLinkedQueue'
}

{ #category : #baselines }
BaselineOfContainersLinkedQueue >> baseline: spec [

	<baseline>
	spec for: #common do: [ "Packages"
		spec package: 'Containers-Linked-Queue'.
		spec
			package: 'Containers-Linked-Queue-Tests'
			with: [ spec requires: #( 'Containers-Linked-Queue' ) ].
		"Define groups"
		spec
			group: 'Core'
			with: #( 'Containers-Linked-Queue' );
			group: 'Tests' with: #( 'Containers-Linked-Queue-Tests' ).

		spec group: 'default' with: #( 'Core' 'Tests' ) ]
]
