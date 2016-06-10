Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rRGZq46hfzDqWf
 for <openbmc@lists.ozlabs.org>; Sat, 11 Jun 2016 08:10:43 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1465596637326623.340627440342;
 Fri, 10 Jun 2016 15:10:37 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: [PATCH openbmc v3 03/11] Remove empty devtrees
Date: Fri, 10 Jun 2016 17:10:22 -0500
Message-Id: <20160610221030.3943-4-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20160610221030.3943-1-openbmc-patches@stwcx.xyz>
References: <20160610221030.3943-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 10 Jun 2016 22:10:44 -0000
X-List-Received-Date: Fri, 10 Jun 2016 22:10:44 -0000
X-List-Received-Date: Fri, 10 Jun 2016 22:10:44 -0000

From: Brad Bishop <bradleyb@fuzziesquirrel.com>

At the moment the in-tree devtrees are used.  Remove these to
minimize confusion.

Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
---
 .../meta-firestone/recipes-kernel/linux/linux-obmc/firestone.dts         | 1 -
 .../meta-ibm/meta-garrison/recipes-kernel/linux/linux-obmc/garrison.dts  | 1 -
 .../meta-ibm/meta-palmetto/recipes-kernel/linux/linux-obmc/palmetto.dts  | 1 -
 3 files changed, 3 deletions(-)
 delete mode 100644 meta-openbmc-machines/meta-openpower/meta-ibm/meta-firestone/recipes-kernel/linux/linux-obmc/firestone.dts
 delete mode 100644 meta-openbmc-machines/meta-openpower/meta-ibm/meta-garrison/recipes-kernel/linux/linux-obmc/garrison.dts
 delete mode 100644 meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/recipes-kernel/linux/linux-obmc/palmetto.dts

diff --git a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-firestone/recipes-kernel/linux/linux-obmc/firestone.dts b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-firestone/recipes-kernel/linux/linux-obmc/firestone.dts
deleted file mode 100644
index 3b5e0f1..0000000
--- a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-firestone/recipes-kernel/linux/linux-obmc/firestone.dts
+++ /dev/null
@@ -1 +0,0 @@
-# use in-tree devtree
diff --git a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-garrison/recipes-kernel/linux/linux-obmc/garrison.dts b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-garrison/recipes-kernel/linux/linux-obmc/garrison.dts
deleted file mode 100644
index 3b5e0f1..0000000
--- a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-garrison/recipes-kernel/linux/linux-obmc/garrison.dts
+++ /dev/null
@@ -1 +0,0 @@
-# use in-tree devtree
diff --git a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/recipes-kernel/linux/linux-obmc/palmetto.dts b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/recipes-kernel/linux/linux-obmc/palmetto.dts
deleted file mode 100644
index 3b5e0f1..0000000
--- a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/recipes-kernel/linux/linux-obmc/palmetto.dts
+++ /dev/null
@@ -1 +0,0 @@
-# use in-tree devtree
-- 
2.8.3
