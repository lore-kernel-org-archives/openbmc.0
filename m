Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xJvKF5DDLzDrS8
 for <openbmc@lists.ozlabs.org>; Sat, 29 Jul 2017 02:23:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="Iu+IKh3h"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="XFa8Xg5r"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id E527C20F49;
 Fri, 28 Jul 2017 12:23:10 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Fri, 28 Jul 2017 12:23:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=F85V1H
 d/ik+kq2Wnn1SwVoV7Q0T7cSmZUvaIA8cdV88=; b=Iu+IKh3hMTFVLjPd4Aq3ng
 3+J9I/6io/YsBuPHY3MTgkMIXhI6Q5zGQeAIWQv2lQFWj4K5yjcgQR2jt0OyLZQC
 AHRtsWe50iexvtczoOUcIuJU5SqfhWPifZrxRd27U/kjOwcG48YGzJx/Ye673L7+
 x17fOjzmEKcJKB6a8rEc4QoPGV0seza3nIr41UaMcGINss6EIduzO4aYNPnKDEHV
 3ldSFqxSt6jW3aKNN2c80QtPjnwVvCAZt5BJqx5WkwsijOfqSgv9sEmd7C9qMu+q
 Caaj7u4bdrEnqcImzhsXQGkoaa6pXdYqFRWoYRiFkoMFth4gr6S6rQnaLJGZlzEw
 ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=F85V1Hd/ik+kq2Wnn1SwVoV7Q0T7cSmZUvaIA8cdV
 88=; b=XFa8Xg5rLDtIdoQusVkbq9jJ7lUcKW3Q7IkLr2oAYH3NjtpNaVWo722Rr
 Pun13oNQtnW3VbaCZdaN9Piwde6r2nNapNL7vaiIb49EHblpcV1EvC8kIzmrRL33
 hhMgLJTE5ushsJoyWiNEqSU+47gvgsXIHAifXN/7EhGIsxHt3ClRHX9AaNwsa4b0
 exLQJdNwWJZN6VOCCUZNFwpsEYBFfwIPZNKUj9cLvJcE4KPrYmExkceVj2zBfIu9
 J/d1RbkVcovshMJYzWImOxU3bhPi7RR8Ge+ZM+9Q2jvCmUEMyFTlhwTfLEcgSb9H
 6EzAclFh2E91F17gWBnkN+ViRMA7Q==
X-ME-Sender: <xms:7mR7WQiKijvMm5jQenfRb2KXWLPFX4FkAdVD6uAiY3Zq4ElJ6DGb7w>
X-Sasl-enc: oGOh7KAEcsSYu+T2MmnFK6KFN9tqwQR9adKZBkzpCa5D 1501258990
Received: from keelia.au.ibm.com
 (ppp118-210-176-216.bras2.adl6.internode.on.net [118.210.176.216])
 by mail.messagingengine.com (Postfix) with ESMTPA id A79507E1FC;
 Fri, 28 Jul 2017 12:23:08 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Cc: Andrew Jeffery <andrew@aj.id.au>, mspinler@linux.vnet.ibm.com,
 msbarth@linux.vnet.ibm.com, openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.10 4/6] ARM: dts: aspeed: Configure Witherspoon to
 mark its fans as installed
Date: Sat, 29 Jul 2017 01:52:47 +0930
Message-Id: <20170728162249.9145-5-andrew@aj.id.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170728162249.9145-1-andrew@aj.id.au>
References: <20170728162249.9145-1-andrew@aj.id.au>
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
X-List-Received-Date: Fri, 28 Jul 2017 16:23:14 -0000

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
index 5afc03a19863..56cdc76c1250 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
@@ -216,6 +216,7 @@
 		fan@0 {
 			compatible = "pmbus-fan";
 			reg = <0>;
+			mark-fan-installed;
 			tach-pulses = <2>;
 			maxim,fan-rotor-input = "tach";
 			maxim,fan-pwm-freq = <25000>;
@@ -229,6 +230,7 @@
 		fan@1 {
 			compatible = "pmbus-fan";
 			reg = <1>;
+			mark-fan-installed;
 			tach-pulses = <2>;
 			maxim,fan-rotor-input = "tach";
 			maxim,fan-pwm-freq = <25000>;
@@ -242,6 +244,7 @@
 		fan@2 {
 			compatible = "pmbus-fan";
 			reg = <2>;
+			mark-fan-installed;
 			tach-pulses = <2>;
 			maxim,fan-rotor-input = "tach";
 			maxim,fan-pwm-freq = <25000>;
@@ -255,6 +258,7 @@
 		fan@3 {
 			compatible = "pmbus-fan";
 			reg = <3>;
+			mark-fan-installed;
 			tach-pulses = <2>;
 			maxim,fan-rotor-input = "tach";
 			maxim,fan-pwm-freq = <25000>;
-- 
2.11.0
