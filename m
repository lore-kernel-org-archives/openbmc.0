Return-Path: <joel.stan@gmail.com>
Received: from mail-pg0-x241.google.com (mail-pg0-x241.google.com
 [IPv6:2607:f8b0:400e:c05::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vS7tZ2dGbzDqGc
 for <openbmc@lists.ozlabs.org>; Tue, 21 Feb 2017 16:13:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="hP4J1xjg"; 
 dkim-atps=neutral
Received: by mail-pg0-x241.google.com with SMTP id a123so13458803pgc.3
 for <openbmc@lists.ozlabs.org>; Mon, 20 Feb 2017 21:13:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id;
 bh=nRaPZQcVJZ4Bdf+vWUVXULrxPB+A//+aRBxqyPu6PGM=;
 b=hP4J1xjgBxaiB73dgYBgw0/w+xRtGyXLiS4hKjJci1R8mBvBMZU437iUp3vzIwi18b
 XpMjIhAp3vWyCXm+iuVIF+/QxETcFnrDFLG1g0UFQP/4PsS0zfRpled+neKtiZWVgR+7
 N8L/m3dui3nMeE1/27XdmuqEyzkAvgYfKfJ828UdqBqSS5Q4Qr4OURz5uLBx+sKNshWf
 dG58f17kCsn7Wd5MYN5Jsw2PuqGDVAvNm5zeMD9hOSxcQqEBOZzSmpoxUVkK94ZJ09v8
 Xzk4vKJ3qRabqIAUHwmlTxQvm6WhZDwZZgijHx/PVMw/ElmuwaNIMwdDLH7DmAe7nM4J
 9rSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
 bh=nRaPZQcVJZ4Bdf+vWUVXULrxPB+A//+aRBxqyPu6PGM=;
 b=op2uvjczBALb2hc5FZpstpnayo/w5CESYCBSa2wxteIDv2FjBSEPpjdcLmsqKlzwwt
 /yfBZxIP31ZmtofjH40/Rtrc4yAIqnjZla/3mR019zMBgpOXezZt6COlvYYV0PqtdH3/
 dcjf/s6kV44+O8Epan33jeLu3ozyFclITu6S94AtCKGR4aCQ2lqJIMr5LtwBpFNzzYcW
 3xjaVlATfyvsmAuH6zxg1okBK1rLi56SeTX+x3DPB6Qg128cDIuiQXQTvolK6S0arGKm
 rbKbz8n+G+ZL2f9IJSaxF0gA4Szt8nmIL4qQ9cfIgw3qv1cfINF7e5/zoAdd1xu4cfVZ
 7O5A==
X-Gm-Message-State: AMke39mgai86ZiB5OC5PYY2KNcjzcW5ezBPtMgL7wedGpkZMyNrTKBfR6wPWQyrvmMUZiA==
X-Received: by 10.84.218.1 with SMTP id q1mr37333323pli.104.1487653988223;
 Mon, 20 Feb 2017 21:13:08 -0800 (PST)
Received: from aurora.jms.id.au ([203.0.153.9])
 by smtp.gmail.com with ESMTPSA id l25sm37913287pfb.24.2017.02.20.21.13.04
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Mon, 20 Feb 2017 21:13:07 -0800 (PST)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
 Tue, 21 Feb 2017 15:43:01 +1030
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org
Cc: Cyril Bur <cyrilbur@gmail.com>, Lei YU <mine260309@gmail.com>,
 Xo Wang <xow@google.com>
Subject: [PATCH linux dev-4.7 1/2] ARM: dts: aspeed: Fix RAM size in Romulus
 and Witherspoon
Date: Tue, 21 Feb 2017 15:42:58 +1030
Message-Id: <20170221051259.18383-1-joel@jms.id.au>
X-Mailer: git-send-email 2.11.0
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
X-List-Received-Date: Tue, 21 Feb 2017 05:13:11 -0000

They both contain 512M of RAM. Early bringup Witherspoons did have 1G,
but all machines we are using now have 512M.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts     | 2 +-
 arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
index 85e545110be6..58baf87454e2 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
@@ -17,7 +17,7 @@
 	};
 
 	memory {
-		reg = <0x80000000 0x40000000>;
+		reg = <0x80000000 0x20000000>;
 	};
 
 	fsi-master {
diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
index 4b2d8aa8abb6..2cbdeba88908 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
@@ -17,7 +17,7 @@
 	};
 
 	memory {
-		reg = <0x80000000 0x40000000>;
+		reg = <0x80000000 0x20000000>;
 	};
 
 	reserved-memory {
-- 
2.11.0
