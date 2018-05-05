using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;
using Toybox.System as Sys;
using Toybox.Lang as Lang;
using Toybox.Time;
using Toybox.Time.Gregorian;

class spacefaceView extends Ui.WatchFace {
	
    function initialize() {
        WatchFace.initialize();
    }

    // Load your resources here
    function onLayout(dc) {
        setLayout(Rez.Layouts.WatchFace(dc));
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() {
    }

    // Update the view
    function onUpdate(dc) {
    	System.println(dc.getWidth());
    	System.println(dc.getHeight());
    	dc.setColor(Gfx.COLOR_BLACK,Gfx.COLOR_BLACK);
		dc.clear();
		var width=dc.getWidth();
		var height=dc.getHeight();
        // Fonts
//        var space_mono_180 = Ui.loadResource(Rez.Fonts.space_mono_180);
//        var space_mono_180_bold = Ui.loadResource(Rez.Fonts.space_mono_180_bold);
//        var space_mono_30 = Ui.loadResource(Rez.Fonts.space_mono_30);
//        var space_mono_rot_40 = Ui.loadResource(Rez.Fonts.space_mono_rot_40);
//        System.println(dc.getTextWidthInPixels("0", space_mono_180));
//        System.println(dc.getTextDimensions("0", space_mono_180));

        var clockTime = Sys.getClockTime();
        var timeString = Lang.format("$1$$2$$3$", [clockTime.hour.format("%02d"), 
        										clockTime.min.format("%02d"), 
        										clockTime.sec.format("%02d")]);
        System.println(timeString);
        var today = new Time.Moment(Time.today().value());
        var dayString = Gregorian.info(today, Time.FORMAT_MEDIUM).day_of_week;
 		var dayArray = dayString.toUpper().toCharArray();
        dayString = Lang.format("$1$\n$2$\n$3$", [dayArray[0], dayArray[1], dayArray[2]]);
        System.println(dayString);
        var h1 = View.findDrawableById("hour1");
        h1.setText(timeString.substring(0,1));
        var h2 = View.findDrawableById("hour2");
        h2.setText(timeString.substring(1,2));
        var m1 = View.findDrawableById("min1");
        m1.setText(timeString.substring(2,3));
        var m3 = View.findDrawableById("min2");
        m3.setText(timeString.substring(3,4));
        var day = View.findDrawableById("day");
        day.setText(dayString); // was at 57
        dc.setPenWidth(1);
        dc.setColor(Gfx.COLOR_WHITE, Gfx.COLOR_BLACK);
        dc.drawLine(width/2, 0, width/2, height);
        dc.drawLine(0, height/2, height,height/2);
        var sec1 = View.findDrawableById("sec1");
        sec1.setText(timeString.substring(4,5));
        var sec2 = View.findDrawableById("sec2");
        sec2.setText(timeString.substring(5,6));
        

        // Call the parent onUpdate function to redraw the layout
        View.onUpdate(dc);
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() {
    }

    // The user has just looked at their watch. Timers and animations may be started here.
    function onExitSleep() {
    }

    // Terminate any active timers and prepare for slow updates.
    function onEnterSleep() {
    }

}
