$(document).ready(function(){
  (function() {
  var msg = $('.circle .msg');
  var texts = ['Learn', 'Code', 'Connect', 'Discover'];
  var speed = 70;
  var delay = 1000;
  var finish_delay = 2000;
  var repeat = true;
  iterate(texts);

  function iterate(texts) {
    var i = 0,
      size = texts.length,
      real_delay, real_finish_delay;
    real_delay = delay || 10;
    real_finish_delay = finish_delay || 1000;
    addText(texts[i], next);

    function next() {
      i++;
      if (i < size) {
        setTimeout(function() {
          addText(texts[i], next);
        }, real_delay);
      } else if (repeat) {
        setTimeout(function() {
          i = -1;
          next();
        }, real_finish_delay);
      }
    }
  }

  function addText(text, cb) {
    var i = 0;
    cb = cb || function() {};
    tick();

    function tick() {
      if (i > text.length) {
        cb();
      } else {
        setTimeout(function() {
          addMore(i++);
        }, speed);
      }
    }

    function addMore(i) {
      msg.text(text.substr(0, i));
      tick();
    }
  }

})();
})