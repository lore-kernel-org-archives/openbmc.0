Return-Path: <clg@kaod.org>
Received: from e06smtp16.uk.ibm.com (e06smtp16.uk.ibm.com [195.75.94.112])
 (using TLSv1.2 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r8S3849YzzDq5f
 for <openbmc@lists.ozlabs.org>; Wed, 18 May 2016 05:25:23 +1000 (AEST)
Received: from localhost
 by e06smtp16.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <clg@kaod.org>;
 Tue, 17 May 2016 20:25:19 +0100
Received: from d06dlp03.portsmouth.uk.ibm.com (9.149.20.15)
 by e06smtp16.uk.ibm.com (192.168.101.146) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Tue, 17 May 2016 20:25:17 +0100
X-IBM-Helo: d06dlp03.portsmouth.uk.ibm.com
X-IBM-MailFrom: clg@kaod.org
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by d06dlp03.portsmouth.uk.ibm.com (Postfix) with ESMTP id 7E78B1B08061
 for <openbmc@lists.ozlabs.org>; Tue, 17 May 2016 20:26:13 +0100 (BST)
Received: from d06av07.portsmouth.uk.ibm.com (d06av07.portsmouth.uk.ibm.com
 [9.149.37.248])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u4HJPHdF24707512
 for <openbmc@lists.ozlabs.org>; Tue, 17 May 2016 19:25:17 GMT
Received: from d06av07.portsmouth.uk.ibm.com (localhost [127.0.0.1])
 by d06av07.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u4HJPG18017770
 for <openbmc@lists.ozlabs.org>; Tue, 17 May 2016 15:25:17 -0400
Received: from smtp.lab.toulouse-stg.fr.ibm.com
 (srv01.lab.toulouse-stg.fr.ibm.com [9.101.4.1])
 by d06av07.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u4HJPGCO017767; Tue, 17 May 2016 15:25:16 -0400
Received: from hermes.ibm.com (icon-9-164-165-196.megacenter.de.ibm.com
 [9.164.165.196])
 by smtp.lab.toulouse-stg.fr.ibm.com (Postfix) with ESMTP id 40589220447;
 Tue, 17 May 2016 21:25:16 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH qemu 2/3] ast2400: add a rtc device on I2C bus 0
Date: Tue, 17 May 2016 21:25:01 +0200
Message-Id: <1463513102-14135-3-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1463513102-14135-1-git-send-email-clg@kaod.org>
References: <1463513102-14135-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16051719-0025-0000-0000-0000183C0C7A
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
X-Mailman-Approved-At: Wed, 18 May 2016 23:12:54 +1000
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 17 May 2016 19:25:25 -0000

The palmetto platform has a ds3231 RTC device but not qemu. Let's use
a ds1338 instead.

The aspeed-bmc-opp-palmetto dts file needs to be changed consequently
with :

	rtc@68 {
		compatible = "dallas,ds1338";
		reg = <0x68>;
	};

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/arm/ast2400.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/arm/ast2400.c b/hw/arm/ast2400.c
index 4576e67cd483..41bfc74493fa 100644
--- a/hw/arm/ast2400.c
+++ b/hw/arm/ast2400.c
@@ -159,6 +159,8 @@ static void ast2400_realize(DeviceState *dev, Error **errp)
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->i2c), 0, AST2400_I2C_BASE);
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->i2c), 0,
                        qdev_get_gpio_in(DEVICE(&s->vic), 12));
+
+    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&s->i2c), 0), "ds1338", 0x68);
 }
 
 static void ast2400_class_init(ObjectClass *oc, void *data)
-- 
2.1.4
