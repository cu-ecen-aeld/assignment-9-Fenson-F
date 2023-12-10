
##############################################################
#
# LDD
#
##############################################################

LDD_VERSION = '718cbdf07e082486e008537660e6b9fb4fb07a45'

# Note: Be sure to reference the *ssh* repository URL here (not https) to work properly
# with ssh keys and the automated build/test system.
# Your site should start with git@github.com:
LDD_SITE = 'git@github.com:cu-ecen-aeld/assignment-7-Fenson-F.git'
LDD_SITE_METHOD = git
LDD_GIT_SUBMODULES = YES
#CC = aarch64-none-linux-gnu-

LDD_MODULE_SUBDIRS = scull 
LDD_MODULE_SUBDIRS += misc-modules

#define LDD_BUILD_CMDS
#	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/scull all
#	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/misc-modules all
#endef


define LDD_INSTALL_TARGET_CMDS

	$(INSTALL) -m 0755 $(@D)/scull/scull_load $(TARGET_DIR)/usr/bin/
	$(INSTALL) -m 0755 $(@D)/scull/scull_unload $(TARGET_DIR)/usr/bin/

	$(INSTALL) -m 0755 $(@D)/misc-modules/module_load $(TARGET_DIR)/usr/bin/
	$(INSTALL) -m 0755 $(@D)/misc-modules/module_unload $(TARGET_DIR)/usr/bin/

endef

$(eval $(kernel-module))
$(eval $(generic-package))
