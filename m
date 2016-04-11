Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qjr7S22yNzDqZJ
 for <openbmc@lists.ozlabs.org>; Mon, 11 Apr 2016 10:10:43 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1460333442009919.551684725406;
 Sun, 10 Apr 2016 17:10:42 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc 7/7] runqemu-internal: Configure tun/tap network for
 palmetto-bmc
Date: Sun, 10 Apr 2016 19:10:31 -0500
Message-Id: <1460333431-28399-8-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1460333431-28399-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1460333431-28399-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 11 Apr 2016 00:10:44 -0000

From: Andrew Jeffery <andrew@aj.id.au>

The palmetto-bmc QEMU machine can now be invoked with tun/tap network
support through Poky's `runqemu` script:

    $ bitbake obmc-phosphor-image
    $ runqemu palmetto

Note that this requires root for tun/tap configuration, however the
benefit is full network access with no port-forwarding required to
reach services running inside the VM.

When running in tun/tap mode, the IP address for the VM is 192.168.7.2.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 yocto-poky/scripts/runqemu-internal | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/yocto-poky/scripts/runqemu-internal b/yocto-poky/scripts/runqemu-internal
index 78b19c1..228301c 100755
--- a/yocto-poky/scripts/runqemu-internal
+++ b/yocto-poky/scripts/runqemu-internal
@@ -378,7 +378,10 @@ if [ "$MACHINE" = "palmetto" ]; then
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
2.7.1
