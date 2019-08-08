"
I create the whole application
"
Class {
	#name : #PMTView,
	#superclass : #BlElement,
	#instVars : [
		'container',
		'toolbar',
		'controller',
		'messages',
		'instances'
	],
	#category : #'PharoModelingTool-View'
}

{ #category : #initialization }
PMTView >> addInstance: anObject [
	| tmpInstance generatedInstance |
	"TODO: How to turn a string to said object?"
	"generatedInstance := anObject blabla."
	generatedInstance := PMTInstance new.
	tmpInstance := PMTInstanceElement new
		instance: generatedInstance;
		addEventHandler: BlPullHandler new.
	container addChild: tmpInstance.
	"instanceElements addAll: {tmpInstance} TODO: Why does this not work?"
]

{ #category : #initialization }
PMTView >> addMessage: anObject [
	| tmpMessage generatedMessage |
	"TODO: How to turn a string to said object?"
	"generatedInstance := anObject blabla."
	generatedMessage := PMTMessage new.
	tmpMessage := PMTMessageElement new
		instance: generatedMessage;
		addEventHandler: BlPullHandler new.
	container addChild: tmpMessage.
	"messages add: tmpMessage. TODO how do i do this?"
]

{ #category : #accessing }
PMTView >> container [
	^ container
]

{ #category : #accessing }
PMTView >> container: aContainer [
	container := aContainer
]

{ #category : #accessing }
PMTView >> controller [
	^ controller
]

{ #category : #accessing }
PMTView >> controller: anObject [
	controller := anObject
]

{ #category : #initialization }
PMTView >> createContainer [
	^ BlElement new
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical matchParent ];
		yourself
]

{ #category : #initialization }
PMTView >> createInstanceanObject [
	| anObject instance nameElement attributesElement methodElement |
	instance := anObject.
	nameElement text: instance class name asRopedText.
	attributesElement items: instance class allInstVarNames.
	methodElement items: instance class methods asOrderedCollection
]

{ #category : #initialization }
PMTView >> createNewInstanceButton [
	^ BrButton new
		beLarge;
		look: BrGlamorousButtonWithLabelLook new;
		label: 'New instance';
		action: [ self controller createInstance: 'ONE'];
		constraintsDo: [ :c | c horizontal matchParent ];
		yourself
]

{ #category : #initialization }
PMTView >> createNewMessageButton [
	^ BrButton new
		beLarge;
		look: BrGlamorousButtonWithLabelLook new;
		label: 'New message';
		action: [ self controller createMessage: 'UNO' ];
		constraintsDo: [ :c | 
			c horizontal exact: 170 ];
		yourself
]

{ #category : #initialization }
PMTView >> createNewModelButton [
	^ BrButton new
		beLarge;
		look: BrGlamorousButtonWithLabelLook new;
		label: 'Create new model';
		action: [ self controller createPackage: 'PharoModelingToolONE'];
		constraintsDo: [ :c | 
			c horizontal matchParent ];
		yourself
		"TODO: How to disable this button after one click."
]

{ #category : #initialization }
PMTView >> createOpenModelButton [
	^ BrButton new
		beLarge;
		look: BrGlamorousButtonWithLabelLook new;
		label: 'Open model';
		action: [ self inform: 'Not yet implemented.' ];
		constraintsDo: [ :c | 
			c horizontal matchParent ];
		yourself
]

{ #category : #initialization }
PMTView >> createToolbar [
	^ BrToolbar new
		look: BrGlamorousToolbarLook new beVertical;
		"addChild: self createToolbarLabel; Is it even necessary?"
		addChild: self createNewModelButton;
		addChild: self createOpenModelButton;
		addChild: self createNewInstanceButton;
		addChild: self createNewMessageButton;
		constraintsDo: [ :c | 
			c horizontal exact: 170.
			c vertical matchParent ];
		yourself
]

{ #category : #initialization }
PMTView >> createToolbarLabel [
	^ BrLabel new
		look: BrGlamorousLabelLook new;
		text: 'Toolbar';
		yourself
]

{ #category : #initialization }
PMTView >> gtLiveFor: aView [
	<gtView>
	^ aView explicit
		priority: 1;
		title: 'PMT';
		stencil: [ self asElement ]
]

{ #category : #initialization }
PMTView >> initialize [
	| a |
	super initialize.
	instances := OrderedCollection new.
	messages := OrderedCollection new.
	self container: self createContainer.
	self toolbar: self createToolbar.
	self
		layout: BlLinearLayout horizontal;
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical matchParent ];
		addChild: toolbar;
		addChild: container;
	yourself.
]

{ #category : #accessing }
PMTView >> toolbar [
	^ toolbar
]

{ #category : #accessing }
PMTView >> toolbar: aToolbar [
	toolbar := aToolbar
]
