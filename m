Return-Path: <3Pa-3Ww4KB147NAJ96JDECCEJOCKKCHA.8KIKLAJ7I8HEOPO.KVH67O.KNC@flex--brendanhiggins.bounces.google.com>
Authentication-Results: lists.ozlabs.org; spf=pass (mailfrom)
 smtp.mailfrom=flex--brendanhiggins.bounces.google.com
 (client-ip=2607:f8b0:4864:20::84a; helo=mail-qt1-x84a.google.com;
 envelope-from=3pa-3ww4kb147naj96jdeccejockkcha.8kiklaj7i8heopo.kvh67o.knc@flex--brendanhiggins.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="JuOtnuw+"; 
 dkim-atps=neutral
Received: from mail-qt1-x84a.google.com (mail-qt1-x84a.google.com
 [IPv6:2607:f8b0:4864:20::84a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42Rdl869GwzF3TY
 for <openbmc@lists.ozlabs.org>; Sat,  6 Oct 2018 04:36:48 +1000 (AEST)
Received: by mail-qt1-x84a.google.com with SMTP id i64-v6so6160726qtb.21
 for <openbmc@lists.ozlabs.org>; Fri, 05 Oct 2018 11:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=2kmVx36xgoYV8gF3d/5zwoKOskweja3Ogv6Zox+9+CQ=;
 b=JuOtnuw+ibkCh6EdCaECniMNpzlgwaEgavMkV1uIrrEkGudrO0jT01tH7/yTiDPQt/
 oT9V/Xxi58sChxA0gaj3O61BKtHtRuvAvIU3jso4fAuLekkMWAKZlpfE5M1EC/JwFjKM
 h/5TsPdScY8zYLjCCHUPHY63VGZ2comdnTu2MqcT13nqq2hi+Pcnyl8Yb+3yvZ9elpU6
 fC8DZGscjZXREaohn2xk0uKPh/8cQWyMkWgps/JmfGyL/2RO9vQe7VPhM5kF2pcYk1jg
 5N1bWSTHBgVuCcH2qs5LT918JOMYwK+u75X6AAtMUgEVUnmnpjPPMBnSPPduJjs5jr68
 IZhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=2kmVx36xgoYV8gF3d/5zwoKOskweja3Ogv6Zox+9+CQ=;
 b=AIOglHtPjcPcqTJtlXq0W5//ArgZjvihg46Yw/TukzrQDKTcl9c06H5/DIXvOqEO9H
 0EPAb/6Om/5VEL7pblfa95x8aeHVFCGk00ei16mioYROIno79zzy5M8OfU8z+37/WImV
 jzbOJTwFMqR1alMvLpsmYyMzbb4Y29zQa09qpF8o2G4RJRnDtQvMOfPKerA592khRCPv
 LHnQhbXFVvuZoXytc08ZQwq7pzWLXLfHhcTlG62NOxpqFXuKdGoQuCIzHCFNKGAmuIFl
 NWp8HixLt30Mx5hVvv7q/ol78KE/Vi/kELy4UhhvjpoFiUd4F3DwiiDCp8OO3HlohbIK
 i3Ow==
X-Gm-Message-State: ABuFfoh5EsL/KdONQ/JKoZpVmjOpJqRBUdTPIO9m7rVQ2tt9Ew3Sxrol
 XC6qwwf5hEAkbhMOOW7vbhk2CMLV4Y4YLq9hfY1peQ==
X-Google-Smtp-Source: ACcGV62JoeFcEEaUZfAcd2Uzsc3x94SKj0hSIO7XWGfsDAlYUztq58yJ7wfn4B9/Mmc9KC9GFdSuGpZSDkdX5rg+J4Fk8w==
X-Received: by 2002:ac8:550c:: with SMTP id
 j12-v6mr9308158qtq.59.1538764605743; 
 Fri, 05 Oct 2018 11:36:45 -0700 (PDT)
Date: Fri,  5 Oct 2018 11:33:00 -0700
Message-Id: <20181005183301.10329-1-brendanhiggins@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.19.0.605.g01d371f741-goog
Subject: [PATCH] MAINTAINERS: fix bad pattern in ARM/NUVOTON NPCM
From: Brendan Higgins <brendanhiggins@google.com>
To: joe@perches.com, avifishman70@gmail.com, tmaimon77@gmail.com, 
 venture@google.com, yuenn@google.com, benjaminfair@google.com, 
 akpm@linux-foundation.org, gregkh@linuxfoundation.org
Cc: openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Brendan Higgins <brendanhiggins@google.com>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 05 Oct 2018 18:36:54 -0000

In the process of upstreaming architecture support for ARM/NUVOTON NPCM
include/dt-bindings/clock/nuvoton,npcm7xx-clks.h was renamed
include/dt-bindings/clock/nuvoton,npcm7xx-clock.h without updating
MAINTAINERS. This updates the MAINTAINERS pattern to match the new name
of this file.

Fixes: 6a498e06ba22 ("MAINTAINERS: Add entry for the Nuvoton NPCM architecture")
Reported-by: Joe Perches <joe@perches.com>
Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 544cac829cf4..771378e82de8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1730,7 +1730,7 @@ L:	openbmc@lists.ozlabs.org (moderated for non-subscribers)
 S:	Supported
 F:	arch/arm/mach-npcm/
 F:	arch/arm/boot/dts/nuvoton-npcm*
-F:	include/dt-bindings/clock/nuvoton,npcm7xx-clks.h
+F:	include/dt-bindings/clock/nuvoton,npcm7xx-clock.h
 F:	drivers/*/*npcm*
 F:	Documentation/devicetree/bindings/*/*npcm*
 F:	Documentation/devicetree/bindings/*/*/*npcm*
-- 
2.19.0.605.g01d371f741-goog
