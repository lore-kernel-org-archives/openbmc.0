Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vF3Zn1fsyzDqBg
 for <openbmc@lists.ozlabs.org>; Fri,  3 Feb 2017 15:21:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="WFFrNbT4"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="SFDCxUR7"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 26B9E20AA1;
 Thu,  2 Feb 2017 23:21:03 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Thu, 02 Feb 2017 23:21:03 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=cY5
 /q6gmUAPrLJyx1GUiO+/C4fs=; b=WFFrNbT4DU7VNsofy/egNCsxABoothVxsyW
 5zNqRy1aRVSPmIOGL7vfrHOZT3EzMG57lj7RJeaFu8XXuQyhI1Ku8WLgsjHgT6Ls
 m5S55Rk7ETaWYRQWOlFJe3cE3w6UljxF36+SdhX+i4vEaHwbE89qOOok1+tLKAEZ
 fVOYSILc=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=smtpout; bh=cY5/q6gmUAPrLJyx1GUiO+/C4fs=; b=SFDCx
 UR7D0eom2sD3e6XFVvrsgIM57B3aPTyM43IU7rfMdNlHXlBqHFjzIRPNldByzhlS
 7uJksCoegdjnbIwpYNOgKvyYLSB7sglzAWy5FVMKN4HtzqolrYSHZFXaX2AiJ/qM
 4kb/Dg6b9kgUGmuAy44omBX/tcwm7qQW71WlIM=
X-ME-Sender: <xms:LwWUWJpB1W_P7B1fQPUsQaQ6nB8ad4GAyUtVP6ylQIKMJoaAlct3wg>
X-Sasl-enc: M1xWj+tMWaacqlv8BlWghP/9Er0F8z83XrhFZya6QQP7 1486095662
Received: from keelia.au.ibm.com (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 19F75241D3;
 Thu,  2 Feb 2017 23:21:00 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: Joel Stanley <joel@jms.id.au>
Cc: Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org,
 Christopher Bostic <cbostic@linux.vnet.ibm.com>
Subject: [PATCH linux dev-4.7 03/14] aspeed: dt: Mark GPIO controller as
 interrupt-controller
Date: Fri,  3 Feb 2017 14:50:02 +1030
Message-Id: <20170203042013.2719-4-andrew@aj.id.au>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170203042013.2719-1-andrew@aj.id.au>
References: <20170203042013.2719-1-andrew@aj.id.au>
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
X-List-Received-Date: Fri, 03 Feb 2017 04:21:05 -0000

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
