Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="MN3TDrOY"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="p+CxmxdP"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ybbXn59zNzDqky
 for <openbmc@lists.ozlabs.org>; Tue, 14 Nov 2017 16:24:24 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id BCEDD20C67;
 Tue, 14 Nov 2017 00:24:21 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Tue, 14 Nov 2017 00:24:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:message-id:subject:to:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=/HEs12AE3ENA1yxlV9Nc7sv1zYGqtGizbnDPXG1hn
 i4=; b=MN3TDrOYx/miy96DzmJvZz8KM+mt9n2HY7LtCSylIlEwevCHaRLbbECOG
 x2lWj6JCXuf1tndl81NcohncQWv3qp+Y+ssWc3rZFk33BhOqPRKiDrXR4v7z54RS
 3e84GNcjuQJEUkqXJ/dR97qEv6qm/RQVJYq41rzdv9DxB/P/spYCgobORgnjdeO9
 EBDC/wRUJ4SFUPyZRjpH6tzGYDot2SpF8ls78UeG/TCUZf+5wGsdoT7XV/wnL/GB
 cm1blHjrDso1kALyzSTbccvXoaLiX4JwAtu55QhlxGuxa0bGaXCkA3z8kS3yku/L
 VpA0Ldosz7Mqnc1Fg1DcMXa+vHquQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:message-id:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=/HEs12AE3ENA1yxlV
 9Nc7sv1zYGqtGizbnDPXG1hni4=; b=p+CxmxdP44Voy85K1blMzqbO+C2YwnRO7
 5NPehsGgoW1/5OiXyB+hxQtuyQfRWGj9AGn3u2Jy4dVVDavfTEYdmowdxtnF7oCB
 mrOa35LZYWlOMLvsKc8EVGovqttHiZR8d7EFodEf3jxiyy4fb6A/k0OzdfvghwIy
 7oRS+z3J8Awx6Owip+T+p1GoGFgdqylhO6w+UWBLitLKp8xUt/qXJLMdX9P4+Egz
 +vCMPtk25zgWjDj/ikEzmTUy8vt/kNdzf2c0aHy1P0RmFOFMQ/Dw0JsZmQGPb5Mx
 9IkyCdHsFWiyFHzPzZ2ze54h2/FN5LhAkT5Klm3RXx5+gzwan9sXw==
X-ME-Sender: <xms:BX4KWqP3aSjmVHCim9qQ1NgeqdjZ-lWrhpjI_OpQI7xYki1vmnPA1A>
Received: from dave.base64.com.au (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 8BFE12473E;
 Tue, 14 Nov 2017 00:24:19 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Cc: Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org,
 Mykola Kostenok <c_mykolak@mellanox.com>,
 Patrick Venture <venture@google.com>
Subject: [PATCH linux dev-4.10] aspeed: dts: Update some platforms to mux
 RMII1 for MAC0
Date: Tue, 14 Nov 2017 15:53:43 +1030
Message-Id: <20171114052343.18808-1-andrew@aj.id.au>
X-Mailer: git-send-email 2.14.1
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 14 Nov 2017 05:24:26 -0000

I noticed that Witherspoon was missing its pinctrl properties for the mac0
node. On auditing the rest of the DTS files, the MSN and Q71L platforms
appeared to have the same issue.

Add the pinctrl nodes to ensure MAC0 has RMII1 muxed. This provides mutual
exclusion with the GPIO subsystem ensuring broken userspace can't interfere
with networking.

Cc: Mykola Kostenok <c_mykolak@mellanox.com>
Cc: Patrick Venture <venture@google.com>
Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 arch/arm/boot/dts/aspeed-bmc-mellanox-msn.dts    | 3 +++
 arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 3 +++
 arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts     | 3 +++
 3 files changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-mellanox-msn.dts b/arch/arm/boot/dts/aspeed-bmc-mellanox-msn.dts
index d1dc2ef1a162..1005d6becdba 100644
--- a/arch/arm/boot/dts/aspeed-bmc-mellanox-msn.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-mellanox-msn.dts
@@ -48,6 +48,9 @@
 &mac0 {
 	status = "okay";
 	use-ncsi;
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_rmii1_default>;
 };
 
 &i2c5 {
diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
index 68058eca1559..cc1fd0dc6677 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
@@ -239,6 +239,9 @@
 
 	use-ncsi;
 	no-hw-checksum;
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_rmii1_default>;
 };
 
 &i2c0 {
diff --git a/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts b/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
index 7ed3a773b2d5..41368734f07d 100644
--- a/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
@@ -139,6 +139,9 @@
 
 	use-ncsi;
 	no-hw-checksum;
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_rmii1_default>;
 };
 
 &mac1 {
-- 
2.14.1
