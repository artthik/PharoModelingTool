"
I am the template instance for the PMT.
"
Class {
	#name : #PMTInstance,
	#superclass : #Object,
	#instVars : [
		'connectedInstances'
	],
	#category : #'PharoModelingTool-Model'
}

{ #category : #accessing }
PMTInstance >> connectedInstances [
	^ connectedInstances
]

{ #category : #accessing }
PMTInstance >> connectedInstances: anObject [
	connectedInstances := anObject
]

{ #category : #initialization }
PMTInstance >> create [
	self inform: 'Message created'
]

{ #category : #initialization }
PMTInstance >> initialize [
	self inform: 'ZERO'
]

{ #category : #initialization }
PMTInstance >> receive [
	self inform: 'Message received'
]

{ #category : #initialization }
PMTInstance >> send: aDocument [
	self inform: 'Message sent'
]
