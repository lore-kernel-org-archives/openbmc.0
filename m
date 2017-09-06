Return-Path: <brendanhiggins@google.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400e:c00::22f; helo=mail-pf0-x22f.google.com;
 envelope-from=brendanhiggins@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="kXXMixLT"; 
 dkim-atps=neutral
Received: from mail-pf0-x22f.google.com (mail-pf0-x22f.google.com
 [IPv6:2607:f8b0:400e:c00::22f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xnGRW42cBzDrJ7
 for <openbmc@lists.ozlabs.org>; Wed,  6 Sep 2017 18:08:07 +1000 (AEST)
Received: by mail-pf0-x22f.google.com with SMTP id g13so11734901pfm.2
 for <openbmc@lists.ozlabs.org>; Wed, 06 Sep 2017 01:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=PAQ58rss1CIjkxtt29xMoTxQvGCwLCEuTrfSDD2cz/I=;
 b=kXXMixLT6iPm6BUm5EUDZLvOc3CcEOj1slzvdwa7ulD8/gNhwnr7FkevDzNkNX0696
 9yNFSUaj8jv8KAY440PvLhyVGwfKDU7Px62f+XzTKkgLSAyV/BXjqMYqYgz4MplIvNTt
 /BAp5Oi01KD8652uloG7hHrVUDi2zIBs/zlUP/UZD148OQ4xjJPyzBGkYMRwnFKlZhS1
 G5Y4MeF49rS9+xkYQfv7g+LMlBy1c93sf7zSXr1R39KWXAcmcYR4xUUct1P9HydOebY9
 1lWxFoaOGTT/bwN8MopNaCd3iWxUjcVnMV5lvSJTAaCPUmDGyHDUbLJPnBmL34RBHH+O
 S5Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=PAQ58rss1CIjkxtt29xMoTxQvGCwLCEuTrfSDD2cz/I=;
 b=ces9T7kmKcfdpfihrBDyCn59UAyYN0HPQA83HD9l9D60GAQcuX9dFyd3mUSnkVxdPM
 hc4/+n9T0T6LYcoHIcGOQEjptkxjY7TBd6xMWPKvavqzdsmqOl3/qK2fzZm+tUwl4yzx
 i8AlbV7N8I4bh7BPXi53G8rC1XplOk+qGSiQtAwvF/JWyWYP3HChwiNvIHx4IbJE4f1T
 STZVx2pUk/SWDQxxaOvG6srfCzFE0+Hz4+E5G+ewomrIris5yn6vfMZlV0xo/WDHWwVt
 fJw6tK32Vvo/wrpCO5HU53Jct1ZcCCEpQwJFsuaSjuyea3Tbnhr+YKqC+UnH/Kkkxe0f
 oJhg==
X-Gm-Message-State: AHPjjUh15jqR+rZruc2JuHrxcaVyRiMr2azNtp5YQ7MiOVMmJ36PwKlK
 aluf/X3pNz2vaVVR
X-Google-Smtp-Source: ADKCNb6AMMbaAQNqkJOrBfPNcBDzBIimJYQfki1+jvgzxvmiDADf2j3QwS9ej2CB18tv+fvvsqeH1w==
X-Received: by 10.84.128.72 with SMTP id 66mr7329644pla.119.1504685285414;
 Wed, 06 Sep 2017 01:08:05 -0700 (PDT)
Received: from mactruck.svl.corp.google.com ([100.123.242.94])
 by smtp.gmail.com with ESMTPSA id b187sm1687620pfg.135.2017.09.06.01.08.04
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 06 Sep 2017 01:08:04 -0700 (PDT)
From: Brendan Higgins <brendanhiggins@google.com>
To: robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk,
 avifishman70@gmail.com, tmaimon77@gmail.com, raltherr@google.com,
 f.fainelli@gmail.com, joel@jms.id.au
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org,
 Brendan Higgins <brendanhiggins@google.com>
Subject: [PATCH v4 3/3] MAINTAINERS: Add entry for the Nuvoton NPCM
 architecture
Date: Wed,  6 Sep 2017 01:07:51 -0700
Message-Id: <20170906080751.6773-4-brendanhiggins@google.com>
X-Mailer: git-send-email 2.14.1.581.gf28d330327-goog
In-Reply-To: <20170906080751.6773-1-brendanhiggins@google.com>
References: <20170906080751.6773-1-brendanhiggins@google.com>
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
X-List-Received-Date: Wed, 06 Sep 2017 08:08:07 -0000

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
