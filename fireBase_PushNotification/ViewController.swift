//
//  ViewController.swift
//  fireBase_PushNotification
//
//  Created by Samir Raut on 27/11/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
 
    }

    
    @IBAction func sendNotification(_ sender: Any) {
        
     //   setInternalNotification()
        dispatchNotification()
        
    }
    
    func setInternalNotification() {
        
        let center = UNUserNotificationCenter.current()
        let content = UNMutableNotificationContent()
        content.title = "Welcome Tanmay"
        content.body = " Maker of impulsive AI"
        content.sound = .default
        content.userInfo = ["value": "Data with local notification"]
        let selectDate = Calendar.current.dateComponents([.day,.month, .year, .hour, .minute, .second], from: Date().addingTimeInterval(5)) // 5 Seconds
        let trigger = UNCalendarNotificationTrigger(dateMatching: selectDate, repeats: false)
        let request = UNNotificationRequest(identifier: "reminder", content: content, trigger: trigger)
        center.add(request) { (error) in
            if error != nil {
                print("Error: ", error?.localizedDescription ?? "Error in local notification")
            }
        }
        
    }
    
    
    func dispatchNotification() {
        
        let title = "Test Local API"
        let body = "Local API Passed"
     //   var hours = 0
     //   var min = 0
        let isDaily = true
        
      //  let identifier = "euWga2lNJEBfieDXlAU9hF:APA91bHCslyrKBuUXRkLFlJeRC22kIALqY3eaL5ff_rEqc0o3HHXkrTNHwRCa_HEdxqI5w9i5KUF073Hfgf5ZpKK2ArMSEdGKupTt_cvJ3fyMFX4VNJDyLFbf_jeu4eaf-Sc0jHUlr87" // iPhone 15Pro 17.1
        
        let identifier = "cjurerAuUUr-lnTFcvR9QQ:APA91bGpxOeoCzV8Frhj_G8LW3jBMTeDAVjDK8CwcpfSow-MjeJIMUsoHepAQlpaVwCQiJK8iG6xB2-w37_FqQzxACT7JMAOTcZBBZ1c2L4boRqzv9ewtL-z74bLmtLAr9yVAhdHfsUK" // iPhone 15Pro 17.2

        // Create a Calendar instance
        let calendar = Calendar.current

        // Get the current date and time
        let currentDate = Date()

        // Extract components from the current date
        var components = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: currentDate)

        // Print the components
        print("Current Date: \(components.year ?? 0)-\(components.month ?? 0)-\(components.day ?? 0) \(components.hour ?? 0):\(components.minute ?? 0):\(components.second ?? 0)")
        
        let hours = components.hour ?? 0
        let min = components.minute ?? 0
        let seconds = (components.second ?? 00)+10
        
        let notificationCenter = UNUserNotificationCenter.current()
        
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = body
        content.sound = .default
        
        components.hour = hours
        components.minute = min
        components.second = seconds
        
        print("Updated Date: \(components.year ?? 0)-\(components.month ?? 0)-\(components.day ?? 0) \(components.hour ?? 0):\(components.minute ?? 0):\(components.second ?? 0)")
        
let trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: isDaily)
        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
        
     //   notificationCenter.removePendingNotificationRequests(withIdentifiers: [identifier])
        notificationCenter.add(request)
   
    }
    
}

