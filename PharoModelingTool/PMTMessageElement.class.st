"
I am the visual representation of a message
"
Class {
	#name : #PMTMessageElement,
	#superclass : #BlElement,
	#instVars : [
		'instance',
		'nameElement',
		'attributesElement',
		'methodElement'
	],
	#category : #'PharoModelingTool-View'
}

{ #category : #initialization }
PMTMessageElement >> initialize [
	super initialize.
	self layout: BlLinearLayout vertical.
	self
		constraintsDo: [ :c | 
			c horizontal exact: 200.
			c vertical exact: 200 ].
	self background: Color gray.
	self look: BrShadowLook.
	nameElement := BrEditor new
		look: BrEditorLook;
		padding: (BlInsets all: 5);
		hMatchParent;
		vExact: 30;
		text: '...' asRopedText;
		yourself.
	attributesElement := BrSimpleList new
		padding: (BlInsets all: 5);
		hMatchParent;
		vMatchParent;
		items: {};
		stencil:
			[ :n | 
			BrButton new
				look: BrGlamorousButtonWithLabelLook;
				label: n;
				action: [ :b | b phlow spawnObject: (instance instVarNamed: n) ];
				yourself ] yourself.
	methodElement := BrSimpleList new
		padding: (BlInsets all: 5);
		hMatchParent;
		vMatchParent;
		items: {};
		stencil: [ :m | GtMethodCoder forMethod: m ] yourself.
	self
		addChildren:
			{nameElement.
			attributesElement.
			methodElement}
]

{ #category : #accessing }
PMTMessageElement >> instance [
	^ instance
]

{ #category : #accessing }
PMTMessageElement >> instance: anObject [
	instance := anObject.
	nameElement text: instance class name asRopedText.
	attributesElement items: instance class allInstVarNames.
	methodElement items: instance class methods asOrderedCollection
]
