NEURON {
	SUFFIX K_Ch
	USEION k READ ek WRITE ik
	RANGE gKv3bar, gKv3, mInf, mTau, ek
}

STATE {
	m
}

ASSIGNED {
	ik	(mA/cm2)
	ek
	k
	gKv3
	gKv3bar
	mInf
	mTau
	v
}

BREAKPOINT {
	SOLVE states METHOD cnexp
	gKv3 = gKv3bar*m
	ik = gKv3*(v-ek)
}


DERIVATIVE states {   
	rates()
	m' = (mInf-m)/mTau
}

INITIAL {
	rates()
	m = mInf
}

PROCEDURE rates(){
    UNITSOFF
        mInf = 1/(1+exp(((v - (18.700))/(-9.700))))
        mTau = 20.000 /(1+exp(((v-(-46.560))/(-44.140))))
    UNITSON
}









