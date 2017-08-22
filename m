Return-Path: <brendanhiggins@google.com>
Received: from mail-pg0-x230.google.com (mail-pg0-x230.google.com
 [IPv6:2607:f8b0:400e:c05::230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xbx6M2RqpzDrCd
 for <openbmc@lists.ozlabs.org>; Tue, 22 Aug 2017 13:35:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="AH4jtYEn"; 
 dkim-atps=neutral
Received: by mail-pg0-x230.google.com with SMTP id y129so110222485pgy.4
 for <openbmc@lists.ozlabs.org>; Mon, 21 Aug 2017 20:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=VC0X6GjxridP9BUdU/NrzW2BfPrN86CEUJSd9cuRw2s=;
 b=AH4jtYEnaSmo1DFDg8SFLzBA8cV9PpNB07vbUJRWeRh4/HOT3zRHey6vjorIDJSD/6
 NBdeCcJ3UpxgZ37fyIcqkxP/cdGK/Qnh024A5DckYlafo6GWAexxOisBfG6z680hB+cx
 GBXNpV5znfY65Nmu3K6+WVoyLGpYB8lD9v6gWpRw6iNRYCZJzCH/D6kHtkA7nsCRc8AJ
 mmc8OcMY5QylNQ5/eqKwygLsZ8yRRo+3vVUcAu7vdHyU8tUIPK5zHW/tSVN2Kb3lGIov
 yKuN6yNkb+/TD3eT+WlLlckboOUher56KyQB1EQw2+EgfwgRdwymy4cM11tSBl+oLAka
 n3Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=VC0X6GjxridP9BUdU/NrzW2BfPrN86CEUJSd9cuRw2s=;
 b=oCdHMMbV1Z116U4IhIKTh6421TUlJvnMYyB3Naemiy077NCmkjIPzH0byWlCnPytHN
 8JljRIsFxUMhH2krjxyblLc/SOw+swtUmfXfqv6bUJmNeERFGYWYkygpBsxnpoxWILuK
 RV7UoZXySD4ADVMApzOmuy8mZq6kZyhvyGtsDJrWD0VxtuVeSgMW7SzwsOylnraCLdHl
 mm7ctZXeGreDZZk4FiqA+yDkVXvBLsyY64ohRlDVr4+Sn2Yr2pL2G4kbzLNv5lWvdLWV
 1tPa/Fw7yskK3v/VOpY/8KysO50dtHQBdWaGTa8+H47u7DBmfmKPdJ/5Lru+4WkgdGMJ
 qJag==
X-Gm-Message-State: AHYfb5gZE7eccDjIG/5woB8xDQDIXkC6FNjberB86AjXRfLpvPraC/Ah
 2/j8JiKKs/C1ggTa
X-Received: by 10.84.194.131 with SMTP id h3mr22078549pld.82.1503372953310;
 Mon, 21 Aug 2017 20:35:53 -0700 (PDT)
Received: from mactruck.svl.corp.google.com ([100.123.242.94])
 by smtp.gmail.com with ESMTPSA id e184sm25044480pfe.172.2017.08.21.20.35.51
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 21 Aug 2017 20:35:51 -0700 (PDT)
From: Brendan Higgins <brendanhiggins@google.com>
To: robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk,
 avifishman70@gmail.com, tmaimon77@gmail.com, raltherr@google.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org,
 Brendan Higgins <brendanhiggins@google.com>
Subject: [PATCH v1 3/3] MAINTAINERS: Add entry for the Nuvoton NPCM
 architecture
Date: Mon, 21 Aug 2017 20:35:02 -0700
Message-Id: <20170822033502.4100-4-brendanhiggins@google.com>
X-Mailer: git-send-email 2.14.1.480.gb18f417b89-goog
In-Reply-To: <20170822033502.4100-1-brendanhiggins@google.com>
References: <20170822033502.4100-1-brendanhiggins@google.com>
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
X-List-Received-Date: Tue, 22 Aug 2017 03:35:55 -0000

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
2.14.1.480.gb18f417b89-goog
