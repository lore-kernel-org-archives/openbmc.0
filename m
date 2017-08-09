Return-Path: <sam@mendozajonas.com>
X-Greylist: delayed 347 seconds by postgrey-1.36 at bilbo;
 Wed, 09 Aug 2017 19:01:07 AEST
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=mendozajonas.com header.i=@mendozajonas.com
 header.b="scfbcz0W"; dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="RWVhGZgD"; dkim-atps=neutral
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xS4xb5gsTzDqyV
 for <openbmc@lists.ozlabs.org>; Wed,  9 Aug 2017 19:01:07 +1000 (AEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.nyi.internal (Postfix) with ESMTP id 4D84E9BF;
 Wed,  9 Aug 2017 04:55:18 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute2.internal (MEProxy); Wed, 09 Aug 2017 04:55:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 mendozajonas.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=+ooonx+cOsPO6hRpf1VnyfspovKfXFjpvHqaCMGlC
 sU=; b=scfbcz0WRDSG+CjxUxk2MWKnC4iQWIUVRA8Qv3byLbdlTCQ23Kk84wA4B
 2xiz4x/9prNI6IjaYQoU6wIni1QsH7ZHXW6+M546lldXPEhgveC2nmfMu4jzwIXO
 P9VOUkEl+TpskXtjSJwiYSIHT1h383n8hdoeugKs892nkV57smJrXZcligG92xgb
 sOIJNOJdPM17K10Fp9/pws+5oaFtEaihEQB7DEBGfpTSrx0rEQJAcxNRrJ90Xje6
 hBVusrBgMfMTRVGd5okInCll1+B7pQ38KyzUutX1yRrVpjjXGH91LkhHCiPWW5XX
 LjcennTZh4TFFU76s5+m9lsm7GfUg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=+ooonx+cOsPO6hRpf1VnyfspovKfXFjpvHqaCMGlC
 sU=; b=RWVhGZgDa8tXvN498Xj/ytA+qGt4rsErB0U0K1xgQlRkceeshKq2Ju/as
 1/MJH6/xTlvIk4XBQTTBLlOyo8RL0yzoH3TVPs3a8S9fW3qWo/Vyin70PKHtiwx6
 eW1CUnydxHDG9vxF+G1m+ENomtzmPBl3PxK/iqIX9s23MpKfDmIdKV4H7/9LdBmX
 Qy3ePXwarZLSSLASOvcUiwCKAJ0MyikrcoS+8FNa+E4YuD9Pu27uPn0mT4FhyULq
 GStOZN8Hx++Jppa2NcVmaXxdpJDKqfUA193kVvJ6RJaQYQyxAZkhkAbEN7lVzhwH
 H5DmTC7tRlIDYhsWo8och7NdXChDQ==
X-ME-Sender: <xms:9s2KWVY8l9mKqAl_NOUmCY27hv3Pq017LTs5YocGM3oUTdoMBIBjJw>
X-Sasl-enc: MT07hOzzA86glvUMN8mvSfQVinRh1IMeD8rMtjvfVmep 1502268917
Received: from v4.ozlabs.ibm.com (unknown [122.99.82.10])
 by mail.messagingengine.com (Postfix) with ESMTPA id D0C4D240A4;
 Wed,  9 Aug 2017 04:55:15 -0400 (EDT)
From: Samuel Mendoza-Jonas <sam@mendozajonas.com>
To: openbmc@lists.ozlabs.org
Cc: Samuel Mendoza-Jonas <sam@mendozajonas.com>, Joel Stanley <joel@jms.id.au>,
 Ravindra S Rao1 <ravindra.s@in.ibm.com>, Leonard Low <leolow@au1.ibm.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Ratan K Gupta <ratagupt@in.ibm.com>
Subject: [RFC PATCH 1/3] ftgmac: Include NETIF_F_HW_VLAN_CTAG_FILTER in
 features
Date: Wed,  9 Aug 2017 18:54:41 +1000
Message-Id: <20170809085443.13148-2-sam@mendozajonas.com>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170809085443.13148-1-sam@mendozajonas.com>
References: <20170809085443.13148-1-sam@mendozajonas.com>
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
X-List-Received-Date: Wed, 09 Aug 2017 09:01:08 -0000

This is required for the VLAN core to call the add/kill callback for
VLAN IDs.

Signed-off-by: Samuel Mendoza-Jonas <sam@mendozajonas.com>
---
 drivers/net/ethernet/faraday/ftgmac100.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/ethernet/faraday/ftgmac100.c b/drivers/net/ethernet/faraday/ftgmac100.c
index 33b5c8eb9961..7c4d772287c7 100644
--- a/drivers/net/ethernet/faraday/ftgmac100.c
+++ b/drivers/net/ethernet/faraday/ftgmac100.c
@@ -1837,6 +1837,9 @@ static int ftgmac100_probe(struct platform_device *pdev)
 		NETIF_F_GRO | NETIF_F_SG | NETIF_F_HW_VLAN_CTAG_RX |
 		NETIF_F_HW_VLAN_CTAG_TX;
 
+	if (priv->use_ncsi)
+		netdev->hw_features |= NETIF_F_HW_VLAN_CTAG_FILTER;
+
 	/* AST2400  doesn't have working HW checksum generation */
 	if (np && (of_device_is_compatible(np, "aspeed,ast2400-mac")))
 		netdev->hw_features &= ~NETIF_F_HW_CSUM;
-- 
2.13.3
