Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qwPXX71nwzDq5f
 for <openbmc@lists.ozlabs.org>; Thu, 28 Apr 2016 14:50:36 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1461819032589659.4223799219749;
 Wed, 27 Apr 2016 21:50:32 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc] DON'T MERGE
Date: Wed, 27 Apr 2016 23:50:30 -0500
Message-Id: <1461819030-17684-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1461819030-17684-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1461819030-17684-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 28 Apr 2016 04:50:37 -0000

From: Joel Stanley <joel@jms.id.au>

This adds memory debugging to the kernel.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 .../meta-barreleye/recipes-kernel/linux/linux-obmc/debug_mem.cfg  | 8 ++++++++
 .../meta-barreleye/recipes-kernel/linux/linux-obmc_%.bbappend     | 2 ++
 2 files changed, 10 insertions(+)
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-kernel/linux/linux-obmc/debug_mem.cfg
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-kernel/linux/linux-obmc_%.bbappend

diff --git a/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-kernel/linux/linux-obmc/debug_mem.cfg b/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-kernel/linux/linux-obmc/debug_mem.cfg
new file mode 100644
index 0000000..f323eb9
--- /dev/null
+++ b/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-kernel/linux/linux-obmc/debug_mem.cfg
@@ -0,0 +1,8 @@
+CONFIG_UBSAN=y
+CONFIG_UBSAN_ALIGNMENT=y
+CONFIG_DEBUG_OBJECTS=y
+CONFIG_DEBUG_OBJECTS_FREE=y
+CONFIG_DEBUG_SLAB=y
+CONFIG_DEBUG_SLAB_LEAK=y
+CONFIG_DEBUG_KMEMLEAK=y
+CONFIG_DEBUG_MEMORY_INIT=y
diff --git a/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-kernel/linux/linux-obmc_%.bbappend b/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-kernel/linux/linux-obmc_%.bbappend
new file mode 100644
index 0000000..f0d4e20
--- /dev/null
+++ b/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-kernel/linux/linux-obmc_%.bbappend
@@ -0,0 +1,2 @@
+FILESEXTRAPATHS_prepend := "${THISDIR}/linux-obmc:"
+SRC_URI += "file://debug_mem.cfg"
-- 
2.8.1
