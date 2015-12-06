Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3EC511A01E7
 for <openbmc@lists.ozlabs.org>; Mon,  7 Dec 2015 02:40:31 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1449416427221346.5053857967391;
 Sun, 6 Dec 2015 07:40:27 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: adamliyi <adamliyi@msn.com>
Subject: [PATCH linux v2 0/3] Add BMC HWMON driver to kernel. Format patch
 based on Joel's comments.
Date: Sun,  6 Dec 2015 10:40:23 -0500
Message-Id: <1449416426-1683-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
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
X-List-Received-Date: Sun, 06 Dec 2015 15:40:32 -0000

Signed-off-by: adamliyi <adamliyi@msn.com>
 Add BMC HWMON driver to kernel. Format patch based on Joel's comments.

https://github.com/openbmc/linux/pull/22

Jeremy Kerr (1):
  gpio/aspeed: Use handler_data in aspeed_gpio_irq_handler.

adamliyi (2):
  Add BMC HWMON driver to kernel. Format patch based on Joel's comments.
  hwmon: Add occ_i2c HWMON driver     - Revise code based on comments
    from Jeremy Kerr <jk@ozlabs.org>.     - Add new HWMON attributes
    "update_interval" and "name".     - Change driver name form occ.c to
    occ_i2c.c

 Documentation/devicetree/bindings/hwmon/occ.txt |   14 +
 drivers/gpio/gpio-aspeed.c                      |    2 +-
 drivers/hwmon/Kconfig                           |   10 +
 drivers/hwmon/Makefile                          |    1 +
 drivers/hwmon/occ_i2c.c                         | 1315 +++++++++++++++++++++++
 5 files changed, 1341 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/hwmon/occ.txt
 create mode 100644 drivers/hwmon/occ_i2c.c

-- 
2.6.3
