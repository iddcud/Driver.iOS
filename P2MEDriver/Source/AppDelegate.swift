//
//  AppDelegate.swift
//  P2MEDriver
//
//  Created by user on 16.07.2018.
//  Copyright © 2018 DenisBaturitskiyDev. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift
import GoogleMaps
import Starscream

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    var socket: WebSocket!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        GMSServices.provideAPIKey("AIzaSyAYh5aNDV_fFI-wBiaThMJDh7FRUdUFKDo")
        
        IQKeyboardManager.shared.enable = true

        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    func initSocket(token: String) {
        var request = URLRequest(url: URL(string: "ws://109.251.227.52:8080/delivery/?token=\(token)")!)
        request.timeoutInterval = 5
        socket = WebSocket(request: request)
        socket.delegate = self
        socket.connect()
    }
}

extension AppDelegate: WebSocketDelegate {
    func websocketDidConnect(socket: WebSocketClient) {
        print("websocket is connected")
    }
    
    func websocketDidDisconnect(socket: WebSocketClient, error: Error?) {
        if let e = error as? WSError {
            print("websocket is disconnected: \(e.message)")
        } else if let e = error {
            print("websocket is disconnected: \(e.localizedDescription)")
        } else {
            print("websocket disconnected")
        }
    }
    
    func websocketDidReceiveMessage(socket: WebSocketClient, text: String) {
        let socketModel = try? JSONDecoder().decode(SocketModel.self, from: text.data(using: .utf8)!)
        let dict: [String : Any] = try! (socketModel?.toDictionary())!
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "NavigationVC"), object: nil, userInfo: dict)
    }
    
    func websocketDidReceiveData(socket: WebSocketClient, data: Data) {
        print("Received data: \(data.count)")
    }
    
    // MARK: Write Text Action
    
    @IBAction func writeText(_ sender: UIBarButtonItem) {
        socket.write(string: "hello there!")
    }
    
    // MARK: Disconnect Action
    
    @IBAction func disconnect(_ sender: UIBarButtonItem) {
        if socket.isConnected {
            sender.title = "Connect"
            socket.disconnect()
        } else {
            sender.title = "Disconnect"
            socket.connect()
        }
    }
}
