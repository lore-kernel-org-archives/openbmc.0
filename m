Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.29; helo=out5-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="aHPeYkS6"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="OA8Zon6Y"; dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zhwlS20YxzF1Fl
 for <openbmc@lists.ozlabs.org>; Thu, 15 Feb 2018 23:37:17 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 0E6CD20E5E;
 Thu, 15 Feb 2018 07:37:15 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Thu, 15 Feb 2018 07:37:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=N+YqcQDRNpvq1plL5
 5YiFpFafTUw0VhglDYmOZerR5o=; b=aHPeYkS6tCKqjX+34NJLF4j5WxYlU4lCr
 f3yDYKnWUdZQJrz6b9aSVRljeecEjkDLsSuymryzX+wqiwVas8HCVHJakQuNumIl
 +AddwFWxtWDX/jxeJpKk7gZi8Ihd+yMszlms75xnhmtd0I9f6UO7PFdhmtCY+PAX
 GP/a2pEDk3IBWHlUdQ+KipQmNRGMdg8jg5wp3JyfW909uW2wQN9nBu5k/1YVIzPt
 lvJHasldgRJ0KTGABX9xeGC90/wg4vE/yi23i3rPNsCp4XDSk8eVHX1g9vUJ9lnt
 cAddyGvGgPzdvn6OJqwdPzccolS0adC7a9NTfY1NsgMJf5PrhJ1AA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=N+YqcQDRNpvq1plL55YiFpFafTUw0VhglDYmOZerR5o=; b=OA8Zon6Y
 QFWxQk3c4iJcLIwXihqMJRslpiHZl6EmVP0KFZEWHWFz2Q6z4VOPMRV3MNtNpd5v
 9V2+kqCumF1EAt5vMt4dm0jhujw3PWNXsZnEghyCK0y5FtgQ4aJ6Fbnpe7jchPfF
 eOwcJkdA5GiUFqJdidLjFqYBvwHehRm09kJZUT5Mqe0EMyzxq1WSxz7vIy5Qp8LR
 31SCJn9+tz+JUMI4lisqfyi2/0cNevoYvAumUntOQxJZWwKQRBzblaVhjX/N+sr9
 vQ/r0nOU2UjLFuVkI0YamFZQTlRSEb5Uk97wsccjKtZdwkxMavGFs4c2LGyok8dO
 taUN1/4MnmE+gg==
X-ME-Sender: <xms:-n6FWmTSB9AHcy0w253imkEid64jwHwx3AmB7n-2BmZPBFiiiuoXxQ>
Received: from dave.aj.id.au (ppp118-210-154-2.bras1.adl6.internode.on.net
 [118.210.154.2])
 by mail.messagingengine.com (Postfix) with ESMTPA id 3E2E47E1DE;
 Thu, 15 Feb 2018 07:37:11 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au, jk@ozlabs.org, eajames@linux.vnet.ibm.com,
 bradleyb@fuzziesquirrel.com, cbostic@linux.vnet.ibm.com
Cc: openbmc@lists.ozlabs.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH linux dev-4.10 14/16] lib: Add crc4 module
Date: Thu, 15 Feb 2018 23:06:04 +1030
Message-Id: <20180215123606.25777-15-andrew@aj.id.au>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20180215123606.25777-1-andrew@aj.id.au>
References: <20180215123606.25777-1-andrew@aj.id.au>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 15 Feb 2018 12:37:25 -0000

From: Jeremy Kerr <jk@ozlabs.org>

Add a little helper for crc4 calculations. This works 4-bits-at-a-time,
using a simple table approach.

We will need this in the FSI core code, as well as any master
implementations that need to calculate CRCs in software.

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
Signed-off-by: Chris Bostic <cbostic@linux.vnet.ibm.com>
Signed-off-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
(cherry picked from commit 0cbaa44841db3d06d2a21ae4ab679882033f3dbe)
Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
(cherry picked from commit 0a91ec387692617d5f2fe46094b28c529595ff72)
---
 include/linux/crc4.h |  8 ++++++++
 lib/Kconfig          |  8 ++++++++
 lib/Makefile         |  1 +
 lib/crc4.c           | 46 ++++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 63 insertions(+)
 create mode 100644 include/linux/crc4.h
 create mode 100644 lib/crc4.c

diff --git a/include/linux/crc4.h b/include/linux/crc4.h
new file mode 100644
index 000000000000..8f739f1d794f
--- /dev/null
+++ b/include/linux/crc4.h
@@ -0,0 +1,8 @@
+#ifndef _LINUX_CRC4_H
+#define _LINUX_CRC4_H
+
+#include <linux/types.h>
+
+extern uint8_t crc4(uint8_t c, uint64_t x, int bits);
+
+#endif /* _LINUX_CRC4_H */
diff --git a/lib/Kconfig b/lib/Kconfig
index 260a80e313b9..bed5e61473ad 100644
--- a/lib/Kconfig
+++ b/lib/Kconfig
@@ -159,6 +159,14 @@ config CRC32_BIT
 
 endchoice
 
+config CRC4
+	tristate "CRC4 functions"
+	help
+	  This option is provided for the case where no in-kernel-tree
+	  modules require CRC4 functions, but a module built outside
+	  the kernel tree does. Such modules that use library CRC4
+	  functions require M here.
+
 config CRC7
 	tristate "CRC7 functions"
 	help
diff --git a/lib/Makefile b/lib/Makefile
index bc4073a8cd08..08f6fc8e1c61 100644
--- a/lib/Makefile
+++ b/lib/Makefile
@@ -90,6 +90,7 @@ obj-$(CONFIG_CRC16)	+= crc16.o
 obj-$(CONFIG_CRC_T10DIF)+= crc-t10dif.o
 obj-$(CONFIG_CRC_ITU_T)	+= crc-itu-t.o
 obj-$(CONFIG_CRC32)	+= crc32.o
+obj-$(CONFIG_CRC4)	+= crc4.o
 obj-$(CONFIG_CRC7)	+= crc7.o
 obj-$(CONFIG_LIBCRC32C)	+= libcrc32c.o
 obj-$(CONFIG_CRC8)	+= crc8.o
diff --git a/lib/crc4.c b/lib/crc4.c
new file mode 100644
index 000000000000..cf6db46661be
--- /dev/null
+++ b/lib/crc4.c
@@ -0,0 +1,46 @@
+/*
+ * crc4.c - simple crc-4 calculations.
+ *
+ * This source code is licensed under the GNU General Public License, Version
+ * 2. See the file COPYING for more details.
+ */
+
+#include <linux/crc4.h>
+#include <linux/module.h>
+
+static const uint8_t crc4_tab[] = {
+	0x0, 0x7, 0xe, 0x9, 0xb, 0xc, 0x5, 0x2,
+	0x1, 0x6, 0xf, 0x8, 0xa, 0xd, 0x4, 0x3,
+};
+
+/**
+ * crc4 - calculate the 4-bit crc of a value.
+ * @crc:  starting crc4
+ * @x:    value to checksum
+ * @bits: number of bits in @x to checksum
+ *
+ * Returns the crc4 value of @x, using polynomial 0b10111.
+ *
+ * The @x value is treated as left-aligned, and bits above @bits are ignored
+ * in the crc calculations.
+ */
+uint8_t crc4(uint8_t c, uint64_t x, int bits)
+{
+	int i;
+
+	/* mask off anything above the top bit */
+	x &= (1ull << bits) - 1;
+
+	/* Align to 4-bits */
+	bits = (bits + 3) & ~0x3;
+
+	/* Calculate crc4 over four-bit nibbles, starting at the MSbit */
+	for (i = bits - 4; i >= 0; i -= 4)
+		c = crc4_tab[c ^ ((x >> i) & 0xf)];
+
+	return c;
+}
+EXPORT_SYMBOL_GPL(crc4);
+
+MODULE_DESCRIPTION("CRC4 calculations");
+MODULE_LICENSE("GPL");
-- 
2.14.1
