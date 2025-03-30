TestCase subclass: #CTLinkedQueueTest
	instanceVariableNames: 'queue'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Containers-Linked-Queue-Tests'.

{ #category : 'setup' }
CTLinkedQueueTest >> setUp [
	"Initialize a new queue before each test."
	queue := CTLinkedQueue new.
]

{ #category : 'testing' }
CTLinkedQueueTest >> testInitialize [
	"Test that a new queue is empty."
	self assert: queue isEmpty.
	self assert: queue size = 0.
]

{ #category : 'testing' }
CTLinkedQueueTest >> testEnqueue [
	"Test enqueue operation."
	queue enqueue: 1.
	queue enqueue: 2.
	queue enqueue: 3.
	self assert: queue isEmpty not.
	self assert: queue size = 3.
	self assert: (queue asArray = #(1 2 3)).
]

{ #category : 'testing' }
CTLinkedQueueTest >> testDequeue [
	"Test dequeue operation."
	queue enqueue: 'a'.
	queue enqueue: 'b'.
	queue enqueue: 'c'.
	self assert: (queue dequeue = 'a').
	self assert: (queue dequeue = 'b').
	self assert: (queue dequeue = 'c').
	self assert: queue isEmpty.
]

{ #category : 'testing' }
CTLinkedQueueTest >> testPeek [
	"Test peek method."
	queue enqueue: 100.
	queue enqueue: 200.
	self assert: (queue peek = 100).
	self assert: queue size = 2.
]

{ #category : 'testing' }
CTLinkedQueueTest >> testDequeueOnEmptyQueue [
	"Test that dequeue raises an error on an empty queue."
	self should: [queue dequeue] raise: Error.
]

{ #category : 'testing' }
CTLinkedQueueTest >> testPeekOnEmptyQueue [
	"Test that peek raises an error on an empty queue."
	self should: [queue peek] raise: Error.
]

{ #category : 'testing' }
CTLinkedQueueTest >> testFIFOBehavior [
	"Test that the queue follows FIFO order."
	queue enqueue: 10.
	queue enqueue: 20.
	queue enqueue: 30.
	self assert: (queue dequeue = 10).
	self assert: (queue dequeue = 20).
	queue enqueue: 40.
	self assert: (queue dequeue = 30).
	self assert: (queue dequeue = 40).
	self assert: queue isEmpty.
]
