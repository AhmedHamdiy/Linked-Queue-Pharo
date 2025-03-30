Class {
	#name : 'CTLinkedQueue',
	#superclass : 'Object',
	#instVars : [
		'front', 'back', 'size'
	],
	#category : 'Containers-Linked-Queue',
	#package : 'Containers-Linked-Queue'
}

{ #category : 'instance creation' }
CTLinkedQueue class >> new [
	^ super new initialize.
]

{ #category : 'initialization' }
CTLinkedQueue >> initialize [
	"Initialize an empty queue"
	size := 0.
]

{ #category : 'adding' }
CTLinkedQueue >> enqueue: anElement [
	"Adds anElement to the back of the queue."
	| newNode |
	newNode := CTValueLink value: anElement.
	back ifNil: [
		front := newNode.
		back := newNode.
	] ifNotNil: [
		back nextLink: newNode.
		back := newNode.
	].
	size := size + 1.
]

{ #category : 'removing' }
CTLinkedQueue >> dequeue [
dequeue
    "Removes and returns the front element of the queue, or nil if empty."
    self isEmpty ifTrue: [^ nil].
    
    | removedValue |
    removedValue := front value.
    front := front nextLink.
    
    (front isNil) ifTrue: [back := nil]. "Reset back if queue becomes empty"
    size := size - 1.
    
    ^ removedValue.

]

{ #category : 'accessing' }
CTLinkedQueue >> peek [
	"Returns the front element without removing it. Raises an error if empty."
	^front value.
]

{ #category : 'testing' }
CTLinkedQueue >> isEmpty [
	"Returns true if the queue has no elements."
	^size = 0.
]

{ #category : 'accessing' }
CTLinkedQueue >> size [
	"Returns the number of elements in the queue."
	^size.
]

{ #category : 'enumerating' }
CTLinkedQueue >> asArray [
	"Returns an array containing all elements in FIFO order."
	| elements currentNode |
	elements := OrderedCollection new.
	currentNode := front.
	[currentNode isNil] whileFalse: [
		elements add: currentNode value.
		currentNode := currentNode nextLink.
	].
	^elements asArray.
]
