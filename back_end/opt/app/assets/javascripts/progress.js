function Progress(){
}

Progress.prototype.updatePercentage = function(){
	this.currentProgressPercent = ((this.currentProgressValue * 100.0)/this.maxProgressValue);
}

Progress.prototype.getProgressPercent = function(){
	return this.currentProgressPercent;
}

Progress.prototype.init = function( maxProgressValue, initialProgressValue){
	
	var defaultMax = 100;
	var defaultCurrent = 0;

	if ( typeof maxProgressValue != 'number' ) {
		this.maxProgressValue = defaultMax;
	}
	else {
		if ( maxProgressValue <= 0 ){
				this.maxProgressValue = defaultMax;		
		}
		else {
			this.maxProgressValue = maxProgressValue;
		}
	}
	
	if ( typeof initialProgressValue != 'number' ) {
		this.currentProgressValue = defaultCurrent;
	}
	else {
		if ( (initialProgressValue < 0) || (initialProgressValue > this.maxProgressValue) ) {
			this.currentProgressValue = defaultCurrent;
		}
		else {
			this.currentProgressValue = initialProgressValue;
		}
	}
	this.updatePercentage();
};

Progress.prototype.increment = function(incrementValue){
	if ( incrementValue < 0 )
		return;
	if ( (this.currentProgressValue + incrementValue) < this.maxProgressValue ) {
		this.currentProgressValue = this.maxProgressValue
	}
	else {
		this.currentProgressValue = this.currentProgressValue + incrementValue;
	}
	this.updatePercentage();
}

