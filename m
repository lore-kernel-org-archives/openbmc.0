Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3F0E71A064D
 for <openbmc@lists.ozlabs.org>; Fri, 16 Oct 2015 23:20:54 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 144499805146446.25178951779776;
 Fri, 16 Oct 2015 05:20:51 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc 2/2] u-boot: Fix u-boot default bootargs for console
Date: Fri, 16 Oct 2015 07:20:46 -0500
Message-Id: <1444998046-17813-3-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1444998046-17813-1-git-send-email-patches@stwcx.xyz>
References: <1444998046-17813-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 16 Oct 2015 12:20:54 -0000

From: Jeremy Kerr <jk@ozlabs.org>

We want ttyS4 for the palmetto BMC, and use the same baud rate as u-boot.

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
---
 .../recipes-bsp/u-boot/files/patch-2013.07/0001-u-boot-openbmc.patch    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/recipes-bsp/u-boot/files/patch-2013.07/0001-u-boot-openbmc.patch b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/recipes-bsp/u-boot/files/patch-2013.07/0001-u-boot-openbmc.patch
index bf77686..1c1c5ea 100644
--- a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/recipes-bsp/u-boot/files/patch-2013.07/0001-u-boot-openbmc.patch
+++ b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/recipes-bsp/u-boot/files/patch-2013.07/0001-u-boot-openbmc.patch
@@ -1679,7 +1679,7 @@ index 0000000..6bb7639
 +#define CONFIG_CMDLINE_TAG	 1		/* enable passing of ATAGs	*/
 +#define CONFIG_SETUP_MEMORY_TAGS 1
 +#define CONFIG_INITRD_TAG	 1
-+#define	CONFIG_BOOTARGS 	"debug console=ttyS0,57600n8 root=/dev/ram rw"
++#define	CONFIG_BOOTARGS 	"debug console=ttyS4,38400n8 root=/dev/ram rw"
 +#define CONFIG_UPDATE           "tftp 40800000 ast2400.scr; so 40800000'"
 +
 +#define CONFIG_BOOTDELAY	3		/* autoboot after 3 seconds	*/
-- 
2.6.0
