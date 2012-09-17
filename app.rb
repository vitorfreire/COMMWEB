require 'sinatra'

get '/form' do
  
  myHTML = <<-RSTUFF
    <html>
      <head>
      <head>
      <style type="text/css">
.form_style {
	font-family: "Palatino Linotype", "Book Antiqua", Palatino, serif;
	font-size: 14px;
	font-weight: 200;
	font-height: 200;
	font-variant: small-caps;
	text-transform: lowercase;
}
body {
	background-color: #F90;
}
</style>
        <title>Please fill with your informations</title>
      </head>
      <body>
     
<form id="form1" action="http://itp.nyu.edu/~vf483/sinatra/week2/form" method="POST">
  <p>
    <label for="textfield" class="form_style"><span class="form_style">First name</span></label>
    <span class="form_style">
    <input type="text" name="firstname" id="textfield" /> 
    LAST NAME 
    <input type="text" name="lastname" id="lastname" />
  </span></p>
  <p class="form_style">Where are you from? 
    
    <input type="text" name="origin" id="origin" />
  </p>
  <p>
    <label>
      <span class="form_style">
      <input type="radio" name="RadioGroup1" value="male" id="RadioGroup1_0" />
      Male</span></label>
    <span class="form_style"><br />
    <label>
      <input type="radio" name="RadioGroup1" value="female" id="RadioGroup1_1" />
      Female</label>
    <br />
    </span><br />
   <label for="past" class="form_style">write a sentence about something you believed in the past, but not anymore:</label><br>
    <textarea name="past" cols="40" rows="3" class="form_style" id="past"></textarea><br>
    <br>
    <label for="background" class="form_style">What's your work background?</label><br>
    <textarea name="background" cols="50" rows="1" class="form_style" id="background"></textarea>
    
  </p>
  <p class="form_style">How do you see yourself? </p>
  <p>
    <span class="form_style">
    <label>
      <input type="checkbox" name="CheckboxGroup1" value="inventor" id="CheckboxGroup1_0" />
    Inventor</label>
    <br />
    <label>
      <input type="checkbox" name="CheckboxGroup1" value="artist" id="CheckboxGroup1_1" />
      Artist</label>
    <br />
    <label>
      <input type="checkbox" name="CheckboxGroup1" value="changemaker" id="CheckboxGroup1_2" />
      Changemaker</label>
    <br />
    <label>
      <input type="checkbox" name="CheckboxGroup1" value="entrep" id="CheckboxGroup1_3" />
      Entrepreneur</label>
    <br />
    <label>
      <input type="checkbox" name="CheckboxGroup1" value="noneabove" id="CheckboxGroup1_4" />
      None of above</label>
    </span><br />
  </p>
  <p class="form_style">In the timeline of your life how would you describe the point where ITP is?<br>
    <textarea name="itp" cols="55" rows="4" class="form_style" id="itp"></textarea><br>
 <br>
 <input type="submit" value="Submit!"/></p>
  </p>
</form>
<p>&nbsp;</p>
<p>&nbsp;</p>
</body>
    </html>
  RSTUFF
  
  return myHTML

end

post '/form' do
  
  image_url = ""

  if (params[:CheckboxGroup1] == "changemaker")
    image_url = "http://payload34.cargocollective.com/1/5/174648/2986212/IMG_7180.jpg"
  elsif (params[:CheckboxGroup1] == "inventor")
    image_url = "http://payload72.cargocollective.com/1/5/174648/3753204/NucleodoDirceu-TiagoLima-4701.jpg"
  elsif (params[:CheckboxGroup1] == "artist")
    image_url = "http://payload44.cargocollective.com/1/5/174648/3199666/FIAC2010_Para-O-Heroi_TiagoLima-9012.jpg"
  elsif (params[:CheckboxGroup1] == "entrepreneur")
    image_url = "http://payload35.cargocollective.com/1/5/174648/3004106/Bico_Pesquisa-TiagoLima-2382.jpg"
  else
    image_url = "http://upload.wikimedia.org/wikipedia/commons/f/fd/Unclothed_woman_behind_question_mark_sign.jpg"
  end

#// How to make multiple variables inside a value? When gender is checked, there is a way to use He/his and She/her ?

sex_gender = ""
if (params[:RadioGroup1] == "male")
  sex_gender = "his"
else 
  sex_gender = "her"
end

  myHTML = <<-RSTUFF
    <html>
      <head>
      <style type="text/css">
body,td,th {
	font-family: "Palatino Linotype", "Book Antiqua", Palatino, serif;
	font-size: 16px;
	font-variant: small-caps;
	color: #FC0;
}
body {
	background-color: #333;
}
a:link {
	color: #FFF;
}
a:visited {
	color: #FFF;
}
a:hover {
	color: #666;
}
a:active {
	color: #F90;
}
</style>
        <title>StorYourself</title>
      </head>
  <body>
  <table width="70%" border="0" align="center">
  <tr>
    <td>
This is the story of #{params[:firstname]} #{params[:lastname]}. That's just a intro for #{sex_gender} extraordinary story.<br>
#{params[:firstname]} grew up in #{params[:origin]}. #{params[:past]}. 
But #{sex_gender} track record of great works in #{params[:background]} made #{sex_gender} a true #{params[:CheckboxGroup1]}.<br>
And the urge to make something special in life just popped up. <br>
The desire to blend old and new skills and to be part of an enthusiastic community of people.<br>
#{params[:itp]}
<br>
#{params[:lastname].upcase} is ready to make some difference out there. Be aware.<br>
<br>
<p>
 <img src="#{image_url}"/></p>
</td>
  </tr>
</table>
</body>
    </html>
  RSTUFF
    
  return myHTML

end
