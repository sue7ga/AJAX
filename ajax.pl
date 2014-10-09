use strict;
use warnings;

use Mojolicious::Lite;
use Data::Dumper;

get '/' => sub{
 my $self = shift;
 $self->render('index');
};

get '/hoge' => sub{
 my $self = shift;
 my $params = $self->req->params->to_hash;
 print Dumper $params;
 $self->render(json => $params->{name});
};

app->start;

__DATA__

@@ index.html.ep

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js" type="text/javascript">
</script>
 </head>
 <body>

 <form id="form">   
    <input type="text" size="40" name="q"/>
    <input type="submit" value="submit">
 </form>

 <script type="text/javascript">
  $(document).ready(function(){
   $('#form').submit(function(){
     $.ajax({
      type:'GET',
      url:'http://localhost:3000/hoge',
      dataType:'json',
      data: {name:"John",location:"hogehoge"},
      success: function(json){
             alert(json);
      },
      error: function(){
          alert('error');
      }
    });
   });
  });
 </script>
 
</body>
</html>














