# QEMU

```
# Create a disk
qemu-img create mydisk.img 10G

# Boot image with disk as HDD
qemu-system-x86_64 -boot d -cdrom image.iso -m 512 -hda mydisk.img
```