import KituraContracts
import LoggerAPI
import SwiftKueryORM
import SwiftKueryMySQL

func initializeORMRoutes(app: App) {
    // Initialize MySQL Database
    let pool = MySQLConnection.createPool(
        host: "78.47.186.12",
        user: "aruser",
        password: "arpassword",
        database: "ardb",
        port: 3306,
        poolOptions: ConnectionPoolOptions(initialCapacity: 10, maxCapacity: 50)
    )
    Database.default = Database(pool)
    
    // Create tables if they do not exist
    do {
        try Object.createTableSync()
        try Token.createTableSync()
        try User.createTableSync()
        
        Log.info("All tables created")
    } catch {
        Log.error("Failed to create table: \(error)")
    }
    
    // Initialize routes
    app.router.get("/object", handler: app.findAllObjects)
    app.router.get("/user", handler: app.findAllUsers)
    app.router.post("/object", handler: app.saveObject)
    app.router.post("/user", handler: app.saveUser)
}

extension App {
    func findAllObjects(completion: @escaping ([Object]?, RequestError?) -> Void) {
        Object.findAll(completion)
    }
    
    func findAllUsers(completion: @escaping ([User]?, RequestError?) -> Void) {
        User.findAll(completion)
    }
    
    func saveObject(object: Object, completion: @escaping (Object?, RequestError?) -> Void) {
        object.save(completion)
    }
    
    func saveUser(user: User, completion: @escaping (User?, RequestError?) -> Void) {
        user.save(completion)
    }
}
