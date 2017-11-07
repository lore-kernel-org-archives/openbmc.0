Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="MRP2HDkv"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="EO+Mi7fq"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yWLhh10brzDrKB
 for <openbmc@lists.ozlabs.org>; Tue,  7 Nov 2017 18:31:32 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id D803420D53;
 Tue,  7 Nov 2017 02:31:29 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Tue, 07 Nov 2017 02:31:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=KgSvo2enzj8jI4A56
 fRIcgMd7eUVtTs1Stl9XVeAZMw=; b=MRP2HDkv5g7V3gllJLmXT6VLXH8tXfBur
 fNDKjefWeuos5zzTibqTGrxPixW52J2zdaioA9vxXYyVpSc9elR2ZkJT8yx75gj2
 nS3zwA4N9GwqoU3cy3cnBtLtr0Gs8nHoQtxrFqATc/F1HE1NLODFuu5SWUmIjWsO
 Om7abjSFSgmujcdnokolv8KRVlxEspyCqX0JbJkRTWajawQWcm88CURqNhbP2Xh1
 rX3mSS3A/HA8sU+iI7F4Tn9CCDIC/JHlWHeZ7NYMT9pktIZ75YtJ1VFmjObScGRC
 fBq3LXV/mSR2KeSUtjaNxv4WyC5DYnAWQqQLzErHsMeVYHUXhJ+dA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=KgSvo2enzj8jI4A56fRIcgMd7eUVtTs1Stl9XVeAZMw=; b=EO+Mi7fq
 GCURd9M1HsstFL3orjeKtp4tpfYWoova0VERIJPnE8sNxJu/6cflR/Fuge/BGce5
 K3m3HEK3g6PRycaBi2easDv4XgnzCbXtZBwQdxDfuAN5bsLLOJ65aZpzP+f156dB
 7HvLM7RaihbTLh6raTZUgn4yYF83we4kbTTVInhHAzjgKYfoKZmHJOnTBw2hANku
 DcQEEeK2xxKE4k3mwCSSW6btNlOdFjx0LENLiuzmGn/aE2yWSwWJgiWpwraaQiKp
 o2IC1aNhM2c9NwKTinAsv26M5T+MZPUKkiaWUhWkOvL7aRhHgTNrPEYQszWqoeMY
 8mzF/ky09n5OyA==
X-ME-Sender: <xms:UWEBWlNJoLPv_2i74f5DYvtq6x0lZd9hARpG9xId0gULqYHH3pY-Zg>
Received: from keelia.au.ibm.com (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 6F21324108;
 Tue,  7 Nov 2017 02:31:27 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Cc: Andrew Jeffery <andrew@aj.id.au>,
	openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.13 02/23] ARM: aspeed: palmetto: Configure mbox
 and lpc nodes
Date: Tue,  7 Nov 2017 18:00:25 +1030
Message-Id: <20171107073046.13319-3-andrew@aj.id.au>
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
X-List-Received-Date: Tue, 07 Nov 2017 07:31:32 -0000
X-List-Received-Date: Tue, 07 Nov 2017 07:31:32 -0000
X-List-Received-Date: Tue, 07 Nov 2017 07:31:32 -0000
X-List-Received-Date: Tue, 07 Nov 2017 07:31:32 -0000

Assign 16MB of reserved memory for mboxd to make use of via the
aspeed-lpc-ctrl device.

OpenBMC-Staging-Count: 1
Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
index e61cac42e2f5..899fba592093 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
@@ -24,6 +24,11 @@
 			no-map;
 			reg = <0x5f000000 0x01000000>; /* 16M */
 		};
+
+		flash_memory: region@98000000 {
+			no-map;
+			reg = <0x98000000 0x01000000>; /* 16MB */
+		};
 	};
 };
 
@@ -109,3 +114,13 @@
 &vuart {
 	status = "okay";
 };
+
+&lpc_ctrl {
+	status = "okay";
+	memory-region = <&flash_memory>;
+	flash = <&spi>;
+};
+
+&mbox {
+	status = "okay";
+};
-- 
2.11.0
