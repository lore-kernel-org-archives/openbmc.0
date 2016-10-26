Return-Path: <chris@distroguy.com>
Received: from mx-out03.mykolab.com (mx.kolabnow.com [95.128.36.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t3gl12xjQzDvNJ
 for <openbmc@lists.ozlabs.org>; Wed, 26 Oct 2016 17:55:25 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at kolabnow.com
X-Spam-Flag: NO
X-Spam-Score: -2.9
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 tagged_above=-10 required=6.31
 tests=[ALL_TRUSTED=-1, BAYES_00=-1.9] autolearn=ham
Received: from mx03.mykolab.com (mx03.mykolab.com [10.20.7.101])
 by mx-out03.mykolab.com (Postfix) with ESMTPS id 56FDC21A3B;
 Wed, 26 Oct 2016 08:55:20 +0200 (CEST)
Date: Wed, 26 Oct 2016 17:55:14 +1100
From: Chris Smart <chris@distroguy.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH v2] ARM: dts: witherspoon: add Epson RX8900CE RTC module
Message-ID: <20161026065509.GA10287@distroguy.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
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
X-List-Received-Date: Wed, 26 Oct 2016 06:55:25 -0000

This commit adds the relevant device tree entry for the Epson RX8900CE
RTC module on the I2C bus.

Note that there are two options that we may need to set.

If there is no connected battery:
 epson,vdet-disable;

If there is no trickle charge diode:
 epson,vdet-disable;

These are currently left commented out in the commit.

Signed-off-by: Chris Smart <chris@distroguy.com>
---

Changes since v1:
	- fixed up the entry for rtc@32

 arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
index 328a9c4e189e..19a91a207530 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
@@ -148,7 +148,19 @@
 
 	/* TPM */
 	/* 9552 */
+
 	/* RTC */
+	rtc@32 {
+		compatible = "epson,rx8900"
+		reg = <0x32>;
+		/*
+		 * If no battery, set this:
+		 * epson,vdet-disable;
+		 * If no trickle charge diode, set this:
+		 * epson,vdet-disable;
+		 */
+	};
+
 	/* EEPROM */
 
 	eeprom@51 {
-- 
2.9.3
