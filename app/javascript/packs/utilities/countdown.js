document.addEventListener('turbolinks:load', function() {
  
  const countdownTimerItems = document.querySelector('.timer__items');

  if (countdownTimerItems) {
    deadlineDate = countdownTimerItems.getAttribute('data-deadline_date');

    const deadline = new Date(deadlineDate);

    let timerId = null;

    function declensionNum(num, words) {
      return words[(num % 100 > 4 && num % 100 < 20) ? 2 : [2, 0, 1, 1, 1, 2][(num % 10 < 5) ? num % 10 : 5]];
    }

    function countdownTimer() {
      const diff = deadline - new Date();
      if (diff <= 0) {
        clearInterval(timerId);
        alert("Время прохождения теста вышло!");
        return
      }
      const hours = diff > 0 ? Math.floor(diff / 1000 / 60 / 60) % 24 : 0;
      const minutes = diff > 0 ? Math.floor(diff / 1000 / 60) % 60 : 0;
      const seconds = diff > 0 ? Math.floor(diff / 1000) % 60 : 0;
      if ($hours) {$hours.textContent = hours < 10 ? '0' + hours : hours;}
      if ($minutes) {$minutes.textContent = minutes < 10 ? '0' + minutes : minutes;}
      if ($seconds) {$seconds.textContent = seconds < 10 ? '0' + seconds : seconds;}
      if ($hours) {$hours.dataset.title = declensionNum(hours, ['час', 'часа', 'часов']);}
      if ($minutes) {$minutes.dataset.title = declensionNum(minutes, ['минута', 'минуты', 'минут']);}
      if ($seconds) {$seconds.dataset.title = declensionNum(seconds, ['секунда', 'секунды', 'секунд']);}
    }
    const $hours = document.querySelector('.timer__hours');
    const $minutes = document.querySelector('.timer__minutes');
    const $seconds = document.querySelector('.timer__seconds');

    countdownTimer();

    timerId = setInterval(countdownTimer, 1000);
  }

});
