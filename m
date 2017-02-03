Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vF3472xGVzDqC6
 for <openbmc@lists.ozlabs.org>; Fri,  3 Feb 2017 14:57:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="Ye06EGRf"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="XYaFJCQX"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 5BBDD20703;
 Thu,  2 Feb 2017 22:57:57 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Thu, 02 Feb 2017 22:57:57 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=cY5
 /q6gmUAPrLJyx1GUiO+/C4fs=; b=Ye06EGRfKmvXwEFjuX8xKUplCW7zpoApdz4
 30fUry0a9X9ZydsxwobY9gOkmcTV4EOjxQ5+S8q8bnzno1KctyZLK3fkBg7nPjrz
 jb7dn6mCDiQgvkCCgO/IlWcKWxLDIuLOLQALktN2MYVx4zFZEXIIcR7IT0zvm18H
 QQ4CHdp4=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=smtpout; bh=cY5/q6gmUAPrLJyx1GUiO+/C4fs=; b=XYaFJ
 CQX0lAVQfSE4tLMbNGwI/pINKC/4wiwxVrAx/d8eR/lGiY8MOsKDroFjDM7sdS3I
 LomQ68TPbfaDnSaHloOlk/tIoN1P9KhQgxvYIUZ3n0W2EMd87QXxgLpmscoSqhSv
 B/+89FnEfUCnARD4I43o/hXnBmfn59ZUiEClXA=
X-ME-Sender: <xms:xf-TWImzoY0VYQYYciufZvulvlN9hSFs1EAVoPKv8A9qLNdM-VRR2Q>
X-Sasl-enc: dzyTRsobPbjGYji1DLoe74VuP15YCccSNfNBaCKJF7HI 1486094276
Received: from keelia.au.ibm.com (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 0092124066;
 Thu,  2 Feb 2017 22:57:54 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: Joel Stanley <joel@jms.id.au>
Cc: Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org,
 Christopher Bostic <cbostic@linux.vnet.ibm.com>
Subject: [PATCH linux dev-4.7 03/14] aspeed: dt: Mark GPIO controller as
 interrupt-controller
Date: Fri,  3 Feb 2017 14:27:05 +1030
Message-Id: <20170203035716.646-4-andrew@aj.id.au>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170203035716.646-1-andrew@aj.id.au>
References: <20170203035716.646-1-andrew@aj.id.au>
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
X-List-Received-Date: Fri, 03 Feb 2017 03:57:59 -0000

This brings the devicetree into line with the mainline bindings.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 arch/arm/boot/dts/aspeed-g4.dtsi | 1 +
 arch/arm/boot/dts/aspeed-g5.dtsi | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-g4.dtsi
index 7c78eb1c01ff..28408a2e2ad5 100644
--- a/arch/arm/boot/dts/aspeed-g4.dtsi
+++ b/arch/arm/boot/dts/aspeed-g4.dtsi
@@ -851,6 +851,7 @@
 				compatible = "aspeed,ast2400-gpio";
 				reg = <0x1e780000 0x1000>;
 				interrupts = <20>;
+				interrupt-controller;
 				gpio-ranges = <&pinctrl 0 0 220>;
 			};
 
diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
index 7b1297b7f3da..14e03d8d35dc 100644
--- a/arch/arm/boot/dts/aspeed-g5.dtsi
+++ b/arch/arm/boot/dts/aspeed-g5.dtsi
@@ -1016,6 +1016,7 @@
 				compatible = "aspeed,ast2500-gpio";
 				reg = <0x1e780000 0x1000>;
 				interrupts = <20>;
+				interrupt-controller;
 				gpio-ranges = <&pinctrl 0 0 220>;
 			};
 
-- 
2.9.3
