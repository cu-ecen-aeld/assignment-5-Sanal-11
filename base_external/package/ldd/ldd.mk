
##############################################################
#
# AESD-ASSIGNMENTS
#
##############################################################
$(info ==== aesd-assignments.mk IS PARSED ====)

#TODO: Fill up the contents below in order to reference your assignment 3 git contents
AESD_ASSIGNMENTS_VERSION = 43b0eb80d7c617ac810838f9fb93ac76c638643b
# Note: Be sure to reference the *ssh* repository URL here (not https) to work properly
# with ssh keys and the automated build/test system.
# Your site should start with git@github.com:
AESD_ASSIGNMENTS_SITE = git@github.com:cu-ecen-aeld/assignment-7-Sanal-11.git
AESD_ASSIGNMENTS_SITE_METHOD = git
# AESD_ASSIGNMENTS_SITE = /home/win/workspace/coursera/assignment-1-Sanal-11
# AESD_ASSIGNMENTS_SITE_METHOD = local
AESD_ASSIGNMENTS_GIT_SUBMODULES = YES

MODULE_SUBDIRS = misc-modules scull

# define AESD_ASSIGNMENTS_BUILD_CMDS
# 	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/server all
# endef

# TODO add your writer, finder and finder-test utilities/scripts to the installation steps below
define AESD_ASSIGNMENTS_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/misc-modules/module_load $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 0755 $(@D)/scull/module_unload $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 0755 $(@D)/misc-modules/scull_load $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 0755 $(@D)/scull/scull_unload $(TARGET_DIR)/usr/bin
endef

$(eval $(generic-package))
