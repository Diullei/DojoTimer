proxy = (fn, $this) ->
  -> fn.apply $this, arguments

class TimerControl
  constructor: ->
    @currentsec = 59
    @currentmin = 5
    @currentmil = 9

    @strsec = "00"
    @strmin = "00"
    @strmil = "00"

    document.getElementById('reset').onclick = proxy @reset, @

  start: ->
    @currentmil -= 1

    if @currentmil == -1
      @currentmil = 9
      @currentsec -= 1

    if @currentsec == -1
      @currentsec = 59
      @currentmin -= 1

    @strsec = "" + @currentsec
    @strmin = "" + @currentmin
    @strmil = "" + @currentmil

    if @strsec.length != 2
      @strsec = "0" + @currentsec
    if @strmin.length != 2
      @strmin = "0" + @currentmin

    document.getElementById('seconds').innerHTML = @strsec;
    document.getElementById('minutes').innerHTML = @strmin;
    document.getElementById('milsecs').innerHTML = "0" + @strmil;

    if @currentsec == 0 && @currentmin == 0 && @currentmil == 0 
      chrome.app.window.focus()
      return

    setTimeout proxy(@start, @), 100
    null

  reset: ->
    @currentsec = 59
    @currentmin = 5
    @currentmil = 9
    @strsec = "00"
    @strmin = "00"
    @strmil = "00"
    setTimeout proxy(@start, @), 100
    null

control = new TimerControl
control.start()
