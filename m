Return-Path: <joel.stan@gmail.com>
Received: from mail-pg0-x243.google.com (mail-pg0-x243.google.com
 [IPv6:2607:f8b0:400e:c05::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wylf92HljzDr4V
 for <openbmc@lists.ozlabs.org>; Thu, 29 Jun 2017 13:34:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="exsYVjRs"; 
 dkim-atps=neutral
Received: by mail-pg0-x243.google.com with SMTP id u36so10288018pgn.3
 for <openbmc@lists.ozlabs.org>; Wed, 28 Jun 2017 20:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id;
 bh=KQvfwuutIqPc+0S26hEZgJJBSUXJfI22DQTx6lBRnws=;
 b=exsYVjRsIhWhlmrq9WQWwG2mCwlLUQa5p39D7feeav6vVmEJEWwOXoiQiwt/qkSHvY
 DU5GOJtGRCBjwmU/blfJEmqWCXOCd2dLskMye1iQxKPkbHj+95NzLrezEMnvez2RCM34
 l+arStDtDUxkAcOUPTWm4rP9A/JcGRWXLdkJS6ZsbURjh1u7vlcsglGzl4qbMLEyP9eG
 NvEbRjbGu5ul9iGmHuJHXpEPCk82JBth7FPmgjcE/8atvINCuDD9ZtS36By+ZiCKjXor
 wA6iGP+nmb0H2KQ3gIsUKQW1pfXCPJQega0XqaaSs6v+KsOTbp1zv67PgFiyVNiddUGp
 EDkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
 bh=KQvfwuutIqPc+0S26hEZgJJBSUXJfI22DQTx6lBRnws=;
 b=hq6Z6tsrPtE17XB3f5+/Sa5Z8qQ9r0rs4a6ut5Ruq2q2qRz6DMYaONnukiqoWUwpyE
 1XSHGYxzWPsdAag1O4wl1KPPjnkdmgmuzWGeB+8h48O+yxvtEtkBPmhDjfQDmultEEMr
 4TbumawrJvGtBoUKk6SUYP4POb1T9XddElGM6I1mle3Vgro/1VVxnrCu+Z2RAoMoSHX5
 OHpDg8ia1HelyrnUEgpKqOlK4gJPddDZTIxbECmSvuSGm6d21zKYcaeUa7uMw5bHxcL9
 At3YVf3iOHxtTaDVRXEOEEZHAbWe58U/cYH5IwE6wd7twxWSgaH2O5otTiC5rkOSB/Cu
 8z0w==
X-Gm-Message-State: AKS2vOzm9k33T8iRr/p/b3AAzWYY2XUt2J7w245T4U/e7SbiuuFy/l8F
 MRpvx45lBnqBNi2luTQ=
X-Received: by 10.101.75.199 with SMTP id p7mr13588895pgr.164.1498707295024;
 Wed, 28 Jun 2017 20:34:55 -0700 (PDT)
Received: from aurora.jms.id.au ([203.0.153.9])
 by smtp.gmail.com with ESMTPSA id u2sm9188339pgn.28.2017.06.28.20.34.51
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Wed, 28 Jun 2017 20:34:54 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
 Thu, 29 Jun 2017 13:04:47 +0930
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org
Cc: Sweta Potthuri <spotthur@in.ibm.com>,
 Adi Gangidi <adi.gangidi@rackspace.com>
Subject: [PATCH linux dev-4.10] ARM: dts: aspeed: barreleye: Correct bad LED
 nodes
Date: Thu, 29 Jun 2017 13:04:46 +0930
Message-Id: <20170629033446.10782-1-joel@jms.id.au>
X-Mailer: git-send-email 2.13.2
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 29 Jun 2017 03:34:58 -0000

There was a bug in the definition of the heartbeat LED that meant we
were selecting the wrong GPIO for the driver. This fails now that we
have the correct pinmux settings for the Ethernet MAC.

When looking at the schematic for the correct number I found that the
other LEDs were mislabeled, and in the case of the power LED not
present at all.

Finally, the keep property is reinstated. This was present in an older
version of the dts as it is the required behaviour.

The LEDs are now accurate according to the Ingrasys document
0101DAW00-000-G, dated Wednesday, April 20, 2016, rev A00. The file
name is BARRELEYE-IO_BOARD-MP-HW-SCH-A00_20160419_FINAL.pdf

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts b/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
index e4e853d0f561..2060831e579c 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
@@ -34,16 +34,28 @@
 	leds {
 		compatible = "gpio-leds";
 
+		/* BMC_HEARTBRAT_LED_N */
 		heartbeat {
-			gpios = <&gpio ASPEED_GPIO(R, 17) GPIO_ACTIVE_HIGH>;
+			gpios = <&gpio ASPEED_GPIO(R, 4) GPIO_ACTIVE_LOW>;
+			default-state = "keep";
 		};
 
+		/* BMC_SYS_PWROK_IDLED_N */
 		identify {
-			gpios = <&gpio ASPEED_GPIO(R, 2) GPIO_ACTIVE_LOW>;
+			gpios = <&gpio ASPEED_GPIO(H, 2) GPIO_ACTIVE_LOW>;
+			default-state = "keep";
 		};
 
+		/* BMC_BEEP */
 		beep {
 			gpios = <&gpio ASPEED_GPIO(N, 7) GPIO_ACTIVE_HIGH>;
+			default-state = "keep";
+		};
+
+		/* BMC_PWR_LED_N */
+		power {
+			gpios = <&gpio ASPEED_GPIO(R, 5) GPIO_ACTIVE_LOW>;
+			default-state = "keep";
 		};
 	};
 };
-- 
2.13.2
