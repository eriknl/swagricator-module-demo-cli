CC=arm-linux-gnueabihf-gcc
APPLICATION=demo-cli
OUTPUT_DIR=./image
MOUNT_POINT=./mount

.PHONY: clean-application clean-image clean image

all: image

application:
	$(CC) $(CFLAGS) src/demo-cli.c -o $(OUTPUT_DIR)/$(APPLICATION)

image: application
	dd if=/dev/zero of=./module-demo-cli.img bs=1M count=16
	mkfs.ext4 module-demo-cli.img
	sudo mount -o loop module-demo-cli.img $(MOUNT_POINT)
	sudo cp -rv $(OUTPUT_DIR)/* $(MOUNT_POINT)
	sudo umount $(MOUNT_POINT)

clean-application:
	rm -f $(OUTPUT_DIR)/$(APPLICATION)

clean-image:
	rm -f module-demo-cli.img

clean: clean-application clean-image