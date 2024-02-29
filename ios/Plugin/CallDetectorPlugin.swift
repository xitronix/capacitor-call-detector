import Foundation
import Capacitor
import CallKit

@objc(CallDetector)
public class CallDetector: CAPPlugin, CXCallObserverDelegate {
    private var callObserver: CXCallObserver!

    override public func load() {
        self.callObserver = CXCallObserver()
        self.callObserver.setDelegate(self, queue: nil)
    }

    @objc func echo(_ call: CAPPluginCall) {
        let value = call.getString("value") ?? ""
        print(value)
        call.resolve([
            "value": value
        ])
    }

    @objc func startCallDetector(_ call: CAPPluginCall) {
        callObserver.setDelegate(self, queue: nil)
        call.resolve()
    }

    @objc func stopCallDetector(_ call: CAPPluginCall) {
        callObserver.setDelegate(nil, queue: nil)
        call.resolve()
    }
    // MARK: - CXCallObserverDelegate

    public func callObserver(_ callObserver: CXCallObserver, callChanged call: CXCall) {
  
        if call.hasEnded {
            notifyListeners("callEnded", data: ["status": "callEnded", "hasConnected": call.hasConnected, "isOutgoing": call.isOutgoing, "hasEnded": call.hasEnded])
        } else if call.hasConnected {
            notifyListeners("callConnected", data: ["status": "callConnected", "hasConnected": call.hasConnected, "isOutgoing": call.isOutgoing, "hasEnded": call.hasEnded])
        } else if call.isOutgoing {
            notifyListeners("outgoingCall", data: ["status": "outgoingCall", "hasConnected": call.hasConnected, "isOutgoing": call.isOutgoing, "hasEnded": call.hasEnded])
        } else if (!call.hasConnected && !call.isOutgoing) {
            // Assuming it's an incoming call when it's neither connected nor outgoing
            notifyListeners("incomingCall", data: ["status": "incomingCall", "hasConnected": call.hasConnected, "isOutgoing": call.isOutgoing, "hasEnded": call.hasEnded])
        }
    }
}
