$(document).ready(function(){
  $(".post:submit").click(function(e){
    e.preventDefault();
    $.ajax({
      type:"post", //can be get or post
      url:"/posts/vote", //go to this url
      data: {post_id: $(this).siblings().val()}, //data sent to the controller
      dataType: "json" //expects to receive json data as response from controller
    }).success(function(response) { 
      console.log(response);
      var post_id = response.post_id;
      $('#' + post_id).val(response.post_count);
    }).error(function(response) { 
      console.log(response);
      var error = response.message
      alert(error); //not popping up BUGBUG
    });
  });
});

//do commentvotes next
