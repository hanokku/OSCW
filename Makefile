ifneq ($(KERNELRELEASE),)
	obj-m   := mouse_gamepad.o
else
	CURRENT = $(shell uname -r)
	KDIR = /lib/modules/$(CURRENT)/build 
	PWD = $(shell pwd)
default: 
	$(MAKE) -C $(KDIR) M=$(PWD) modules 
clean:  
	@rm -f *.o .*.cmd .*.flags *.mod *.mod.c *.order 
	@rm -f .*.*.cmd *~ *.*~ TODO.* 
	@rm -fR .tmp* 
	@rm -rf .tmp_versions 
disclean: clean 
	@rm *.ko *.symvers 

endif
