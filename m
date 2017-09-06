Return-Path: <brendanhiggins@google.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400e:c05::22d; helo=mail-pg0-x22d.google.com;
 envelope-from=brendanhiggins@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="fojqeXCX"; 
 dkim-atps=neutral
Received: from mail-pg0-x22d.google.com (mail-pg0-x22d.google.com
 [IPv6:2607:f8b0:400e:c05::22d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xn4HV3GdxzDrFT
 for <openbmc@lists.ozlabs.org>; Wed,  6 Sep 2017 10:30:30 +1000 (AEST)
Received: by mail-pg0-x22d.google.com with SMTP id t3so12383221pgt.0
 for <openbmc@lists.ozlabs.org>; Tue, 05 Sep 2017 17:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=PAQ58rss1CIjkxtt29xMoTxQvGCwLCEuTrfSDD2cz/I=;
 b=fojqeXCXD5iGnTBL7tWS+QfJ6C+ZTYF1WYk56FRSz6qIsD9WQa0Jk8POlADpkTVxi4
 tyqWFrKvDCziVgFgBi+Vro/Xz6eLylR6Rt3RwP44uhaH6wouFgqCNYgilah5qdN406YR
 EikETGMV7r8Rn0hoIWb+rq1HFaQXLgH5s0fJ0cC9nC8HJIZV6bOIDUJrCIk0G5KE3X2T
 Q5Elk66XFiPH5BnKJQI1EnM4XcUpi/wIRhldUYVPjWrqr+Dm/TGa6z5v8q88KXNmFxwg
 9e9hiNp83A48cNGDYl6TPhTv9v6zr4kckcPiIyJZRqyMKpnbdKxW2Royh2/NXYi0qneL
 GZbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=PAQ58rss1CIjkxtt29xMoTxQvGCwLCEuTrfSDD2cz/I=;
 b=iEpXcAA8OL296T3UaEf39oC77GWDxkMlKEVTEyJXlD168SFK5Rgtfmo1XDOaYX9nZp
 sWFJWY6BJVms6Sm1BW01e2Y7XqHEtnyJh7Iz5taNF/19mD9LUl/2rUiS3/0uGg4sAUiG
 6q3rfgmYRCj3zW01qYCopIzPLrd3j0ly9qG9kDgCw/9ONC1WKKNSC2w4lwTkEpVK0xd+
 9HcDZ1r/p2R0BCI7/wHCqea+WGyD3Mfeg92SY+uUWovmRkHfwgDcE0Mtu7rJeSPe0HNd
 lgBUuYCuW4N/5xxKexzgPh8cU/+QkJOinuI+lrNcUVGmsjzxtRLvv5fch92NbeWTNKhj
 wQlA==
X-Gm-Message-State: AHPjjUjmoeMCnz0A0c4t/3H+jyWxMvZztj+jVeCn4Uzz2bdKbrcexScU
 R16ANxHf98zcHD1g
X-Google-Smtp-Source: ADKCNb7jWZoC+5tblQ3GWAkIppQGnTAH3K225BT7pfIDsJ05/4ckZ+CWs1OtLlcV4kUH/UishWPwzw==
X-Received: by 10.99.122.29 with SMTP id v29mr5745188pgc.434.1504657828283;
 Tue, 05 Sep 2017 17:30:28 -0700 (PDT)
Received: from mactruck.svl.corp.google.com ([100.123.242.94])
 by smtp.gmail.com with ESMTPSA id v126sm176808pfv.113.2017.09.05.17.30.26
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 05 Sep 2017 17:30:26 -0700 (PDT)
From: Brendan Higgins <brendanhiggins@google.com>
To: robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk,
 avifishman70@gmail.com, tmaimon77@gmail.com, raltherr@google.com,
 f.fainelli@gmail.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org,
 Brendan Higgins <brendanhiggins@google.com>
Subject: [PATCH v3 3/3] MAINTAINERS: Add entry for the Nuvoton NPCM
 architecture
Date: Tue,  5 Sep 2017 17:30:16 -0700
Message-Id: <20170906003016.2159-4-brendanhiggins@google.com>
X-Mailer: git-send-email 2.14.1.581.gf28d330327-goog
In-Reply-To: <20170906003016.2159-1-brendanhiggins@google.com>
References: <20170906003016.2159-1-brendanhiggins@google.com>
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
X-List-Received-Date: Wed, 06 Sep 2017 00:30:30 -0000

Add maintainers and reviewers for the Nuvoton NPCM architecture.

Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
Reviewed-by: Tomer Maimon <tmaimon77@gmail.com>
Reviewed-by: Avi Fishman <avifishman70@gmail.com>
---
 MAINTAINERS | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 44cb004c765d..67064bf11904 100644
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
+S:	Maintained
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
2.14.1.581.gf28d330327-goog
