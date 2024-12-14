# xserver-sixel-image

## Usage

```sh
docker build -t xserver-sixel-image .
docker run -it --rm --network host --env DISPLAY=:1 --env SCREEN=1920x1080 xserver-sixel-image

DISPLAY=:1 your-app
```
