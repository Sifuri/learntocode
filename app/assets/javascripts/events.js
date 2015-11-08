// $(document).ready(function(){

// var e  = $('.event');
// for (var i =0; i< 29; i++) {
//   e.parent().append(e.clone());
// }

// (function(){
//   var all_options = {
//   distance: [1, 2, 5, 8, 10, 15, 20],
//   location: ['Brooklyn, NY', 'NYC, NY', 'Queens, NY', 'Bronx, NY']
// };

// var mySelects = new MySelect(all_options);


// function MySelect(options) {
//   this._eles = $('.mySelect');
//   this.elements = [];
//   var eles = this.elements;
//   this._eles.each(function(){
//     eles.push( _selectEles($(this)) );
//   });
//   for (var k in options) {
//       var opt = options[k];
//       opt
//   }
// }

// function _selectEles($ele) {
//   return {
//     ele : $ele,
//     menu: null,
//     items: null,
//     current: 0,
//     current_ele: null
//   }
// }
  
// })();
// });

// $(document).ready(function(){
// 	fakeData('.event');
// fakeData('.room')
// fakeData('.comment');

// function fakeData(ele, n) {
//   var e = $(ele),
//     p = e.parent();
//   var i = n || 3;
//   while (i--) {
//     p.append(e.clone());
//   }
// }

// $("html, body").scrollTop($('.nav_meet').offset().top);


// // Sections code navgiation
// var sects = $('.left .hide');
// var navs = $('.nav_meet li');


// sects.first().removeClass('hide');

// navs.click(function() {
//   $(this).addClass('active').siblings().removeClass('active');
  
//   var show = $(this).attr('data-sect');
//   sects.filter("#" + show).removeClass('hide').siblings().addClass('hide');
// });
// });

// // end


