Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 2ADFA1A0981
 for <openbmc@lists.ozlabs.org>; Wed, 14 Oct 2015 01:30:53 +1100 (AEDT)
Received: from localhost (32.97.110.55 [32.97.110.55]) by mx.zohomail.com
 with SMTPS id 14447466488791003.3678131999675;
 Tue, 13 Oct 2015 07:30:48 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc 3/3] Palmetto u-boot console fixes
Date: Tue, 13 Oct 2015 09:30:37 -0500
Message-Id: <1444746637-10175-4-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1444746637-10175-1-git-send-email-patches@stwcx.xyz>
References: <1444746637-10175-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 13 Oct 2015 14:30:55 -0000

From: Brad Bishop <bradleyb@us.ibm.com>

This provides a working uboot console.
---
 .../recipes-bsp/u-boot/files/patch-2013.07/0001-u-boot-openbmc.patch  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/recipes-bsp/u-boot/files/patch-2013.07/0001-u-boot-openbmc.patch b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/recipes-bsp/u-boot/files/patch-2013.07/0001-u-boot-openbmc.patch
index 834f371..bf77686 100644
--- a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/recipes-bsp/u-boot/files/patch-2013.07/0001-u-boot-openbmc.patch
+++ b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/recipes-bsp/u-boot/files/patch-2013.07/0001-u-boot-openbmc.patch
@@ -1842,8 +1842,8 @@ index 0000000..6bb7639
 +#define CONFIG_SYS_NS16550_COM2		0x1e784000
 +#define CONFIG_SYS_NS16550_COM3		0x1e78e000
 +#define	CONFIG_SYS_LOADS_BAUD_CHANGE
-+#define CONFIG_CONS_INDEX		3
-+#define CONFIG_BAUDRATE			57600
++#define CONFIG_CONS_INDEX		2
++#define CONFIG_BAUDRATE			38400
 +#define CONFIG_SYS_BAUDRATE_TABLE	{ 9600, 19200, 38400, 57600, 115200 }
 +#define CONFIG_ASPEED_COM 0x1e784000 // UART5
 +#define CONFIG_ASPEED_COM_IER (CONFIG_ASPEED_COM + 0x4)
-- 
2.6.0
