# SPDX-FileCopyrightText: 2021 ladyada for Adafruit Industries
# SPDX-License-Identifier: MIT

"""Maps acceleration (tilt) to Neopixel colors.

x, y, and z acceleration components map to red, green and blue,
respectively.

When the Circuit Playground is level, the lights are blue because there is no acceleration
on x or y, but on z, gravity pulls at 9.81 meters per second per second (m/s²).
When banking, the vertical (z) axis is no longer directly aligned with gravity,
so the blue decreases, and red increases because gravity is now pulling more
along the x axis. Similarly, when changing the pitch from level, we see blue change
to green.

This video walks you through the code: https://youtu.be/eNpPLbYx-iA
"""

import time
from adafruit_circuitplayground import cp
import json

def color_amount(accel_component):
    """Convert acceleration component (x, y, or z) to color amount (r, g, or b)"""
    standard_gravity = 9.81  # Acceleration (m/s²) due to gravity at the earth’s surface
    accel_magnitude = abs(accel_component)  # Ignore the direction
    constrained_accel = min(accel_magnitude, standard_gravity)  # Constrain values
    normalized_accel = constrained_accel / standard_gravity  # Convert to 0–1
    return round(normalized_accel * 255)  # Convert to 0–255

class NodeSubSensor():
    def __init__(self, brightness = 0.2):
        self.sensor = cp
        self.sensor.pixels.brightness = brightness
        self.previous_state = {}
        self.current_state = {}

    def get_state(self):
        self.previous_state = self.current_state
        self.current_state["temperature"]=self.sensor.temperature
        x, y, z = self.sensor.acceleration
        self.current_state["x_acceleration"]= x
        self.current_state["y_acceleration"]= y
        self.current_state["z_acceleration"]= z
        self.current_state["light_level"] = self.sensor.light
        self.current_state["sound_level"] = self.sensor.sound_level
        self.current_state["touch_a1"] = self.sensor.touch_A1
        self.current_state["touch_a2"] = self.sensor.touch_A2
        self.current_state["touch_a3"] = self.sensor.touch_A3
        self.current_state["touch_a4"] = self.sensor.touch_A4
        self.current_state["button_a"] = self.sensor.button_a
        self.current_state["button_b"] = self.sensor.button_b
        self.current_state["brightness"] = self.sensor.light

    def set_all(self,rgb_list):
        self.sensor.pixels.fill(rgb_list)

    def respond(self):
        if self.current_state["sound_level"]<200:
            #pass
            rgb_list = [color_amount(component) for component in self.sensor.acceleration]
        else:
            rgb_list = [0,0,0]
        rgb_list = [0,0,0]
        self.set_all(rgb_list)
        touch_list = [self.current_state["touch_a{0}".format(i+1)] for i in range(4)]
        if True in touch_list:
            sensor_touched = touch_list.index(True)
            #self.sensor.play_tone(2000*sensor_touched,.1)
            rgb_list = [0,0,0]
            self.set_all(rgb_list)

       # if self.current_state["button_a"]:
        #    self.sensor.play_mp3("queen-another-one-bites-the-dust-official-video_MGqfDaJn.mp3")
        if self.current_state["light_level"]-self.previous_state["light_level"]>10:
            self.sensor.pixels.brightness = self.previous_state["brightness"]-.1
        if self.current_state["temperature"]-self.previous_state["temperature"]>.01:
            self.sensor.pixels.brightness = self.previous_state["brightness"]+.1

    def __str__(self):
        return json.dumps(self.current_state)

    def log_values(self):
        self.get_state()
        print(self)
sensor = NodeSubSensor()
        
while True:
    sensor.log_values()
    sensor.respond()
    time.sleep(1)

