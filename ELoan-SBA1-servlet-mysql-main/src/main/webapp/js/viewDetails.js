function viewInfo(evt, detailsType) {

  var i, tabcontent, tablinks;

  tabcontent = document.getElementsByClassName("tabcontent");
  for (i = 0; i < tabcontent.length; i++) {
    tabcontent[i].style.display = "none";
  }

  tablinks = document.getElementsByClassName("tablinks");
  for (i = 0; i < tablinks.length; i++) {
    tablinks[i].className = tablinks[i].className.replace(" active", "");
  }

  document.getElementById(detailsType).style.display = "block";
  evt.currentTarget.className += " active";
}

function toggleButton(evt, elementID) {
	  var element = document.getElementById(elementID);
	  
	  if (element.style.display === "none") {
		  element.style.display = "block";
	  } else {
		  element.style.display = "none";
	  }
}




function IsMobileNumber(txtMobId) {
    var mob = /^[1-9]{1}[0-9]{9}$/;
    var txtMobile = document.getElementById(txtMobId);
    if (mob.test(txtMobile.value) == false) {
        alert("Please enter valid mobile number.");
        txtMobile.focus();
        return false;
    }
    return true;
}


