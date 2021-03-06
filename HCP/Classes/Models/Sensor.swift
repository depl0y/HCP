@objc(Sensor)
class Sensor: _Sensor, FXForm {

	func update(definition: NSDictionary) {

		var previousName = self.name;
		
		if let nameValue = definition.objectForKey("name") as? String {
			self.name = definition.objectForKey("name") as? String;
		}
		
		if (self.displayName == nil || previousName != self.name) {
			self.displayName = self.name;
		}
		
	}
	
	func addObserversForObject(object: NSObject) {
		self.addObserver(object, forKeyPath: "name", options: NSKeyValueObservingOptions.New, context: nil);
		self.addObserver(object, forKeyPath: "displayName", options: NSKeyValueObservingOptions.New, context: nil);
		self.addObserver(object, forKeyPath: "available", options: NSKeyValueObservingOptions.New, context: nil);
	}
	
	func removeObserversForObject(object: NSObject) {
		
		self.removeObserver(object, forKeyPath: "name");
		self.removeObserver(object, forKeyPath: "displayName");
		self.removeObserver(object, forKeyPath: "available");
		
	}
	
	func fields() -> [AnyObject]! {
		
		return [
			[ "key": "displayName", "title": "Display name", "type": "text", "header" : "General" ],
			[ "key": "selected", "title": "Active", "type": "boolean" ],
			[ "key": "onTodayScreen", "title": "Display in Widget", "type": "boolean" ],
			[ "key": "showTitle", "title": "Display title", "type": "boolean" ],
		];
		
	}
	
	func lastGraphTimeStamp(resolution: kGraphResolution, dataType: kGraphDataType) -> NSDate? {
		
		var searchPredicate = NSPredicate(format: "resolution = %d AND type = %d AND sensor = %@",
			resolution.rawValue,
			dataType.rawValue,
			self);
		
		var lastValue = GraphValue.findFirstWithPredicate(searchPredicate, sortedBy: "timeStamp", ascending: false);
		
		return (lastValue == nil || lastValue.timeStamp == nil) ? nil : lastValue.timeStamp!;
	}
	
}
