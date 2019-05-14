//
//  NavigationVC.swift
//  P2MEDriver
//
//  Created by user on 16.07.2018.
//  Copyright © 2018 DenisBaturitskiyDev. All rights reserved.
//

import UIKit
import GoogleMaps

struct Cordinate {
    let latitude: Double
    let longitude: Double
    
    init(lat: Double, lon: Double) {
        self.latitude = lat
        self.longitude = lon
    }
}

class NavigationVC: UIViewController, CustomSwitchDelegate {

    // MARK: - IBOutlets
    @IBOutlet weak var mapView: UIView!
    @IBOutlet weak var tabBarContainer: TabBarContainer!
    @IBOutlet weak var topNavigationView: CustomDriverTopNavigationView!

    // MARK: - Properties
    var appDelegate = UIApplication.shared.delegate as! AppDelegate
    var tabBarContainerIsHiden = true
    var customTabBarIsHiden = true
    var tabBarIshiden = false
    var topNavigationViewIsHiden = true
    var confirmModel: ConfirmDriverModel?
   
    var googleMapView: GMSMapView?
    let locationManager = CLLocationManager()
    var cordinate: Cordinate?
    var customSwitch = CustomSwitch()
    var timer = Timer()
    var socketMessageArray = [[String : Any]]()
    
    // MARK: -
    // MARK: - ViewController Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        NotificationCenter.default.addObserver(self, selector: #selector(self.receiveSocketMessage(notification:)), name: NSNotification.Name(rawValue: "NavigationVC"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.createRoute), name: NSNotification.Name(rawValue: "orderConfirmed"), object: nil)
        
        let token: String = UserDefaults.standard.string(forKey: "token")!
        appDelegate.initSocket(token: token)
            
        getUserStartLocation()
        startConfigurate()
    }

    override func loadView() {
        super.loadView()
        if let cordinate = cordinate {
            createMapViewAndStartPosition(latitude: cordinate.latitude, longitude: cordinate.longitude)
            createMarkerCar(latitude: cordinate.latitude, longitude: cordinate.longitude)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
    
    // MARK: -
    // MARK: - CustomSwitchDelegate
    
    func thumbDidTouch(_ sender: UIButton) {
        if sender.isSelected {
            timer = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(self.sendLocationToSocket), userInfo: nil, repeats: true)
        } else {
            timer.invalidate()
        }
    }
    
    @objc func sendLocationToSocket() {
        let dict: [String : Any] = ["type" : "location",
                                 "content" : ["lat" : cordinate?.latitude, "lon" : cordinate?.longitude]]
        let jsonData = try! JSONSerialization.data(withJSONObject: dict)
        let jsonString = String(data: jsonData, encoding: .utf8)
        
        if appDelegate.socket.isConnected {
            appDelegate.socket.write(string: jsonString!)
        }
    }
    
    
    // MARK: -
    // MARK: - API Call
    
    @objc func receiveSocketMessage(notification: NSNotification) {
        socketMessageArray.append(notification.userInfo as! [String : Any])
        print(socketMessageArray)
        
        let confirmDriverModel = ConfirmDriverModel()
        confirmDriverModel.orderID = socketMessageArray.first?["order_id"] as? String
        confirmDriverModel.adress = socketMessageArray.first?["supplier_address"] as? String
        confirmDriverModel.category = socketMessageArray.first?["supplier_category"] as? String
        confirmDriverModel.userPhoneNumber = socketMessageArray.first?["supplier_phone"] as? String
        confirmDriverModel.price = socketMessageArray.first?["delivery_cost"] as? Double
        confirmDriverModel.minDriving = "14"
        confirmDriverModel.userFullName = "John Jonson"
        confirmDriverModel.pickUpPlaceName = "Burger Kings"
        confirmDriverModel.userImage = "manImg"
    
        Presenters().presentConfirmDriverVC(model: confirmDriverModel, viewController: self)
    }
    
    @IBAction func testButton(_ sender: UIButton) {
        let model1 = ConfirmDriverModel()                                        //
        model1.adress = "Lesi Ukrainki street, 3 KIYV 10100100"                  //
        model1.minDriving = "14"                                                 //
        //model1.categoryID = 1                                                    //  T
        model1.userFullName = "John Jonson"                                      //  E
        model1.pickUpPlaceName = "Burger Kings"                                  //  S
        model1.userImage = "manImg"                                              //  T
        model1.userPhoneNumber = "+38(063) 707 21 92"                             //
                                                                                 //  M
        let pickUpModel = PickUpModel()                                          //  O
        pickUpModel.totalPrice = "56.79"                                         //  D
        pickUpModel.deliveryCost = "12.55"                                       //  E
        pickUpModel.deliveryUserAdress = "Laboratornaya street, 9 KIYV 10100100" //  L
        pickUpModel.deliveryUserName = "John Jonson"                             //
        pickUpModel.payMethds = "Cash & delivery"                                //  F
        pickUpModel.userNote = "Call befor delivery"                             //  R
                                                                                 //  O
        let modelPickup1 = PickUpItemModel()                                     //  M
        modelPickup1.itemName = "Burger"                                         //
        modelPickup1.quantity = "1"                                              //  S
        let modelPickup2 = PickUpItemModel()                                     //  E
        modelPickup2.itemName = "Coca cola"                                      //  R
        modelPickup2.quantity = "3"                                              //  V
        let modelPickup3 = PickUpItemModel()                                     //  E
        modelPickup3.itemName = "Kebab"                                          //  R
        modelPickup3.quantity = "1"                                              //
        pickUpModel.items = [modelPickup1,modelPickup2,modelPickup3]             //
                                                                                 //
        model1.userPickUpModel = pickUpModel                                     //
        confirmModel = model1
        
        if let model = confirmModel {
            Presenters().presentConfirmDriverVC(model: model, viewController: self)
        }
    }

    // MARK: -
    // MARK: - Configurate Google Maps
    
    func getUserStartLocation() {
        self.locationManager.requestAlwaysAuthorization()
        self.locationManager.requestWhenInUseAuthorization()
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
    }
    
    func createMapViewAndStartPosition(latitude: Double, longitude:Double) {
        let camera = GMSCameraPosition.camera(withLatitude: latitude, longitude: longitude, zoom: 16)
        googleMapView = GMSMapView.map(withFrame: self.mapView.bounds, camera: camera)
        self.mapView.addSubview(googleMapView!)
    }
    
    func createMarkerCar(latitude: Double, longitude: Double) {
        let position = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        let car = GMSMarker(position: position)
        car.icon = UIImage(named: "DriverCarIcon.png")
        car.map = googleMapView
    }
    
    @objc func createRoute(latitude: Double, longitude: Double) {
        let path = GMSMutablePath()
        path.addLatitude((cordinate?.latitude)!, longitude: (cordinate?.longitude)!)
        path.addLatitude(55.815238, longitude:49.131817)

        let polyline = GMSPolyline(path: path)
        polyline.strokeColor = .black
        polyline.strokeWidth = 3.0
        polyline.map = googleMapView
    }
    
    // MARK: -
    // MARK: - Configurate TabBarController
    
    func startConfigurate() {
        customSwitch.initSwitchView()
        customSwitch.delegate = self
        view.addSubview(customSwitch)
        
        tabBarContainer.isHidden = tabBarContainerIsHiden
        tabBarContainer.driverTabView.isHidden = customTabBarIsHiden
        topNavigationView.isHidden = customTabBarIsHiden
        tabBarContainer.driverTabView.confirmAndRefusalDelegate = self
    }
    
    func tabBarConfiguration(tabBar: Bool, custumTabBar: Bool) {
        tabBarContainer.isHidden = !custumTabBar
        tabBarController?.setTabBar(hidden: !tabBar)
        tabBarContainer.driverTabView.isHidden = !custumTabBar
        tabBarIshiden = !tabBar
        customTabBarIsHiden = !custumTabBar
        topNavigationView.isHidden = tabBar
        tabBarContainerIsHiden = !custumTabBar
    }
   
    func confgurateDriverPickUpOrderController(model: ConfirmDriverModel) {
        topNavigationView.userModel = model
        topNavigationView.configureWithModel()
        if let model = confirmModel { tabBarContainer.configurateModel(model: model) }
        tabBarConfiguration(tabBar: tabBarIshiden, custumTabBar: customTabBarIsHiden)
    }
    
    func configurateDriverDeliveryController(){
        topNavigationView.confiturateWithDelivery()
    }

    func refusalAndBackToStartState() {
        customTabBarIsHiden = true
        tabBarIshiden = false
        topNavigationViewIsHiden = true
        confirmModel = nil
        tabBarContainerIsHiden = true
        tabBarConfiguration(tabBar: !tabBarIshiden, custumTabBar: !customTabBarIsHiden)
        tabBarContainer.configurateStarState()
    }
}

extension NavigationVC : OtpAndConfitmDelegate {
    func confirmDeliveryFromDirver() {
        refusalAndBackToStartState()
    }
}

extension NavigationVC : CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        print("locations = \(locValue.latitude) \(locValue.longitude)")
        let cordinateFromUser = Cordinate(lat: locValue.latitude, lon: locValue.longitude)
        cordinate = cordinateFromUser
        createMapViewAndStartPosition(latitude: cordinateFromUser.latitude, longitude: cordinateFromUser.longitude)
        createMarkerCar(latitude: cordinateFromUser.latitude, longitude: cordinateFromUser.longitude)
        locationManager.stopUpdatingLocation()
    }
}

extension NavigationVC: PickUpAndRefusalDelegate {
    func refusalDeliveryCancelNavigationVC() {
        refusalAndBackToStartState()
    }
    
    func refusalDelivery() {
        Presenters().presentRefusalVC(viewController: self)
    }
    
    func confirmDelivery() {
        Presenters().presentConfirmDelivery(viewController: self)
    }
    
    func confirmOrder() {
        if let model = confirmModel { Presenters().presentConfirmOrder(model: model, viewController: self) }
    }
    
    func confirmAndStartDelivery() {
        tabBarContainer.confirmAndStartDelivery()
        configurateDriverDeliveryController()
    }
}

extension NavigationVC: ConfirmDriverDelegate {
    func confirmOrderFromDriver(model: ConfirmDriverModel) {
        tabBarContainer.driverTabView.confirmOrderFromDriver()
        confgurateDriverPickUpOrderController(model: model)
    }
}

