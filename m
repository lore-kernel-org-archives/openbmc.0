Return-Path: <andrew@aj.id.au>
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vMkQD5lLFzDqGX
 for <openbmc@lists.ozlabs.org>; Tue, 14 Feb 2017 11:51:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="HjJvruWz"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="uekcsGce"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id A5D1F209B0;
 Mon, 13 Feb 2017 19:51:46 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Mon, 13 Feb 2017 19:51:46 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=Rmp
 oUX0IVUqaEfBqmAFESB50+38=; b=HjJvruWz4otnc3x1mHXP8r/3gW+HhTljBq+
 N9O3ewuidstYDbzNnuLrkPOIYOO0dxr+ZBGCXo1khuM+S29MpQJJ7gaYNKRlrXo4
 ILZXLVypZnNGrJS23oPPGUuCMJqfKV24x4/86UL2R20pW8wKOMvfIxe38f7Ocwfm
 H1riZjug=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=smtpout; bh=RmpoUX0IVUqaEfBqmAFESB50+38=; b=uekcs
 GceIU+I729vGyYMGdIYYRDQ+2zVKO0Kw0QQG985efF4/TiKhns8iemefyNWKWkB4
 fv0T8dsiBKCbtl0YyFZTNLdCuxEOsmTNjebhuvOpO9B8ufc5sP0Ww0wepVDg6dcK
 tWOo/GcYZ1GA+7/z+m+se3KkpAPqJ4C3tJFar4=
X-ME-Sender: <xms:olSiWJm7lEQ4Ze2Bhxa4yMymo3IniGyJign9E7JFsCKnM1aF-oIKSw>
X-Sasl-enc: tELi4petBB5MHjSBL9ML0NZ598fig9XWnS4Rklg6Mo5r 1487033505
Received: from keelia.au.ibm.com (ppp203-122-213-247.static.internode.on.net
 [203.122.213.247])
 by mail.messagingengine.com (Postfix) with ESMTPA id C769F7E0D5;
 Mon, 13 Feb 2017 19:51:43 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: Joel Stanley <joel@jms.id.au>
Cc: Patrick Williams <patrick@stwcx.xyz>, Rick Altherr <raltherr@google.com>,
 Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: [PATCH linux dev-4.7 v2 2/3] ARM: dts: aspeed-g5: Add LPC Host
 Controller node to LPC
Date: Tue, 14 Feb 2017 11:21:03 +1030
Message-Id: <20170214005104.11940-3-andrew@aj.id.au>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170214005104.11940-1-andrew@aj.id.au>
References: <20170214005104.11940-1-andrew@aj.id.au>
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
X-List-Received-Date: Tue, 14 Feb 2017 00:51:49 -0000

Required for pinmux, which tests some bits in the LHC's IO space.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---

This is extracted from commit cec822f89ec19b181dc02e2a0c6441d107d8b4d9 in the
ARM next/dt tree.

 arch/arm/boot/dts/aspeed-g5.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
index b73503c866aa..7c09a26eea6e 100644
--- a/arch/arm/boot/dts/aspeed-g5.dtsi
+++ b/arch/arm/boot/dts/aspeed-g5.dtsi
@@ -117,6 +117,11 @@
 					status = "disabled";
 				};
 
+				lhc: lhc@20 {
+					compatible = "aspeed,ast2500-lhc";
+					reg = <0x20 0x24 0x48 0x8>;
+				};
+
 				mbox: mbox@180 {
 					compatible = "aspeed,ast2500-mbox";
 					reg = <0x180 0x5c>;
-- 
2.9.3
