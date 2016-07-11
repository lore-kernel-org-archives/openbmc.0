Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rpJCw3n59zDqpR
 for <openbmc@lists.ozlabs.org>; Tue, 12 Jul 2016 07:30:20 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1468272616741749.2841811009655;
 Mon, 11 Jul 2016 14:30:16 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH docs 2/2] Minor spelling fixes
Date: Mon, 11 Jul 2016 16:30:13 -0500
Message-Id: <20160711213013.11995-3-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 11 Jul 2016 21:30:21 -0000

From: Milton Miller <miltonm@us.ibm.com>

Reviewing my recent update in gedit showed a few spelling typos
in code-update.md.  I also noticed the possible auto-correct
that put a backquote before an e in rest-api.md.  After that I
ran the remaining files through gedit looking for mis-spelled
words and found a few with missing letters.

Signed-off-by: Milton Miller <miltonm@us.ibm.com>
---
 code-update.md  | 4 ++--
 contributing.md | 6 +++---
 rest-api.md     | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/code-update.md b/code-update.md
index 28f351f..b599474 100644
--- a/code-update.md
+++ b/code-update.md
@@ -50,7 +50,7 @@ the initramfs to copy the required contents of these filesystems into
 RAM so the images can be applied while the rest of the application stack
 is running and progress can be monitored over the network.  The
 `update` script can then be called to write the images while the
-system is operational and its progress ouput monitored.
+system is operational and its progress output monitored.
 
 Update from the OpenBMC shell
 -----------------------------
@@ -112,7 +112,7 @@ There are a few settings available to control the update process:
  * `preserve_network_settings`: Preserve network settings, only needed if updating the whole flash
  * `restore_application_defaults`: update (clear) the read-write file system
  * `update_kernel_and_apps_only`: update kernel and initramfs
- * `clear_persistent_files`: ignore the persistent file list when reseting applications defaults
+ * `clear_persistent_files`: ignore the persistent file list when resetting applications defaults
  * `auto_apply`: Attempt to write the images by invoking the `Apply` method after the images are unpacked.
 
 To configure the update settings, perform a REST PUT to
diff --git a/contributing.md b/contributing.md
index 195bde6..f2e2c83 100644
--- a/contributing.md
+++ b/contributing.md
@@ -88,7 +88,7 @@ Your contribution will generally need to be reviewed before being accepted.
 Submitting changes via Gerrit server
 ------------------------------------
 
-The openbmc gerrit server supports Gihub credentials, its link is:
+The openbmc gerrit server supports Github credentials, its link is:
 
   https://gerrit.openbmc-project.xyz/#/q/status:open
 
@@ -156,7 +156,7 @@ See also: http://dbus.freedesktop.org/doc/dbus-api-design.html
 Best practices for C
 --------------------
 
-There are numerous resources avaialble elsewhere, but a few items that are
+There are numerous resources available elsewhere, but a few items that are
 relevant to OpenBMC work:
 
  * You almost never need to use `system(<some shell pipeline>)`. Reading and
@@ -174,7 +174,7 @@ relevant to OpenBMC work:
    C types
 
  * Declare internal-only functions as `static`, declare read-only data
-   as `const` where possble.
+   as `const` where possible.
 
  * Ensure that your code compiles without warnings, especially for changes
    to the kernel.
diff --git a/rest-api.md b/rest-api.md
index 10b01e9..4fe2e02 100644
--- a/rest-api.md
+++ b/rest-api.md
@@ -178,7 +178,7 @@ To invoke a method without parameters:
 DELETE operations are for removing instances. Only DBUS objects (instances) can
 be removed. If the underlying DBUS object implements the
 `org.openbmc.Object.Delete` interface the REST server will call it. If
-`org.openbmc.Object.Delet`e is not implemented, the REST server will return a
+`org.openbmc.Object.Delete` is not implemented, the REST server will return a
 HTTP 403 (Forbidden) error.
 
 For example, to delete the event record with ID 0:
-- 
2.9.0
