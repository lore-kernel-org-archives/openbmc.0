Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 32B181A0BFD
 for <openbmc@lists.ozlabs.org>; Fri, 30 Oct 2015 06:16:26 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1446146181163715.2067670252679;
 Thu, 29 Oct 2015 12:16:21 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@us.ibm.com>
Subject: [PATCH openbmc 1/2] Turn off debug kernel debug output by default
Date: Thu, 29 Oct 2015 14:16:16 -0500
Message-Id: <1446146177-30186-2-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1446146177-30186-1-git-send-email-patches@stwcx.xyz>
References: <1446146177-30186-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 29 Oct 2015 19:16:26 -0000

From: Brad Bishop <bradleyb@us.ibm.com>

---
 .../recipes-bsp/u-boot/files/patch-2013.07/0001-u-boot-openbmc.patch    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-bsp/u-boot/files/patch-2013.07/0001-u-boot-openbmc.patch b/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-bsp/u-boot/files/patch-2013.07/0001-u-boot-openbmc.patch
index 1c1c5ea..f34ef22 100644
--- a/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-bsp/u-boot/files/patch-2013.07/0001-u-boot-openbmc.patch
+++ b/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-bsp/u-boot/files/patch-2013.07/0001-u-boot-openbmc.patch
@@ -1679,7 +1679,7 @@ index 0000000..6bb7639
 +#define CONFIG_CMDLINE_TAG	 1		/* enable passing of ATAGs	*/
 +#define CONFIG_SETUP_MEMORY_TAGS 1
 +#define CONFIG_INITRD_TAG	 1
-+#define	CONFIG_BOOTARGS 	"debug console=ttyS4,38400n8 root=/dev/ram rw"
++#define	CONFIG_BOOTARGS 	"console=ttyS4,38400n8 root=/dev/ram rw"
 +#define CONFIG_UPDATE           "tftp 40800000 ast2400.scr; so 40800000'"
 +
 +#define CONFIG_BOOTDELAY	3		/* autoboot after 3 seconds	*/
-- 
2.6.0
