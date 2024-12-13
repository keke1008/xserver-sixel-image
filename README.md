# xserver-sixel-image

## Usage

```sh
docker build -t xserver-sixel-image .
docker run -it --rm --network host --env DISPLAY=:1 xserver-sixel-image

DISPLAY=:1 xterm
```
