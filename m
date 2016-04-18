Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qp9ZX2LbJzDqBD
 for <openbmc@lists.ozlabs.org>; Mon, 18 Apr 2016 11:30:44 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1460943041302357.8622884171424;
 Sun, 17 Apr 2016 18:30:41 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc v2 6/7] palmetto: Build devicetrees for hardware and
 QEMU
Date: Sun, 17 Apr 2016 20:30:32 -0500
Message-Id: <1460943033-24624-7-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1460943033-24624-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1460943033-24624-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 18 Apr 2016 01:30:45 -0000

From: Andrew Jeffery <andrew@aj.id.au>

Using a separate devicetree for QEMU allows us to integrate existing
models for hardware features, compromising on accuracy but hopefully
providing a net benefit by reducing development time.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 .../meta-openpower/meta-ibm/meta-palmetto/conf/machine/palmetto.conf   | 1 +
 yocto-poky/scripts/runqemu-internal                                    | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/conf/machine/palmetto.conf b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/conf/machine/palmetto.conf
index f6256a7..d41127d 100644
--- a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/conf/machine/palmetto.conf
+++ b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/conf/machine/palmetto.conf
@@ -1,5 +1,6 @@
 KMACHINE = "aspeed"
 KERNEL_DEVICETREE = "${KMACHINE}-bmc-opp-${MACHINE}.dtb"
+KERNEL_DEVICETREE += "${KMACHINE}-bmc-opp-qemu${MACHINE}.dtb"
 
 require conf/machine/include/ast2400.inc
 require conf/machine/include/obmc-bsp-common.inc
diff --git a/yocto-poky/scripts/runqemu-internal b/yocto-poky/scripts/runqemu-internal
index d06828a..78b19c1 100755
--- a/yocto-poky/scripts/runqemu-internal
+++ b/yocto-poky/scripts/runqemu-internal
@@ -379,7 +379,8 @@ if [ "$MACHINE" = "palmetto" ]; then
     MACHINE_SUBTYPE=palmetto-bmc
     export QEMU_AUDIO_DRV="none"
     KERNCMDLINE="console=ttyS4"
-    QEMUOPTIONS="$QEMU_NETWORK_CMD -M ${MACHINE_SUBTYPE} -initrd $ROOTFS -no-reboot -nographic"
+    KERNELDTB=${DEPLOY_DIR_IMAGE}/${PALMETTO_DEFAULT_KERNEL}-aspeed-bmc-opp-qemu${MACHINE}.dtb
+    QEMUOPTIONS="$QEMU_NETWORK_CMD -M ${MACHINE_SUBTYPE} -dtb $KERNELDTB -initrd $ROOTFS -no-reboot -nographic"
 fi
 
 if [ "$MACHINE" = "qemuarm64" ]; then
-- 
2.7.1
