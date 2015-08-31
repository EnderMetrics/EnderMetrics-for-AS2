class EmSet {
	var activityToken='';
	var initTime=0;
	var endTime=0;
	var level=0;
	var hits:Array=null;

	var time=0;
	var result='';


	function setActivityToken(at){
		activityToken=at;
	}

	function getActivityToken(){
		return activityToken;
	}



	function setInitTime(it){
		this.initTime=it;
	}

	function getInitTime(){
		return initTime;
	}


	function setLevel(l){
		level=l;
	}

	function getLevel(){
		return level;
	}


	function getHits(){
		return hits;
	}



	function init(at, l){
		activityToken=at;
		initTime=getTimer();
		level=l;
		hits=new Array();
	}

	function end(r){
		result=r;
		endTime=getTimer();
		time = endTime - initTime;
	}

	function addHit(stoken, r){
		//var someObj:Object = new Object();
		var a:Object = new Object();
		a.skill_token=stoken;
		a.result=r;
		hits.push(a);
	}

	function toJson(){
		var r = '{';
		r=r+'"activity_token":"'+activityToken+'"';
		r=r+', "level":'+level;
		r=r+', "time":'+time;
		r=r+', "result":"'+result+'"';
		r=r+', "hits":[';

		for(var i=0; i < hits.length; i++){
			var h = hits[i];
		    r=r+'{"skill_token":"'+h.skill_token+'", "result":"'+h.result+'"}';
		    if(i<hits.length-1)r=r+',';
		}
		r=r+']';

		r=r+'}';

		return r;
	}


}