extends Resource
class_name GDQuest

enum statuses {UNKNOWN, KNOWN, ACCEPTED, ACHIEVED, COMPLETED, BOTCHED, FAILED}
var status: statuses = statuses.UNKNOWN

# Statuses for quests are explained below...
# UNKNOWN & KNOWN are if you have heard about the quest or never heard of it. 
# ACCEPTED 	are quested you have taken but not completed. 
# ACHIEVED 	are quests you have completed but not turned in. 
# COMPLETED are quests you have accepted, achieved and then finished compeltely. 
# BOTCHED 	are quests you have (for now) fucked up. You can always fix this somehow. 
# FAILED 	are quests that have failed completely and are uncompletable. 

var is_compeleted	: bool = false # first:  when completed, all else is ignored. 
var is_failed		: bool = false # second: when failed,    all else is ignored except 1st.
var is_botched		: bool = false # third:  when botched,   all else is ignored except 1st and 2nd.

func known(): 		status = statuses.KNOWN
func accept(): 		status = statuses.ACCEPTED
func achieve():		status = statuses.ACHIEVED

func fail():		is_failed 		= true
func botch(): 		is_botched 		= true
func unbotch(): 	is_botched 		= false
func complete(): 	is_compeleted 	= true

func get_status():
	if is_compeleted:
		return statuses.COMPLETED
	elif is_failed:
		return statuses.FAILED
	elif is_botched:
		return statuses.BOTCHED
	else:
		return status
	pass
