Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rpJCy1tyvzDqpR
 for <openbmc@lists.ozlabs.org>; Tue, 12 Jul 2016 07:30:22 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1468272615601513.3791439214331;
 Mon, 11 Jul 2016 14:30:15 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH docs 1/2] Clean up formatting
Date: Mon, 11 Jul 2016 16:30:12 -0500
Message-Id: <20160711213013.11995-2-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <20160711213013.11995-1-openbmc-patches@stwcx.xyz>
References: <20160711213013.11995-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 11 Jul 2016 21:30:22 -0000

From: Milton Miller <miltonm@us.ibm.com>

When reviewing the formatted output I discovered my receint additions
to the dbus interfaces did not have trailing periods.  In addition
one of the entries did not parse the bold formatting.  I tracked
the later down to a space between the text and the intended end bold.

I also added a few columns to headers where the text was longer than
the initial columns.  This makes the file a bit easier to read when
viewing the markdown as plain text.

Signed-off-by: Milton Miller <miltonm@us.ibm.com>
---
 dbus-interfaces.md | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/dbus-interfaces.md b/dbus-interfaces.md
index 5ea5d02..84e75c3 100644
--- a/dbus-interfaces.md
+++ b/dbus-interfaces.md
@@ -313,11 +313,11 @@ The control.BmcFlash interface allows applications update the BMC firmware.
 |                     | `s`          |               | The name of the file containing the BMC firmware image.|
 | `update`            | `s`          | `void`        | **Perform a BMC firmware update with a file already on the BMC.**|
 |                     | `s`          |               | The name of the file containing the BMC firmware image.|
-| `PrepareForUpdate`  | `void`       | `void`        | **Reboot BMC with Flash content cached in RAM **|
-| `Abort`             | `void`       | `void`        | **Abort any pending, broken, or in-progress flash update**|
-| `Apply`             | `void`       | `void`        | **Initiate writing image into flash**|
-| `GetUpdateProgress` | `void`       | `s`           | **Display progress log `Apply` phase**|
-|                     |              | `s`           | The `state` and log output from `Apply` |
+| `PrepareForUpdate`  | `void`       | `void`        | **Reboot BMC with Flash content cached in RAM.**|
+| `Abort`             | `void`       | `void`        | **Abort any pending, broken, or in-progress flash update.**|
+| `Apply`             | `void`       | `void`        | **Initiate writing image to flash.**|
+| `GetUpdateProgress` | `void`       | `s`           | **Display progress log `Apply` phase.**|
+|                     |              | `s`           | The `status` and log output from `Apply`|
 
 ### signals
 | name           | signature | description                              |
@@ -329,13 +329,13 @@ The control.BmcFlash interface allows applications update the BMC firmware.
 ### properties
 | name                           | signature | description                     |
 | ------------------------------ | --------- | ------------------------------- |
-| `status`                       | `s`       | **Description of the phase of the update**        |
+| `status`                       | `s`       | **Description of the phase of the update.**        |
 | `filename`                     | `s`       | **The name of the file containing the BMC firmware image.**|
 | `preserve_network_settings`    | `b`       | **Perform a factory reset.**    |
 | `restore_application_defaults` | `b`       | **Clear modified files in read-write filesystem.**    |
 | `update_kernel_and_apps`       | `b`       | **Do not update bootloader (requires image pieces).**    |
 | `clear_persistent_files`       | `b`       | **Also remove persistent files when updating read-write filesystem.**    |
-| `auto_apply`                   | `b`       | **Attempt to apply image after unpacking (cleared if image verification fails)**    |
+| `auto_apply`                   | `b`       | **Attempt to apply image after unpacking (cleared if image verification fails).**    |
 
 ### namespace
 | path                             | required | description |
@@ -474,8 +474,8 @@ Insert a description of the control.Power interface here.
 | `PowerLost` | `void`    | **The power is off.** |
 
 ### properties
-| name          | signature | description     |
-| ------------- | --------- | --------------- |
+| name            | signature | description     |
+| --------------- | --------- | --------------- |
 | `pgood`         | `i`     | **?**           |
 | `state`         | `i`     | **?**           |
 | `pgood_timeout` | `i`     | **?**           |
@@ -694,6 +694,6 @@ bookeeping to another application.
 | `WatchdogError` | `void`    | *The watchdog was not pinged before the timer expired.**|
 
 ### namespace
-| path                             | required | description                  |
-| -------------------------------- | -------- | ---------------------------------------- |
+| path                               | required | description                  |
+| ---------------------------------- | -------- | ---------------------------------------- |
 | `/org/openbmc/watchdog/<watchdog>` | No       | Any watchdog instances must be instantiated in the watchdog namespace. |
-- 
2.9.0
