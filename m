Return-Path: <andrew@aj.id.au>
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tDlxq3kMdzDvhG
 for <openbmc@lists.ozlabs.org>; Thu, 10 Nov 2016 12:36:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="Q9HpxNq+"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="IFhOTIcm"; dkim-atps=neutral
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 7DC1720B6A;
 Wed,  9 Nov 2016 20:36:13 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
 by compute7.internal (MEProxy); Wed, 09 Nov 2016 20:36:13 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=lnV
 mVhoVBpFCZVhvL/+mJgU0cX4=; b=Q9HpxNq+rYiNI0SEXDG1b9jY3qKGQMYJXYw
 iVS65Kqf3T9jLn0qD6BEphMOnqECcuUbpn7fHx4h/NSfNsPVWx2Fk6WT9/L/Vv9P
 9Qv0oXZF/AGwMAHPj7oTpm7OsV4+u+o+BXb3F39HbODS7LkcMBeBZUiwZ5ZEsrRJ
 +5DHGzkc=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=smtpout; bh=lnVmVhoVBpFCZVhvL/+mJgU0cX4=; b=IFhOT
 Icmgz45Vq2it9NhkbLhnN3Rumusdp/aNFY1yW4PRSzCd0ryUyP2sFcQQdX8/NdKG
 z+fbQzi1ejvE88cGoVl/TnQQ80VEZkjAzx1ZR11eUoEwEcahvvKgw0zgZ+mol8SU
 TPhBuDXL1ba0vOfn7itaOm2SGbfJn3604tgi7w=
X-ME-Sender: <xms:Dc8jWHkvOnUuGSXXVk3-AdxRkVW9pC_LdGbEKbX7maDkbIe79bGMLg>
X-Sasl-enc: hLdNCk3QErojp6sF854xE/yujsqaBQWs+tkpcjjwuJXu 1478741772
Received: from keelia.au.ibm.com (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id E4837F29CD;
 Wed,  9 Nov 2016 20:36:11 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC <openbmc@lists.ozlabs.org>,
	Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH linux dev-4.7 3/4] arm: aspeed: dt: Add SuperIO scratch
 register nodes
Date: Thu, 10 Nov 2016 12:05:55 +1030
Message-Id: <20161110013556.8542-4-andrew@aj.id.au>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20161110013556.8542-1-andrew@aj.id.au>
References: <20161110013556.8542-1-andrew@aj.id.au>
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
X-List-Received-Date: Thu, 10 Nov 2016 01:36:15 -0000

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 arch/arm/boot/dts/aspeed-g4.dtsi | 5 +++++
 arch/arm/boot/dts/aspeed-g5.dtsi | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-g4.dtsi
index 68eadec4ab34..1ee9e87aa5b2 100644
--- a/arch/arm/boot/dts/aspeed-g4.dtsi
+++ b/arch/arm/boot/dts/aspeed-g4.dtsi
@@ -857,6 +857,11 @@
 				clocks = <&clk_apb>;
 			};
 
+			scrsio: scrsio@1e789170 {
+				compatible = "aspeed,ast2400-scrsio";
+				reg = <0x1e789170 0x10>;
+			};
+
 			ibt: ibt@1e789140 {
 				compatible = "aspeed,bt-host";
 				reg = <0x1e789140 0x18>;
diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
index d72aea7ab8f2..505f4878d9af 100644
--- a/arch/arm/boot/dts/aspeed-g5.dtsi
+++ b/arch/arm/boot/dts/aspeed-g5.dtsi
@@ -991,6 +991,11 @@
 				clocks = <&clk_apb>;
 			};
 
+			scrsio: scrsio@1e789170 {
+				compatible = "aspeed,ast2500-scrsio";
+				reg = <0x1e789170 0x10>;
+			};
+
 			ibt: ibt@1e789140 {
 				compatible = "aspeed,bt-host";
 				reg = <0x1e789140 0x18>;
-- 
2.9.3
