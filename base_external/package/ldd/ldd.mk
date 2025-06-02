
##############################################################
#
# LDD-ASSIGNMENTS
#
##############################################################
$(info ==== ldd.mk IS PARSED ====)

#TODO: Fill up the contents below in order to reference your assignment 3 git contents
LDD_VERSION = bc8f49febdb3aa1fc91e5a9d2b11941a0835d3b6
# Note: Be sure to reference the *ssh* repository URL here (not https) to work properly
# with ssh keys and the automated build/test system.
# Your site should start with git@github.com:
LDD_SITE = git@github.com:cu-ecen-aeld/assignment-7-Sanal-11.git
LDD_SITE_METHOD = git
# LDD_SITE = ~/workspace/coursera/assignment-7-Sanal-11 
# LDD_SITE_METHOD = local
LDD_GIT_SUBMODULES = YES

MODULE_SUBDIRS = misc-modules scull

define LDD_BUILD_CMDS
	# $(MAKE) -C $(LINUX_DIR) -C $(@D)/misc-modules modules
	# $(MAKE) -C $(LINUX_DIR)  -C $(@D)/scull modules
	# $(MAKE) -C $(LINUX_DIR) ARCH=$(KERNEL_ARCH) CROSS_COMPILE=$(TARGET_CROSS) M=$(@D)/misc-modules modules
	# $(MAKE) -C $(LINUX_DIR) ARCH=$(KERNEL_ARCH) CROSS_COMPILE=$(TARGET_CROSS) M=$(@D)/scull modules
	$(MAKE) -C $(LINUX_DIR) \
	    ARCH=$(KERNEL_ARCH) \
	    CROSS_COMPILE=$(TARGET_CROSS) \
	    M=$(@D)/misc-modules \
	    EXTRA_CFLAGS="-I$(@D)/include" \
	    modules
	$(MAKE) -C $(LINUX_DIR) \
	    ARCH=$(KERNEL_ARCH) \
	    CROSS_COMPILE=$(TARGET_CROSS) \
	    M=$(@D)/scull \
	    EXTRA_CFLAGS="-I$(@D)/include" \
	    modules


endef

# TODO add your writer, finder and finder-test utilities/scripts to the installation steps below
define LDD_INSTALL_TARGET_CMDS

	# Install .ko kernel modules
	$(INSTALL) -D -m 0644 $(@D)/misc-modules/*.ko $(TARGET_DIR)/lib/modules/
	$(INSTALL) -D -m 0644 $(@D)/scull/*.ko $(TARGET_DIR)/lib/modules/

	$(INSTALL) -m 0755 $(@D)/misc-modules/module_load $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 0755 $(@D)/misc-modules/module_unload $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 0755 $(@D)/scull/scull_load $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 0755 $(@D)/scull/scull_unload $(TARGET_DIR)/usr/bin
endef

$(eval $(generic-package))
