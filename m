Return-Path: <andrew@aj.id.au>
Received: from homiemail-a19.g.dreamhost.com (sub3.mail.dreamhost.com
 [69.163.253.7])
 (using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rQqN50k71zDqJd
 for <openbmc@lists.ozlabs.org>; Fri, 10 Jun 2016 14:44:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=Xpd0D+zn; 
 dkim-atps=neutral
Received: from homiemail-a19.g.dreamhost.com (localhost [127.0.0.1])
 by homiemail-a19.g.dreamhost.com (Postfix) with ESMTP id 471CC604076;
 Thu,  9 Jun 2016 21:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=from:to:cc
 :subject:date:message-id:in-reply-to:references; s=aj.id.au; bh=
 jAcq0lEBGFofdR8LmfxI+RxTdug=; b=Xpd0D+znn2muapAshJcjrCERJYc3730e
 jYwNInRZOguLKRmmi9zmXdWKETQ9t+wpCL7kkJ573vWRVVuYxNnpYPZZj/as9Tzr
 Q0jICYuxhKPNvaleoqW1PNQCgMpbanAjMUYgiBf5FwZLL8zIludQ10Dljs0OcpBD
 HXtCpJbVaa8=
Received: from keelia.au.ibm.com (unknown [203.0.153.9])
 (using TLSv1 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: andrew@aj.id.au)
 by homiemail-a19.g.dreamhost.com (Postfix) with ESMTPSA id 196E0604061;
 Thu,  9 Jun 2016 21:44:49 -0700 (PDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: OpenBMC <openbmc@lists.ozlabs.org>
Cc: Joel Stanley <joel@jms.id.au>, Gavin Shan <gwshan@linux.vnet.ibm.com>,
 Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH linux 4/4] aspeed-g5: Configure ftgmac100s for the Aspeed g5
 register interface
Date: Fri, 10 Jun 2016 14:14:29 +0930
Message-Id: <1465533869-3218-5-git-send-email-andrew@aj.id.au>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1465533869-3218-1-git-send-email-andrew@aj.id.au>
References: <1465533869-3218-1-git-send-email-andrew@aj.id.au>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 10 Jun 2016 04:44:53 -0000

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 arch/arm/boot/dts/aspeed-g5.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
index c86e3d5bfab1..afddbb8d28b4 100644
--- a/arch/arm/boot/dts/aspeed-g5.dtsi
+++ b/arch/arm/boot/dts/aspeed-g5.dtsi
@@ -41,6 +41,7 @@
 			compatible = "faraday,ftgmac100";
 			reg = <0x1e660000 0x180>;
 			interrupts = <2>;
+			aspeed-g5-interface;
 			no-hw-checksum;
 			status = "disabled";
 		};
@@ -49,6 +50,7 @@
 			compatible = "faraday,ftgmac100";
 			reg = <0x1e680000 0x180>;
 			interrupts = <3>;
+			aspeed-g5-interface;
 			no-hw-checksum;
 			status = "disabled";
 		};
-- 
2.7.4
