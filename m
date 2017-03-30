Return-Path: <austenc@us.ibm.com>
Received: from nm27-vm1.bullet.mail.bf1.yahoo.com
 (nm27-vm1.bullet.mail.bf1.yahoo.com [98.139.213.148])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vvJZQ3pDbzDqC4
 for <openbmc@lists.ozlabs.org>; Fri, 31 Mar 2017 09:04:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=yahoo.com header.i=@yahoo.com header.b="RxVR7Cxn"; 
 dkim-atps=neutral
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1490911467; bh=pTrLc1TSXSgMk0iTXTEWkkWtwahtBpUHrP69Ierd8Oc=;
 h=From:To:Cc:Subject:Date:From:Subject;
 b=RxVR7Cxn4iyiZdZhNEPOgHyDa26ZZrbCKzhbPOgpGa23MBbMfVfrsOytwZzx2lMF7uqEIW3q9ajber57RNwEpxLJwKR2J7uKjP+P6DyzJEznpLp2ahSeYM/C8lhZ5D/f6uQU156VEfCZNREZhuxwCFhMlpveFZ4ex4C286vVa/Jx481F8pSGIytOmmt6F4B3gCkT7jc5U60T/rVb9p/s1qXMojlr3NnzlQGPk5RQuV5X932IjwW9wZIJV/TTjRGu428RFD/jR4elZ/sy20h6nAYEdIBPBN40S3v8+DjJe+gTashcv0iPNKV8k/zOFruchTPiYTs7NdTUyfv8gQdr+w==
Received: from [98.139.170.178] by nm27.bullet.mail.bf1.yahoo.com with NNFMP;
 30 Mar 2017 22:04:27 -0000
Received: from [98.139.211.195] by tm21.bullet.mail.bf1.yahoo.com with NNFMP;
 30 Mar 2017 22:04:27 -0000
Received: from [127.0.0.1] by smtp204.mail.bf1.yahoo.com with NNFMP;
 30 Mar 2017 22:04:27 -0000
X-Yahoo-Newman-Id: 63674.80160.bm@smtp204.mail.bf1.yahoo.com
X-Yahoo-Newman-Property: ymail-3
X-YMail-OSG: VTY8.q8VM1lyPDbj__F4VtWTlZ7N6Yce8qYMk6ZB0254P5g
 6yD6WnPSaxWTidvBNq2mMPMw.lwMoHGsXkhyDB1fkmqzlDFcKi5GL4qrmLAa
 tSKVMp2qJGW1L81KcpyKb2hCqkA5HbLiTtNiex40a1EPwTS9genAujlBlYmj
 J0Ubl_7yLv4MuEoAOiQAkv8YDztKyj.a3rlXRfGuNE6gBslmdzKAj8Tqg.CE
 6vMXM5ivCILbNRHbclRVy8LGCQC_eHOo7WDAMpJCrbAdHU_5KN18n9YZ4J8b
 7wKGq60YBcdT2EavyShIW.D.r6TlgfAyM5uFme0_sTuT7qKCb36XNRP8pA7E
 K2.X_Gk70sFcMFDPWHaCCE3e9dhUYI7j68b_A5j9qHcac3AUDJn2lLDdgy41
 MZioa5mAh8NkbZjT0xCsWIqR15eFEX_nwpxGs6fUJoPztmwMaFpMH3QfS9VE
 f1uPOjoEy2ZuU.vur96uZdnKm9dPMq6aF89oeCTJLqQuCX5hltEk4IDTYT0B
 o0ivXLDfBjRGQtiQlNepQOcv4XaWzmaJlwao4t1yv094AJ_bBTA4.vz7Rukx Spg--
X-Yahoo-SMTP: kKQA4hiswBAsDtB7Rz5b18fkdN7u
From: Chris Austen <austenc@us.ibm.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au
Subject: [PATCH linux dev-4.7 1/1] ARM: dts: aspeed: Enable Garrison uart
Date: Thu, 30 Mar 2017 17:04:20 -0500
Message-Id: <1490911460-20581-1-git-send-email-austenc@us.ibm.com>
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
X-List-Received-Date: Thu, 30 Mar 2017 22:04:32 -0000

The dts did not turn on the debug port. This starts
to allow development of OpenBMC on the garrison system

Signed-off-by: Chris Austen <austenc@us.ibm.com>
---
 arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts b/arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts
index 639b8f8..d4bb77d 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts
@@ -64,6 +64,10 @@
 	};
 };
 
+&uart5 {
+	status = "okay";
+};
+
 &mac0 {
 	status = "okay";
 
-- 
2.7.4
