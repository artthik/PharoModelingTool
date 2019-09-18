"
I am the template message for the PMT
"
Class {
	#name : #PMTMessage,
	#superclass : #Object,
	#instVars : [
		'sender',
		'recipient',
		'data'
	],
	#category : #'PharoModelingTool-Model'
}

{ #category : #accessing }
PMTMessage >> data: anObject [
	<gtExample>
	data := anObject
]

{ #category : #accessing }
PMTMessage >> recipient: anObject [
	<gtExample>
	recipient := anObject
]

{ #category : #accessing }
PMTMessage >> sender: anObject [
	<gtExample>
	sender := anObject
]

{ #category : #tests }
PMTMessage >> test [
	<gtExample>
	self data: 'Hello World.'.
	self inform: data
]
