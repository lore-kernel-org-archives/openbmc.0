Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4003:c06::242; helo=mail-oi0-x242.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="pVH5t5GL"; 
 dkim-atps=neutral
Received: from mail-oi0-x242.google.com (mail-oi0-x242.google.com
 [IPv6:2607:f8b0:4003:c06::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zd38Y39P8zF1Cq
 for <openbmc@lists.ozlabs.org>; Fri,  9 Feb 2018 16:12:13 +1100 (AEDT)
Received: by mail-oi0-x242.google.com with SMTP id 24so5205173oij.3
 for <openbmc@lists.ozlabs.org>; Thu, 08 Feb 2018 21:12:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=bLGq/3LC/tl+SXsu7VUdzai4YXg3rULby7L/uFj5qqc=;
 b=pVH5t5GLx/0baK+2FyvCTmSdoYxDVQIW16xpplKuFFdBaAsETzyxb/sGA7OAKf5+zV
 kGfz0cwwbU8ehq/SYoIfCx9nnVot2fRfG47qeHh74O1WSd37anP8XS3SuccZ9GOLqvDF
 w4o/z050ZafNTeGTf230IgqNy9lxvjUZhw01gDbASVOjvGMxjhb5DZscW/40objhmtK+
 drTjYuBesiyC8yA4fISf7BZlbEtBYt0uY5j4biLQdFxy9B4m0WUJ+rltKMKCRVixhfhT
 irf6rvnll1NFvkM35Egtoyi2vtTwUaP0KP//pDiUpCADg9glZdqObi2wOd0634koZ8cY
 oQsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references;
 bh=bLGq/3LC/tl+SXsu7VUdzai4YXg3rULby7L/uFj5qqc=;
 b=UwcgQWIUFSkybsNy5bym0ajuBL5bUXHh2A4v0Sww8sXkkPyAqMU7WkjrXVj5WhsoY2
 hXRMsgYU67dJGW/SJNvB42Ckjpme2WBkmHZI5c9d5Qsv+B3nVU/pDaOG5g9sq6YSt4+v
 2iz3bFSsisHUfrikrJ6AY5Hnx5sHuGx9vvkP6P8YDYwVMl+RCipRWAYsoKSqGOm6rNy6
 qWhelzY8aijSTPHzemjfWDc4D8Ax33oR5omXN5dk+3KzqGYnQPDTlQCuUZr1XEf/Lw13
 5/Bd+nB6iWvGR9Xsnbv0DSDHMuVoAepgwcz/BreGqFZtiHfz3WfSXxwknfE9oD0p4+v/
 gujw==
X-Gm-Message-State: APf1xPCc1NerlBe2WhhnOKjVemyrA0evAZDSKrtf8U9LsVJNI+8DFVjd
 i3MeiSlYZsypkiIfj7HtTZWR5bVd
X-Google-Smtp-Source: AH8x226raaG+KAM0NjeEtQJSnZBOFDyIKpddy34vjXiJecy8tNbALJXlmRkw1u0SF1Pc3aoFkCdbBw==
X-Received: by 10.202.8.76 with SMTP id 73mr967490oii.326.1518153130559;
 Thu, 08 Feb 2018 21:12:10 -0800 (PST)
Received: from aurora.jms.id.au ([203.0.153.9])
 by smtp.gmail.com with ESMTPSA id o49sm854023oto.46.2018.02.08.21.12.07
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 08 Feb 2018 21:12:09 -0800 (PST)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
 Fri, 09 Feb 2018 15:42:04 +1030
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org
Cc: Lei YU <mine260309@gmail.com>, Andrew Jeffery <andrew@aj.id.au>,
 Cyril Bur <cyrilbur@gmail.com>
Subject: [PATCH linux dev-4.13 v2 1/4] ARM: dts: aspeed: Add LPC clock phandles
Date: Fri,  9 Feb 2018 15:41:55 +1030
Message-Id: <20180209051158.32354-2-joel@jms.id.au>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180209051158.32354-1-joel@jms.id.au>
References: <20180209051158.32354-1-joel@jms.id.au>
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
X-List-Received-Date: Fri, 09 Feb 2018 05:12:13 -0000

The LPC device uses LCLK.

Tested-by: Lei YU <mine260309@gmail.com>
Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
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
