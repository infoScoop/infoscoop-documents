# Auto Update

InfoScoop provides the function to reload automatically the information displaying in Gadget with a fixed interval.

There are two kinds of the interval of the auto update: the interval between the starting times of the turns in which all the Gadgets are updated, and the interval between each Gadget is updated in a turn.


## Starting the Auto Update Turn

Timing to start the auto update turn is based on the auto update interval(default is 10 minutes) which the administrator set, and executed by the following rules.


### Time to Start the First Auto Update Turn

Start when the interval of auto update has passed since infoScoop was displayed.


### Time to Start the Second and Later Auto Update Turns

Start when the interval of auto update has passed since the start time of the last time.

![Auto update]

The start of next turn is cancelled, and the current turn is continued if the operations making the auto update stop(display frame in portal, maximize Gadget...) are done, or the number of Gadget is huge, or one turn was not finished within the setting interval.

Next turn is started just after finishing the current turn.

![Start of the next turn]


<a name="updateDurationInTurn"></a>
## The Updating Interval in One Turn

The targeted Gadgets are updated one by one with 20 seconds interval when the turn of the auto update is started. The order of Gadgets update is not set.

![Updating interval of gadgets]

**Note:** The updating interval of RSS Reader Gadget which is considered the category in the Composite RSS Reader Gadget depends on the browsers. With Firefox, there is not the update interval(Actually, execute according to the simultaneity of the permit connection number). With InternetExplorer 6, the update interval is 0.5 second.

A turn is finished when all the updates are done, and the starting time of the next turn is scheduled.


## The Objects of the Auto Update

The Gadgets that are considered as the objects of the auto update are the Gadgets arranged in the current tab and the Gadgets arranged on the command bar.  
The Gadgets arranged in the current tab include the Gadgets on the fixed area of the current tab and the Gadgets on the personalized area.

The Gadgets that are considered as the objects of the auto update are set by the type of Gadgets by the administrator.


## Stopping and Restarting Auto Update

The auto update is stopped while the following operations are executed.

* Maximize Gadget
* Display frame in portal
* Display the search result

**Note** The maximized Gadget is considered as a single object to be updated, so it is considered as the object of the auto update. The update interval is set by the administrator.

The auto update is restarted when the operations shown above are terminated.


[Auto update]: images/etc/auto-update-1.gif
[Start of the next turn]: images/etc/auto-update-2.gif
[Updating interval of gadgets]: images/etc/auto-update-3.gif
