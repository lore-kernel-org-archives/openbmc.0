Return-Path: <joel.stan@gmail.com>
Received: from mail-pf0-x241.google.com (mail-pf0-x241.google.com
 [IPv6:2607:f8b0:400e:c00::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wH9vK4vQ2zDqGx
 for <openbmc@lists.ozlabs.org>; Tue,  2 May 2017 16:13:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="B+OTVf7C"; 
 dkim-atps=neutral
Received: by mail-pf0-x241.google.com with SMTP id g23so30736835pfj.1
 for <openbmc@lists.ozlabs.org>; Mon, 01 May 2017 23:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=kJ5EcVejD/kRGYT2Q6DuO+yRtJQ8GvemS1eMAZ4uWPE=;
 b=B+OTVf7CQYzwmIgF4cEZ213M2mYxh5N5FERd4BiUN6j04/ze/8MfykGEfNgWGwkrJx
 gbUOmVO09rs9HomoSH3Do/Oj7MEqEaJvGLlwTPsjkkFupu7yLM8z+bNrJEyoQtD5dWC0
 ovopbIm7jSW9lJC2vRMrFps7FWDSWf3UgA3mt8D0r5FltTrtof5AhsFXblBaSX1tOAZM
 wWGrtNDUDdrLPPwTaqRqYJLE9nfrV6X8bp4tFWUBGur01b5+hM05c1ijx/OC56Ax8WYW
 490SQ7SPS91mi7P4EGp3gza0m1dDJLazX6oX3rM+ahrMFg/67p0HOGwO5UOkcrSKiSk3
 CQSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references;
 bh=kJ5EcVejD/kRGYT2Q6DuO+yRtJQ8GvemS1eMAZ4uWPE=;
 b=BXQEmHlcNsE9UnD3rNrLbBJvd64Kwmy0E23x0cJIvF6gsgiTxHcxRySp5cToIDQbhq
 A48mon8vtDNWUZZ1KrveggmqBesoJlb6HUHXQmGUOVbvKGAv+HCymVNfYTzU2nT+j15a
 TbORduw34Bn9wQSAZfyLavT1pMI9M9b9kHJRJZHPMULLA6GvaL98WssujgupeFwcL+FA
 wANkYWFmOSlFsib/FyEaMVpXBtKXLkNeqiItTRmFiwc4onV4qDdb5+S6RAuZ4b11Fuh8
 bvx1j+nUeag0P2TVm6KRSJjxdHgNfksjA04DJcAPJ/1OS29LdZbjC2lK+m+NQVyW9eFL
 vZjQ==
X-Gm-Message-State: AN3rC/45krrl7zQBOxvIY+wo0Km2Yfj7BmEwYQCv8Yz9Qut9RI8ooNcJ
 xuOH38bcE6sNQQ==
X-Received: by 10.98.104.4 with SMTP id d4mr30627613pfc.94.1493705579882;
 Mon, 01 May 2017 23:12:59 -0700 (PDT)
Received: from aurora.jms.id.au ([203.0.153.9])
 by smtp.gmail.com with ESMTPSA id s10sm27322723pfe.28.2017.05.01.23.12.56
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Mon, 01 May 2017 23:12:59 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
 Tue, 02 May 2017 15:42:54 +0930
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org
Cc: Lei YU <mine260309@gmail.com>, Samuel Mendoza-Jonas <sam@mendozajonas.com>
Subject: [PATCH linux dev-4.10 2/3] ARM: dts: aspeed: witherspoon: Add
 Infineon ir35221
Date: Tue,  2 May 2017 15:42:38 +0930
Message-Id: <20170502061239.7677-3-joel@jms.id.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170502061239.7677-1-joel@jms.id.au>
References: <20170502061239.7677-1-joel@jms.id.au>
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
X-List-Received-Date: Tue, 02 May 2017 06:13:02 -0000

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
index f20aaf48614d..31da60f8ff49 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
@@ -209,6 +209,11 @@
 	/* CP1 VDD & VCS */
 	/* CP1 VIO */
 
+	hwmon@70 {
+		compatible = "infineon,ir35221";
+		reg = <0x70>;
+	};
+
 	tmp423a@4c {
 		compatible = "ti,tmp423";
 		reg = <0x4c>;
@@ -223,6 +228,11 @@
 	/* CP1 VDD & VCS */
 	/* CP1 VIO */
 
+	hwmon@70 {
+		compatible = "infineon,ir35221";
+		reg = <0x70>;
+	};
+
 	tmp423a@4c {
 		compatible = "ti,tmp423";
 		reg = <0x4c>;
-- 
2.11.0
