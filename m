Return-Path: <clg@kaod.org>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kaod.org
 (client-ip=46.105.52.162; helo=2.mo68.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
Received: from 2.mo68.mail-out.ovh.net (2.mo68.mail-out.ovh.net
 [46.105.52.162])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42WgZx2cZpzF3Rc
 for <openbmc@lists.ozlabs.org>; Fri, 12 Oct 2018 19:13:44 +1100 (AEDT)
Received: from player728.ha.ovh.net (unknown [10.109.143.220])
 by mo68.mail-out.ovh.net (Postfix) with ESMTP id F040210039E
 for <openbmc@lists.ozlabs.org>; Fri, 12 Oct 2018 10:07:41 +0200 (CEST)
Received: from zorba.kaod.org.com (LFbn-1-10605-110.w90-89.abo.wanadoo.fr
 [90.89.196.110]) (Authenticated sender: clg@kaod.org)
 by player728.ha.ovh.net (Postfix) with ESMTPSA id F06195400CA;
 Fri, 12 Oct 2018 10:07:36 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Cc: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH linux dev-4.18] /dev/mem: add a devmem kernel parameter to
 activate the device
Date: Fri, 12 Oct 2018 10:07:23 +0200
Message-Id: <20181012080723.15825-1-clg@kaod.org>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 6218345188294626050
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedtkedrvddtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 12 Oct 2018 08:13:45 -0000

For security reasons, some configuration needs to run without /dev/mem
but on some occasions, to debug HW for instance, it's still useful to
be able to reboot the system with access to physical memory.

Add a kernel parameter which activates the /dev/mem device only when
'mem.devmem' is enabled.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 drivers/char/mem.c                              | 12 ++++++++++++
 Documentation/admin-guide/kernel-parameters.txt |  3 +++
 drivers/char/Kconfig                            |  9 +++++++++
 3 files changed, 24 insertions(+)

diff --git a/drivers/char/mem.c b/drivers/char/mem.c
index df66a9dd0aae..8c021a559e6c 100644
--- a/drivers/char/mem.c
+++ b/drivers/char/mem.c
@@ -10,6 +10,7 @@
  */
 
 #include <linux/mm.h>
+#include <linux/moduleparam.h>
 #include <linux/miscdevice.h>
 #include <linux/slab.h>
 #include <linux/vmalloc.h>
@@ -36,6 +37,7 @@
 # include <linux/efi.h>
 #endif
 
+#define DEVMEM_MINOR	1
 #define DEVPORT_MINOR	4
 
 static inline unsigned long size_inside_page(unsigned long start,
@@ -912,6 +914,12 @@ static char *mem_devnode(struct device *dev, umode_t *mode)
 	return NULL;
 }
 
+#ifdef CONFIG_DEVMEM_BOOTPARAM
+static bool devmem;
+module_param(devmem, bool, 0444);
+MODULE_PARM_DESC(devmem, "kernel parameter to activate /dev/mem");
+#endif
+
 static struct class *mem_class;
 
 static int __init chr_dev_init(void)
@@ -930,6 +938,10 @@ static int __init chr_dev_init(void)
 		if (!devlist[minor].name)
 			continue;
 
+#ifdef CONFIG_DEVMEM_BOOTPARAM
+		if (minor == DEVMEM_MINOR && !devmem)
+			continue;
+#endif
 		/*
 		 * Create /dev/port?
 		 */
diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 1370b424a453..a8ed12d0d678 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -2402,6 +2402,9 @@
 			deep    - Suspend-To-RAM or equivalent (if supported)
 			See Documentation/admin-guide/pm/sleep-states.rst.
 
+	mem.devmem=	Activate the /dev/mem device
+			Format: <bool>  (1/Y/y=enable, 0/N/n=disable)
+
 	meye.*=		[HW] Set MotionEye Camera parameters
 			See Documentation/media/v4l-drivers/meye.rst.
 
diff --git a/drivers/char/Kconfig b/drivers/char/Kconfig
index 212f447938ae..08c56148190b 100644
--- a/drivers/char/Kconfig
+++ b/drivers/char/Kconfig
@@ -16,6 +16,15 @@ config DEVMEM
 	  memory.
 	  When in doubt, say "Y".
 
+config DEVMEM_BOOTPARAM
+	bool "mem.devmem boot parameter"
+	depends on DEVMEM
+	default n
+	help
+	  This option adds a 'mem.devmem' kernel parameter which activates
+	  the /dev/mem device when enabled.
+	  When in doubt, say "N".
+
 config DEVKMEM
 	bool "/dev/kmem virtual device support"
 	# On arm64, VMALLOC_START < PAGE_OFFSET, which confuses kmem read/write
-- 
2.17.1
