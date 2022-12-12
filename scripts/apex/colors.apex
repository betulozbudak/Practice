List<string> coloursList = new List<String>();

coloursList.add('mavi');
coloursList.add('kirmizi');
coloursList.add('beyaz');
coloursList.add('siyah');
coloursList.add('mor');
system.debug('Renkler-->'+ coloursList);
integer colorSize = coloursList.size();
system.debug('Eleman sayisi '+ colorSize);
Boolean checkcolor = coloursList.contains('Red');
system.debug('Red var mi? ' + checkcolor);
string getLast = coloursList.get(colorSize-1).toUpperCase();
system.debug(getLast);
string getFourth = coloursList.get(3).toUpperCase();
system.debug(getFourth);

List<string> colourCodesList = new List<string>();

colorCodesList.add('#0000FF');
colorCodesList.add('#FF0000');
colorCodesList.add('#FFFFFF');
colorCodesList.add('#000000');
colourCodesList.add('#800080');

boolean isEqualList = 






