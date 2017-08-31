Return-Path: <sam@mendozajonas.com>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xjSlh31rGzDqF4
 for <openbmc@lists.ozlabs.org>; Thu, 31 Aug 2017 13:38:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=mendozajonas.com header.i=@mendozajonas.com
 header.b="pWGbfMK4"; dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="VYKFKdiD"; dkim-atps=neutral
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id 2C40121B9C;
 Wed, 30 Aug 2017 23:38:54 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute2.internal (MEProxy); Wed, 30 Aug 2017 23:38:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 mendozajonas.com; h=cc:date:from:message-id:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=JXJECG
 3H6ciM/5gVUYz80mVFOrhDE0+4TToYiQcz0Ao=; b=pWGbfMK46l3uXGQseLWelm
 5oCyKXvQpZfpk1/7voYl5sC+cPraf/fbK4o8sfleRNaROLJ4TXS2Y48+KLKCWNb0
 14XroXgJccg/fkG1xaKYZbL42YrJ0uYNt0VmvI1Y2hhES7UFBp9WCLmqxVu/qKyJ
 L69yQJunk3EI8XdpJ3192ctpqGRicVJdwlkkAKrW+wIPsP9Nqsc5OKs8iad3EOkO
 fq4LjIakmJspceVparMZ1eH0pdMz//f19qJ4+2mFpgzKu+NdSa0EeViXVm8gjqAT
 UJIkVOYEPgZ+ZbHKl+HrSswXY+5JdCs2u5mPJDyWCl+ZC1LTnBthC0rlOjYHJFBQ
 ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:message-id:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=JXJECG
 3H6ciM/5gVUYz80mVFOrhDE0+4TToYiQcz0Ao=; b=VYKFKdiDZgVaNcY3fxwX7v
 zaSmkN6Z8QU7u20EDFnhAhgPv9IsquvzT9gN1+sJhCmQdgGShR6qvyD7VuVdqj/p
 e60tLmP97WnBBdibN0qo3238uzaBltJM0YFP5NLTSsXxOYrbEEPcKVQ+AxDjqem6
 YF6ujMdqTQ/aSzYwhnHxAxdkfkKdv1IIdbMZ3+ylJmAc0I7+FcixHlpOdqi+7r/8
 crErG75xI8Gk8RYs3toPSf4Gt5cUBIjush+1pDEFDZx4EU8+OZd0N9JWOGClExQI
 o7R7qrh+R0dqbItoh2EUFdeYXkKspz6hOBUR1AuGEWhAygE+FBbBvaGdRjPqrGdQ
 ==
X-ME-Sender: <xms:zoSnWbDn1uotw6Lt6x9FHwQuAiBh2V-v1PSAt0if8jSm8c-926nqdA>
X-Sasl-enc: y3pcSWo2N44HlpTsdsYWbj6RazPd5ZOtrQJ18+3O8aiO 1504150733
Received: from v4.ozlabs.ibm.com (unknown [122.99.82.10])
 by mail.messagingengine.com (Postfix) with ESMTPA id 9443724253;
 Wed, 30 Aug 2017 23:38:51 -0400 (EDT)
From: Samuel Mendoza-Jonas <sam@mendozajonas.com>
To: "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Cc: Samuel Mendoza-Jonas <sam@mendozajonas.com>, Joel Stanley <joel@jms.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Gavin Shan <gwshan@linux.vnet.ibm.com>
Subject: [PATCH net-next] net/ncsi: Define {add,
 kill}_vid callbacks for !CONFIG_NET_NCSI
Date: Thu, 31 Aug 2017 13:38:46 +1000
Message-Id: <20170831033846.23538-1-sam@mendozajonas.com>
X-Mailer: git-send-email 2.14.1
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
X-List-Received-Date: Thu, 31 Aug 2017 03:38:57 -0000

Patch "net/ncsi: Configure VLAN tag filter" defined two new callback
functions in include/net/ncsi.h, but neglected the !CONFIG_NET_NCSI
case. This can cause a build error if these are referenced elsewhere
without NCSI enabled, for example in ftgmac100:

>>> ERROR: "ncsi_vlan_rx_kill_vid" [drivers/net/ethernet/faraday/ftgmac100.ko] undefined!
>>> ERROR: "ncsi_vlan_rx_add_vid" [drivers/net/ethernet/faraday/ftgmac100.ko] undefined!

Add definitions for !CONFIG_NET_NCSI to bring it into line with the rest
of ncsi.h

Signed-off-by: Samuel Mendoza-Jonas <sam@mendozajonas.com>
---
 include/net/ncsi.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/include/net/ncsi.h b/include/net/ncsi.h
index 1f96af46df49..2b13b6b91a4d 100644
--- a/include/net/ncsi.h
+++ b/include/net/ncsi.h
@@ -36,6 +36,14 @@ int ncsi_start_dev(struct ncsi_dev *nd);
 void ncsi_stop_dev(struct ncsi_dev *nd);
 void ncsi_unregister_dev(struct ncsi_dev *nd);
 #else /* !CONFIG_NET_NCSI */
+int ncsi_vlan_rx_add_vid(struct net_device *dev, __be16 proto, u16 vid)
+{
+	return -ENOTTY;
+}
+int ncsi_vlan_rx_kill_vid(struct net_device *dev, __be16 proto, u16 vid)
+{
+	return -ENOTTY;
+}
 static inline struct ncsi_dev *ncsi_register_dev(struct net_device *dev,
 					void (*notifier)(struct ncsi_dev *nd))
 {
-- 
2.14.1
