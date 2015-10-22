Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id DAA3D1A0965
 for <openbmc@lists.ozlabs.org>; Fri, 23 Oct 2015 08:31:31 +1100 (AEDT)
Received: from localhost (32.97.110.52 [32.97.110.52]) by mx.zohomail.com
 with SMTPS id 1445549484725371.52471644480465;
 Thu, 22 Oct 2015 14:31:24 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc 3/4] Point Barreleye at Palmetto configs
Date: Thu, 22 Oct 2015 16:31:15 -0500
Message-Id: <1445549476-2786-4-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1445549476-2786-1-git-send-email-patches@stwcx.xyz>
References: <1445549476-2786-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 22 Oct 2015 21:31:32 -0000

From: Brad Bishop <bradleyb@us.ibm.com>

Until there is a proper device tree.
---
 .../meta-foxconn/meta-barreleye/conf/machine/barreleye.conf           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-openbmc-machines/meta-openpower/meta-foxconn/meta-barreleye/conf/machine/barreleye.conf b/meta-openbmc-machines/meta-openpower/meta-foxconn/meta-barreleye/conf/machine/barreleye.conf
index f3da811..3ab8bb0 100644
--- a/meta-openbmc-machines/meta-openpower/meta-foxconn/meta-barreleye/conf/machine/barreleye.conf
+++ b/meta-openbmc-machines/meta-openpower/meta-foxconn/meta-barreleye/conf/machine/barreleye.conf
@@ -1,11 +1,11 @@
 KMACHINE = "aspeed"
-KERNEL_DEVICETREE = "${KMACHINE}-bmc-opp-${MACHINE}.dtb"
+KERNEL_DEVICETREE = "${KMACHINE}-bmc-opp-palmetto.dtb"
 
 require conf/machine/include/ast2400.inc
 require conf/machine/include/obmc-bsp-common.inc
 require conf/machine/include/foxconn.inc
 
-UBOOT_MACHINE_barreleye = "barreleye_config"
+UBOOT_MACHINE_barreleye = "palmetto_config"
 UBOOT_ENTRYPOINT = "0x40008000"
 UBOOT_LOADADDRESS = "0x40008000"
 
-- 
2.6.0
