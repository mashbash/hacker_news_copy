$(document).ready(function(){
  $(".post:submit").click(function(e){ // AA: instead of being so specific, can pull the form
    e.preventDefault();
    $.ajax({
      type:"post", //can be get or post
      url:"/posts/vote", //go to this url
      data: {post_id: $(this).siblings().val()}, //data sent to the controller/server //AA: if pull form, can do serialize data instead of having to do this
      dataType: "json" //expecting to receive data in json format from the controller/server
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

//reason why error doesn't work is because the controller is not throwing up an error that ajax recognizes. If you want
//to use save to trigger the error, have to use save! but we don't want to do that because it stops everything.
//so in the controller put an if else statement just send the data that we want to show depending on whether it is
//a success or an error according to how we expect it to be and just make those messages appear in the success
//function in ajax
