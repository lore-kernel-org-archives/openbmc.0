Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="KKGG27Ir"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="D9EbhHqh"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zlnSV4LVNzF0cS
 for <openbmc@lists.ozlabs.org>; Tue, 20 Feb 2018 15:19:22 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 9541F20DCD;
 Mon, 19 Feb 2018 23:19:20 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Mon, 19 Feb 2018 23:19:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=ISnRrMpQsK9kz+Eoj
 nh7NUf0hd0DsvoXzh27wdCOCjg=; b=KKGG27IrXFezNYa6uBjIT4w/XSe/u1aRF
 tWRPjuVTlCu20o3UVjIx0aKapYPdah3K9W3R1AOf9WtVqy45D2x2xKRfHpn9MZZU
 sSDwR91Ov6YZME4matgyTkColV7t9W+oN+3AZx/WI9SZ+U9ohrcYcoYP+oNtJh+J
 tHygtbl2dP9/WEAWo52RPjWpGLGxPX39W8UAfU8jFvtVawyKp0jWZ0ZJ9z9iNZkP
 psv4kLQuLIoFmbxAo+RvD5lGGlK9VtCmtD5yhrby0Yah+UT6VB0iRF+8EEgsnrkN
 hF706tiQCX/mwa9IqgwNJ6iodFDJGOfk3ArooNz22ACIFabFN/39g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=ISnRrMpQsK9kz+Eojnh7NUf0hd0DsvoXzh27wdCOCjg=; b=D9EbhHqh
 kQDutT/w/MjR9ZXHzC+ID5G+12LwUhJ+JbjnKY1UldifwNCFmuXUxrX6opUIHKi7
 yThsOjCrkiZTdjhPNRzQXqFtrn+gaWInSILVUgcVuiml8rsf3w3+mgcWjb1iiqGo
 3Yn/hx3OR0LNvxo1hU0H7cQi2ItEY5FrIP+K5Jm3V8Y1hGBDI2oSiafwbgCIyQcn
 cAVJJpZBgHwnUF+illi0AISmP9t+NH0Vfqb/FopQUSaWvWkwneNwcNDigukpPLYH
 dCoO37CPXAiCzaZxMz2QpsY+ibMYq1sCcEUtML4BDkM2ozqbKxi6krYu50iyt1SH
 6eXojvLW4Vv/Jg==
X-ME-Sender: <xms:yKGLWprIpStYwRrS7z10Ys2_5H9IhB7Uh_VW7lxZsibb7Ilx1d7vXg>
Received: from dave.aj.id.au (ppp118-210-154-2.bras1.adl6.internode.on.net
 [118.210.154.2])
 by mail.messagingengine.com (Postfix) with ESMTPA id B65D97E0DF;
 Mon, 19 Feb 2018 23:19:17 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au, jk@ozlabs.org, eajames@linux.vnet.ibm.com,
 bradleyb@fuzziesquirrel.com, cbostic@linux.vnet.ibm.com
Cc: Andrew Jeffery <andrew@aj.id.au>,
	openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.13 01/16] dts: fsi: Make OCC description match
 expected hierarchy
Date: Tue, 20 Feb 2018 14:48:29 +1030
Message-Id: <20180220041844.13228-2-andrew@aj.id.au>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20180220041844.13228-1-andrew@aj.id.au>
References: <20180220041844.13228-1-andrew@aj.id.au>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 20 Feb 2018 04:19:22 -0000

ibm,p9-occ-hwmon describes a driver, not hardware, but this compatible is
what's required to get the driver to probe.

While we discuss how to resolve that problem, lets at least make the current
configuration work.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 arch/arm/boot/dts/ibm-power9-cfam.dtsi | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/ibm-power9-cfam.dtsi b/arch/arm/boot/dts/ibm-power9-cfam.dtsi
index e0e738f9e539..215cc8182ca5 100644
--- a/arch/arm/boot/dts/ibm-power9-cfam.dtsi
+++ b/arch/arm/boot/dts/ibm-power9-cfam.dtsi
@@ -113,8 +113,12 @@
 			#size-cells = <0>;
 
 			occ@1 {
-				compatible = "ibm,p9-occ-hwmon";
+				compatible = "ibm,p9-occ";
 				reg = <1>;
+
+				occ-hwmon@1 {
+					compatible = "ibm,p9-occ-hwmon";
+				};
 			};
 		};
 
@@ -205,8 +209,12 @@
 					#size-cells = <0>;
 
 					occ@2 {
-						compatible = "ibm,p9-occ-hwmon";
+						compatible = "ibm,p9-occ";
 						reg = <2>;
+
+						occ-hwmon@2 {
+							compatible = "ibm,p9-occ-hwmon";
+						};
 					};
 				};
 			};
-- 
2.14.1
