# xserver-sixel-image

## Usage

```sh
docker build -t xserver-sixel-image .
docker run -it --rm --network host --env DISPLAY=:1 --env SCREEN=1920x1080 xserver-sixel-image

DISPLAY=:1 chromium
```

## Troubleshooting

### The window is only partially displayed.

The cause is unknown, but starting Chromium, maximizing it with F11, and restarting the X server will solve the problem.
