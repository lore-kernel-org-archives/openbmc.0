Return-Path: <SRS0=JxwQ=D2=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 396D9C433E7
	for <openbmc@archiver.kernel.org>; Mon, 19 Oct 2020 09:02:01 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C6B820874
	for <openbmc@archiver.kernel.org>; Mon, 19 Oct 2020 09:02:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7C6B820874
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=aspeedtech.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CF9jy1pQTzDqZX
	for <openbmc@archiver.kernel.org>; Mon, 19 Oct 2020 20:01:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; spf=fail (SPF fail - not authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.71;
 helo=twspam01.aspeedtech.com; envelope-from=dylan_hung@aspeedtech.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=aspeedtech.com
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com
 [211.20.114.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CF9d66w6hzDqZG;
 Mon, 19 Oct 2020 19:57:46 +1100 (AEDT)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 09J8so81046772;
 Mon, 19 Oct 2020 16:54:50 +0800 (GMT-8)
 (envelope-from dylan_hung@aspeedtech.com)
Received: from localhost.localdomain (192.168.10.9) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 19 Oct
 2020 16:57:27 +0800
From: Dylan Hung <dylan_hung@aspeedtech.com>
To: <davem@davemloft.net>, <kuba@kernel.org>, <netdev@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <ratbert@faraday-tech.com>,
 <linux-aspeed@lists.ozlabs.org>, <openbmc@lists.ozlabs.org>
Subject: [PATCH 1/4] ftgmac100: Fix race issue on TX descriptor[0]
Date: Mon, 19 Oct 2020 16:57:14 +0800
Message-ID: <20201019085717.32413-2-dylan_hung@aspeedtech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201019085717.32413-1-dylan_hung@aspeedtech.com>
References: <20201019085717.32413-1-dylan_hung@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [192.168.10.9]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 09J8so81046772
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
Cc: BMC-SW@aspeedtech.com
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

These rules must be followed when accessing the TX descriptor:

1. A TX descriptor is "cleanable" only when its value is non-zero
and the owner bit is set to "software"

2. A TX descriptor is "writable" only when its value is zero regardless
the edotr mask.

Fixes: 52c0cae87465 ("ftgmac100: Remove tx descriptor accessors")
Signed-off-by: Dylan Hung <dylan_hung@aspeedtech.com>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/net/ethernet/faraday/ftgmac100.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/net/ethernet/faraday/ftgmac100.c b/drivers/net/ethernet/faraday/ftgmac100.c
index 00024dd41147..7cacbe4aecb7 100644
--- a/drivers/net/ethernet/faraday/ftgmac100.c
+++ b/drivers/net/ethernet/faraday/ftgmac100.c
@@ -647,6 +647,9 @@ static bool ftgmac100_tx_complete_packet(struct ftgmac100 *priv)
 	if (ctl_stat & FTGMAC100_TXDES0_TXDMA_OWN)
 		return false;
 
+	if ((ctl_stat & ~(priv->txdes0_edotr_mask)) == 0)
+		return false;
+
 	skb = priv->tx_skbs[pointer];
 	netdev->stats.tx_packets++;
 	netdev->stats.tx_bytes += skb->len;
@@ -756,6 +759,9 @@ static netdev_tx_t ftgmac100_hard_start_xmit(struct sk_buff *skb,
 	pointer = priv->tx_pointer;
 	txdes = first = &priv->txdes[pointer];
 
+	if (le32_to_cpu(txdes->txdes0) & ~priv->txdes0_edotr_mask)
+		goto drop;
+
 	/* Setup it up with the packet head. Don't write the head to the
 	 * ring just yet
 	 */
@@ -787,6 +793,10 @@ static netdev_tx_t ftgmac100_hard_start_xmit(struct sk_buff *skb,
 		/* Setup descriptor */
 		priv->tx_skbs[pointer] = skb;
 		txdes = &priv->txdes[pointer];
+
+		if (le32_to_cpu(txdes->txdes0) & ~priv->txdes0_edotr_mask)
+			goto dma_err;
+
 		ctl_stat = ftgmac100_base_tx_ctlstat(priv, pointer);
 		ctl_stat |= FTGMAC100_TXDES0_TXDMA_OWN;
 		ctl_stat |= FTGMAC100_TXDES0_TXBUF_SIZE(len);
-- 
2.17.1

