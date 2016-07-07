Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rlv4G3QBpzDr4w
 for <openbmc@lists.ozlabs.org>; Fri,  8 Jul 2016 09:30:22 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1467934218844739.3866468103546;
 Thu, 7 Jul 2016 16:30:18 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH docs 2/2] Document BMC flash update enhancements
Date: Thu,  7 Jul 2016 18:30:15 -0500
Message-Id: <20160707233015.9687-3-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <20160707233015.9687-1-openbmc-patches@stwcx.xyz>
References: <20160707233015.9687-1-openbmc-patches@stwcx.xyz>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 07 Jul 2016 23:30:23 -0000

From: Milton Miller <miltonm@us.ibm.com>

The BMC flash update process was enhanced to allow the images to be
written to flash while the system is operational allowing progress
to be mointored.

Update the documentation describing how to use the new interfaces.
Also add or update the description of the prior interface.

Fixes: openbmc/openbmc#293
Signed-off-by: Milton Miller <miltonm@us.ibm.com>
---
 code-update.md     | 110 ++++++++++++++++++++++++++++++++++++++++++++++-------
 dbus-interfaces.md |  28 ++++++++------
 2 files changed, 114 insertions(+), 24 deletions(-)

diff --git a/code-update.md b/code-update.md
index da85f5e..28f351f 100644
--- a/code-update.md
+++ b/code-update.md
@@ -29,17 +29,57 @@ that can be updated on the BMC:
 
     The OpenBMC bootloader
 
+Preparing for BMC code Update
+-----------------------------
+
+The BMC normally runs with the read-write and read-only file systems
+mounted, which means these images may be read (and written, for the
+read-write filesystem) at any time.  Because the updates are distributed
+as complete file system images, these filesystems have to be unmounted
+to replace them with new images.  To unmount these file systems all
+applications must be stopped.
+
+By default an orderly `reboot` will stop all applications and unmount
+the root filesystem, and the images copied into the `/run/initramfs`
+directory will be applied at that point before restarting.  This also
+applied to the `shutdown` and `halt` commands -- they will write the
+flash before stopping.
+
+As an alternative, the an option can be parsed by the `init` script in
+the initramfs to copy the required contents of these filesystems into
+RAM so the images can be applied while the rest of the application stack
+is running and progress can be monitored over the network.  The
+`update` script can then be called to write the images while the
+system is operational and its progress ouput monitored.
+
 Update from the OpenBMC shell
 -----------------------------
 
-To update from the OpenBMC shell, copy one or more of these `image-*` files to
-the directory:
+To update from the OpenBMC shell, follow the steps in this section.
+
+It is recommended that the BMC be prepared for update:
+
+    fw_setenv openbmconce copy-files-to-ram copy-base-filesystem-to-ram
+    reboot
+
+Copy one or more of these `image-*` files to the directory:
 
     /run/initramfs/
 
-(preserving the filename), then reboot. Before the system reboots, the new image
-will be copied to the appropriate flash partition.
+(preserving the filename), then run the `update` script to apply the images:
+
+    /run/initramfs/update
+
+then reboot to finish applying:
 
+    reboot
+
+During the reboot process the `update` script will be invoked after
+the file systems are unmounted to complete the update process.
+
+Some optional features are available, see the help for more details:
+
+    /run/initramfs/update --help
 
 Update via REST
 ---------------
@@ -47,18 +87,33 @@ Update via REST
 An OpenBMC system can download an update image from a TFTP server, and apply
 updates, controlled via REST. The general procedure is:
 
- 1. Configure update settings
- 2. Initiate update
- 3. Check flash status
+ 1. Prepare system for update
+ 2. Configure update settings
+ 3. Initiate update
+ 4. Check flash status
+ 5. Reboot the BMC
+
+### Prepare system for update
+
+Perform a POST to invoke the `PrepareForUpdate` method of the `/flash/bmc` object:
+
+    curl -b cjar -k -H "Content-Type: application/json" -X POST \
+        -d '{"data": ["<TFTP server IP address>", "<filename>"]}' \
+        https://bmc/org/openbmc/control/flash/bmc/action/prepareForUpdate
+
+This will setup the u-boot environment and reboot the BMC.   If no other
+images were pending the BMC should return in about 2 minutes.
+
 
 ### Configure update settings
 
 There are a few settings available to control the update process:
 
- * `preserve_network_settings`: Preserve network settings, only needed if updating uboot
- * `restore_application_defaults`: update read-only file system
+ * `preserve_network_settings`: Preserve network settings, only needed if updating the whole flash
+ * `restore_application_defaults`: update (clear) the read-write file system
  * `update_kernel_and_apps_only`: update kernel and initramfs
- * `clear_persistent_files`: Erase persistent files
+ * `clear_persistent_files`: ignore the persistent file list when reseting applications defaults
+ * `auto_apply`: Attempt to write the images by invoking the `Apply` method after the images are unpacked.
 
 To configure the update settings, perform a REST PUT to
 `/control/flash/bmc/attr/<setting>`. For example:
@@ -77,15 +132,44 @@ Perform a POST to invoke the `updateViaTftp` method of the `/flash/bmc` object:
 
 ### Check flash status
 
-You can query the progress of the flash with a simple GET request:
+You can query the progress of the download and image verificaton with
+a simple GET request:
 
     curl -b cjar -k https://bmc/org/openbmc/control/flash/bmc
 
+Or perform a POST to invoke the `GetUpdateProgress` method of the `/flash/bmc` object:
+
+    curl -b cjar -k -H "Content-Type: application/json" -X POST \
+        -d '{"data": []}' \
+        https://bmc/org/openbmc/control/flash/bmc/action/GetUpdateProgress
+
+
+Note: the status will not advance from `Writing images to flash` without
+calling the `GetUpdateProgress` method.
+
+If the status is `Image ready to apply.` then you can either initiate
+a reboot or call the Apply method to start the process of writing the
+flash.
+
+### Reboot the BMC
+
+To start using the new images, reboot the BMC using the warmReset method
+of the BMC control object:
+
+
+    curl -b cjar -k -H "Content-Type: application/json" -X POST \
+        -d '{"data": []}' \
+        https://bmc/org/openbmc/control/bmc0/action/warmReset
+
+
 Host code update
 ================
 
-Using a similar method, we can update the host firmware (or "BIOS"), by
-performing a POST request to call the `updateViaTftp` method of
+The host firmware (or "BIOS") can be updated in a similar method.  Because
+the BMC does not use the host firmware it is updated when the download is
+completed.  This assumes the host is not accessing its firmware.
+
+Perform a POST request to call the `updateViaTftp` method of
 `/control/flash/bios` (instead of `/control/flash/bmc` used above). To initiate
 the update:
 
diff --git a/dbus-interfaces.md b/dbus-interfaces.md
index f4e043d..5ea5d02 100644
--- a/dbus-interfaces.md
+++ b/dbus-interfaces.md
@@ -306,13 +306,18 @@ notifications.
 The control.BmcFlash interface allows applications update the BMC firmware.
 
 ### methods
-| name            | in signature | out signature | description                 |
-| --------------- | ------------ | ------------- | --------------------------- |
-| `updateViaTftp` | `ss`         | `void`        | **Perform a BMC firmware update using a TFTP server.**|
-|                 | `s`          |               | The ipv4 address of the TFTP server hosting the firmware image file.|
-|                 | `s`          |               | The name of the file containing the BMC firmware image.|
-| `update`        | `s`          | `void`        | **Perform a BMC firmware update with a file already on the BMC.**|
-|                 | `s`          |               | The name of the file containing the BMC firmware image.|
+| name                | in signature | out signature | description                 |
+| ------------------- | ------------ | ------------- | --------------------------- |
+| `updateViaTftp`     | `ss`         | `void`        | **Perform a BMC firmware update using a TFTP server.**|
+|                     | `s`          |               | The ipv4 address of the TFTP server hosting the firmware image file.|
+|                     | `s`          |               | The name of the file containing the BMC firmware image.|
+| `update`            | `s`          | `void`        | **Perform a BMC firmware update with a file already on the BMC.**|
+|                     | `s`          |               | The name of the file containing the BMC firmware image.|
+| `PrepareForUpdate`  | `void`       | `void`        | **Reboot BMC with Flash content cached in RAM **|
+| `Abort`             | `void`       | `void`        | **Abort any pending, broken, or in-progress flash update**|
+| `Apply`             | `void`       | `void`        | **Initiate writing image into flash**|
+| `GetUpdateProgress` | `void`       | `s`           | **Display progress log `Apply` phase**|
+|                     |              | `s`           | The `state` and log output from `Apply` |
 
 ### signals
 | name           | signature | description                              |
@@ -324,12 +329,13 @@ The control.BmcFlash interface allows applications update the BMC firmware.
 ### properties
 | name                           | signature | description                     |
 | ------------------------------ | --------- | ------------------------------- |
-| `status`                       | `s`       | **?**                           |
+| `status`                       | `s`       | **Description of the phase of the update**        |
 | `filename`                     | `s`       | **The name of the file containing the BMC firmware image.**|
 | `preserve_network_settings`    | `b`       | **Perform a factory reset.**    |
-| `restore_application_defaults` | `b`       | **Perform a factory reset.**    |
-| `update_kernel_and_apps`       | `b`       | **Perform a factory reset.**    |
-| `clear_persistent_files`       | `b`       | **Perform a factory reset.**    |
+| `restore_application_defaults` | `b`       | **Clear modified files in read-write filesystem.**    |
+| `update_kernel_and_apps`       | `b`       | **Do not update bootloader (requires image pieces).**    |
+| `clear_persistent_files`       | `b`       | **Also remove persistent files when updating read-write filesystem.**    |
+| `auto_apply`                   | `b`       | **Attempt to apply image after unpacking (cleared if image verification fails)**    |
 
 ### namespace
 | path                             | required | description |
-- 
2.9.0
