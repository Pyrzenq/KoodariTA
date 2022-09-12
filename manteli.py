import sys, pygame
pygame.init()

width = 320
height = 240
size = (width, height) # tuple (monikko), immutable (muuttumaton)

speed = [2, 2]
black = (0, 0, 0) # Red, Green, Blue 0...255

screen = pygame.display.set_mode(size)

ball = pygame.image.load("intro_ball.gif")
ballrect = ball.get_rect()

clock = pygame.time.Clock()
while 1:
    for event in pygame.event.get():
        if event.type == pygame.QUIT: sys.exit()

    ballrect = ballrect.move(speed)
    if ballrect.left < 0 or ballrect.right > width:
        speed[0] = -speed[0]
    if ballrect.top < 0 or ballrect.bottom > height:
        speed[1] = -speed[1]

    screen.fill(black)
    screen.blit(ball, ballrect)
    pygame.display.flip()
    clock.tick(60)
    
def iter_num(c, max_n=100):
    n = 0
    z = 0
    while n < max_n:
        z = z**2 + c
        n += 1
        if abs(z) > 2:
            break
        return n
    
    
   