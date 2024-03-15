document.addEventListener('turbolinks:load', function() {
  const progressBar = document.querySelector('.progress-bar');

  if (progressBar) { 
    dataProgressFill = progressBar.getAttribute('data-progress-fill')
    dataQuestionIndex = progressBar.getAttribute('data-question-index')
    progress = dataProgressFill * dataQuestionIndex
  
    updateProgressBar(progressBar, progress)
  };
});

function updateProgressBar(progressBar, value) {
  progressBar.querySelector(".progress-fill").style.width = `${value}%`;
  progressBar.querySelector(".progress-text").textContent = `${value}%`;
}
