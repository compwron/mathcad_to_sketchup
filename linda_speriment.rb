require 'sketchup.rb'
# require 'hpricot'

Sketchup.send_action "showRubyPanel:"

# get data from xml file?
  # doc = open("http://redhanded.hobix.com/index.xml") do |f|
    # Hpricot.XML(f)
  # end

UI.menu("PlugIns").add_item("linda-speriment") {
  stairs
  circle
}

def circle
  centerpoint = Geom::Point3d.new
 # Create a circle perpendicular to the normal or Z axis
 vector = Geom::Vector3d.new 0,0,1
 vector2 = vector.normalize!
 model = Sketchup.active_model
 entities = model.active_entities
 edges = entities.add_circle centerpoint, vector2, 10
end

def stairs

  

  # Create some variables.
  stairs = 10
  rise = 8
  run = 12
  width = 100
  thickness = 3
  # wall = { }

  # Get handles to our model and the Entities collection it contains.
  model = Sketchup.active_model
  entities = model.entities

  # Loop across the same code several times
  for step in 1..stairs
    
    # Calculate our stair corners.
    x1 = 0
    x2 = width
    y1 = run * step
    y2 = run * (step + 1)
    z = rise * step
    
    # Create a series of "points", each a 3-item array containing x, y, and z.
    pt1 = [x1, y1, z]
    pt2 = [x2, y1, z]
    pt3 = [x2, y2, z]
    pt4 = [x1, y2, z]

    # Call methods on the Entities collection to draw stuff.
    new_face = entities.add_face pt1, pt2, pt3, pt4
    new_face.pushpull thickness
  end

end