Return-Path: <brendanhiggins@google.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4001:c06::243; helo=mail-io0-x243.google.com;
 envelope-from=brendanhiggins@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="BbDCzZ7U"; 
 dkim-atps=neutral
Received: from mail-io0-x243.google.com (mail-io0-x243.google.com
 [IPv6:2607:f8b0:4001:c06::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yJ40R2kqMzDqJ6
 for <openbmc@lists.ozlabs.org>; Fri, 20 Oct 2017 09:51:03 +1100 (AEDT)
Received: by mail-io0-x243.google.com with SMTP id h70so11497513ioi.4
 for <openbmc@lists.ozlabs.org>; Thu, 19 Oct 2017 15:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=aBDx8H15Am6oJtLDIAKX23e29wNeF52PJfsTwbKpI3I=;
 b=BbDCzZ7UPoRn3o3DiiDqa5LyxpkS3+ar76k+4RLILL93uPsBrIL6sk9foL7FUlMtdD
 hfJNn7koErf2eub4XPVZOr9L80lYVUFrQ+WWB2OgaVkaDoWbaqfbIr7naHgHIbO6wiUO
 VbteW11UGySyYys6KFXCesYchhyOAE3NJVau98LQV6IzJTTAbq0cxXCfSSg3rj2jjmXL
 gDSJM6sLWV72+ywf9nJ3rSllaAtUCob3AuMi+5l7bdaz7LrCtL14oMkVzsktTlSOTmMQ
 UcEgWCbffV4rRy5STO+b4obQvnyWSqEpLimvPLc97blNKedCNo+/Y85U0f6xyKp4k6i5
 snMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=aBDx8H15Am6oJtLDIAKX23e29wNeF52PJfsTwbKpI3I=;
 b=COtCyQmyld0wLS9XOw+MqyGd/70LiP+P5Z03xAjBqL4bV/URYnEzfUf+K++JIl2Fe+
 XZ3MBp/p46Q6E/CPm3SCItsD35z7BsR7hGpr/w6FGc7bVLd7TBNPB+DV1OgmUvSTppP7
 jKFlqsEoskou8aU96H2XfX5STI8rpo7LnnZl0yrBn7G7BCtSvhDtzh4SEp3kuANpGo9Q
 CeQa07zpNZSGY7gkKkSqgr1EONw8XM3Asm074zIEuxn6OT0Yflf9e4dXzVT0r/z5KeRM
 4aff7nz3dKpN3QFcbZEUzB48/+G4nS/kzTGM9y8eeR+VbQGIYYpn+1UCTos3xrtCTonS
 YGHQ==
X-Gm-Message-State: AMCzsaUCoKlybJalYy/kamPMNShrsDtOw4POM7WwjLWblgS40FuRzxXe
 kDtuciP+gSwuNjxsTA8BLHKavw==
X-Google-Smtp-Source: ABhQp+S1UdPS2VWQGC6E9YgqIBaASiyTOQ2btcvYpEdZ0zwjkJk5vkHNbf9DT+SaY+Z4h6ge2IXrpw==
X-Received: by 10.107.53.66 with SMTP id c63mr4178952ioa.212.1508453460886;
 Thu, 19 Oct 2017 15:51:00 -0700 (PDT)
Received: from mactruck.svl.corp.google.com ([100.123.242.94])
 by smtp.gmail.com with ESMTPSA id f193sm521979ita.27.2017.10.19.15.50.59
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 19 Oct 2017 15:51:00 -0700 (PDT)
From: Brendan Higgins <brendanhiggins@google.com>
To: robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk,
 avifishman70@gmail.com, tmaimon77@gmail.com, raltherr@google.com,
 f.fainelli@gmail.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org,
 Brendan Higgins <brendanhiggins@google.com>
Subject: [PATCH v7 3/3] MAINTAINERS: Add entry for the Nuvoton NPCM
 architecture
Date: Thu, 19 Oct 2017 15:50:50 -0700
Message-Id: <20171019225050.25410-4-brendanhiggins@google.com>
X-Mailer: git-send-email 2.15.0.rc0.271.g36b669edcc-goog
In-Reply-To: <20171019225050.25410-1-brendanhiggins@google.com>
References: <20171019225050.25410-1-brendanhiggins@google.com>
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
X-List-Received-Date: Thu, 19 Oct 2017 22:51:03 -0000

Add maintainers and reviewers for the Nuvoton NPCM architecture.

Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
Reviewed-by: Tomer Maimon <tmaimon77@gmail.com>
Reviewed-by: Avi Fishman <avifishman70@gmail.com>
---
 MAINTAINERS | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 44cb004c765d..ec0d35384a16 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1598,6 +1598,19 @@ F:	drivers/pinctrl/nomadik/
 F:	drivers/i2c/busses/i2c-nomadik.c
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git
 
+ARM/NUVOTON NPCM ARCHITECTURE
+M:	Avi Fishman <avifishman70@gmail.com>
+M:	Tomer Maimon <tmaimon77@gmail.com>
+R:	Brendan Higgins <brendanhiggins@google.com>
+R:	Rick Altherr <raltherr@google.com>
+L:	openbmc@lists.ozlabs.org (moderated for non-subscribers)
+S:	Supported
+F:	arch/arm/mach-npcm/
+F:	arch/arm/boot/dts/nuvoton-npcm*
+F:	include/dt-bindings/clock/nuvoton,npcm7xx-clks.h
+F:	drivers/*/*npcm*
+F:	Documentation/*/*npcm*
+
 ARM/NUVOTON W90X900 ARM ARCHITECTURE
 M:	Wan ZongShun <mcuos.com@gmail.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
-- 
2.15.0.rc0.271.g36b669edcc-goog
