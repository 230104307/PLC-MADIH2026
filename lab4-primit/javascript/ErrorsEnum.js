const prompt=require("prompt-sync")({sigint:true}); 

const Result_enumobj = {
	FP_ROUNDING: "FP_ROUNDING",
	FP_OVERFLOW: "FP_OVERFLOW",
	FP_UNDERFLOW: "FP_UNDERFLOW",
	INT_OVERFLOW: "INT_OVERFLOW"
}

const Error_enumobj = {
    A_BIT_DIFFERENT: "A_BIT_DIFFERENT", 
    INFINITY: "INFINITY", 
    ZERO: "ZERO", 
    VERY_DIFFERENT: "VERY_DIFFERENT"
}

function error2Result(err){
    switch (err) {
	case Result_enumobj.FP_ROUNDING:
	 return Error_enumobj.A_BIT_DIFFERENT;
	break;
	case Result_enumobj.FP_OVERFLOW:
	    return Error_enumobj.INFINITY;
	break;
	case Result_enumobj.FP_UNDERFLOW:
	    return Error_enumobj.ZERO;
	break;
	case Result_enumobj.INT_OVERFLOW:
	    return Error_enumobj.VERY_DIFFERENT;
	break;
	default:
		return 'Invalid Error value';
}

}

console.log('Error list: ', Object.values(Error_enumobj));
var validArg = false;
while(!validArg){
    var input = prompt("Input: ");
    let result = error2Result(input);
    if (Object.values(Result_enumobj).includes(result)){
        validArg = true;
		console.log(input + " results in " + error2Result(input));
    }
    else{
        console.log(result);
    }
}
