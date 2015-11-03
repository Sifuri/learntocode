$(document).ready(function(){

var e  = $('.event');
for (var i =0; i< 29; i++) {
  e.parent().append(e.clone());
}

(function(){
  var all_options = {
  distance: [1, 2, 5, 8, 10, 15, 20],
  location: ['Brooklyn, NY', 'NYC, NY', 'Queens, NY', 'Bronx, NY']
};

var mySelects = new MySelect(all_options);


function MySelect(options) {
  this._eles = $('.mySelect');
  this.elements = [];
  var eles = this.elements;
  this._eles.each(function(){
    eles.push( _selectEles($(this)) );
  });
  for (var k in options) {
      var opt = options[k];
      opt
  }
}

function _selectEles($ele) {
  return {
    ele : $ele,
    menu: null,
    items: null,
    current: 0,
    current_ele: null
  }
}
  
})();
});