$ ->

  success = (position) -> 
    lat = position.coords.latitude
    lng = position.coords.longitude
    window.location.replace("/trucks?search=#{ lat } #{ lng }")

  error = ->
    alert('oops!')

  on_click_event_function = (e) ->
    navigator.geolocation.getCurrentPosition(success, error)
    e.preventDefault()

  $('#find-nearby-trucks').on 'click', on_click_event_function

class RichMarkerBuilder extends Gmaps.Google.Builders.Marker #inherit from builtin builder
  #override create_marker method
  create_marker: ->
    options = _.extend @marker_options(), @rich_marker_options()
    @serviceObject = new RichMarker options #assign marker to @serviceObject

  rich_marker_options: ->
    marker = document.createElement("div")
    marker.setAttribute 'class', 'yellow'
    marker.innerHTML = @args.name
    { content: marker }

  # override method
  create_infowindow: ->
    return null unless _.isString @args.infowindow

    boxText = document.createElement("div")
    boxText.setAttribute("class", 'yellow') #to customize
    boxText.innerHTML = @args.title
    @infowindow = new InfoBox(@infobox(boxText))

    # add @bind_infowindow() for < 2.1

  infobox: (boxText)->
    content: boxText
    pixelOffset: new google.maps.Size(-140, 0)
    boxStyle:
      width: "280px"

@buildMap = (markers)->
		handler = Gmaps.build 'Google', { builders: { Marker: RichMarkerBuilder} } #dependency injection

		#then standard use
		handler.buildMap { provider: {}, internal: {id: 'map'} }, ->
		  markers = handler.addMarkers(markers)
		  handler.bounds.extendWith(markers)
		  handler.fitMapToBounds()