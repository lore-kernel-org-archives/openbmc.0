Return-Path: <austenc@us.ibm.com>
Received: from nm18-vm0.bullet.mail.bf1.yahoo.com
 (nm18-vm0.bullet.mail.bf1.yahoo.com [98.139.213.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xJLdJ2bdfzDrLR
 for <openbmc@lists.ozlabs.org>; Fri, 28 Jul 2017 04:50:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=yahoo.com header.i=@yahoo.com header.b="sp2j4y1/"; 
 dkim-atps=neutral
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1501181406; bh=pdjG8UlTlCHaqALfmrp5kcubf0+1XW1F6tGTFKmyNkg=;
 h=From:To:Cc:Subject:Date:From:Subject;
 b=sp2j4y1/ZrDP5SfpW54bVPvpAyQg0vAOMZfaxWEaCPUiudInlMxSEZddlgCQjz8Tol3V/Qm5hv0crscbuQtc1M6usrPJscvwDlEni1T5x+WFdVNWucinxcJug9tN5rnS0gHxAnIbR9oRUWwZ3JxHgXpiGwe1P6dakZMiqK8uGYFFCXzcqPV4GfTaBGH+h6zEc6BPalscw6QDHDjHdegLs0QKklFTShbWTbGazVQ20yd6FcVJwHrJa/IuZXe98LkMXtXuhMGh5ugQXQ1zx0C6MTnjHpkkDIo10zkQ2zO+fsIXiH3KsG+YUkaoIysGnrWrveerYvWiAuifi8arkLEXjw==
Received: from [66.196.81.174] by nm18.bullet.mail.bf1.yahoo.com with NNFMP;
 27 Jul 2017 18:50:06 -0000
Received: from [68.142.230.74] by tm20.bullet.mail.bf1.yahoo.com with NNFMP;
 27 Jul 2017 18:50:06 -0000
Received: from [127.0.0.1] by smtp231.mail.bf1.yahoo.com with NNFMP;
 27 Jul 2017 18:50:06 -0000
X-Yahoo-Newman-Id: 586222.83977.bm@smtp231.mail.bf1.yahoo.com
X-Yahoo-Newman-Property: ymail-3
X-YMail-OSG: c9xLhV4VM1m.CLznfLBPE9OETb3..8ub4LWXA9XzJJjiUvf
 Ca3GdNr8hpR78wp88eTs5gbajcCtY2DnUcD1_kVboatv4PXv1J3NqVCLPRUN
 DCoJHRtrSMoLCBoG0s6S4zUjxgMzcEmYJLjVrfH1K7YiokjY9dqA.gSSvxuJ
 t1_9k5BH7D42aUGagJB0OU.RpgcAWP6g2xLuFpKLBXAszyZKZ6OYrYLM8pC_
 wGfAs6gLsRbGNzzTmy01l2ENcbLZq1pLuTwLl6TXAQovATNsw30ARUWT.vpa
 o6uhf9Co88pMNXdUyESGWfu1lAJ2.nRy_FwCWN7rMQou6in3e0kvNCGTNM1S
 CUEDieKRfZCjEdY5QnuQu7nvLJ6IctSab6uqXnCZdXf_eRHOo7WolgojuyA8
 ITJP2uX1DjXt2nAnwZfbuDnqXxwR5TjIvD0y_sEhIejNjSzJeE2ve.kAfbAD
 gEwv.DI9KQJvq85s3zapRIr_y11GyMM6rVy6CjF3tvW5bg.KyyMLntbZQyx5
 jiYd5bdoD9GS_F.Q-
X-Yahoo-SMTP: kKQA4hiswBAsDtB7Rz5b18fkdN7u
From: causten <austenc@us.ibm.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au
Cc: causten <austenc@us.ibm.com>,
	Chris Austen <austencj@yahoo.com>
Subject: [PATCH linux dev-4.10] ARM: dts: Romulus: Identify LED is too active
Date: Thu, 27 Jul 2017 13:50:00 -0500
Message-Id: <1501181400-31373-1-git-send-email-austenc@us.ibm.com>
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
X-List-Received-Date: Thu, 27 Jul 2017 18:50:14 -0000

Identify LED is coming on ever boot.  This is because
it should have been set to ACTIVE_HIGH

Signed-Off-By: Chris Austen <austencj@yahoo.com>
---
 arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
index a9e3615..45a3c99 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
@@ -35,7 +35,7 @@
 		};
 
 		identify {
-			gpios = <&gpio ASPEED_GPIO(N, 4) GPIO_ACTIVE_LOW>;
+			gpios = <&gpio ASPEED_GPIO(N, 4) GPIO_ACTIVE_HIGH>;
 		};
 
 		power {
-- 
2.7.4
