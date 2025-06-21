
##############################################################
#
# AESDCHAR_DD
#
##############################################################
$(info ==== aesdchar-dd.mk IS PARSED ====)

#TODO: Fill up the contents below in order to reference your assignment 3 git contents
AESDCHAR_DD_VERSION = 92a8b75f9570d6d8da9cb0f80a920a34b3c53c42
# Note: Be sure to reference the *ssh* repository URL here (not https) to work properly
# with ssh keys and the automated build/test system.
# Your site should start with git@github.com:
AESDCHAR_DD_SITE = git@github.com:cu-ecen-aeld/assignments-3-and-later-Sanal-11.git
AESDCHAR_DD_SITE_METHOD = git
AESDCHAR_DD_GIT_SUBMODULES = YES
# AESDCHAR_DD_SITE = /home/win/workspace/coursera/assignments-3-and-later-Sanal-11
# AESDCHAR_DD_SITE_METHOD = local

MODULE_SUBDIRS = aesd-char-driver

define AESDCHAR_DD_BUILD_CMDS
	$(MAKE) -C $(LINUX_DIR) \
	    ARCH=$(KERNEL_ARCH) \
	    CROSS_COMPILE=$(TARGET_CROSS) \
	    M=$(@D)/aesd-char-driver \
	    EXTRA_CFLAGS="-I$(@D)/include" \
	    modules
endef

# TODO add your writer, finder and finder-test utilities/scripts to the installation steps below
define AESDCHAR_DD_INSTALL_TARGET_CMDS

	# Install .ko kernel modules
	$(INSTALL) -D -m 0644 $(@D)/aesd-char-driver/*.ko $(TARGET_DIR)/lib/modules/$(LINUX_VERSION_PROBED)

	$(INSTALL) -m 0755 $(@D)/aesd-char-driver/aesdchar_load $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 0755 $(@D)/aesd-char-driver/aesdchar_unload $(TARGET_DIR)/usr/bin
endef

$(eval $(generic-package))
