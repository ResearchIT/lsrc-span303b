//Add sound

function setSound() {

	this.pronunciation_mc = this.createEmptyMovieClip("soundClip",2);

	this.mySound = new Sound(this.pronunciation_mc);

	this.mySound.loadSound(pronunciation, false);

	this.intervalId = setInterval(this, "checkSoundLoad", 500, this.mySound, "doSetSound");

	

}



function checkSoundLoad(subject, callback) {

	var bytesLoaded = subject.getBytesLoaded();

	var bytesTotal = subject.getBytesTotal();

	var perc = bytesLoaded / bytesTotal;

	if(perc >=1) {

		this[callback]();

		clearInterval(this.intervalId);

	}

}

function doSetSound(percent) {

	var dur = this.mySound.duration;

	var newLoc = Math.floor(dur * (percent * .01) );

	var sec = Math.floor(newLoc * .001);

	test.text = dur;

	this.mySound.stop();

	this.mySound.start(sec);

}



//HIDE OR SHOW VIDEO BUTTON AND MENU



if (isvideo01 == 1 || isvideo02 == 1 || isvideo03 == 1) {

	this.menu_mc.movie_btn._visible = true;

	

} else {

	this.menu_mc.movie_btn._visible = false;

	

};



if (isvideo01 == 0) {

	this.movie_mc.btn_one._visible = false;	

};

if (isvideo02 == 0) {

	this.movie_mc.btn_two._visible = false;	

};

if (isvideo03 == 0) {

	this.movie_mc.btn_three._visible = false;	

};



//FUNCTIONS

showPicture = function(){

stopAllSounds();

this.picture_mc._visible = true;

this.movie_mc._visible = false;

this.sound_mc.enabled = false;

this.sound_mc._visible = false;

this.synonym_mc._visible = false;

this.translation_mc._visible = false;



};



showMovie = function(){

stopAllSounds();

this.picture_mc._visible = false;

this.movie_mc._visible = true;

this.sound_mc.enabled = false;

this.sound_mc._visible = false;

this.synonym_mc._visible = false;

this.translation_mc._visible = false;



//

};



showSound = function(){

stopAllSounds();

this.picture_mc._visible = false;

this.movie_mc._visible = false;

this.sound_mc.enabled = true;

this.sound_mc._visible = true;

this.synonym_mc._visible = false;

this.translation_mc._visible = false;



//

};



showSyn = function(){

stopAllSounds();

this.picture_mc._visible = false;

this.movie_mc._visible = false;

this.sound_mc.enabled = false;

this.sound_mc._visible = false;

this.synonym_mc._visible = true;

this.translation_mc._visible = false;



//

};



showTrans = function(){

stopAllSounds();

this.picture_mc._visible = false;

this.movie_mc._visible = false;

this.sound_mc.enabled = false;

this.sound_mc._visible = false;

this.synonym_mc._visible = false;

this.translation_mc._visible = true;



//

};



markPicture = function() {

this.menu_mc.pictureon_mc._visible = true;

this.menu_mc.soundon_mc._visible = false;

this.menu_mc.movieon_mc._visible = false;

this.menu_mc.synonymon_mc._visible = false;

this.menu_mc.tanslationon_mc._visible = false;

};

markSound = function() {

this.menu_mc.pictureon_mc._visible = false;

this.menu_mc.soundon_mc._visible = true;

this.menu_mc.movieon_mc._visible = false;

this.menu_mc.synonymon_mc._visible = false;

this.menu_mc.tanslationon_mc._visible = false;

};

markMovie = function() {

this.menu_mc.pictureon_mc._visible = false;

this.menu_mc.soundon_mc._visible = false;

this.menu_mc.movieon_mc._visible = true;

this.menu_mc.synonymon_mc._visible = false;

this.menu_mc.tanslationon_mc._visible = false;

};

markSyn = function() {

this.menu_mc.pictureon_mc._visible = false;

this.menu_mc.soundon_mc._visible = false;

this.menu_mc.movieon_mc._visible = false;

this.menu_mc.synonymon_mc._visible = true;

this.menu_mc.tanslationon_mc._visible = false;

};

markTrans = function() {

this.menu_mc.pictureon_mc._visible = false;

this.menu_mc.soundon_mc._visible = false;

this.menu_mc.movieon_mc._visible = false;

this.menu_mc.synonymon_mc._visible = false;

this.menu_mc.tanslationon_mc._visible = true;

};





//

markPicture();

showPicture();





this.menu_mc.picture_btn.onRelease = function(){

showPicture();

markPicture();

};







this.menu_mc.sound_btn.onRelease = function(){

showSound();

markSound();

setSound();

//test.text = "clicked it";

};





this.menu_mc.synonym_btn.onRelease = function(){

showSyn();

markSyn();

};



this.menu_mc.translation_btn.onRelease = function(){

showTrans();

markTrans();

};





this.menu_mc.movie_btn.onRelease = function(){

showMovie();

markMovie();

  

};



//Actionscript code

System.security.allowDomain("http://www.youtube.com");

System.security.loadPolicyFile("http://www.youtube.com/crossdomain.xml");



this.createEmptyMovieClip("container",this.getNextHighestDepth());

container.createEmptyMovieClip("subcontainer",this.getNextHighestDepth());





_root._lockroot = true;

_root.container._lockroot = true;

_root.container.subcontainer._lockroot = true;

var mclListener:Object = new Object();



mclListener.onLoadStart = function(target_mc:MovieClip) {

        target_mc.startTimer = getTimer();

};



mclListener.onLoadComplete = function(target_mc:MovieClip) {

        target_mc.completeTimer = getTimer();

};



mclListener.onLoadInit = function(target_mc:MovieClip) {

        var timerMS:Number = target_mc.completeTimer-target_mc.startTimer;

        //trace("loaded in "+timerMS+" ms.");

};



var video_mcl:MovieClipLoader = new MovieClipLoader();

video_mcl.addListener(mclListener);







//waits till some content has been loaded





//scaling for youtube



//scaling for youtube

		movie_mc.loadYoutube01_mc._xscale = 40;

		movie_mc.loadYoutube01_mc._yscale = 40;

		movie_mc.loadYoutube02_mc._xscale = 40; 

		movie_mc.loadYoutube02_mc._yscale = 40;

		movie_mc.loadYoutube03_mc._xscale = 40; 

		movie_mc.loadYoutube03_mc._yscale = 40;

test.text = movie_mc.loadYoutube03_mc._xscale+" "+movie_mc._xscale+" "+_root._xscale;



this.movie_mc.btn_one.onPress = function() {

        //when you unload the movie, sounds remains playing, so we need this line

        stopAllSounds();

        //without this line the other video keeps playing

		_root._xscale=100;

		_root._yscale=100;

        video_mcl.unloadClip(movie_mc.loadYoutube02_mc);

		video_mcl.unloadClip(movie_mc.loadYoutube03_mc);

		showOne();

        //your video address

		

        full_address = "http://www.youtube.com/v/" + myvideo01;

        //ready to load

        video_mcl.loadClip(full_address, movie_mc.loadYoutube01_mc);



		test.text = movie_mc.loadYoutube03_mc._xscale+" "+movie_mc._xscale+" "+_root._xscale;

		

		//trace(video_mcl.loadClip(full_address, loadYoutube01_mc));



}



this.movie_mc.btn_two.onPress = function() {

        //when you unload the movie, sounds remains playing, so we need thisline

        stopAllSounds();

        //without this line the other video keeps playing  

		

		_root._xscale=90;

		_root._yscale=90;

        video_mcl.unloadClip(movie_mc.loadYoutube01_mc);

		video_mcl.unloadClip(movie_mc.loadYoutube03_mc);

		showTwo();

        //your video address

        full_address = "http://www.youtube.com/v/" + myvideo02;

        //ready to load

       video_mcl.loadClip(full_address, movie_mc.loadYoutube02_mc);

		test.text = movie_mc.loadYoutube03_mc._xscale+" "+movie_mc._xscale+" "+_root._xscale;

		//trace(video_mcl.loadClip(full_address, loadYoutube02_mc));

}



this.movie_mc.btn_three.onPress = function() {

        //when you unload the movie, sounds remains playing, so we need thisline

        stopAllSounds();

        //without this line the other video keeps playing

		

		_root._xscale=90;

		_root._yscale=90;

        video_mcl.unloadClip(movie_mc.loadYoutube01_mc);

		video_mcl.unloadClip(movie_mc.loadYoutube02_mc);

		showThree();

        //your video address

        full_address = "http://www.youtube.com/v/" + myvideo03;

        //ready to load

        video_mcl.loadClip(full_address, movie_mc.loadYoutube03_mc);

			test.text = movie_mc.loadYoutube03_mc._xscale+" "+movie_mc._xscale+" "+_root._xscale;

		//trace(video_mcl.loadClip(full_address, container.subcontainer));

}



showOne = function(){

	movie_mc.loadYoutube01_mc._visible = true;

	movie_mc.loadYoutube02_mc._visible = false;

	movie_mc.loadYoutube03_mc._visible = false;

}

showTwo = function(){

	movie_mc.loadYoutube01_mc._visible = false;

	movie_mc.loadYoutube02_mc._visible = true;

	movie_mc.loadYoutube03_mc._visible = false;

}



showThree = function(){

	movie_mc.loadYoutube01_mc._visible = false;

	movie_mc.loadYoutube02_mc._visible = false;

	movie_mc.loadYoutube03_mc._visible = true;

}



