package gb

class NavigationController {

    def index() { }

    def customer() {
        render(template: 'customer')
    }

    def menu() {
        render(template: 'menu')
    }
}
