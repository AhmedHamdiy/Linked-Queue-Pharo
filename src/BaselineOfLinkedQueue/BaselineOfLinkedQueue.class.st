"
I am a baseline
"
Class {
	#name : #BaselineOfLinkedQueue,
	#superclass : #BaselineOf,
	#category : #BaselineOfLinkedQueue,
	#package : #BaselineOfLinkedQueue
}

{ #category : #baselines }
BaselineOfContainersLinkedQueue >> baseline: spec [
	<baseline>

	spec for: #pharo do: [		
		spec package: 'Linked-Queue'.
		spec package: 'Linked-Queue-Tests' with: [ spec requires: #('Linked-Queue')] 
	]
]
