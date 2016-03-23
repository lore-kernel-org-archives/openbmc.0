Return-Path: <andrew@aj.id.au>
Received: from homiemail-a13.g.dreamhost.com (sub3.mail.dreamhost.com
 [69.163.253.7])
 (using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qVMXC0xHpzDq72
 for <openbmc@lists.ozlabs.org>; Wed, 23 Mar 2016 19:03:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=gjwAS2bW; 
 dkim-atps=neutral
Received: from homiemail-a13.g.dreamhost.com (localhost [127.0.0.1])
 by homiemail-a13.g.dreamhost.com (Postfix) with ESMTP id 8DFE2334075
 for <openbmc@lists.ozlabs.org>; Wed, 23 Mar 2016 01:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=from:to
 :subject:date:message-id:in-reply-to:references; s=aj.id.au; bh=
 uFkdYhGuL7SuxJpM3sX4H/Q+Vy8=; b=gjwAS2bWVuZaABXRfpHWPDbwswtdO+QA
 I/Qczu0BuZbNSM31Y9RT2ymVdWkqUkDzAFpoWdjYsBAlmJasa8IYKQAOkN0TbyfE
 wor3sAe1oUZqUunPAVgJQgyoluy+XxmYVP6KjbOMsToZsfLpd/GFip1XdOGW8nzG
 JGHTBs6the4=
Received: from keelia.au.ibm.com (ppp203-122-213-247.static.internode.on.net
 [203.122.213.247])
 (using TLSv1 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: andrew@aj.id.au)
 by homiemail-a13.g.dreamhost.com (Postfix) with ESMTPSA id 2296F33406F
 for <openbmc@lists.ozlabs.org>; Wed, 23 Mar 2016 01:03:52 -0700 (PDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: OpenBMC <openbmc@lists.ozlabs.org>
Subject: [RFC PATCH openbmc v3 8/8] runqemu-internal: Configure tun/tap
 network for palmetto-bmc
Date: Wed, 23 Mar 2016 18:33:35 +1030
Message-Id: <1458720215-25302-9-git-send-email-andrew@aj.id.au>
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
X-List-Received-Date: Wed, 23 Mar 2016 08:03:55 -0000

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 yocto-poky/scripts/runqemu-internal | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/yocto-poky/scripts/runqemu-internal b/yocto-poky/scripts/runqemu-internal
index f461e9f..bdaea01 100755
--- a/yocto-poky/scripts/runqemu-internal
+++ b/yocto-poky/scripts/runqemu-internal
@@ -392,7 +392,10 @@ if [ "$MACHINE" = "palmetto" ]; then
     QEMU=qemu-system-arm
     MACHINE_SUBTYPE=palmetto-bmc
     export QEMU_AUDIO_DRV="none"
-    KERNCMDLINE="console=ttyS4"
+    if [ "$SLIRP_ENABLED" != "yes" ]; then
+        KERNEL_NETWORK_CMD=${KERNEL_NETWORK_CMD}"::eth0"
+    fi
+    KERNCMDLINE="console=ttyS4 $KERNEL_NETWORK_CMD mem=$QEMU_MEMORY highres=off"
     KERNELDTB=${DEPLOY_DIR_IMAGE}/${PALMETTO_DEFAULT_KERNEL}-aspeed-bmc-opp-qemu${MACHINE}.dtb
     QEMUOPTIONS="$QEMU_NETWORK_CMD -M ${MACHINE_SUBTYPE} -dtb $KERNELDTB -initrd $ROOTFS -no-reboot -nographic"
 fi
-- 
2.5.0
