import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "name" ]  // define the targets this controller will work with

  greet() {
    const element = this.nameTarget  // access a specific target
    const name = element.value  // read the value of a target
    console.log(`hello, ${name}!`)  // do something with the value
  }
}
