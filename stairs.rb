# First we pull in the standard API hooks.
require 'sketchup.rb'

# Show the Ruby Console at startup so we can
# see any programming errors we may make.
# Sketchup.send_action "showRubyPanel:"

# Add a menu item to launch our plugin.
UI.menu("PlugIns").add_item("Draw stairs") {
  # UI.messagebox("I'm about to draw stairs!") 

  # Call our new method.
  draw_stairs
}

def draw_stairs

  # Create some variables.
  stairs = 10
  rise = 0
  run = 12
  width = 100
  thickness = 3

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