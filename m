Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 805EE1A01EC
 for <openbmc@lists.ozlabs.org>; Tue,  8 Mar 2016 08:30:26 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1457386224208628.6863561063825;
 Mon, 7 Mar 2016 13:30:24 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc v2 00/34] Update openbmc initfs to add temporary run
 from RAM 
Date: Mon,  7 Mar 2016 15:29:49 -0600
Message-Id: <1457386223-5725-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
X-Zoho-Virus-Status: 1
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
X-List-Received-Date: Mon, 07 Mar 2016 21:30:27 -0000

This series adds support to the openbmc phosphor initfs scripts to support the BMC running with either or both of the read-write and read-only layers of the root file system to be in RAM instead of in the flash.
This decision is made via u-boot firmware variables and the kernel command line, and is designed to have a persistent and one time option.

Also included is a systemd service called clear-once that clears the variable meant for one time use.  The host-ipmid service is modified to want to run after the clear-once service in anticipation of the a OEM command that will set the variable.

When running in RAM the read-write layer can be replaced with updated content.  If both layers are in memory the BMC will not be accessing the flash except by explicit action, which include a shutdown and reboot.

This series includes support to copy the read-only layer from the existing flash at boot, and to copy the white listed files from the read-write file system at boot and restore them at shutdown along with the u-boot environment.  Also included is support for using images sourced from elsewhere either by manual intervention at the debug-init-sh shell prompt or via a shell command line stored in a u-boot environment variable (only executed if an option is found on the command line or in the previously mentioned u-boot variables).  This can be used to download the read-only layer from the network to test or run a new read-only layer while updating the flash.  The packaged initfs supports HTTP ant TFTP transfers via the busybox commands.

The updated flash update script can run while the BMC is at system runtime if both layers are in RAM.  Future updates will allow it to update one layer while the other is mounted.  The error handling in the update script still is designed for use at shutdown with a console to debug and fix unexpected conditions.  Future updates could also support leaving the watchdog timer enabled during flash, but a reset during an update to u-boot will always be fatal without a redundant flash chip and the corresponding strapping and support.

The options and variable names were listed in this prior email https://lists.ozlabs.org/pipermail/openbmc/2016-March/002119.html


. Documentation for this and network booting will be written.


https://github.com/openbmc/openbmc/pull/200

Milton D. Miller II (34):
  shutdown: Conditionally unmount proc
  shutdown: Correct comment on the reason to invoke stty
  shutdown: Test equality with =
  shutdown: Complain if update images exist without update script
  shutdown: Call update from /run/initramfs directory
  shutdown: request saved files be cleaned
  update: Add command line parsing to clean or preserve saved files
  update: Add options to skip the save and restore phases
  update: Do not check if the whitelist is empty
  update: Read whitelist from the /run/initramfs directory
  update: Save files in run filesystem
  update: Restore files via an alternate mount directory
  update: Make cow directory before restoring saved files.
  update: Save files using the same mount path as init
  update: Save whitelist files from RAM or mounted read-write filesystem
  update: Add option to copy files to runtime cow directory
  update: Remove images as they are successfully flashed
  update: Skip calling flashcp for empty files
  init: Read options from a file
  init: Use image of read only file system in RAM if present
  init: Suppress fsck command not present error by file system type
  init: Run from RAM if file system type is specified as none
  init: Always move images from root
  init: Add option to run with writable overlay in RAM
  init: Add option to copy base read-only filesystem into RAM
  init: Be explicit about saving and restoring files.
  init: Call update from initramfs directory
  init: Add option to copy files into memory
  init: Look for options in u-boot environment
  init: Allow options to be fixed at build time
  init: Add a hook to download files
  initfs: Install option and download files if they exist
  Add clear-once service
  host-ipmid: OEM command will require clear-once service

 .../recipes-phosphor/clear-once/clear-once.bb      |   8 +
 .../clear-once/clear-once/clear-once.service       |  15 ++
 .../recipes-phosphor/host-ipmid/host-ipmid.bb      |   1 +
 .../host-ipmid/host-ipmid/host-ipmid.service       |   2 +
 .../obmc-phosphor-initfs/files/obmc-init.sh        | 210 +++++++++++++++++++--
 .../obmc-phosphor-initfs/files/obmc-shutdown.sh    |  17 +-
 .../obmc-phosphor-initfs/files/obmc-update.sh      |  91 +++++++--
 .../obmc-phosphor-initfs/obmc-phosphor-init.bb     |   8 +
 8 files changed, 320 insertions(+), 32 deletions(-)
 create mode 100644 meta-phosphor/common/recipes-phosphor/clear-once/clear-once.bb
 create mode 100644 meta-phosphor/common/recipes-phosphor/clear-once/clear-once/clear-once.service

-- 
2.7.1
