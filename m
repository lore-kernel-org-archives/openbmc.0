Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="rrYV3ykP"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="fcb6GPaR"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yWLhz1hRBzDrKb
 for <openbmc@lists.ozlabs.org>; Tue,  7 Nov 2017 18:31:47 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 18BD420D5F;
 Tue,  7 Nov 2017 02:31:45 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Tue, 07 Nov 2017 02:31:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=W+Lo+1PWTf2ew6JxU
 U6UmJJmb/11VXhx37e3QZowPaA=; b=rrYV3ykP1LiXjwES58r/x4ce9z77fP5It
 lamhf5xD/658GNBV4SqUsMPNfxjEbYVOddK3l0bZI0y0f0ChyHHjmhZjnSlwNY6b
 G4VleHJ57+oCvEcKVpIGt+UcfZHUlt7g/xPK71WvMy0GaoSyDTtOQ8PYyVkfiw+/
 xEG3gJKIfIVxu0r4IfoHxn3a2C+CAaBOX61B94/6rynJbQC26cy3Hxjy3cVouGdm
 dkL+bdPV/EgoO7hK6U+uYRG5HLHIDJDWL93TFlTlNU5pKLWq8Yks7k8A6tVjR/jz
 lHQhH91EBe9gmggdCCyiLlo9RV7/KaGdb3QRNxtQPEC6Qo5PvCS8Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=W+Lo+1PWTf2ew6JxUU6UmJJmb/11VXhx37e3QZowPaA=; b=fcb6GPaR
 i290zij897v8AzqaV0g8XibvBxM7UC1AXZZx8pb8E4GTczEtWSQDtE68c1KRlB9H
 Sm5XgvMol89RkbHAA1TkuqhIzg7HQEyzSLAFxhPE+40Spc/9ID/M06/RcgEk+oBB
 UkN9+IFp5/YCNzD7ncGA6LZqVzHI6iwBjcUmrFQLORSGu7yVOnDz8CcRek7YdHbB
 BHxJnjJqcfD39nugvrUF01+pMkj3pt8k3O7yDXi6wXxMeRUZqXZXb8hopLh1G75V
 CqaNoVf5K5vcIj94UmFGhCC9Se+38OwjcDAqzbKktOx4sFgkVZMtlBbPCbUh9ya2
 VgJ95P68y4Aj3w==
X-ME-Sender: <xms:YWEBWqIoOOvnwri5Vi_AIiIWg0Ed6guIvcU9F8ijhnguFZOAtAjTYQ>
Received: from keelia.au.ibm.com (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id ACEF424DF9;
 Tue,  7 Nov 2017 02:31:43 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Cc: Andrew Jeffery <andrew@aj.id.au>,
	openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.13 09/23] ARM: dts: aspeed-palmetto: Request mux
 as per strapping configuration
Date: Tue,  7 Nov 2017 18:00:32 +1030
Message-Id: <20171107073046.13319-10-andrew@aj.id.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20171107073046.13319-1-andrew@aj.id.au>
References: <20171107073046.13319-1-andrew@aj.id.au>
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
X-List-Received-Date: Tue, 07 Nov 2017 07:31:47 -0000

Prevents the error:

 aspeed-smc 1e630000.spi: Error applying setting, reverse things back

The pinmux driver is only capable of modifying selected strapping bits
that make sense to change at runtime. The SPI strapping is not
currently defined modifiable, so "request" the mux as per how the board
is physically strapped.

OpenBMC-Staging-Count: 1
Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
index 899fba592093..cd4101ce9d6d 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
@@ -43,6 +43,9 @@
 
 &spi {
 	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_spi1debug_default>;
+
 	flash@0 {
 		status = "okay";
 		m25p,fast-read;
-- 
2.11.0
