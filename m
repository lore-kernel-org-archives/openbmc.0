Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400e:c00::242; helo=mail-pf0-x242.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="betPhXx6"; 
 dkim-atps=neutral
Received: from mail-pf0-x242.google.com (mail-pf0-x242.google.com
 [IPv6:2607:f8b0:400e:c00::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xtlb66F1TzDrXZ
 for <openbmc@lists.ozlabs.org>; Fri, 15 Sep 2017 16:18:42 +1000 (AEST)
Received: by mail-pf0-x242.google.com with SMTP id h4so806740pfk.0
 for <openbmc@lists.ozlabs.org>; Thu, 14 Sep 2017 23:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id;
 bh=LAtvWNO5SNk/npc4IAzc87hnkPoLBst+hkJ2GX6hPdQ=;
 b=betPhXx6yMRlwiTz9Jy1kZHUxzdux3+1Pqk4a48pUAJ6kkDLrxUZlaZmQ1rODS4pQH
 hD+jd9UYz0i2uQOup6qI0lXCLe3jqU524U6hSIRMCA49dH+WCOcR4CdKRXAzUvEi7DOj
 PwP1UZ8ZzjIyHrNFYIFK6Gs+jpWCmrZaARiTtN8QLraFLjmgoWgGYlYK9UxUd3glKbGV
 DMaoBaHPGo8KagMp1KWCZBxoS7MIRa2lVX07tH5Rxrc/jUVHkgeSoVeL0aVbUzR0nnD2
 NxDoN3HFl6fIDBC3cMtgZSV7KBKyE1pnNwfGjGELhR4kc/Hkh9O/mrQuVUE1MbQ3oLWV
 NCew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
 bh=LAtvWNO5SNk/npc4IAzc87hnkPoLBst+hkJ2GX6hPdQ=;
 b=qoCTLUkPvljj0bzzuUZmf1Lou6YkE9y0vDRQ7lR/5WAqBWNcc97nePcgLRIjZhHCUA
 bUN7kr6CLzOMjGk/kU3IISiwPo/1aSacvrBX1utKKX7/x8lA9zF9VaINPXUcMpyvyWw6
 WQdHjufgYw31rzPkTefs4jaCKN+oh0WxJM3Z29Efc3ObcG4ruj1qgNA+PDRzXHDigVsH
 ZZzhQhW2ZH6r3akjr4PYqi0JuN3M/g6To3qtTLEL/xDLm4lDp7nRONSKCsxjIPBmsKYM
 8H7p85Ln6bF2SvviFMHuG+E4m0WiOZv8uHJURwlof4aAnBPHZtnn+PDT/HrzzCZ914oT
 rBww==
X-Gm-Message-State: AHPjjUhy9G13EAoXL3Jlxq0wh8JMQQQDkK5o7tOgbFSlHnoRrXt48riG
 0tqNddupYiSYyFvFntQ=
X-Google-Smtp-Source: ADKCNb5D6iUCbebwHmeuLdhAv7/fSxeVEE7HQzcEAcIKYjcQUM69XoOuheXJAJcOId9YaT1qvNCsHw==
X-Received: by 10.84.150.101 with SMTP id g92mr26959546plg.168.1505456320258; 
 Thu, 14 Sep 2017 23:18:40 -0700 (PDT)
Received: from aurora.jms.id.au ([203.0.153.9])
 by smtp.gmail.com with ESMTPSA id a29sm579770pgn.75.2017.09.14.23.18.36
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 14 Sep 2017 23:18:39 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
 Fri, 15 Sep 2017 15:48:32 +0930
From: Joel Stanley <joel@jms.id.au>
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Andrew Jeffery <andrew@aj.id.au>
Cc: openbmc@lists.ozlabs.org
Subject: [PATCH qemu] arm: aspeed: Add palmetto and evb EEPROM I2C devices
Date: Fri, 15 Sep 2017 15:48:30 +0930
Message-Id: <20170915061830.1527-1-joel@jms.id.au>
X-Mailer: git-send-email 2.14.1
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 15 Sep 2017 06:18:43 -0000

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 hw/arm/aspeed.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 9ef5fb3b6ddc..2f596959649a 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -253,6 +253,7 @@ static void aspeed_board_init(MachineState *machine,
 
 static void palmetto_bmc_i2c_init(AspeedBoardState *bmc)
 {
+    uint8_t *eeprom_buf = g_malloc0(256 * 1024);
     AspeedSoCState *soc = &bmc->soc;
     DeviceState *dev;
 
@@ -260,6 +261,13 @@ static void palmetto_bmc_i2c_init(AspeedBoardState *bmc)
      * enough to provide basic RTC features. Alarms will be missing */
     i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 0), "ds1338", 0x68);
 
+    /* 256KB EEPROM */
+    dev = qdev_create((BusState *) aspeed_i2c_get_bus(DEVICE(&soc->i2c), 0),
+                      "smbus-eeprom");
+    qdev_prop_set_uint8(dev, "address", 0x50);
+    qdev_prop_set_ptr(dev, "data", eeprom_buf);
+    qdev_init_nofail(dev);
+
     /* add a TMP423 temperature sensor */
     dev = i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 2),
                            "tmp423", 0x4c);
@@ -295,7 +303,15 @@ static const TypeInfo palmetto_bmc_type = {
 
 static void ast2500_evb_i2c_init(AspeedBoardState *bmc)
 {
+    uint8_t *eeprom_buf = g_malloc0(8 * 1024);
     AspeedSoCState *soc = &bmc->soc;
+    DeviceState *dev;
+
+    dev = qdev_create((BusState *) aspeed_i2c_get_bus(DEVICE(&soc->i2c), 3),
+                      "smbus-eeprom");
+    qdev_prop_set_uint8(dev, "address", 0x50);
+    qdev_prop_set_ptr(dev, "data", eeprom_buf);
+    qdev_init_nofail(dev);
 
     /* The AST2500 EVB expects a LM75 but a TMP105 is compatible */
     i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 7), "tmp105", 0x4d);
-- 
2.14.1
