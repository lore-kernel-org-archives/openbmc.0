Return-Path: <brendanhiggins@google.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400e:c05::241; helo=mail-pg0-x241.google.com;
 envelope-from=brendanhiggins@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="QlAqwanV"; 
 dkim-atps=neutral
Received: from mail-pg0-x241.google.com (mail-pg0-x241.google.com
 [IPv6:2607:f8b0:400e:c05::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zjHS90H9VzF1JY
 for <openbmc@lists.ozlabs.org>; Fri, 16 Feb 2018 13:40:24 +1100 (AEDT)
Received: by mail-pg0-x241.google.com with SMTP id l131so1358712pga.2
 for <openbmc@lists.ozlabs.org>; Thu, 15 Feb 2018 18:40:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=xXpS5V+0TnQ3T8DWiB2YwDlibE+QQnTBdlXIuEYyZso=;
 b=QlAqwanVd9e2qI1mhJLjYz7FGkziPwFQ88DEsFyW23MFmlgoXxpRCeJB7TB9BUp+5t
 S2qLJE59UIV6Oq8hGEhbaNq4MThI86PwvBp9hHUoFz559qkyzz6gdXpskfjRH9SDtbLo
 w9eNcdkKWAUci73hTbTjTHJb1FKK6sTsnDio8RgwgOmw9zMfa/xGM40My/Gr2TA2+vhs
 GhvzfLb2lsj+bT0XGu+DeVxOgaDTLcpbuoNkg7KL/8iy3DD1p1ovMYUUsjjh7RSuplJm
 sPCwronwpUe2fkOOE3HFcWkmzjJCjqhUIbDArt3O0p+hC8nYEZPTOtfhLJfN5erSLaMe
 x3QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=xXpS5V+0TnQ3T8DWiB2YwDlibE+QQnTBdlXIuEYyZso=;
 b=VqQcuGRo80lW5kyFEu6ejNQ0l2iFeDa0bV+or6Adkket/WS6A5L/0k1RRB/a8QZZSZ
 nhWgeNcp7ShqBmuhAtx2ECebzyqjTkjAYlWR/guUQ8GCoTWcCdIcexlhXswCguXlHDi4
 WDnNFEwQrcHVSqT93xPWrT4URPFW9M47cRLr+MWt2PtaItrtvZ5h+OEiyY23+BYy7n8o
 ZqikQD/7GA3509u0NOYVionETSEuE8y0DinXYW8CKH7EONrpJayQC2sQtEfSx7D+XgS1
 zC4D8o6R1/IQOx0NHf+i2TVNded1xR8ZPlIq/7wZm09KXlAkXQKkOvKOS06wdr96i57K
 NTwg==
X-Gm-Message-State: APf1xPBzhch/TBRrgC3UP16dDX1jYwC2C33tMBwZkT3zr0Akk2+338n1
 i2idL3SxDYPXXRjUOLLT5hyGhg==
X-Google-Smtp-Source: AH8x224cKxX7f3QLgSYsLb6N3rB09wSvxy1HAWnM3Xskhti7YA+lFg6ydchvlySilnZHsnpM6PS5wg==
X-Received: by 10.98.41.194 with SMTP id p185mr4651518pfp.38.1518748822444;
 Thu, 15 Feb 2018 18:40:22 -0800 (PST)
Received: from mactruck.svl.corp.google.com ([100.123.242.94])
 by smtp.gmail.com with ESMTPSA id g16sm9094041pfd.23.2018.02.15.18.40.21
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 15 Feb 2018 18:40:21 -0800 (PST)
From: Brendan Higgins <brendanhiggins@google.com>
To: robh+dt@kernel.org, linux@armlinux.org.uk, mark.rutland@arm.com,
 tmaimon77@gmail.com, avifishman70@gmail.com, julien.thierry@arm.com,
 pombredanne@nexb.com, arnd@arndb.de, olof@lixom.net, khilman@kernel.org
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Brendan Higgins <brendanhiggins@google.com>
Subject: [PATCH v11 3/3] MAINTAINERS: Add entry for the Nuvoton NPCM
 architecture
Date: Thu, 15 Feb 2018 18:40:11 -0800
Message-Id: <20180216024011.189157-4-brendanhiggins@google.com>
X-Mailer: git-send-email 2.16.1.291.g4437f3f132-goog
In-Reply-To: <20180216024011.189157-1-brendanhiggins@google.com>
References: <20180216024011.189157-1-brendanhiggins@google.com>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 16 Feb 2018 02:40:25 -0000

Add maintainers and reviewers for the Nuvoton NPCM architecture.

Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
Reviewed-by: Tomer Maimon <tmaimon77@gmail.com>
Reviewed-by: Avi Fishman <avifishman70@gmail.com>
---
 MAINTAINERS | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3bdc260e36b7..02d1b0345298 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1700,6 +1700,20 @@ F:	Documentation/devicetree/bindings/arm/ste-*
 F:	Documentation/devicetree/bindings/arm/ux500/
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git
 
+ARM/NUVOTON NPCM ARCHITECTURE
+M:	Avi Fishman <avifishman70@gmail.com>
+M:	Tomer Maimon <tmaimon77@gmail.com>
+R:	Patrick Venture <venture@google.com>
+R:	Nancy Yuen <yuenn@google.com>
+R:	Brendan Higgins <brendanhiggins@google.com>
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
2.16.1.291.g4437f3f132-goog
