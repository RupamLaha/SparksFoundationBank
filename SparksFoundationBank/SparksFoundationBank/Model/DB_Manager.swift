//
//  DB_Manager.swift
//  SparksFoundationBank
//
//  Created by RUPAM LAHA on 16/01/21.
//

import Foundation

//import library
import SQLite

class DB_Manager{
    
    //create empty array
//    @Published var customersData: [customersModel] = []
    
    //sqlite instance
    private var db: Connection!
    
    //customers table instance
    private var Customers: Table!
    
    //column instances of the table customers
    private var id: Expression<Int64>!
    private var acc_no: Expression<Int64>!
    private var name: Expression<String>!
    private var email: Expression<String>!
    private var balance: Expression<Int64>!
    
    //transactions table instance
    private var Transactions: Table!
    
    //column instances of the table transactions
    public var transaction_id: Expression<Int64>!
    public var tarik: Expression<String>!
    public var customer_id: Expression<Int64>!
    public var mode: Expression<String>!
    public var beneficiary: Expression<String>!
    public var amount: Expression<Int64>!
    
    //constructor of the class
    init() {
        
        //exception handler
        do{
            //path of the document directory
//            let path: String = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first ?? ""
//
//            print(path)
            
            let path1: String = "/Users/rupamlaha/Desktop/SparksFoundationBank/SparksFoundationBank/SparksFoundationBank/Model"
            
            //creation database connection
            db = try Connection("\(path1)/Bank.sqlite3")
            
            
//            db = try Connection("/Bank.sqlite3")
            
            //creating customers table object
            Customers = Table("Customers")
            
            //create instances of each column
            id = Expression<Int64>("id")
            acc_no = Expression<Int64>("acc_no")
            name = Expression<String>("name")
            email = Expression<String>("email")
            balance = Expression<Int64>("balance")
            
            //check if table is crated or not
            if(!UserDefaults.standard.bool(forKey: "is_db_created")){
                //if not then create one
                try db.run(Customers.create { (t) in
                    t.column(id, primaryKey: true)
                    t.column(acc_no, unique: true)
                    t.column(name)
                    t.column(email)
                    t.column(balance)
                })
                
                //set the values to true, so it will not attempt to create the table again
                UserDefaults.standard.set(true, forKey: "is_db_created")
            }
            
            //creating transactions table object
            Transactions = Table("Transactions")
            
            //create instances of each column
            transaction_id = Expression<Int64>("transaction_id")
            tarik = Expression<String>("tarik")
            customer_id = Expression<Int64>("customer_id")
            mode = Expression<String>("mode")
            beneficiary = Expression<String>("beneficiary")
            amount = Expression<Int64>("amount")
            
        }catch{
            //show error message
            print(error.localizedDescription)
        }
    }
    
    public func getUsers() -> [customersModel] {
        
        //create empty array
        var customersData: [customersModel] = []
        
        //get all users in desending order
//        Customers = Customers.order(id.desc)
        
        //exception handeling
        do{
            
            //loop through all users
            for customer in try db.prepare(Customers) {
                
                //create loop model in each
                let customers: customersModel = customersModel()
                
                customers.id = customer[id]
                customers.acc_no = customer[acc_no]
                customers.name = customer[name]
                customers.email = customer[email]
                customers.balance = customer[balance]
                
                //append in new array
                customersData.append(customers)
                
            }
            
        }catch{
            print(error.localizedDescription)
        }
        
        //return array
        return customersData
    }
    
    public func getUsersFiltered() -> [customersModel] {
        
        //create empty array
        var customersData: [customersModel] = []
        
        //get all users in desending order
//        Customers = Customers.order(id.desc)
        
        //exception handeling
        do{
            
            //loop through all users
            for customer in try db.prepare(Customers.filter(id != 1)) {
                
                //create loop model in each
                let customers: customersModel = customersModel()
                
                    customers.id = customer[id]
                    customers.acc_no = customer[acc_no]
                    customers.name = customer[name]
                    customers.email = customer[email]
                    customers.balance = customer[balance]
                    
                    //append in new array
                    customersData.append(customers)
                
            }
            
        }catch{
            print(error.localizedDescription)
        }
        
        //return array
        return customersData
    }
    
    
    
    public func getTransactions() -> [transactionsModel]{
        
        //create empty array
        var allTransactions: [transactionsModel] = []
        
        do{
            
            //loop through all users
            for transaction in try db.prepare(Transactions) {
                
                //create loop model in each
                let transactions: transactionsModel = transactionsModel()
                
                transactions.transaction_id = transaction[transaction_id]
                transactions.tarik = transaction[tarik]
                transactions.customer_id = transaction[customer_id]
                transactions.mode = transaction[mode]
                transactions.beneficiary = transaction[beneficiary]
                transactions.amount = transaction[amount]
                
                //append in new array
                allTransactions.append(transactions)
                
            }
            
        }catch{
            print(error.localizedDescription)
        }
        
        return allTransactions
    }
    
    public func addMoney(moneyValue: Int64) {
        do {
            
            //get user using id
            let customer: Table = Customers.filter(id == 1)
            
            var senderAvailableBalance:Int64 = 0
            
            //get sender current balance
            for user in try db.prepare(Customers.select(balance).filter(id == 1)) {
                senderAvailableBalance = user[balance]
//                print(senderAvailableBalance)
            }
            
            let senderUpdatedBalance = senderAvailableBalance + moneyValue
            
            //run the update query
            try db.run(customer.update(balance <- senderUpdatedBalance))
            
            //get the current date
            let date = Date()
            let formatter = DateFormatter()
            formatter.dateFormat = "dd.MM.yyyy"
            let result = formatter.string(from: date)

            
            //run the insert transaction query
            try db.run(Transactions.insert(tarik <- result, customer_id <- 1, mode <- "credit", beneficiary <- "Self", amount <- moneyValue))
            
        } catch {
            print(error.localizedDescription)
        }
    }
    
    public func sendMoney(accountNo:Int64, moneyValue:Int64) {
        do {
            
            var senderAvailableBalance:Int64 = 0
            
            let sender: Table = Customers.filter(id == 1)
            
            //get sender current balance
            for user in try db.prepare(Customers.select(balance).filter(id == 1)) {
                senderAvailableBalance = user[balance]
//                print(senderAvailableBalance)
            }
            
            let senderUpdatedBalance = senderAvailableBalance - moneyValue
//            print("Sender Before Balance : " + String(senderAvailableBalance))
//            print("Sender Updated Balance : " + String(senderUpdatedBalance))
            
            //run the update query
            try db.run(sender.update(balance <- senderUpdatedBalance))
            
            //get user using acc_no of receiver
            let receiver: Table = Customers.filter(acc_no == accountNo)
            
            var receiverAvailableBalance:Int64 = 0
            var receiverId:Int64 = 0
            var receiverName:String = ""
            
            //get sender current balance
            for user in try db.prepare(Customers.select(balance,id,name).filter(acc_no == accountNo)) {
                receiverAvailableBalance = user[balance]
                receiverId = user[id]
                receiverName = user[name]
//                print(senderAvailableBalance)
            }
//            let receiverAvailableBalance = receiver[Customers[balance]]
            
            let receiverUpdatedBalance = receiverAvailableBalance + moneyValue
            
//            print("Receiver Before Balance : " + String(receiverAvailableBalance))
//            print("Receiver Updated Balance : " + String(receiverUpdatedBalance))
            
            //run the update query
            try db.run(receiver.update(balance <- receiverUpdatedBalance))
            
            //get the current date
            let date = Date()
            let formatter = DateFormatter()
            formatter.dateFormat = "dd.MM.yyyy"
            let result = formatter.string(from: date)
            
            //run the insert transaction query
            try db.run(Transactions.insert(tarik <- result, customer_id <- receiverId, mode <- "debit", beneficiary <- "\(receiverName)", amount <- moneyValue))
            
        } catch {
            print(error.localizedDescription)
        }
    }
    
}
