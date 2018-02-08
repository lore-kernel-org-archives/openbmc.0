Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400e:c01::243; helo=mail-pl0-x243.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="WH1GQCPJ"; 
 dkim-atps=neutral
Received: from mail-pl0-x243.google.com (mail-pl0-x243.google.com
 [IPv6:2607:f8b0:400e:c01::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zcRmp6NSzzF17c
 for <openbmc@lists.ozlabs.org>; Thu,  8 Feb 2018 16:38:02 +1100 (AEDT)
Received: by mail-pl0-x243.google.com with SMTP id 13-v6so1537487plb.5
 for <openbmc@lists.ozlabs.org>; Wed, 07 Feb 2018 21:38:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Mg631pgN8w6ZU1/VUhMJsXM7cmzP86Ihc69UpeAeoTg=;
 b=WH1GQCPJ9iWMeWpdZjc1Wf7hkhCe5mQsCU/qJ3sdbZnvFS9YwEhr15alD6oAWTBTx0
 TGgSJxhjWrhfoAlO5luVcUnD/NVzgXuY/VNXZAKYkAB58/c97SFX5zc384sVWLBRWUC3
 T8/d705ipPWN8e8gxT5S6YWZOEDNVvUvuqWubX0E0PwQ8BOZ83Fztxaj5wUXLfpO2iE+
 oQL6ISrJJd07jPkuaZ2y/fKOhE80npte5k0wLCyennHMOvWvbaf3HBDl4i2SDAVhDnMd
 2YvP+MYBSVLqB9jgFos+Wnhz1lC3vDhTvPvgaBaOfhTlHE1OuJwQQHzT/3LAX+EIRlaq
 rzrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references;
 bh=Mg631pgN8w6ZU1/VUhMJsXM7cmzP86Ihc69UpeAeoTg=;
 b=ACd5mQr0zBj4mYzNIvrds0v3+6JFJ4zMupE55R37tKLxm74YJOZHtGcKm+bhcO0bLO
 QMEQ5qDulol7I2PX39uxZy/SsWpHrEb3o1Ve02ySx6qbaiFgFY88LISMyiZue5X4+xk+
 hz0hKmKyRAntq6vMFlb1TIQDErCtC8tmWpBGBe5bgWeqHDMXXGle+JOreoQxwxKEq022
 Uo8ccO3zNOF18Z0JSuzjkPY64VgO1kFXpMM+jFXvbGJdALwdAMzXeJ5QouHeXF5178Jb
 ZrL9LIEjOEBs3jUjadN678nw81z8vjZYjYaAxdKUZ8PPcCtVBp+s7MvtBVXnbQhr2IPr
 y3xQ==
X-Gm-Message-State: APf1xPCmldgoO8EYJwnEUyTrju+Ty+a5MQ5eY61h96EMn87j9aiJv9jm
 /DcKt8b57ZDkqqpNGxAmFmrwrIfN
X-Google-Smtp-Source: AH8x224gIrBNLX192KpIANc3HvLwmIX/11T/PQHD6UdVQ5J581C52Pe4D3u3t2RuuNH5yIb5tX0q6Q==
X-Received: by 2002:a17:902:b60b:: with SMTP id
 b11-v6mr8413805pls.210.1518068280121; 
 Wed, 07 Feb 2018 21:38:00 -0800 (PST)
Received: from aurora.jms.id.au ([203.0.153.9])
 by smtp.gmail.com with ESMTPSA id c185sm7573964pfb.146.2018.02.07.21.37.56
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 07 Feb 2018 21:37:59 -0800 (PST)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
 Thu, 08 Feb 2018 16:07:53 +1030
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org
Cc: Lei YU <mine260309@gmail.com>, Andrew Jeffery <andrew@aj.id.au>,
 Cyril Bur <cyrilbur@gmail.com>
Subject: [PATCH linux dev-4.13 1/3] ARM: dts: aspeed: Add LPC clock phandles
Date: Thu,  8 Feb 2018 16:07:43 +1030
Message-Id: <20180208053745.31254-2-joel@jms.id.au>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180208053745.31254-1-joel@jms.id.au>
References: <20180208053745.31254-1-joel@jms.id.au>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.25
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 08 Feb 2018 05:38:03 -0000

The LPC device uses LCLK.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/boot/dts/aspeed-g4.dtsi | 1 +
 arch/arm/boot/dts/aspeed-g5.dtsi | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-g4.dtsi
index 1fb5b410917a..d697380f2f39 100644
--- a/arch/arm/boot/dts/aspeed-g4.dtsi
+++ b/arch/arm/boot/dts/aspeed-g4.dtsi
@@ -233,6 +233,7 @@
 					lpc_ctrl: lpc-ctrl@0 {
 						compatible = "aspeed,ast2400-lpc-ctrl";
 						reg = <0x0 0x80>;
+						clocks = <&syscon ASPEED_CLK_GATE_LCLK>;
 						status = "disabled";
 					};
 
diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
index 77d6d98d24a0..89ef960c4ef3 100644
--- a/arch/arm/boot/dts/aspeed-g5.dtsi
+++ b/arch/arm/boot/dts/aspeed-g5.dtsi
@@ -283,6 +283,7 @@
 					lpc_ctrl: lpc-ctrl@0 {
 						compatible = "aspeed,ast2500-lpc-ctrl";
 						reg = <0x0 0x80>;
+						clocks = <&syscon ASPEED_CLK_GATE_LCLK>;
 						status = "disabled";
 					};
 
-- 
2.15.1
