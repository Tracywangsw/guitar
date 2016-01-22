function detectmob() {
  if(window.innerWidth <= 800 && window.innerHeight <= 600) {
    return true;
  }
  else{
     return false;
  }
}

if(detectmob()) window.location="http://m.xianmuyinyue2014.icoc.cc/";