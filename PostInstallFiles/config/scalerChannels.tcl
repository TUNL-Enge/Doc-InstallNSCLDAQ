#
#  Set up the scaler display channels.  
#  The user will have to decide which channels go on which pages
#  and how.
#
#


source ~/config/configFile.tcl
source ~/config/daqconfig.tcl


#
#  At this point we really just care about
#
#   scalers  which is an ordered list of the scalers read out
#   scalerChannels which is an array indexed by scaler name
#                  containing the list of channels in each scaler.
#                  Each scaler is assumed to have 32 channels,
#                  trailing unused channels can be omitted.
##
#
set channelNumber 0

foreach module $scalers {
    if {[array names scalerChannels $module] ne ""} {
	set channelList $scalerChannels($module)
	set offset 0
	foreach name $channelList {
	    if {$name ne ""} {
		channel $name [expr $offset+$channelNumber]
	    }
	    incr offset
	}
    }

    incr channelNumber 32
}

#
#  The user can now set up their scaler pages based on the
#  scaler channels that have been defined.
#
