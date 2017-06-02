Return-Path: <austenc@us.ibm.com>
Received: from nm2-vm1.bullet.mail.bf1.yahoo.com
 (nm2-vm1.bullet.mail.bf1.yahoo.com [98.139.213.158])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wf4D84Dt6zDqKm
 for <openbmc@lists.ozlabs.org>; Fri,  2 Jun 2017 10:03:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=yahoo.com header.i=@yahoo.com header.b="R1GkAr8D"; 
 dkim-atps=neutral
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1496361781; bh=PktU/lOk/BbJvYd69PdG3smBUKSjyKOZOiUU2DX1Sj4=;
 h=From:To:Cc:Subject:Date:From:Subject;
 b=R1GkAr8DRKxmodgdW7lZXV49U4ZdTp+ttG/tKHcZxCB2uDbYIEwIZc2XckWYCBi2xIZA1kP9UMQrVwi1FlEQJ3LdRRA39NrguOVxw+nkJHOGUTUulapcOVTU5Agzuv9lpcgCvI/q+KW96cQwvaIFQHtowNrWgnp+e5IoIhrq3c/ycXt5lfx8HpfPrVjw3cvax44Fy391PzIPG7nHOsnPyQ4uxk3buz36/fJfAfBCWo1FOJDZh/qULMyJ+SJmo86zz5X9I1oD9++Wfhtl10q9efjR37Qpoq/MU0O4ISS1r7PkE2oY4mLS/ezGma8RAe/5OKyzPdXdKGvLENarl+JP8w==
Received: from [98.139.215.141] by nm2.bullet.mail.bf1.yahoo.com with NNFMP;
 02 Jun 2017 00:03:01 -0000
Received: from [68.142.230.76] by tm12.bullet.mail.bf1.yahoo.com with NNFMP;
 02 Jun 2017 00:03:01 -0000
Received: from [127.0.0.1] by smtp233.mail.bf1.yahoo.com with NNFMP;
 02 Jun 2017 00:03:01 -0000
X-Yahoo-Newman-Id: 58524.61822.bm@smtp233.mail.bf1.yahoo.com
X-Yahoo-Newman-Property: ymail-3
X-YMail-OSG: 47.lXxIVM1n4BAhv2URY__VNo5R_nU8LT78yVAhU2buwFu0
 KKfIKXcQ6BeFeON1Gdyqc4Nil51u7pYWzFw.0jaQBB7Vs65xw7lFR6_8Nm2D
 fAX9iW9h0t.iVCqpiK5jCCn6Bn33iItePU2ECXR6EZ4iTx5uJ8cxlQZnTfh0
 WFtA8yyPUsNt9mKt_DpBQdX084DRvtpl6W0ditzWL22jxIQS64LBd1BJ_btB
 HIqNVuSO2TBwChVt_H8wlTTWmFOJxgbfi_wPuGVeNBqcUC5iv.bJtkVwupTy
 DJQezoS7qr0EFNZVw0tQfAStxzI.q8UqKpFf6U.4FYEY18lSJyowOCWjLcmw
 W5VPMEznd85M1DNBB32mutX7._KWfCySo99BCfpekHabFnYMXk9w9fUPqlAp
 9E0_3uBTSzcv4F4vIAhANr9xlo.5_PGJFqkhb3bTAsE27oEqVAgWR_wfms1m
 mDC1kK_.1mGxBGYizHrlVjg6nxVyt5G7_zBCDni7cTTTHpWk9YbBf8VhNYWK
 E3zD6XAVFtCaFJ.9UXPnRTWt3sWIh6TOnximEOTeYrXBCIZfhjE4Z0OJW9ub _1IX1
X-Yahoo-SMTP: kKQA4hiswBAsDtB7Rz5b18fkdN7u
From: causten <austenc@us.ibm.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au
Subject: [PATCH linux dev-4.10 1/1] Add Romulus LEDs in to dts
Date: Thu,  1 Jun 2017 19:02:57 -0500
Message-Id: <1496361777-8390-1-git-send-email-austenc@us.ibm.com>
X-Mailer: git-send-email 2.7.4
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
X-List-Received-Date: Fri, 02 Jun 2017 00:03:05 -0000

Romulus has three LEDs that can be exposed.  Without them the
OpenBMC code can not operate them.

Signed-off-by: Chris Austen <austenc@us.ibm.com>
---
 arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
index e70fc00..7547b9e 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
@@ -31,6 +31,22 @@
 		};
 	};
 
+	leds {
+		compatible = "gpio-leds";
+
+		fault {
+			gpios = <&gpio ASPEED_GPIO(N, 2) GPIO_ACTIVE_LOW>;
+		};
+
+		identify {
+			gpios = <&gpio ASPEED_GPIO(N, 4) GPIO_ACTIVE_LOW>;
+		};
+
+		power {
+			gpios = <&gpio ASPEED_GPIO(R, 5) GPIO_ACTIVE_LOW>;
+		};
+	};
+
 	gpio-fsi {
 		compatible = "fsi-master-gpio", "fsi-master";
 
-- 
2.7.4
