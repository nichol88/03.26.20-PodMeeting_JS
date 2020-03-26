let ul
document.addEventListener('DOMContentLoaded', init)

function init() {
  initializeDOMElements();
  getAnagrams();
}

function initializeDOMElements() {
  ul = document.getElementById('anagrams-index-ul')
}

function getAnagrams() {
  fetch('http://localhost:3000/anagrams')
    .then(response => response.json())
    .then(anagramsJson => {
      Anagram.addAnagramsToDOM(anagramsJson)
    })
}

class Anagram {
  constructor(anagramInfo) {
    this.name = anagramInfo.name
    this.description = anagramInfo.description
    this.id = anagramInfo.id
  }

  renderLi() {
    return `<li>${this.id} - ${this.name} - ${this.description}</li>`
  }

  addToDOM() {
    ul.innerHTML += this.renderLi()
  }

  static addAnagramsToDOM(anagramsJson) {
    anagramsJson.forEach((anagramJson) => {
      const newAnagram = new Anagram(anagramJson)
      newAnagram.addToDOM()
    });

  }
}
