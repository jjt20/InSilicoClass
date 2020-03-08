NEURON {
	SUFFIX Na_Ch
	USEION na READ ena WRITE ina
	RANGE gNa_Sbar, gNa_S, mInf, mTau, hInf, hTau, ena
}

STATE {
	m h
}

ASSIGNED {
	ina 	(mA/cm2)
	ena
	na
	gNa_S
	gNa_Sbar
	mInf
	hInf
	mTau
	hTau
	v
	mAlpha
	mBeta
}


BREAKPOINT {
	SOLVE states METHOD cnexp
	gNa_S = gNa_Sbar*m*m*m*h
	ina = gNa_S*(v-ena)
}


DERIVATIVE states {   
	rates()
	m' = (mInf-m)/mTau
	h' = (hInf-h)/hTau
}

INITIAL {
	rates()
	m = mInf
	h = hInf
}

PROCEDURE rates(){
    UNITSOFF
        if(v == -25.0){
            v = v + 0.000001
        }
        mAlpha = (0.182 * ((v-10)- -35))/(1-(exp(-((v-10)- -35)/9)))
        if(v == -25.0){
            v = v + 0.000001
        }
        mBeta = (0.124 * (-(v-10)- 35))/(1-(exp(-(-(v-10) - 35)/9)))
        mInf = mAlpha/(mAlpha + mBeta)
        mTau = 1/(mAlpha + mBeta)
        hInf = 1.0/(1 + exp((v - -65 - 10)/6.2))
        if(v == -40.0){
            v = v + 0.000001
        }
        hTau = 1/((0.024 * ((v-10)- -50))/(1 - (exp(-((v - 10)- -50)/5)))+(0.0091 * (-(v-10)- 75.000123))/(1-(exp(-(-(v-10) - 75.000123)/5))))
    UNITSON
}









