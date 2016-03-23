Return-Path: <andrew@aj.id.au>
Received: from homiemail-a13.g.dreamhost.com (sub3.mail.dreamhost.com
 [69.163.253.7])
 (using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qVMXB1X9kzDqDt
 for <openbmc@lists.ozlabs.org>; Wed, 23 Mar 2016 19:03:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=Mv8gArqh; 
 dkim-atps=neutral
Received: from homiemail-a13.g.dreamhost.com (localhost [127.0.0.1])
 by homiemail-a13.g.dreamhost.com (Postfix) with ESMTP id AF8CF334072
 for <openbmc@lists.ozlabs.org>; Wed, 23 Mar 2016 01:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=from:to
 :subject:date:message-id:in-reply-to:references; s=aj.id.au; bh=
 kLe6KT4W9EcBQxwwQNqSyv1EZ1U=; b=Mv8gArqhDd6uBYP3CeXVVEja5I7bdPqb
 f5hCwqXd28w0hWiFZ5U7J450vQBCtrG7MaeQP4S5RPM1GvQyrMsu1s3DLLdoOQpB
 N11pUEl65bICXGVxdG4RJsBTixeaF4/GxeVgd9ayoumIdWjsyb05REyRYSY8PJV9
 sBNoRLa0FKg=
Received: from keelia.au.ibm.com (ppp203-122-213-247.static.internode.on.net
 [203.122.213.247])
 (using TLSv1 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: andrew@aj.id.au)
 by homiemail-a13.g.dreamhost.com (Postfix) with ESMTPSA id 41A9D33406F
 for <openbmc@lists.ozlabs.org>; Wed, 23 Mar 2016 01:03:52 -0700 (PDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: OpenBMC <openbmc@lists.ozlabs.org>
Subject: [RFC PATCH openbmc v3 7/8] palmetto: Build devicetrees for hardware
 and QEMU
Date: Wed, 23 Mar 2016 18:33:34 +1030
Message-Id: <1458720215-25302-8-git-send-email-andrew@aj.id.au>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1458720215-25302-1-git-send-email-andrew@aj.id.au>
References: <1458720215-25302-1-git-send-email-andrew@aj.id.au>
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
X-List-Received-Date: Wed, 23 Mar 2016 08:03:54 -0000

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
index 479d61c..f461e9f 100755
--- a/yocto-poky/scripts/runqemu-internal
+++ b/yocto-poky/scripts/runqemu-internal
@@ -393,7 +393,8 @@ if [ "$MACHINE" = "palmetto" ]; then
     MACHINE_SUBTYPE=palmetto-bmc
     export QEMU_AUDIO_DRV="none"
     KERNCMDLINE="console=ttyS4"
-    QEMUOPTIONS="$QEMU_NETWORK_CMD -M ${MACHINE_SUBTYPE} -initrd $ROOTFS -no-reboot -nographic"
+    KERNELDTB=${DEPLOY_DIR_IMAGE}/${PALMETTO_DEFAULT_KERNEL}-aspeed-bmc-opp-qemu${MACHINE}.dtb
+    QEMUOPTIONS="$QEMU_NETWORK_CMD -M ${MACHINE_SUBTYPE} -dtb $KERNELDTB -initrd $ROOTFS -no-reboot -nographic"
 fi
 
 if [ "$MACHINE" = "qemuarm64" ]; then
-- 
2.5.0
