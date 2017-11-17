Return-Path: <brendanhiggins@google.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400e:c05::242; helo=mail-pg0-x242.google.com;
 envelope-from=brendanhiggins@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="chIvzIsx"; 
 dkim-atps=neutral
Received: from mail-pg0-x242.google.com (mail-pg0-x242.google.com
 [IPv6:2607:f8b0:400e:c05::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ydngj0xXTzDr6M
 for <openbmc@lists.ozlabs.org>; Sat, 18 Nov 2017 06:08:00 +1100 (AEDT)
Received: by mail-pg0-x242.google.com with SMTP id 70so2597051pgf.6
 for <openbmc@lists.ozlabs.org>; Fri, 17 Nov 2017 11:08:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=rE7GnzCiN6JHzhuO8Pb8myU4zN2eXDkAiGcU8CF1pls=;
 b=chIvzIsxUpwCMtF61vJL4attFdT+CnRgMF0pFA1EDvDKusGzHQgCSTRNx47iV5MxBy
 U4itBDSbGZs4SjjkS6gq7oVMt1HpeR3MQKu3U8oW5KRc5lJBIrI0f6PEEtFHX9DxdLzV
 kAOGjTfwF4bBinyULOx/IRCaPCTUxow6tUrcSOjUmIxOREDDj3EZsnmzytcctIvnSDmY
 T8UT+9emSyIpev9BMBzbaGpAXkD38avm6LsobmD4qrtpBDj0WqxKGkhuYkq29Vlp0Geu
 D1FH078ygjPp0ufhY7aClFCRSjh5QrzmKHyyopCN7/6g+/aoqqXXtcidXNr51GEN3xI8
 eCTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=rE7GnzCiN6JHzhuO8Pb8myU4zN2eXDkAiGcU8CF1pls=;
 b=m9PAwkEqwjngg7RIJReO5Cgq8ExHQWTKHDyQ3LMk3B5zZUy1Bddvjz9XZvnD7zTBWE
 U2B+gcbSJFyJKUNDxrZGRJB754u4whyLJudPLzAHprEJjkCwcX88i1xvKwomfiLy82QR
 T22sPrrBIeg0wL/3ZCn0E2V8hIH3y80NIYoX62t7AMeKR8lZyN84rVb0kTFq7Lc4Go7a
 rwbT2av2SVtS3iKVSv+NujZwQIAiMd/cZJAJr4gnYJNV+B/QERQBMca2sWmrhfKZpfig
 bb8hKkvl7nk1i0ThINLOIT8qyXm0p3fdpQYh6UmmtImoG4fFI8+F9bHMwJquFBke8HRL
 5u3A==
X-Gm-Message-State: AJaThX5ZFkIfZQ2DWsWX/Z3biHwQ3R+78p7nVvuvIPD14w0RCksUvisW
 8Q/+lnKKcuGvKA9wEr17tiRdRg==
X-Google-Smtp-Source: AGs4zMbavUYqFY/qR8o0cQ5FdqgJSiTTThoKzzL9akUFgQ+2Xyk37AZDKmm746ZK+r3ZJIKfiIfx+Q==
X-Received: by 10.98.202.131 with SMTP id y3mr3088756pfk.199.1510945678916;
 Fri, 17 Nov 2017 11:07:58 -0800 (PST)
Received: from mactruck.svl.corp.google.com ([100.123.242.94])
 by smtp.gmail.com with ESMTPSA id z71sm11626964pfi.172.2017.11.17.11.07.57
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 17 Nov 2017 11:07:58 -0800 (PST)
From: Brendan Higgins <brendanhiggins@google.com>
To: robh+dt@kernel.org, linux@armlinux.org.uk, mark.rutland@arm.com,
 tmaimon77@gmail.com, avifishman70@gmail.com, raltherr@google.com,
 f.fainelli@gmail.com, julien.thierry@arm.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 openbmc@lists.ozlabs.org
Cc: Brendan Higgins <brendanhiggins@google.com>
Subject: [PATCH v8 3/3] MAINTAINERS: Add entry for the Nuvoton NPCM
 architecture
Date: Fri, 17 Nov 2017 11:07:47 -0800
Message-Id: <20171117190747.21642-4-brendanhiggins@google.com>
X-Mailer: git-send-email 2.15.0.448.gf294e3d99a-goog
In-Reply-To: <20171117190747.21642-1-brendanhiggins@google.com>
References: <20171117190747.21642-1-brendanhiggins@google.com>
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
X-List-Received-Date: Fri, 17 Nov 2017 19:08:01 -0000

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
2.15.0.448.gf294e3d99a-goog
