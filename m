Return-Path: <joel.stan@gmail.com>
Received: from mail-pf0-x242.google.com (mail-pf0-x242.google.com
 [IPv6:2607:f8b0:400e:c00::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tNBnV2WHYzDw0Q
 for <openbmc@lists.ozlabs.org>; Tue, 22 Nov 2016 15:09:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="EdygmIjd"; 
 dkim-atps=neutral
Received: by mail-pf0-x242.google.com with SMTP id i88so478696pfk.2
 for <openbmc@lists.ozlabs.org>; Mon, 21 Nov 2016 20:09:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=sender:from:to:subject:date:message-id:in-reply-to:references;
 bh=+70mCwz8QCrVFPeSfVQsqgwLGdFAeoW1gBx8VlzkC/4=;
 b=EdygmIjd+ly3IPx1kMe19uD7c1SyTLhuYrx/+nn2KXeMKhqszF3gGsfXJSr05Imi/r
 8KgaZutSzkSZN+yW+xuMxtJUmy7UkBa0YncJbgt4W1YNBVhGsEqXFFebNglWU4dMbdGN
 elfXmGVasoM6rEOdHAqbJrYLDWS7odeaXVv/Ut7vnSecEUVdKMbV9pRHDIJ/eJrafDhg
 NJh56prFsUtVISnEc3lan8RCHck2Y+yz63oPpogh925YqBJTB9wgIl0ngR/4ZbxW9jIJ
 4RaPnLEhLeQvnI2JOfXCm2o6iep93dHasUe3xZi88+TqoTHgFS1W/QGPjsyMy0x8A+1Z
 Rwag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references;
 bh=+70mCwz8QCrVFPeSfVQsqgwLGdFAeoW1gBx8VlzkC/4=;
 b=Khr35jO/Bmu3k8QABnTX4bLTaRmd66JXBvW+eMa6CQ5Syo/2y3G0jIkV4YCU+Q95k6
 nI/JgM8vjKYUjn9Z9NSwb866zwuwIoPh6yTZRv5x7DQcNAYaRfcYQLvMTJTdp8FCOA3c
 36M5snXvYu8x30ku3ZK+Wd+TBdidDdAgjOxgF09weKtf1FFWupy3hsB2EpXMdjytJCYg
 nTkbleq2/MU+pUiVCO6Ie6dkGKv4qj6QcbN5UG85EzOvIo+mZo4zxD2VCWA2qsxIEU2S
 BhNCa33naIR571ylkAMtwlzVyImGOMF5VY0TSWZ3A+SfsKq2NgJXy2AqxBAVWBQQ87Fj
 9GQQ==
X-Gm-Message-State: AKaTC02+yaxpypzNLv1qvhaFOigPG1sDkRUdvSilEoptxLZRut6ESG+L5NPy+uXjtHS61A==
X-Received: by 10.98.150.88 with SMTP id c85mr22876974pfe.68.1479787788798;
 Mon, 21 Nov 2016 20:09:48 -0800 (PST)
Received: from aurora.jms.id.au ([2403:480:11:8000:34fc:e5f1:fa3d:d083])
 by smtp.gmail.com with ESMTPSA id o126sm22778279pga.34.2016.11.21.20.09.45
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Mon, 21 Nov 2016 20:09:48 -0800 (PST)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
 Tue, 22 Nov 2016 14:39:41 +1030
From: Joel Stanley <joel@jms.id.au>
To: andrew@aj.id.au,
	openbmc@lists.ozlabs.org
Subject: [PATCH 7/7] arm: aspeed: Fix unused variable warning
Date: Tue, 22 Nov 2016 14:38:49 +1030
Message-Id: <20161122040849.31604-7-joel@jms.id.au>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20161122040849.31604-1-joel@jms.id.au>
References: <20161122040849.31604-1-joel@jms.id.au>
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
X-List-Received-Date: Tue, 22 Nov 2016 04:09:50 -0000

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/mach-aspeed/aspeed.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm/mach-aspeed/aspeed.c b/arch/arm/mach-aspeed/aspeed.c
index e64497a297a1..a491cd2ff003 100644
--- a/arch/arm/mach-aspeed/aspeed.c
+++ b/arch/arm/mach-aspeed/aspeed.c
@@ -128,8 +128,6 @@ static void __init do_garrison_setup(void)
 
 static void __init do_ast2500evb_setup(void)
 {
-	unsigned long reg;
-
 	/* Set strap to RGMII for dedicated PHY networking */
 	writel(BIT(6) | BIT(7), AST_IO(AST_BASE_SCU | 0x70));
 }
-- 
2.10.2
