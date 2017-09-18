Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="uPcYUutk"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="rU4b4Utb"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xwZpw06mbzDrbQ;
 Mon, 18 Sep 2017 15:50:16 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id DEEA420AF9;
 Mon, 18 Sep 2017 01:50:13 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Mon, 18 Sep 2017 01:50:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=Elm061
 2bhiyEzgkKbe+5MMPmOnMh2TPJTCw5xCQLFPc=; b=uPcYUutkR1Mjqon8vqVUyL
 ICOKJxHWFMsWtbQqtX/HzNqsY1XY9cNWP9xkHTkjpYfe5dc7fwiftwKwV94N38R5
 A8LT+9QZMAj1znhapy4L9MrRfsyLcE1/TSYy9fJDDKv9sDJVbLvNjVXsM3fHWhqi
 /WG1mn2EEDrSM0yO2W2Y70ISnxS/KPO457j6nwtQMc+q2jwEaDcuzT9bc5sgOY62
 ONq7FYJvQPw4moeRVmAwZJ8msFItVBaZUzNNGdSzv2GVnFuzon6v9CHdjD5+LEWc
 XGnOg6Xu1I7GsMibTwsdhuKZV19XYMr420+sKZwu9EWI4HBsSnDgtbDnd3c8riIg
 ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=Elm0612bhiyEzgkKbe+5MMPmOnMh2TPJTCw5xCQLF
 Pc=; b=rU4b4Utbz7C4rd745zw1kTsdFW0dln8TbkLy3s59gSXD5SFKT4r363wCm
 Ml0RTGbXXNLSrvztrSjD8jjO6eg34DjgLdDSOH8s0H+Pj3Pvue7bCxmu9Kobkhvf
 a/W0vFqwMdpNWZelGY1tvWqxBcr2n2l18ePg4se03LospbX/5i5q98xb4uvQZ5TT
 sjQtZgfcgrnFx9fS3EQMazfD8A9y7Tu0PARyNomWGHt7idUEGxq47SlsdCYA+J/d
 OdnTn9Hq+RgIAWeB751ESh7CXHtpD63kPB7tNZsKIhpHzK690sI5Qw0VN0quosSe
 wbF7MSA/WfKZegOJjMnCqD3LLekPQ==
X-ME-Sender: <xms:lV6_WQPr9qx75LruDJfyh7l4LgYoxybu9hoeSwMkGrzDLKQPxYvb2A>
X-Sasl-enc: BzCAyW9ogY3Uw0uXQ+yfmQJi+fC2v9Sa9ZIudZ30cLjQ 1505713813
Received: from keelia.au.ibm.com (ppp14-2-0-125.bras21.adl4.internode.on.net
 [14.2.0.125])
 by mail.messagingengine.com (Postfix) with ESMTPA id AAF107E183;
 Mon, 18 Sep 2017 01:50:10 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: linux-watchdog@vger.kernel.org
Cc: Andrew Jeffery <andrew@aj.id.au>, wim@iguana.be, linux@roeck-us.net,
 joel@jms.id.au, linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-aspeed@lists.ozlabs.org, ryan_chen@aspeedtech.com
Subject: [PATCH 3/4] watchdog: aspeed: Remove specific reference to AST2400 in
 Kconfig
Date: Mon, 18 Sep 2017 15:19:04 +0930
Message-Id: <20170918054905.16470-4-andrew@aj.id.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170918054905.16470-1-andrew@aj.id.au>
References: <20170918054905.16470-1-andrew@aj.id.au>
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
X-List-Received-Date: Mon, 18 Sep 2017 05:50:16 -0000

The driver also supports the watchdog in the AST25xx series, and
may work on earlier SoCs as well.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/watchdog/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index b562d2e03eb9..a1b92ebe74b6 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -741,7 +741,7 @@ config RENESAS_RZAWDT
 	  Renesas RZ/A SoCs. These watchdogs can be used to reset a system.
 
 config ASPEED_WATCHDOG
-	tristate "Aspeed 2400 watchdog support"
+	tristate "Aspeed BMC watchdog support"
 	depends on ARCH_ASPEED || COMPILE_TEST
 	select WATCHDOG_CORE
 	help
-- 
2.11.0
