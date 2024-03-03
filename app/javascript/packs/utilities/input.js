document.addEventListener('turbolinks:load', function() {
  var control2 = document.getElementById("user_password_confirmation");

  if (control2) { control2.addEventListener('input', passwordConfirmation) }

});

function passwordConfirmation() {
  input1 = document.getElementById("user_password");
  input2 = document.getElementById("user_password_confirmation");

  if (input2.value.trim().length === 0) {
    return (input2.style.backgroundColor = "transparent")
  };

  if (input1.value === input2.value) {
    input2.style.backgroundColor = "LimeGreen"
  } else {
    input2.style.backgroundColor = "Red"
  };
};
