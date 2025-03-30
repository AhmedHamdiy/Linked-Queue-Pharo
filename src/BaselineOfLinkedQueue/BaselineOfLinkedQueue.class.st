"
I am a baseline
"
Class {
	#name : 'BaselineOfLinkedQueue',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfLinkedQueue',
	#package : 'BaselineOfLinkedQueue'
}

{ #category : 'baselines' }
BaselineOfLinkedQueue >> baseline: spec [

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
