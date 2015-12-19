
<div class = 'person-container'>
  <h1>{{ person['first_name'] + ' ' + person['last_name'] }}</h1>
  <h2>{{ person['title'] }}</h2>
  <span>{{ person['address'] }}</span>
  <span>{{ person['phone_number'] }}</span>
  <span>{{ person['email'] }}</span>
</div>

<h3>Skills:</h3>
<div class = 'skills-container'>
  <ul>
  %for skill in skills:
    <li>
      <span>{{ skill['Name'] }}</span>
      <span>{{ skill['Description'] }}</span>
    </li>
  %end
  </ul>
</div>

<h3>Jobs:</h3>
<div class = 'jobs-container'>
<ul>
%for job in jobs:
  <span>{{ job }}</span>
%end
</ul>
</div>

%rebase base
