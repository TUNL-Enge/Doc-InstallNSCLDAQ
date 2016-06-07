set thresholds 7
for {set i 0} {$i < 32} {incr i} {
    lappend thrlist $thresholds
}

adc create adc1     0xA1000000
adc config adc1    -geo 15  
adc config adc1    -supressrange true
adc config adc1    -ipl 0 -vector 0
adc config adc1    -thresholds $thrlist
#adc config adc1    -multievent false
adc config adc1 -timescale 400

set athresholds 10
for {set i 0} {$i < 30} {incr i} {
    lappend athrlist $athresholds
}
set athresholds 1
for {set i 30} {$i < 32} {incr i} {
    lappend athrlist $athresholds
}

adc create adc2    0xb6000000
adc config adc2    -geo 16 
adc config adc2    -supressrange true
adc config adc2    -ipl 0 
adc config adc2    -vector 0
adc config adc2    -thresholds $athrlist
#adc config adc2    -multievent false

caenchain create chain
caenchain config chain -base 0x10000000 -modules [list adc2 adc1]

stack create events
stack config events -trigger nim1 -modules [list chain ] -delay 28
#stack config events -trigger nim1   -modules [list adc1] -delay 30

set adcChannels(adc1) "HPGE1_T HPGE2_T HPGE3_T HPGE4_T \
BTDC_02 SI1_T SI2_T BTDC_03 \
BRILLIANCE1_T BRILLIANCE2_T BTDC_04 BTDC_06 \
BTDC_07 BTDC_08 SI5_T SI6_T \
BTDC_12 BTDC_14 BTDC_15 BTDC_16  \
BTDC_19 BTDC_20 BTDC_23  BTDC_24 \  
COIN12 COIN13 COIN14 COIN23  \
COIN24 COIN34 BTDC_31 BTDC_32"


set adcChannels(adc2) "HPGE1 BA_02 HPGE2 BA_04 \
HPGE3 BA_06 HPGE4 BA_08 \
SI1 BA_10 SI2 BA_12 \
SI5 BA_14 SI6 BA_16 \
HPGE3_PILEUP BA_18 HPGE4_PILEUP BA_20 \
SI1_PILEUP BA_22 SI2_PILEUP BA_24 \
BRILLIANCE1 BA_26 BRILLIANCE2 BA_28 \
BA_29 BA_30 BA_31 BA_32 "

sis3820    create scaler2 0x38000000

set scalers [list scaler2]
stack create scalers
stack config scalers -trigger scaler -modules $scalers -period 2

set scalerChannels(scaler2) \
        "MG MG.Live Clock Clock.Busy \
HPGE1 HPGE2 HPGE3 HPGE4 \
SI1 SI2 SI5 BUSY \
Bril1 Bril2 PILEUP_HPGE3  SI6 \
HPGE1or2.Live HPGE3or4.Live SI1or256.Live Bril1or2.Live \
BCI  Target BSCA_23 SI5or6 \
PILEUP_SI2 BSCA_26 BSCA_27 BSCA_28 \
HPGE1or2 HPGE3or4 SI1or256 Bril1or2 "



