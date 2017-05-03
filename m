Return-Path: <mine260309@gmail.com>
Received: from mail-pf0-x244.google.com (mail-pf0-x244.google.com
 [IPv6:2607:f8b0:400e:c00::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wHs0F1PVBzDqBH
 for <openbmc@lists.ozlabs.org>; Wed,  3 May 2017 18:34:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="OjCIPZiu"; 
 dkim-atps=neutral
Received: by mail-pf0-x244.google.com with SMTP id o68so3277455pfj.2
 for <openbmc@lists.ozlabs.org>; Wed, 03 May 2017 01:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=el4gsorQt0hypkW88qhygs5BwPZCTpviPt2UJuJDeIs=;
 b=OjCIPZiuovt+uWqEsoUrmggb7YGzQvMo8JVm6oV6OxRr/YBOkhd7FRbPoPb+YM1/kg
 aau9TKMKDpEIJ3jGH7qH8Qmu4mRy8EuES5rbYJTeWbwIAbYZwsc+7KMDpF6nLoZx3hIm
 6fxQPrggaQSikaKV1HwPutX+cEzVjTcNjw2di5yrJogZ4qZyZ/r8mV6Fa14oDpXrP28e
 v+8ZHjbH1N+dVAey5IVNzR6yILsIwx/xkMI4XpjRWNhzBMatQ/tcQkRNxLQX2gNDpGt2
 n1LfxK8Zubm+ZnjzVey/x8w+Bz2WtInjY21xUCOhYhf56pPypiBGGpI2vcr4nEG0gIfz
 P3Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=el4gsorQt0hypkW88qhygs5BwPZCTpviPt2UJuJDeIs=;
 b=P4HlNBmPL11dv4syLLGotTTJ8k1QUJivJavOhg7JDkjGUgT7UYi7NTZOOktg6HD7H6
 xV8eu/fwdIkrc1PeYcoGIGporD8S7pCzDMTWlQTxTioKIK+9WZFFK36LrCqnGMuxN6ZB
 sSw13ZzYNGGblC+Sg9QzlMCVACoLqcPm2hhr+EH9KWJHw1XcdkCA1xRrWGxgk1A/IGHk
 qHynueq+EMYhPr0lQJu2I+xGHLhQ8IiWr9imeLEwC+9seHeZKJpD0q9sI3VyF7UBGeXq
 9Q9wew03fdofaMXH4MI8j3MGefP8RrR0/8vX5J3IkW015coTHSNWPG4Yn6tmW1/wTwHY
 Gtsg==
X-Gm-Message-State: AN3rC/7C7p4mVg5QzuBXANn36uvhgCXYSAOgT/yWqGCYGo8xLfAiz/kz
 q3G4b0zv4XkRVA==
X-Received: by 10.98.153.216 with SMTP id t85mr3446190pfk.178.1493800475532;
 Wed, 03 May 2017 01:34:35 -0700 (PDT)
Received: from localhost ([159.203.222.251])
 by smtp.gmail.com with ESMTPSA id d76sm3061932pfj.68.2017.05.03.01.34.34
 (version=TLS1_2 cipher=AES128-SHA bits=128/128);
 Wed, 03 May 2017 01:34:34 -0700 (PDT)
From: Lei YU <mine260309@gmail.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.7] arm: dts: aspeed: garrison: Enable wdt2
Date: Wed,  3 May 2017 16:33:50 +0800
Message-Id: <1493800430-5662-1-git-send-email-mine260309@gmail.com>
X-Mailer: git-send-email 1.9.1
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
X-List-Received-Date: Wed, 03 May 2017 08:34:37 -0000

Garrison enabled WDT2 by pulling up GPIOAA7.
Enable wdt2 in dts, otherwise it hangs after WDT2 times out.

Signed-off-by: Lei YU <mine260309@gmail.com>
---
 arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts b/arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts
index 3921bb3..b24d1d1 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts
@@ -116,3 +116,7 @@
 &vuart {
 	status = "okay";
 };
+
+&wdt2 {
+	status = "okay";
+};
-- 
1.9.1
