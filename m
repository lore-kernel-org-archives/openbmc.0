Return-Path: <brendanhiggins@google.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400e:c05::231; helo=mail-pg0-x231.google.com;
 envelope-from=brendanhiggins@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="l0SrQTp4"; 
 dkim-atps=neutral
Received: from mail-pg0-x231.google.com (mail-pg0-x231.google.com
 [IPv6:2607:f8b0:400e:c05::231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xpxzj5clQzDrnH
 for <openbmc@lists.ozlabs.org>; Sat,  9 Sep 2017 11:53:21 +1000 (AEST)
Received: by mail-pg0-x231.google.com with SMTP id 188so7403709pgb.2
 for <openbmc@lists.ozlabs.org>; Fri, 08 Sep 2017 18:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=cLzSknQeBLlsrsJNP3c7V7XmwYP8kLD6Ox4TaFzfxFo=;
 b=l0SrQTp4P++4Pc9Zz8i5Wsi68uVH9Z0dULEzl0eR8WOfELjlf8QhEse54LE2iKGOCZ
 Fo9mrlow4vClPhPdqgqt5Xf0KcnXQmztlAllCsTaiqGxouY1qWEnbcRkmGynu9QjCxrI
 mQ5J2pfgKONTAtQRGCdIHmW8jBsDhv0uYA8R0kx5QRbP2T52aQegdYCNQSNfNcaw2T/N
 BaGnSx0kusSqaZATnSah1y8PWYaZtBY4Gm5DfzHztTdYT0Uq+mqzRjIyCCud30bsZKEc
 FZxRZOvaz2ezMz+IUWjZZ4X7ZXXXRFyb2Ic9ax/mTLFg2UuTQ5g28EfrFLP8m833ETa7
 4mJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=cLzSknQeBLlsrsJNP3c7V7XmwYP8kLD6Ox4TaFzfxFo=;
 b=iFZLHqb0SZ1ur6CBILoBLp00LYAeO8n5KfhHMW0mni8YZywlw6UJEJWhIzbk34iM1Z
 lxkFUsm2IwUfNXLRLr4Cmv4eNv0R2t2STzV/E9ZS0lXW6fFWDFBrrVBjF7MP3hhzrjiA
 FuhiFkjLLL24956pzv4P61kj8G6fsUZT3QFKGF9o1W4iqpjDNJyfcagS/aRGuCuVvVzR
 CHXWjNXbHRgVqHoRTdVXHgqQ9zHVGl3oo5RGdR4GsMLrw/5d9fu/fIl/HtbUsf2DSiq9
 RcvyLtpFEe8vTRR9+uBUKiYt2lf3oBby7krZtzM9Y1viD2SD20hw5QrHwgB9iubDTUpD
 ruTQ==
X-Gm-Message-State: AHPjjUj94fqprb7xHWcxGGtatpFHyAl5ZM0rieB7vcGEGhsXRFoS7RLv
 BmfFykJ9pdTQa2cx
X-Google-Smtp-Source: ADKCNb6FE73q876JYwjedM4OuyWedepPjcsZD1GcytKAs1FkknV+aUduYFyjDs/LuDWYD5YzAeMUhw==
X-Received: by 10.101.86.79 with SMTP id m15mr4891215pgs.157.1504921999581;
 Fri, 08 Sep 2017 18:53:19 -0700 (PDT)
Received: from mactruck.svl.corp.google.com ([100.123.242.94])
 by smtp.gmail.com with ESMTPSA id z15sm5090132pgs.41.2017.09.08.18.53.18
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 08 Sep 2017 18:53:18 -0700 (PDT)
From: Brendan Higgins <brendanhiggins@google.com>
To: robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk,
 avifishman70@gmail.com, tmaimon77@gmail.com, raltherr@google.com,
 f.fainelli@gmail.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org,
 Brendan Higgins <brendanhiggins@google.com>
Subject: [PATCH v5 3/3] MAINTAINERS: Add entry for the Nuvoton NPCM
 architecture
Date: Fri,  8 Sep 2017 18:53:08 -0700
Message-Id: <20170909015308.30001-4-brendanhiggins@google.com>
X-Mailer: git-send-email 2.14.1.581.gf28d330327-goog
In-Reply-To: <20170909015308.30001-1-brendanhiggins@google.com>
References: <20170909015308.30001-1-brendanhiggins@google.com>
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
X-List-Received-Date: Sat, 09 Sep 2017 01:53:22 -0000

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
2.14.1.581.gf28d330327-goog
