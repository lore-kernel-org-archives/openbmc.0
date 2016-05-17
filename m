Return-Path: <clg@kaod.org>
Received: from e06smtp12.uk.ibm.com (e06smtp12.uk.ibm.com [195.75.94.108])
 (using TLSv1.2 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r8S3S0svYzDq6B
 for <openbmc@lists.ozlabs.org>; Wed, 18 May 2016 05:25:39 +1000 (AEST)
Received: from localhost
 by e06smtp12.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <clg@kaod.org>;
 Tue, 17 May 2016 20:25:36 +0100
Received: from d06dlp01.portsmouth.uk.ibm.com (9.149.20.13)
 by e06smtp12.uk.ibm.com (192.168.101.142) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Tue, 17 May 2016 20:25:18 +0100
X-IBM-Helo: d06dlp01.portsmouth.uk.ibm.com
X-IBM-MailFrom: clg@kaod.org
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by d06dlp01.portsmouth.uk.ibm.com (Postfix) with ESMTP id 50B2017D805D
 for <openbmc@lists.ozlabs.org>; Tue, 17 May 2016 20:26:18 +0100 (BST)
Received: from d06av10.portsmouth.uk.ibm.com (d06av10.portsmouth.uk.ibm.com
 [9.149.37.251])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u4HJPHXB18219496
 for <openbmc@lists.ozlabs.org>; Tue, 17 May 2016 19:25:17 GMT
Received: from d06av10.portsmouth.uk.ibm.com (localhost [127.0.0.1])
 by d06av10.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u4HIPJFZ025997
 for <openbmc@lists.ozlabs.org>; Tue, 17 May 2016 12:25:19 -0600
Received: from smtp.lab.toulouse-stg.fr.ibm.com
 (srv01.lab.toulouse-stg.fr.ibm.com [9.101.4.1])
 by d06av10.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u4HIPJmC025994; Tue, 17 May 2016 12:25:19 -0600
Received: from hermes.ibm.com (icon-9-164-165-196.megacenter.de.ibm.com
 [9.164.165.196])
 by smtp.lab.toulouse-stg.fr.ibm.com (Postfix) with ESMTP id B8192220531;
 Tue, 17 May 2016 21:25:16 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH qemu 3/3] ast2400: add a temp sensor device on I2C bus 3
Date: Tue, 17 May 2016 21:25:02 +0200
Message-Id: <1463513102-14135-4-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1463513102-14135-1-git-send-email-clg@kaod.org>
References: <1463513102-14135-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16051719-0009-0000-0000-0000181C0A2D
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
X-Mailman-Approved-At: Wed, 18 May 2016 23:12:55 +1000
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
X-List-Received-Date: Tue, 17 May 2016 19:25:41 -0000

The palmetto platform has a tmp421 device. Qemu has not (yet). Let's
use a tmp105 instead.

The aspeed-bmc-opp-palmetto dts file should to be changed consequently
with :

	i2c2: i2c-bus@c0 {
		tmp423@4c {
			compatible = "ti,tmp105";
			reg = <0x4c>;
		};
	};

Temperature can be changed from the monitor with :

	(qemu) qom-set /machine/unattached/device[2] temperature 12000

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/arm/ast2400.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/arm/ast2400.c b/hw/arm/ast2400.c
index 41bfc74493fa..d231d98a88e1 100644
--- a/hw/arm/ast2400.c
+++ b/hw/arm/ast2400.c
@@ -161,6 +161,9 @@ static void ast2400_realize(DeviceState *dev, Error **errp)
                        qdev_get_gpio_in(DEVICE(&s->vic), 12));
 
     i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&s->i2c), 0), "ds1338", 0x68);
+    dev = i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&s->i2c), 2),
+                           "tmp105", 0x4c);
+    object_property_set_int(OBJECT(dev), 25000, "temperature", &err);
 }
 
 static void ast2400_class_init(ObjectClass *oc, void *data)
-- 
2.1.4
