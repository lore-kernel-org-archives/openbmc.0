Return-Path: <joel@jms.id.au>
Received: from mail-pf0-x241.google.com (mail-pf0-x241.google.com
 [IPv6:2607:f8b0:400e:c00::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rbVHW4XfmzDq5W
 for <openbmc@lists.ozlabs.org>; Fri, 24 Jun 2016 17:25:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=jms.id.au header.i=@jms.id.au header.b=jLFg16fs; 
 dkim-atps=neutral
Received: by mail-pf0-x241.google.com with SMTP id t190so8568180pfb.2
 for <openbmc@lists.ozlabs.org>; Fri, 24 Jun 2016 00:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=cYJ6tLg1SVshhi8ekZGoNvgEx2GorwnI2v4rwelRFH4=;
 b=jLFg16fs647p3Ga+NiWhM7KvvQfwYnrK3kOWTxxmmhP2vVWJAdXraCckUjrq5qD/t6
 4JXMwhgoj/swcWzrrq8+8TY+5EgxdA9KY2qpn/wLLv6afureOp4AfEehe5nWlVXjomWt
 O1x+l9Fpm0CIcHKSUYgY9TMZcLJlkNnRlCb40=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=cYJ6tLg1SVshhi8ekZGoNvgEx2GorwnI2v4rwelRFH4=;
 b=IB+8ArTUczRqLTBSH9Zd5/FYo0WosmM7mzl6f8F9Yb1hBWZ61ampxqe12rFdRQTYxt
 7XsS/A5lecD9HT3OODZuBTUldwKd00j+i0g1BSWg/IgUxzJldF9ZXZTjHHaco4sIhHDR
 ICcEszkAMdrKd+7IvzRIswZCOOeHFxJW6YPpSILcoxr2fzeEL3RNLJ2LiUUTWmCUw9kK
 JtIJhUblxAUFd0KPxcNhPL2IrOx6NCSqU1Ep0l0MB92C8Ft4dJuQf0Sy1UWMfY92yi6B
 psYuKYD/Ci0jEC3SlZQIi9YDR7T1OWkeaLiyeZPounj83KpTS9Pzn8pgF/P9PAr7V9hE
 m1ig==
X-Gm-Message-State: ALyK8tJjd7diIXjPl2iEHrTmBuWLMqYn5m19RwfAP/rfeUkmEMwbRbYT0eVjo3jU3PSNQA==
X-Received: by 10.98.152.76 with SMTP id q73mr4806047pfd.38.1466753158026;
 Fri, 24 Jun 2016 00:25:58 -0700 (PDT)
Received: from aurora.ibm.com ([203.0.153.9])
 by smtp.gmail.com with ESMTPSA id an13sm5058555pac.42.2016.06.24.00.25.55
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 24 Jun 2016 00:25:57 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: andrew@aj.id.au,
	clg@kaod.org
Cc: openbmc@lists.ozlabs.org
Subject: [linux 2/2] drivers/net/ftgmac100: Adapt for Aspeed SoCs
Date: Fri, 24 Jun 2016 16:55:46 +0930
Message-Id: <1466753146-2916-2-git-send-email-joel@jms.id.au>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1466753146-2916-1-git-send-email-joel@jms.id.au>
References: <1466753146-2916-1-git-send-email-joel@jms.id.au>
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
X-List-Received-Date: Fri, 24 Jun 2016 07:26:00 -0000

The RXDES and TXDES registers bits in the ftgmac100 indicates EDO{R,T}R
at bit position 15 for the Faraday Tech IP. However, the version of this
IP present in the Aspeed SoCs has these bits at position 30 in the
registers.

It appers that ast2400 SoCs support both positions, with the 15th bit
marked as reserved but still functional. In the ast2500 this bit is
reused for another function, so we need a work around.

This was confirmed with engineers from Aspeed that using bit 30 is
correct for both the ast2400 and ast2500 SoCs.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/net/ethernet/faraday/ftgmac100.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/faraday/ftgmac100.c b/drivers/net/ethernet/faraday/ftgmac100.c
index 2c2675d6ee3b..e805c4d4c5f8 100644
--- a/drivers/net/ethernet/faraday/ftgmac100.c
+++ b/drivers/net/ethernet/faraday/ftgmac100.c
@@ -1358,8 +1358,14 @@ static int ftgmac100_probe(struct platform_device *pdev)
 		priv->use_ncsi = false;
 	}
 
-	priv->rxdes0_edorr_mask = BIT(15);
-	priv->txdes0_edotr_mask = BIT(15);
+	if (of_machine_is_compatible("aspeed,ast2400") ||
+	    of_machine_is_compatible("aspeed,ast2500")) {
+		priv->rxdes0_edorr_mask = BIT(30);
+		priv->txdes0_edotr_mask = BIT(30);
+	} else {
+		priv->rxdes0_edorr_mask = BIT(15);
+		priv->txdes0_edotr_mask = BIT(15);
+	}
 
 	netdev->ethtool_ops = &ftgmac100_ethtool_ops;
 	netdev->netdev_ops = &ftgmac100_netdev_ops;
-- 
2.8.1
