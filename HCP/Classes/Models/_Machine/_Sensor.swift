// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Sensor.swift instead.

import CoreData

enum SensorAttributes: String {
    case available = "available"
    case displayName = "displayName"
    case id = "id"
    case lastUpdate = "lastUpdate"
    case name = "name"
    case onTodayScreen = "onTodayScreen"
    case selected = "selected"
    case showTitle = "showTitle"
    case sortOrder = "sortOrder"
}

enum SensorRelationships: String {
    case controller = "controller"
    case graphValues = "graphValues"
    case rooms = "rooms"
}

@objc
class _Sensor: NSManagedObject {

    // MARK: - Class methods

    class func entityName () -> String {
        return "Sensor"
    }

    class func entity(managedObjectContext: NSManagedObjectContext!) -> NSEntityDescription! {
        return NSEntityDescription.entityForName(self.entityName(), inManagedObjectContext: managedObjectContext);
    }

    // MARK: - Life cycle methods

    override init(entity: NSEntityDescription, insertIntoManagedObjectContext context: NSManagedObjectContext!) {
        super.init(entity: entity, insertIntoManagedObjectContext: context)
    }

    convenience init(managedObjectContext: NSManagedObjectContext!) {
        let entity = _Sensor.entity(managedObjectContext)
        self.init(entity: entity, insertIntoManagedObjectContext: managedObjectContext)
    }

    // MARK: - Properties

    @NSManaged
    var available: NSNumber?

    // func validateAvailable(value: AutoreleasingUnsafePointer<AnyObject>, error: NSErrorPointer) {}

    @NSManaged
    var displayName: String?

    // func validateDisplayName(value: AutoreleasingUnsafePointer<AnyObject>, error: NSErrorPointer) {}

    @NSManaged
    var id: NSNumber?

    // func validateId(value: AutoreleasingUnsafePointer<AnyObject>, error: NSErrorPointer) {}

    @NSManaged
    var lastUpdate: NSDate?

    // func validateLastUpdate(value: AutoreleasingUnsafePointer<AnyObject>, error: NSErrorPointer) {}

    @NSManaged
    var name: String?

    // func validateName(value: AutoreleasingUnsafePointer<AnyObject>, error: NSErrorPointer) {}

    @NSManaged
    var onTodayScreen: NSNumber?

    // func validateOnTodayScreen(value: AutoreleasingUnsafePointer<AnyObject>, error: NSErrorPointer) {}

    @NSManaged
    var selected: NSNumber?

    // func validateSelected(value: AutoreleasingUnsafePointer<AnyObject>, error: NSErrorPointer) {}

    @NSManaged
    var showTitle: NSNumber?

    // func validateShowTitle(value: AutoreleasingUnsafePointer<AnyObject>, error: NSErrorPointer) {}

    @NSManaged
    var sortOrder: NSNumber?

    // func validateSortOrder(value: AutoreleasingUnsafePointer<AnyObject>, error: NSErrorPointer) {}

    // MARK: - Relationships

    @NSManaged
    var controller: Controller?

    // func validateController(value: AutoreleasingUnsafePointer<AnyObject>, error: NSErrorPointer) {}

    @NSManaged
    var graphValues: NSSet

    @NSManaged
    var rooms: NSSet

}

extension _Sensor {

    func addGraphValues(objects: NSSet) {
        let mutable = self.graphValues.mutableCopy() as NSMutableSet
        mutable.unionSet(objects)
        self.graphValues = mutable.copy() as NSSet
    }

    func removeGraphValues(objects: NSSet) {
        let mutable = self.graphValues.mutableCopy() as NSMutableSet
        mutable.minusSet(objects)
        self.graphValues = mutable.copy() as NSSet
    }

    func addGraphValuesObject(value: GraphValue!) {
        let mutable = self.graphValues.mutableCopy() as NSMutableSet
        mutable.addObject(value)
        self.graphValues = mutable.copy() as NSSet
    }

    func removeGraphValuesObject(value: GraphValue!) {
        let mutable = self.graphValues.mutableCopy() as NSMutableSet
        mutable.removeObject(value)
        self.graphValues = mutable.copy() as NSSet
    }

}

extension _Sensor {

    func addRooms(objects: NSSet) {
        let mutable = self.rooms.mutableCopy() as NSMutableSet
        mutable.unionSet(objects)
        self.rooms = mutable.copy() as NSSet
    }

    func removeRooms(objects: NSSet) {
        let mutable = self.rooms.mutableCopy() as NSMutableSet
        mutable.minusSet(objects)
        self.rooms = mutable.copy() as NSSet
    }

    func addRoomsObject(value: Room!) {
        let mutable = self.rooms.mutableCopy() as NSMutableSet
        mutable.addObject(value)
        self.rooms = mutable.copy() as NSSet
    }

    func removeRoomsObject(value: Room!) {
        let mutable = self.rooms.mutableCopy() as NSMutableSet
        mutable.removeObject(value)
        self.rooms = mutable.copy() as NSSet
    }

}
