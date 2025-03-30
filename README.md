# Linked-Queue-Pharo
"CTLinkedQueue is an implementation of a FIFO (First-In-First-Out) queue using a linked list."

A queue is a linear data structure where elements are added at the back and removed from the front. This linked list implementation ensures O(1) enqueue and dequeue operations by maintaining pointers to both the front and back of the queue.

CTLinkedQueue uses instances of CTValueLink as nodes to store elements.

Usage
To use CTLinkedQueue, create an instance and call enqueue: to add elements and dequeue to remove elements. The peek method returns the front element without removing it.

Example:


| queue |

queue := CTLinkedQueue new.

queue enqueue: 1.

queue enqueue: 2.

queue enqueue: 3.

queue dequeue.   "Removes 1"

queue peek.      "Returns 2"

queue
