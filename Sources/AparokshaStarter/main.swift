import Aparoksha

@main
struct AparokshaStarter: App {

    let app = Aparoksha(
        id: "com.example.AparokshaStarter",
        name: "Aparoksha Starter",
        settings: "Settings",
        about: "About Aparoksha Starter",
        developer: "Your Name",
        version: "0.1.0",
        quit: "Quit Aparoksha Starter",
        website: .init(string: "https://github.com/your-user/aparoksha-starter")!,
        websiteLabel: "Repository",
        issues: .init(string: "https://github.com/your-user/aparoksha-starter/issues")!,
        issuesLabel: "Issues",
        services: "Services"
    )
    .hideMenu(hideApp: "Hide Aparoksha Starter", hideOthers: "Hide Others", showAll: "Show All")

    var scene: Scene {
        MenuBar {
            Submenu("Template") {
                MenuButton("Say Hello") {
                    print("Hello from Aparoksha Starter")
                }
                MenuButton("Print Hint") {
                    print("Edit Sources/AparokshaStarter/main.swift to customize the app")
                }
            }
        }

        Window("Aparoksha Starter", icon: .headphones, id: "main") {
            ContentView()
        }
        .leadingToolbarItem("Ping", icon: .airplane) {
            print("Toolbar action triggered")
        }

        Window("About", icon: .warning, id: "about") {
            Text("Edit Sources/AparokshaStarter/main.swift to customize this template.")
                .padding(10)
        }
        .frame(width: .constant(360), height: .constant(220))
    }
}

struct ContentView: WindowView {

    @State(blockUpdates: true) private var width = 900
    @State(blockUpdates: true) private var height = 600
    @State private var selectedPage: Page = .dashboard
    @State private var forceSplitView = true
    @State private var showAlert = false
    @State private var alertInput = ""

    var view: Body {
        FlatNavigation(Page.allCases, selection: $selectedPage) {
            switch selectedPage {
            case .dashboard:
                dashboard
            case .gallery:
                gallery
            case .alert:
                alert
            }
        }
        .forceSplitView(forceSplitView)
    }

    var dashboard: AnyView {
        VStack {
            Text("Aparoksha Starter")
                .halign(.center)
                .padding(5, edges: .bottom)

            Text("A minimal cross-platform starter for Windows, macOS, and Linux.")
                .halign(.center)
                .padding(10)

            Button("Toggle Split Layout") {
                forceSplitView.toggle()
            }
            .halign(.center)
        }
        .valign(.center)
    }

    var gallery: AnyView {
        Carousel(SampleCard.allCases) { card in
            VStack {
                Text(card.description)
                    .valign(.center)
                    .halign(.center)
                    .frame(minWidth: 300, minHeight: 250)
            }
            .valign(.center)
            .card()
            .padding(10)
            .valign(.center)
            .halign(.center)
        }
    }

    var alert: AnyView {
        Button("Open Alert") {
            showAlert = true
        }
        .valign(.center)
        .halign(.center)
        .alert(
            visible: $showAlert,
            title: "Starter Alert",
            content: "Your Aparoksha template is running.",
            closeLabel: "Close"
        ) {
            print("Alert closed")
        }
        .primaryResponse(alertInput, style: .suggested) {
            print("Primary response text: \(alertInput)")
        }
        .textField("Type something", text: $alertInput)
    }

    func window(_ window: Window) -> Window {
        window
            .frame(width: $width, height: $height)
    }
}

enum Page: String, FlatNavigationItem, CaseIterable, Equatable, Codable {

    case dashboard
    case gallery
    case alert

    var id: Self { self }

    var description: String {
        rawValue.capitalized
    }

    var icon: Icon {
        switch self {
        case .dashboard:
            .navigation
        case .gallery:
            .airplane
        case .alert:
            .warning
        }
    }
}

enum SampleCard: String, CaseIterable, CustomStringConvertible, Identifiable {

    case windows
    case macos
    case linux

    var id: String {
        rawValue
    }

    var description: String {
        switch self {
        case .windows:
            "Windows / WinUI"
        case .macos:
            "macOS / AppKit"
        case .linux:
            "Linux / libadwaita"
        }
    }
}
