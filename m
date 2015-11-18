Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 9BFF01A04EB
 for <openbmc@lists.ozlabs.org>; Wed, 18 Nov 2015 18:00:27 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1447830023393847.343987524247;
 Tue, 17 Nov 2015 23:00:23 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc-build-scripts] kernel-build-script: fix creation of
 uImage
Date: Wed, 18 Nov 2015 02:00:21 -0500
Message-Id: <1447830021-25787-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1447830021-25787-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1447830021-25787-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 18 Nov 2015 07:00:28 -0000

From: Joel Stanley <joel@jms.id.au>

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 kernel-build-setup.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel-build-setup.sh b/kernel-build-setup.sh
index f1e082e..0565cf7 100755
--- a/kernel-build-setup.sh
+++ b/kernel-build-setup.sh
@@ -92,12 +92,12 @@ ARCH=arm CROSS_COMPILE=arm-linux-gnu- make -j 8
 # Build barreleye image
 ARCH=arm CROSS_COMPILE=arm-linux-gnu- make aspeed-bmc-opp-barreleye.dtb
 cat arch/arm/boot/zImage arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dtb > barreleye-zimage
-./scripts/mkuboot.sh -A arm -O linux -C none  -T kernel -a 0x40008000 -e 0x40008000 -d-e 0x40008000 -n obmc-beye-`date +%Y%m%d%H%M` -d aspeed-zimage uImage.barreleye
+./scripts/mkuboot.sh -A arm -O linux -C none  -T kernel -a 0x40008000 -e 0x40008000 -d-e 0x40008000 -n obmc-beye-`date +%Y%m%d%H%M` -d barreleye-zimage uImage.barreleye
 
 # build palmetto image
 ARCH=arm CROSS_COMPILE=arm-linux-gnu- make aspeed-bmc-opp-palmetto.dtb
 cat arch/arm/boot/zImage arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dtb > palmetto-zimage
-./scripts/mkuboot.sh -A arm -O linux -C none  -T kernel -a 0x40008000 -e 0x40008000 -d-e 0x40008000 -n obmc-palm-`date +%Y%m%d%H%M` -d aspeed-zimage uImage.palmetto
+./scripts/mkuboot.sh -A arm -O linux -C none  -T kernel -a 0x40008000 -e 0x40008000 -d-e 0x40008000 -n obmc-palm-`date +%Y%m%d%H%M` -d palmetto-zimage uImage.palmetto
 
 EOF_SCRIPT
 
-- 
2.6.3
