
<div class = 'person-container'>
  <h1>{{ person['first_name'] + ' ' + person['last_name'] }}</h1>
  <h2>{{ person['title'] }}</h2>
  <span>{{ person['address'] }}</span>
  <span>{{ person['phone_number'] }}</span>
  <span>{{ person['email'] }}</span>
  <div>
    <h3>Professional Summary</h3>
    <span>{{ person['summary'] }}</span>
  </div>
</div>

<h3>Core Skills:</h3>
<div class = 'skills-container'>
  <ul>
  %for skill in skills:
    <li>
      <span>{{ skill['Name'] }}</span>
      <span class = 'divider'>-<span>
      <span>{{ skill['Description'] }}</span>
    </li>
  %end
  </ul>
</div>

<h3>Professional Experience:</h3>
<div class = 'jobs-container'>
<ul>
%for employer in employers:
  <h4>{{ employer['name'] }}</h4>
  %for position in employer['positions']:
    <div>
      <span>{{ position['name'] }}</span>
      <span>{{ position['start'] }}</span>
      <span>{{ position['end'] }}</span>
      <ul>
      %for highlight in position['highlights']:
        <li>{{ highlight['description'] }}</li>
      %end
    </ul>
    </div>
  %end
%end
</ul>
</div>

%rebase base
