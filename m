Return-Path: <saqibkhan@utexas.edu>
Received: from mail-qt0-x243.google.com (mail-qt0-x243.google.com
 [IPv6:2607:f8b0:400d:c0d::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3w6CD21FjxzDq5x
 for <openbmc@lists.ozlabs.org>; Tue, 18 Apr 2017 01:41:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=utexas-edu.20150623.gappssmtp.com
 header.i=@utexas-edu.20150623.gappssmtp.com header.b="C6VE5V00"; 
 dkim-atps=neutral
Received: by mail-qt0-x243.google.com with SMTP id c45so19101938qtb.0
 for <openbmc@lists.ozlabs.org>; Mon, 17 Apr 2017 08:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=utexas-edu.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id;
 bh=uAWCdXvIYjr2eQ/MoAyZHze9aelDh9LABb/R1Tt0X0E=;
 b=C6VE5V0018Xt4HnknFwOrw8/BjtH7ktdjyO19q2+DNpDVi3HzwnCyp/aCWkGsvG2cA
 QV6GXLx5NCLslItP4JPuVKXYPNh7g0Hg74DAQ1RIyhcBkUcqhWb0Is9EDaikseuTsx0I
 DilbXZ5hOR5SpD3BoaZ/uR7WBWeQw8GhcwnugEA72lfG9+LdqtTmNcs/uRV2pBYI9T77
 m6fXFg9BYGlkJyAOo+hW5Pm6BK5x7WNWcwsGfb+EX/rI16WXL7UoMGYxVbiP3UlODQIF
 39aSCrPHSHGgsvne2jwZPvOYOL6dqHj+tS4rBCpPSwnPUP6f1oN2PCVFCSQuG+ZF59Hm
 d2ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=uAWCdXvIYjr2eQ/MoAyZHze9aelDh9LABb/R1Tt0X0E=;
 b=ZFuWA0ZssyKmHSDcLkq76lSnILb4MaPKDDZaCEJyJ2Fu6z0DiVfbNtxCdRcxw8ar4w
 IHbvazTfOO/fI9PydP8rKj1LetduoHCmTgMTm4cXkBohMxArGO9tRlND1vTASxOdkv9V
 vud9NE9yBK62D9myTrjFkjd2Y0sGWt1f1TSn3P2AiM7vFIyh+ZkznZF3P4kte10Fg1CD
 xTM1DGCJColWwtcIqCnnuqoprnOV/yHx3KXkaaDwAIMi0FZcFR6dp5Y6i0vsITTo1FZU
 41paT1orM0S7sLOGSwGKzmZy+i8MvRryMIlW0IOa+rJIRbtVTA0pt8RWMVcHgSRo8amI
 GAkQ==
X-Gm-Message-State: AN3rC/5lks+6DGB58pI1THCgfQgQtTkZrBohQ2KWCGd2DiDNPPXbN2s3
 Abzaldpb4oist9W4
X-Received: by 10.237.37.215 with SMTP id y23mr9075077qtc.241.1492443678470;
 Mon, 17 Apr 2017 08:41:18 -0700 (PDT)
Received: from saqib-VirtualBox.austin.ibm.com ([32.97.110.55])
 by smtp.gmail.com with ESMTPSA id y52sm7484524qty.60.2017.04.17.08.41.17
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 17 Apr 2017 08:41:18 -0700 (PDT)
From: saqibkhan@utexas.edu
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au
Cc: Saqib Khan <khansa@us.ibm.com>
Subject: [PATCH linux dev-4.7] Correct spelling of "barreleye"
Date: Mon, 17 Apr 2017 10:41:45 -0500
Message-Id: <1492443705-24309-1-git-send-email-saqibkhan@utexas.edu>
X-Mailer: git-send-email 1.9.1
X-Mailman-Approved-At: Tue, 18 Apr 2017 02:23:13 +1000
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
X-List-Received-Date: Mon, 17 Apr 2017 15:41:23 -0000

From: Saqib Khan <khansa@us.ibm.com>

Note:"barreleye" mispelled in /sys/firmware/devicetree/base/model

Signed-off-by: Saqib Khan <khansa@us.ibm.com>
---
 arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts b/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
index 9dc3e67..f638bda 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
@@ -4,7 +4,7 @@
 #include <dt-bindings/gpio/aspeed-gpio.h>
 
 / {
-	model = "Barrelye BMC";
+	model = "Barreleye BMC";
 	compatible = "rackspace,barreleye-bmc", "aspeed,ast2400";
 
 	aliases {
-- 
1.8.2.2
