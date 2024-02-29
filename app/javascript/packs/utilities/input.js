document.addEventListener('turbolinks:load', function() {
  var control1 = document.getElementById("user_password");
  var control2 = document.getElementById("user_password_confirmation");

  if (control2) { control2.addEventListener('input', function() {
    if (control2.value.trim().length === 0) {
      return (control2.style.backgroundColor = "transparent")
    };
    if (control1.value === control2.value) {
      control2.style.backgroundColor = "LimeGreen"
    } else {
      control2.style.backgroundColor = "Red"
    }})
  };

});
