# xserver-sixel-image

## Usage

```sh
git clone https://github.com/keke1008/xserver-sixel-image.git --depth 1
cd xserver-sixel-image
docker build -t xserver-sixel-image .
docker run -it --rm --network host --env DISPLAY=:1 --env SCREEN=1920x1080 xserver-sixel-image

# In other terminal
DISPLAY=:1 chromium
```

## Troubleshooting

### The window is only partially displayed

The cause is unknown, but starting Chromium, maximizing it with F11, and restarting the container may solve the problem.

## See also

- [xserver-sixel](https://github.com/saitoha/xserver-SIXEL/tree/sixel) - xserver with SIXEL support
