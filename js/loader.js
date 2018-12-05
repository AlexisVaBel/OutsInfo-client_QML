function getMainByModuleApi01(request,objMapper,idx) {
    var doc = new XMLHttpRequest();
    doc.onreadystatechange = function() {
        if (doc.readyState === XMLHttpRequest.HEADERS_RECEIVED) {
        } else if (doc.readyState === XMLHttpRequest.DONE) {
            var jsonObj = JSON.parse(doc.responseText);
            objMapper.setProperty(idx,"wes",jsonObj.wes);
        }
    }
    doc.open("GET",request);
    doc.responseType = 'json';
    doc.send();
}


function getModulesListApi01(request,objMapper){
    var doc = new XMLHttpRequest();
    doc.onreadystatechange = function() {
        if (doc.readyState === XMLHttpRequest.HEADERS_RECEIVED) {
            objMapper.clear();
        } else if (doc.readyState === XMLHttpRequest.DONE) {
            var jsonObj = JSON.parse(doc.responseText);
            for(var j=0; j < jsonObj.length; j++){
                //update json modele for current purpose
                jsonObj[j]["wes"]=0;
                objMapper.append(jsonObj[j]);
                console.log(jsonObj[j].name)
                console.log(jsonObj[j].idm)
            }
        }
    }
    doc.open("GET",request);
    doc.responseType = 'json';
    doc.send();
}

