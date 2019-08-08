"
I create and am responsible of the package created or opened by PMT.
"
Class {
	#name : #PMTController,
	#superclass : #Object,
	#instVars : [
		'packageName',
		'package',
		'view',
		'model'
	],
	#category : #'PharoModelingTool-Controller'
}

{ #category : #undefined }
PMTController >> createInstance: anInstanceName [
	PMTInstance
		subclass: 'Instance_' , anInstanceName 
		instanceVariableNames: ''
		classVariableNames: ''
		package: self packageName.
	self model addInstance: anInstanceName.
	self view addInstance: anInstanceName.
	"instance := blabla new. TODO: how to create a class with only the class name as a string?"
	"instance := PMTInstance new."
	"instances add: instance. TODO how to make ArrayLists with classes and [add] them"
	self
		inform: 'Instance: ' , 'Instance_' , anInstanceName , ' has been created.'
]

{ #category : #undefined }
PMTController >> createMessage: aMessageName [
	"creates a message"
	PMTMessage subclass: 'Message_',aMessageName
	instanceVariableNames: ''
	classVariableNames: ''
	package: self packageName.
	self model addMessage: aMessageName.
	self view addMessage: aMessageName.
	self inform: 'Message: ', aMessageName, ' has been created.'.
]

{ #category : #undefined }
PMTController >> createPackage: aPackageName [
	"TODO: if there already exists a package with this name throw exception"
	| tmpPackage |
	
	tmpPackage := RPackage organizer createPackageNamed: aPackageName.
	self package: tmpPackage.
	self packageName: aPackageName.
	self inform: 'Package: ' , packageName , ' has been created.'
]

{ #category : #accessing }
PMTController >> initialize [
	<gtExample>
	super initialize. "TODO is this even necessary?"
	self model: PMTModel new.
	self view: PMTView new.
	self view controller: self.
]

{ #category : #accessing }
PMTController >> model [
	^ model
]

{ #category : #accessing }
PMTController >> model: anObject [
	model := anObject
]

{ #category : #undefined }
PMTController >> openPackage: aPackageName [
	"| tmpPackage |"
	"TODO: get the package with the name like: tmpPackage := getPackage: aPackageName"
	"self package: tmpPackage."
	self packageName: aPackageName.
	self inform: 'Package: ', packageName, ' has been opened'.
	"TODO: load instances and stuff."
	
	
]

{ #category : #accessing }
PMTController >> package [
	^ package
]

{ #category : #accessing }
PMTController >> package: aPackage [
	package := aPackage
]

{ #category : #accessing }
PMTController >> packageName [
	^ packageName
]

{ #category : #accessing }
PMTController >> packageName: aPackageName [
	packageName := aPackageName
]

{ #category : #accessing }
PMTController >> view [
	^ view
]

{ #category : #accessing }
PMTController >> view: anObject [
	view := anObject
]
