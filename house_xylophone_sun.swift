import UIKit


//MARK: - The Art of Healing

//MARK: Structs
struct Healing {
    let type: String
    let name: String
}

struct HealthInfo {
    let name: String
    let ailment: String
    let healing: Healing
}

//MARK: Enums
enum HealingType {
    case herb
    case crystal
    case meditation
}

//MARK: Protocols
protocol HealthInfoDelegate {
    func getHealthInfo(for userName: String, ailment: String, completion: (HealthInfo?) -> Void)
}

//MARK: Classes
class Healer {
    let delegate: HealthInfoDelegate
    
    init(delegate: HealthInfoDelegate) {
        self.delegate = delegate
    }
    
    func diagnose(_ healing: Healing, forName name: String, completion: (Healing) -> Void) {
        delegate.getHealthInfo(for: name, ailment: healing.type) { healthInfo in
            if let healthInfo = healthInfo {
                if healthInfo.healing.name == healing.name {
                    completion(healing)
                }
            }
        }
    }
}

//MARK: Extension
extension Healer {
    func recommend(_ healing: Healing, forUser user: String, completion: (Healing?) -> Void) {
        delegate.getHealthInfo(for: user, ailment: healing.type) { healthInfo in
            if let healthInfo = healthInfo {
                if healthInfo.healing.name != healing.name {
                    completion(healing)
                }
            }
        }
    }
}


//MARK: Protocol Implementation
class HealthInfoService: HealthInfoDelegate {
    func getHealthInfo(for userName: String, ailment: String, completion: (HealthInfo?) -> Void) {
        //do web service calls
    }
}

//MARK: Usage
let healer = Healer(delegate: HealthInfoService())
let healing = Healing(type: HealingType.herb.rawValue, name: "Chamomile")

healer.recommend(healing, forUser: "John", completion: { healing in
    if let healing = healing {
        print("Herb recommended for John: \(healing.name)")
    }
})

healer.diagnose(healing, forName: "John", completion: { healing in
    print("John is diagnosed with \(healing.name)")
})