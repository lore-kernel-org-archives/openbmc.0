Return-Path: <brendanhiggins@google.com>
Received: from mail-pf0-x232.google.com (mail-pf0-x232.google.com
 [IPv6:2607:f8b0:400e:c00::232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xjyNx4V04zDqGZ
 for <openbmc@lists.ozlabs.org>; Fri,  1 Sep 2017 08:54:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="hh8Fx/Pd"; 
 dkim-atps=neutral
Received: by mail-pf0-x232.google.com with SMTP id r187so2859851pfr.3
 for <openbmc@lists.ozlabs.org>; Thu, 31 Aug 2017 15:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=xm/KxBiyjmxsU/tCmWl0LJyYSOYK8hEHvHETuBsVIe4=;
 b=hh8Fx/Pd0+iMootLxN8ordBNtbuSDVyCCLDS6fzdLRAgByy5KVCBQSPdydYJ5prNPj
 /zjW95aPDMMPB6yBGpYwRRdUHBLPMZLhq/2LPGwUllNeXO7255Jb4Fl0hg93PW5nZJrn
 PfESWOpIcq+PjSDV2gP4LWMuipDS9tGbe+f71VtoLCIcquLdQs1rw+9m6OMJRQtHwnsz
 vpotfEYbK57dfn7Kwr4fbJCGvNA9+9jecOJ/ZsC+cMj1KojPWAU/CwkDuWn4SDcGOPYL
 4WmhksDvcP+EAduJpy9cUmQV7sa+oQRRSdGAfCpTn28t6dTEY/GV14+44eqnOqUCy6ui
 9p9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=xm/KxBiyjmxsU/tCmWl0LJyYSOYK8hEHvHETuBsVIe4=;
 b=tDT6hHRH1WiFJ/NjmN5x4f+F1BYzgmY1DBnjJY+YPvtu1E5iXjdQsm/3jAGhLDulk3
 FM1x+TyjM1C6W5bcce9ZfKTsQ+510m0dIhebjwZ/BX7kLxqRKrvnSLmqMCQ84torMd47
 ugf4mdVNd/ICrXPSNLNUj/e9i/2m2AOzsUPfIV191DaLDo1H0A9x/OJto0uONpQ6F8nk
 9EI/MRW2Ots1KXzlmfD1rywuYb+B3FUP5Ph3I1hHbj1XRJqu2PThLOAZEqEo8rLfUcAr
 1A/EeWPbi3Lp7B1HY/+UbkkcMcZog+lp2+P5E5P9qLZy/vfFfFBLqdC+U1RF1w5Xi6ZR
 2OJQ==
X-Gm-Message-State: AHPjjUgNQYpf3uAWjVwDLUYV9ojnnsEXoR8sNhE2cSrKWPwXPp8dPlYV
 +I3H7Me5dgQBpL1e
X-Google-Smtp-Source: ADKCNb7tm7vVPxjMaA053CMdvXd5+/q4+oth0rls7fkikZkz2tJ0ygw96lvhkkbcSi+6PEDY7d+b4w==
X-Received: by 10.84.129.195 with SMTP id b61mr26099plb.43.1504220063532;
 Thu, 31 Aug 2017 15:54:23 -0700 (PDT)
Received: from mactruck.svl.corp.google.com ([100.123.242.94])
 by smtp.gmail.com with ESMTPSA id m66sm888461pfc.22.2017.08.31.15.54.22
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 31 Aug 2017 15:54:22 -0700 (PDT)
From: Brendan Higgins <brendanhiggins@google.com>
To: robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk,
 avifishman70@gmail.com, tmaimon77@gmail.com, raltherr@google.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org,
 Brendan Higgins <brendanhiggins@google.com>
Subject: [PATCH v2 3/3] MAINTAINERS: Add entry for the Nuvoton NPCM
 architecture
Date: Thu, 31 Aug 2017 15:54:00 -0700
Message-Id: <20170831225400.19756-4-brendanhiggins@google.com>
X-Mailer: git-send-email 2.14.1.581.gf28d330327-goog
In-Reply-To: <20170831225400.19756-1-brendanhiggins@google.com>
References: <20170831225400.19756-1-brendanhiggins@google.com>
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
X-List-Received-Date: Thu, 31 Aug 2017 22:54:26 -0000

Add maintainers and reviewers for the Nuvoton NPCM architecture.

Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
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
