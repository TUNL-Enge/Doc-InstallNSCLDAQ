set athresholds 10
for {set i 0} {$i < 30} {incr i} {
    lappend athrlist $athresholds
}
set athresholds 1
for {set i 30} {$i < 32} {incr i} {
    lappend athrlist $athresholds
}

adc create adc2    0xa1000000
adc config adc2    -geo 16 
adc config adc2    -supressrange true
adc config adc2    -ipl 0 
adc config adc2    -vector 0
adc config adc2    -thresholds $athrlist
#adc config adc2    -multievent false

#caenchain create chain
#caenchain config chain -base 0x10000000 -modules [list adc2 adc1]

#stack create events
#stack config events -trigger nim1 -modules [list chain ] -delay 28
stack config events -trigger nim1   -modules [list adc2] -delay 30


set adcChannels(adc2) "0APEX_01 0APEX_02 HPGE2 BA_04 \
HPGE3 BA_06 HPGE4 BA_08 \
SI1 BA_10 SI2 BA_12 \
SI5 BA_14 SI6 BA_16 \
HPGE3_PILEUP BA_18 HPGE4_PILEUP BA_20 \
SI1_PILEUP BA_22 SI2_PILEUP BA_24 \
BRILLIANCE1 BA_26 BRILLIANCE2 BA_28 \
BA_29 BA_30 BA_31 BA_32 "




