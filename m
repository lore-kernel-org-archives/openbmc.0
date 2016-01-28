Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 54BCA1A1054
 for <openbmc@lists.ozlabs.org>; Fri, 29 Jan 2016 09:50:30 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1454021426199118.16761764112994;
 Thu, 28 Jan 2016 14:50:26 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: "Milton D. Miller II" <miltonm@us.ibm.com>,
 Milton Miller <miltonmm@us.ibm.com>
Subject: [PATCH openbmc 7/8] Hack to make fw_setenv work
Date: Thu, 28 Jan 2016 16:50:18 -0600
Message-Id: <1454021419-16743-8-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1454021419-16743-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1454021419-16743-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 28 Jan 2016 22:50:30 -0000

From: "Milton D. Miller II" <miltonm@us.ibm.com>

The fw_setenv is not working with the kernel mtd driver.  It works
on a plain flat file, and flashcp which is used in /update works.

Find the u-boot-env mtd, link it in run and copy the contents to a
plain file in /run during init.  In shutdown, check for the link,
the file having data, no current image update for the u-boot-env,
and that the content differs from the mtd via the link.  If all
are true create a symlink to the file and trigger the update.

Along wtih changing the fw_env.config this causes the fw_setenv
and fw_printenv utilities to set and update this cached file which
will be synced during a normal bmc reboot.  This will allow us to
set the ethaddr variable which already requires a reboot to activate.

Note: the links are directly in /run because the fw_{set,print}env
utilities limit the env file name to 16 characters.

Signed-off-by: Milton Miller <miltonmm@us.ibm.com>
---
 .../meta-ast2400/recipes-bsp/u-boot/files/fw_env.config            | 3 ++-
 .../recipes-phosphor/obmc-phosphor-initfs/files/obmc-init.sh       | 7 +++++++
 .../recipes-phosphor/obmc-phosphor-initfs/files/obmc-shutdown.sh   | 5 +++++
 3 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-bsp/u-boot/files/fw_env.config b/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-bsp/u-boot/files/fw_env.config
index fe09890..978e4d6 100644
--- a/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-bsp/u-boot/files/fw_env.config
+++ b/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-bsp/u-boot/files/fw_env.config
@@ -12,7 +12,8 @@
 
 # MTD SPI-dataflash example
 # MTD device name	Device offset	Env. size	Flash sector size	Number of sectors
-/dev/mtd2		0x00000		0x20000
+#/dev/mtd2		0x00000		0x20000
+/run/fw_env		0x00000		0x20000
 #/dev/mtd5		0x4200		0x4200
 #/dev/mtd6		0x4200		0x4200
 
diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-init.sh b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-init.sh
index 431780a..0dc4c35 100644
--- a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-init.sh
+++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-init.sh
@@ -29,6 +29,13 @@ findmtd() {
 	echo $m
 }
 
+env=$(findmtd u-boot-env)
+if test -n $env
+then
+	ln -s /dev/$env /run/mtd:u-boot-env
+	cp /run/mtd:u-boot-env /run/fw_env
+fi
+
 rofs=$(findmtd rofs)
 rwfs=$(findmtd rwfs)
 
diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-shutdown.sh b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-shutdown.sh
index 029cd65..cc076fd 100644
--- a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-shutdown.sh
+++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-shutdown.sh
@@ -24,6 +24,11 @@ do
 done
 set +x
 
+if test -s /run/fw_env -a -c /run/mtd:u-boot-env -a ! -e /image-u-boot-env &&
+	! cmp /run/mtd:u-boot-env /run/fw_env
+then
+	ln -s /run/fw_env /image-u-boot-env
+fi
 
 if test -x /update && ls image-* > /dev/null 2>&1
 then
-- 
2.6.4
