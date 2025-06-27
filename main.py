import pygame
import random
import sys

pygame.init()  # Init pygame
W, H = 600, 600  # Screen setup

screen = pygame.display.set_mode((W, H))
pygame.display.set_caption("Catch the Falling Blocks")

WHT, BLU, RED, BLK = (255, 255, 255), (0, 200, 255), (255, 0, 0), (0, 0, 0
                                                                   )  # Colors

# Clock and font
clock = pygame.time.Clock()
font = pygame.font.SysFont(None, 36)

# Paddle and block
paddle = pygame.Rect(W // 2 - 60, H - 20, 120, 10)
block = pygame.Rect(random.randint(0, W - 20), 0, 20, 20)
b_speed = 5

score = 0  # Score
lives = 3
blocks = [pygame.Rect(random.randint(0, W - 20), 0, 20, 20)
          for _ in range(2)]  # Start with 2 blocks
lives = 4

# replace the game loop

run = True

while run:
    screen.fill(BLK)
    for e in pygame.event.get():

        if e.type == pygame.QUIT:

            pygame.quit()

            sys.exit()

    # Paddle movement

    keys = pygame.key.get_pressed()

    if keys[pygame.K_LEFT] and paddle.left > 0:

        paddle.move_ip(-8, 0)

    if keys[pygame.K_RIGHT] and paddle.right < W:

        paddle.move_ip(8, 0)

    # Move and process each block

    for block in blocks[:]:  # Use copy of list to modify inside loop

        block.y += b_speed

        # Check for collision with paddle

        if block.colliderect(paddle):

            block.y = 0

            block.x = random.randint(0, W - 20)

            score += 1

            b_speed += 0.1  # Increase speed slightly for challenge

        # Block missed

        elif block.y > H:

            lives -= 1

            blocks.remove(block)

            blocks.append(pygame.Rect(random.randint(0, W - 20), 0, 20,
                                      20))  # Replace with new block

    # Check game over condition

    if lives <= 0:

        game_over = font.render(f"Game Over! Final Score: {score}", True, RED)

        screen.blit(game_over, (W // 2 - 150, H // 2))

        pygame.display.flip()

        pygame.time.wait(3000)

        run = False

    # Draw paddle and blocks

    pygame.draw.rect(screen, WHT, paddle)

    for block in blocks:

        pygame.draw.rect(screen, BLU, block)

    # Display score and lives

    score_text = font.render(f"Score: {score}", True, WHT)

    lives_text = font.render(f"Lives: {lives}", True, RED)

    screen.blit(score_text, (10, 10))

    screen.blit(lives_text, (10, 40))

    pygame.display.flip()

    clock.tick(60)
