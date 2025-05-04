import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="dependent-select"
export default class extends Controller {
  static targets = ["brand", "class", "model"]

  connect() {
    console.log("Dependent select controller connected")
  }

  brandChanged() {
    const brandId = this.brandTarget.value
    
    if (brandId === "") {
      this.resetSelect(this.classTarget)
      this.resetSelect(this.modelTarget)
      return
    }

    // Fetch car classes for the selected brand
    fetch(`/case_requests/car_classes?brand_id=${brandId}`, {
      headers: { "Accept": "application/json" }
    })
      .then(response => response.json())
      .then(data => {
        this.populateSelect(this.classTarget, data)
        this.resetSelect(this.modelTarget)
      })
      .catch(error => console.error("Error fetching car classes:", error))
  }

  classChanged() {
    const brandId = this.brandTarget.value
    const classId = this.classTarget.value
    
    if (brandId === "" || classId === "") {
      this.resetSelect(this.modelTarget)
      return
    }

    // Fetch car models for the selected brand and class
    fetch(`/case_requests/car_models?brand_id=${brandId}&class_id=${classId}`, {
      headers: { "Accept": "application/json" }
    })
      .then(response => response.json())
      .then(data => {
        this.populateSelect(this.modelTarget, data)
      })
      .catch(error => console.error("Error fetching car models:", error))
  }

  resetSelect(selectElement) {
    selectElement.innerHTML = ""
    const defaultOption = document.createElement("option")
    defaultOption.value = ""
    defaultOption.text = selectElement.classList.contains('select-class') 
      ? "Selecciona una clase" 
      : "Selecciona un modelo"
    selectElement.appendChild(defaultOption)
    selectElement.disabled = true
  }

  populateSelect(selectElement, data) {
    selectElement.innerHTML = ""
    
    const defaultOption = document.createElement("option")
    defaultOption.value = ""
    defaultOption.text = selectElement.classList.contains('select-class') 
      ? "Selecciona una clase" 
      : "Selecciona un modelo"
    selectElement.appendChild(defaultOption)
    
    data.forEach(item => {
      const option = document.createElement("option")
      option.value = item.id
      option.text = item.name
      selectElement.appendChild(option)
    })
    
    selectElement.disabled = false
  }
}
