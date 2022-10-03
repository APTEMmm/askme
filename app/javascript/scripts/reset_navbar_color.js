document.addEventListener('turbolinks:load', () => {
  const resetLink = document.getElementById('reset_navbar_color')
  if (!resetLink) return
  resetLink.addEventListener('click', (event) => {
    event.preventDefault()
    const colorInput = document.getElementById('user_navbar_color')
    colorInput.value = colorInput.dataset.defaultNavbarColor
  })
})
