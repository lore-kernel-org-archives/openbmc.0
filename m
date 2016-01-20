Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 153AE1A1803
 for <openbmc@lists.ozlabs.org>; Thu, 21 Jan 2016 10:10:24 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1453331421046551.6540389601789;
 Wed, 20 Jan 2016 15:10:21 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc 0/6] Persistent 1
Date: Wed, 20 Jan 2016 17:10:14 -0600
Message-Id: <1453331420-6524-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.4
X-Zoho-Virus-Status: 2
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 20 Jan 2016 23:10:25 -0000

Announcing the persistent file system ready for testing


I hereby submit for your consideration the bitbake metadata
to build a persistent, upgradeable file system for openbmc
phosphor stack systems.

The openbmc-phosphor include has been updated to build two
file systems: an initramfs packaged into an initrd for
setting up the root file system, and a read-only squashfs
with xz compression to hold the main data.  The final 4MB
of the 32MB flash is used to hold a read/write overlay over
the squashfs maintaining updates for any files changed
that are not mounted in a tmpfs directory.

Warning: the main file system is using several parts of the
flash.  Updating those partitions while running will likely
crash your system.

The initramfs clones itself for a shutdown and update
located at /run/initramfs/.  The shutdown script is invoked
when a normal (not -f) shutdown, halt, or poweroff command
is run via systemd.  More documentation on that interface is
available at [1].

To schedule an update, simply drop images for the partitions
you want to update into /run/initramfs/image-{mtd-name}, where
{mtd-name} is the label of the mtd partition or whole flash.
This can be obtained from /proc/mtd or via the name attribute 
under the /sys/class/mtd/ directory.  Files listed in the
/run/initramfs/whitelist will be copied from the overlay before
applying images and restored afterwards.  This file is configured
to hold password, group, shadow, systemd networkd settings, and
the dropbear rsa host key file.   You can add additional files
as needed.

[1]http://www.freedesktop.org/wiki/Software/systemd/InitrdInterface/


Tips and Tricks:

To preserve your u-boot environment with your mac address, u-boot
network settings and bootargs overrides execute:

	cp /dev/mtd2 /run/initramfs/image-u-boot-env

To get a shell with the file systems unmounted but available (will
probably change in the future):

	touch /run/initramfs/image-break

from that shell (prompt update-fs# ) you can mount the file systems,
copy additional images, etc.   When done unmount file systems and
either do

	mv /image-break /image-rwfs
	/update reboot

or if you have preserved the rwfs and do not wish to update, simply

	reboot -f

You can download images either while running, or from the reboot/init
environment.  Full busybox with ifconfig, route, wget, and tftp commands
are available.   If your flash is corrupted but you have not overwritten
u-boot (and don't have a crazy 0-timeout boot script), you can recover
by downloading the kernel and initrd and booting into it.  Assuming the
default 43000000 tftp default address, setup the environment as needed:

	setenv ethaddr xx:xx:xx:xx:xx:xx
	setenv ipaddr xxx.xxx.xxx.xxx
	setenv netmask xxx.xxx.xxx.xxx
	setenv gateway xxx.xxx.xxx.xxx
	setenv server xxx.xxx.xxx.xxx
	saveenv

(the above IP addresses can also acquired by DHCP).

	tftp initrd
	tftp 40080000 cuImage
	bootm 40080000 43000000

The above commands could be packaged into a u-boot script that is packaged
with the mkimage command for scripted booting.


Known Limitations, BUGS, and TODOs:

The read/write overlay is ext4 without a journal (too few blocks), but
no fsck repair is available to fix it after a forced reboot.  The 
existing ext4 tools are too big for the space allocated in the fs.
This may be fixable by running them from the ro squashfs, by copying
fsck and libraries to the /run/initramfs shutdown environment, or
by copying a fresh empty overlay to /run/initramfs/image-rwfs.

Erasing the flash, executed as part of the flashcp command, is extremely
slow.  It is calling erase for each 4k sector and printing a message, but
the print does not seem to make a significant difference to the speed.
Expect a full 32MB flash to take approximately 35 minutes, plus 5 min
to reboot with a clean overlay as first-boot items are run.

The first-boot is triggering systemd-update-hwdb.service which is trying
to recreate a 60MB file in our 4MB file system.  It obviously fails, but
it also sometimes times out and causes the ttyS4.device and ttyS0.device
files that are trying to run concurrently to also fail.   This causes the
console getty to not be started.  If this occurs you can login over the
network if you had previously setup systemd (or set ip= in bootargs from
u-boot), otherwise you will need to reboot then address the unclean ext4
fsck issue above.

The u-boot-fw-utils fw_setenv and fw_printenv are not building correctly
and are therefore not in the image.  These will allow us to update
the u-boot environment for such things as Ethernet mac address, net-boot,
and other overrides such as passing kernel command line via bootargs
that could be used to trigger init to update.

Generating the flash needs to be given a layout with images for each type
and their sizes.  This should also create a dtsi with the flash partitions.

Making the overlay should take FSTYPE parameters (actually OVERLAY_BASETYPE)
for the additional options, in addition some user and some system.

The an empty rwfs should be able to be created via mkfs in the initrd
environment.  The fsck should be applied.

Mounting the rwfs and rofs and several other commands should be error trapped.
Today if the rwfs fails to mount the underlying tmpfs of /run will be
the overlay, resulting in writable but ram-backed non-persistent booting.
Providing a image-rwfs will probably copy the whitelisted files to the image
from this error state.

More systemd setup should be in the base layer: systemd tmpfiles service
changes /etc/mtab from /proc/mounts in base-files to /proc/self/mounts, and
there are several service user ids added to the passwd and group databases.

The updated passwd and shadow files should be copied into run/initramfs under
some policy for the sulogin recovery of shutdown.  Some parameter to trigger
admin sulogin should be available (eg the sulogin allowing a touch of /takeover
to takeover pid 1 in the init script).


https://github.com/openbmc/openbmc/pull/140

Milton D. Miller II (6):
  create obmc-phosphor-initfs
  phosphor: modify use obmc-phosphor-initfs
  linux-obmc: apply the aspeed-spi-nor controller patchset
  u-boot : switch to repro, add fw_env.config
  create u-boot-fw-utils for our u-boot version
  phosphor: Create image class image-overlay and move phosphor to use it

 .../recipes-bsp/u-boot/files/fw_env.config         |   4 +-
 .../u-boot/u-boot-fw-utils_2013.07%.bbappend       |  13 +
 .../recipes-bsp/u-boot/u-boot_2013.07%.bbappend    |   7 +-
 ...-Add-SPI-memory-controllers-for-ASPEED-AS.patch | 686 +++++++++++++++++++++
 .../0001-rtc-aspeed-month-is-off-by-one.patch      |  35 ++
 .../recipes-kernel/linux/linux-obmc/defconfig      |   5 +
 .../linux/linux-obmc/spinor-dts.patch              | 147 +++++
 .../recipes-kernel/linux/linux-obmc_%.bbappend     |   5 +-
 meta-phosphor/classes/image-overlay.bbclass        |  18 +
 .../obmc-phosphor-image_types_uboot.bbclass        |  55 +-
 meta-phosphor/classes/obmc-phosphor-initfs.bbclass |   4 +
 .../recipes-bsp/u-boot/u-boot-fw-utils_2013.07.bb  |  52 ++
 .../common/recipes-bsp/u-boot/u-boot_2013.07.bb    |   9 +-
 .../images/core-image-minimal-initramfs.bbappend   |   3 +
 .../obmc-phosphor-initfs/files/obmc-init.sh        |  78 +++
 .../obmc-phosphor-initfs/files/obmc-shutdown.sh    |  55 ++
 .../obmc-phosphor-initfs/files/obmc-update.sh      | 102 +++
 .../obmc-phosphor-initfs/files/whitelist           |   8 +
 .../obmc-phosphor-initfs/obmc-phosphor-init.bb     |  28 +
 .../common/recipes-phosphor/skeleton/skeleton.bb   |   2 +-
 meta-phosphor/conf/distro/openbmc-phosphor.conf    |   1 +
 .../conf/machine/include/obmc-bsp-common.inc       |  10 +-
 22 files changed, 1295 insertions(+), 32 deletions(-)
 create mode 100644 meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-bsp/u-boot/u-boot-fw-utils_2013.07%.bbappend
 create mode 100644 meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-kernel/linux/linux-obmc/0001-mtd-spi-nor-Add-SPI-memory-controllers-for-ASPEED-AS.patch
 create mode 100644 meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-kernel/linux/linux-obmc/0001-rtc-aspeed-month-is-off-by-one.patch
 create mode 100644 meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-kernel/linux/linux-obmc/spinor-dts.patch
 create mode 100644 meta-phosphor/classes/image-overlay.bbclass
 create mode 100644 meta-phosphor/classes/obmc-phosphor-initfs.bbclass
 create mode 100644 meta-phosphor/common/recipes-bsp/u-boot/u-boot-fw-utils_2013.07.bb
 create mode 100644 meta-phosphor/common/recipes-core/images/core-image-minimal-initramfs.bbappend
 create mode 100644 meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-init.sh
 create mode 100644 meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-shutdown.sh
 create mode 100755 meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-update.sh
 create mode 100644 meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/whitelist
 create mode 100644 meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/obmc-phosphor-init.bb

-- 
2.6.4
