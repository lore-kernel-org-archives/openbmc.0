Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.29; helo=out5-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="IEWo5nf8"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="RKLb31cw"; dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zhwlG27Z1zF124
 for <openbmc@lists.ozlabs.org>; Thu, 15 Feb 2018 23:37:14 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id D484120DEB;
 Thu, 15 Feb 2018 07:37:11 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Thu, 15 Feb 2018 07:37:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=iiFnLb7vrX3JXIETd
 6DZzkORG+fs3eRgdOLmMKNWMxA=; b=IEWo5nf8NMPASFPZ//J12eRmkhCT6HTjX
 KQ4lbAumr+7MtENVhBtnR7OIlCSpqysf23FujCpM6Bg89jj48kfgqIL9JkdmdDmO
 6HZHInM3z4nC7xw5061d/QFJ+YwfDvlIhVBGCvfoy4a/KbCQjLwcGLwl6MRwbeDP
 cyJBdT3kpDcssxN8k9z7bU6lCuyosSZibl71ymLzJ34YEUfDeUta5DbgQava5FSn
 GXkfJOiiJYwC5rfA/ulwwrPhMSXbr10v+4JnEAMmi/q0Q/gcvBIw7ODrh1yrZHyz
 629yzfUnVt1MKEjzvYIdBSvo7QfKI1yd69ueDOH80LZorjOu/SFHA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=iiFnLb7vrX3JXIETd6DZzkORG+fs3eRgdOLmMKNWMxA=; b=RKLb31cw
 gyh6+9beJzE0weYyl2DEBYjRFcoVVRGKh8uR2VWnlnbt6NwGGv+ZmjY9fS2WkYG/
 oU0ioF20qiRsAti7mtDZqCJh8DMUid2CVV0NWl6fEuULn5Zn9ZvsLoGB+J9tMP+7
 6dnuQBcoF2kPMDG75dlxxSlLT/toMXEAPhrOwZLR8b9U5riQhjE/YkqMz7Nk8jGt
 xAtyYAAEs0K3DwMmrWrNXCiT9d1YLTBqf/a/kwJy8nauYlNKbH0CXDsPjzPCkd6e
 /bhyF9CZ5qJMuWPZCH35Poz6uAuaLPqlGepaf5JWaKdM6O0ZepF7H+PQO+HvWGiK
 0VbCS6i+ffdaZQ==
X-ME-Sender: <xms:936FWg2472kii8awaRL8DtCQLjHjTQsDOw1oKgIav2JaoVvSbKiYbw>
Received: from dave.aj.id.au (ppp118-210-154-2.bras1.adl6.internode.on.net
 [118.210.154.2])
 by mail.messagingengine.com (Postfix) with ESMTPA id 2C77B7E1DE;
 Thu, 15 Feb 2018 07:37:08 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au, jk@ozlabs.org, eajames@linux.vnet.ibm.com,
 bradleyb@fuzziesquirrel.com, cbostic@linux.vnet.ibm.com
Cc: Andrew Jeffery <andrew@aj.id.au>,
	openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.10 13/16] Revert "drivers/fsi: GPIO stability
 changes for Cronus/Hostboot"
Date: Thu, 15 Feb 2018 23:06:03 +1030
Message-Id: <20180215123606.25777-14-andrew@aj.id.au>
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
X-List-Received-Date: Thu, 15 Feb 2018 12:37:15 -0000

This reverts commit cecf390c294cd6cf1080ed45cf0966691879750d.

The cost of reading OCC hwmon attributes is reduced by roughly 50%[0] when we
do not incur large delays between cycles in the FSI GPIO master. No impact was
observed on the stability of Hostboot by reverting the delays, though
admittedly it was not tested with Cronus.

[0] Down from ~0.5 to ~0.25 seconds

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/fsi/fsi-master-gpio.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/fsi/fsi-master-gpio.c b/drivers/fsi/fsi-master-gpio.c
index 3d31e50269fe..485ecb88b115 100644
--- a/drivers/fsi/fsi-master-gpio.c
+++ b/drivers/fsi/fsi-master-gpio.c
@@ -15,7 +15,7 @@
 
 #include "fsi-master.h"
 
-#define	FSI_GPIO_STD_DLY	3	/* Standard pin delay in uS */
+#define	FSI_GPIO_STD_DLY	1	/* Standard pin delay in nS */
 #define	FSI_ECHO_DELAY_CLOCKS	16	/* Number clocks for echo delay */
 #define	FSI_PRE_BREAK_CLOCKS	50	/* Number clocks to prep for break */
 #define	FSI_BREAK_CLOCKS	256	/* Number of clocks to issue break */
@@ -78,10 +78,10 @@ static void clock_toggle(struct fsi_master_gpio *master, int count)
 	int i;
 
 	for (i = 0; i < count; i++) {
+		ndelay(FSI_GPIO_STD_DLY);
 		gpiod_set_value(master->gpio_clk, 0);
-		udelay(FSI_GPIO_STD_DLY);
+		ndelay(FSI_GPIO_STD_DLY);
 		gpiod_set_value(master->gpio_clk, 1);
-		udelay(FSI_GPIO_STD_DLY);
 	}
 }
 
@@ -89,6 +89,7 @@ static int sda_in(struct fsi_master_gpio *master)
 {
 	int in;
 
+	ndelay(FSI_GPIO_STD_DLY);
 	in = gpiod_get_value(master->gpio_data);
 	return in ? 1 : 0;
 }
-- 
2.14.1
