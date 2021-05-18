//
//  ViewController.swift
//  SocketIOExample
//
//  Created by AhnSangHoon on 2021/05/14.
//

import UIKit
import SocketIO

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func socketConnect(_ sender: UIButton) {
        SocketIOManager.shared.connect()
    }
    
    @IBAction func socketDisconnect(_ sender: UIButton) {
        SocketIOManager.shared.disconnect()
    }
    
    @IBAction func emit(_ sender: UIButton) {
        SocketIOManager.shared.emit()
    }
}


class SocketIOManager {
    static let shared = SocketIOManager()
    
    private let manager = SocketManager(socketURL: URL(string: "https://test-arqtc.run.goorm.io")!, config: [.log(true), .compress])
    private var socket: SocketIOClient {
        manager.defaultSocket
    }
    
    private init() {
        socket.on("hoon_response_test") { data, ack in
            print(data)
        }
    }
    
    func connect() {
        socket.connect()
    }
    
    func disconnect() {
        socket.disconnect()
    }
    
    func emit() {
        socket.emit("hoon_request_test")
    }
    
    func emit(_ title: String) {
        socket.emit("\(title)")
    }
}
