=begin
# Problem:
A child is playing with a ball on the nth floor of a tall building. The height of this floor, h, is known.

He drops the ball out of the window. The ball bounces (for example), to two-thirds of its height (a bounce of 0.66).

His mother looks out of a window 1.5 meters from the ground.

How many times will the mother see the ball pass in front of her window (including when it's falling and bouncing?

Three conditions must be met for a valid experiment:
Float parameter "h" in meters must be greater than 0
Float parameter "bounce" must be greater than 0 and less than 1
Float parameter "window" must be less than h.
If all three conditions above are fulfilled, return a positive integer, otherwise return -1.

Note:
The ball can only be seen if the height of the rebounding ball is strictly greater than the window parameter.

- Input: 3 floats
  - height, representing the height of the ball's first drop
  - bounce, representing how much of height the ball bounces to on each bounce
  - window, representing the height of the mother's window
- Output: an integer
  - either positive, how many times the mother sees the ball bounce
    - include when the ball falls as well as bounces up (i.e. start at 1)
    - the ball cannot be seen if the height of the bounce is equal to that of the window
  - -1 if the arguments are invalid:
    - height is less than 0
    - bounce is greater than 0 or less than 1
    - window is greater than height

Example:
- h = 3, bounce = 0.66, window = 1.5, result is 3
  - height is greater than window, counter = 1
  - 3 * .66 = 1.98
  - height is still greater than window, counter += 2
  - 1.98 * .66 = 1.30
  - height is less than window, return counter (3)

- h = 3, bounce = 1, window = 1.5, result is -1 
  - bounce is not less than 1, return -1
  (Condition 2) not fulfilled).
  
# Algorithm:
- Return -1 if:
  - height is less than 1
  - bounce is greater than 0 or less than 1
  - window is greater than height
- Set a counter to 1
- Iterate a loop
  - Reassign height to height * bounce
  - break the loop if heigh is less than window
  - increment counter by 2
- Return the counter
=end

def valid_expirament?(height, bounce, window)
  height > 0 && bounce > 0 && bounce < 1 && window < height
end

def bouncingBall(height, bounce, window)
  return -1 unless valid_expirament?(height, bounce, window)
  
  counter = 1
  loop do
    height *= bounce
    break if height <= window
    counter += 2
  end
  
  counter
end

p bouncingBall(3, 0.66, 1.5) == 3
p bouncingBall(30, 0.66, 1.5) == 15
p bouncingBall(30, 0.75, 1.5) == 21
p bouncingBall(30, 0.4, 10) == 3
p bouncingBall(40, 1, 10) == -1
p bouncingBall(-5, 0.66, 1.5) == -1
p bouncingBall(1, 0.66, 0.66) == 1
p bouncingBall(1, 0.66, 1) == -1
