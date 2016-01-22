Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3E25F1A0E9B
 for <openbmc@lists.ozlabs.org>; Fri, 22 Jan 2016 14:50:33 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1453434629138480.19156433824605;
 Thu, 21 Jan 2016 19:50:29 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Cyril Bur <cyrilbur@gmail.com>
Subject: [PATCH linux 2/2] i2c: aspeed spin_lock_init() on cmd_lock
Date: Thu, 21 Jan 2016 21:50:27 -0600
Message-Id: <1453434627-22282-3-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1453434627-22282-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1453434627-22282-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 22 Jan 2016 03:50:33 -0000

From: Cyril Bur <cyrilbur@gmail.com>

---
 drivers/i2c/busses/i2c-aspeed.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
index 3b858d3..e4bf88a3 100644
--- a/drivers/i2c/busses/i2c-aspeed.c
+++ b/drivers/i2c/busses/i2c-aspeed.c
@@ -721,6 +721,7 @@ static int ast_i2c_probe_bus(struct platform_device *pdev)
 	}
 
 	/* Initialize the I2C adapter */
+	spin_lock_init(&bus->cmd_lock);
 	bus->adap.nr = bus_num;
 	bus->adap.owner = THIS_MODULE;
 	bus->adap.retries = 0;
-- 
2.6.4
