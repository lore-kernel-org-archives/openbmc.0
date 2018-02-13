Return-Path: <brendanhiggins@google.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400e:c05::243; helo=mail-pg0-x243.google.com;
 envelope-from=brendanhiggins@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="WTMMknfQ"; 
 dkim-atps=neutral
Received: from mail-pg0-x243.google.com (mail-pg0-x243.google.com
 [IPv6:2607:f8b0:400e:c05::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zgttw2xXYzDq8f
 for <openbmc@lists.ozlabs.org>; Wed, 14 Feb 2018 07:10:16 +1100 (AEDT)
Received: by mail-pg0-x243.google.com with SMTP id w17so627736pgv.6
 for <openbmc@lists.ozlabs.org>; Tue, 13 Feb 2018 12:10:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=m4f4Hl+hd46YbCK4BUClmAVoFWOa6ByLLAnPohaqIw0=;
 b=WTMMknfQgt3xLaiVLR5S4wtzV/jZRHFBv+aCXwo8RNLBrcT4P60ucbIVDiHCRkLfU/
 kMZkpsXLagTpMvL/CRTp1azzuA+HCpcEuSpzoiWLkI34/I3GsSg+birAy1RS8Jo1gUIG
 64s/KJd1m3kirCG8uTeTpyH1eqCB6C3Oa/VGeV7f+FC14O4BXXkkSKDMnLqqT1MxBO/u
 tWyVQQjgnjaVg7+J6/Z6b4P5NyFPJ2Tq2v3W6IXYmoctk1eYo694erQUQ2MmLISqS3KJ
 uOTODGXM+rjpIDZ1tjozgWK6C0VD//bCmJlvbF7BLwBa0QRmec6gp4uHVegVqS+a17J2
 ySIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=m4f4Hl+hd46YbCK4BUClmAVoFWOa6ByLLAnPohaqIw0=;
 b=GLSl1/eZvZLrWWHIHWtPNr+qIPVIpqeH2H4weEYYuygF/F6gfjuSMMhwG8QTf/D44h
 iCLFl+dkzaUdCH7zz3mzTwnqecSZcbPJW3iq1NzSmi/cCx3M+FSq/SKINFvZUqZD+E36
 XHnRnIsx39bJY+bjkMcHc4oILFzLg0tlNMaqRtA0uM1zK+5VHTymHwrfA2kCxb175pic
 9wA4G8tGzqFU6phKcpSyLnwrgsaN79WfMvau5kURg2A7AsV0ei9zc0UvgHL2vIPQPEYT
 8DIsSzs6hqDIht0GugnwWH7WFD9sTL9Xm9Qq852BMQ0sU1QPoERlLAJu7Ae/pa3Tgf08
 d1hw==
X-Gm-Message-State: APf1xPC8OZ6YruoJk6n9QWfK7qHAKwKzKJhGIKqlrEZj1GunRIg0FIin
 8xETXo6kdZjNKEdRFjR7iN2SMw==
X-Google-Smtp-Source: AH8x225ICycpOoAKOFELny9KK1TXUxKrIaxyyJRu/loXOsbNpgtghK2NHxr7giA6gMbkb8FpoS2Fjw==
X-Received: by 10.101.86.198 with SMTP id w6mr1870064pgs.434.1518552614062;
 Tue, 13 Feb 2018 12:10:14 -0800 (PST)
Received: from mactruck.svl.corp.google.com ([100.123.242.94])
 by smtp.gmail.com with ESMTPSA id y17sm35166894pfk.67.2018.02.13.12.10.12
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 13 Feb 2018 12:10:13 -0800 (PST)
From: Brendan Higgins <brendanhiggins@google.com>
To: robh+dt@kernel.org, linux@armlinux.org.uk, mark.rutland@arm.com,
 tmaimon77@gmail.com, avifishman70@gmail.com, f.fainelli@gmail.com,
 julien.thierry@arm.com, pombredanne@nexb.com, arnd@arndb.de
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org,
 Brendan Higgins <brendanhiggins@google.com>
Subject: [PATCH v10 3/3] MAINTAINERS: Add entry for the Nuvoton NPCM
 architecture
Date: Tue, 13 Feb 2018 12:09:59 -0800
Message-Id: <20180213200959.160157-4-brendanhiggins@google.com>
X-Mailer: git-send-email 2.16.0.rc1.238.g530d649a79-goog
In-Reply-To: <20180213200959.160157-1-brendanhiggins@google.com>
References: <20180213200959.160157-1-brendanhiggins@google.com>
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
X-List-Received-Date: Tue, 13 Feb 2018 20:10:17 -0000

Add maintainers and reviewers for the Nuvoton NPCM architecture.

Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
Reviewed-by: Tomer Maimon <tmaimon77@gmail.com>
Reviewed-by: Avi Fishman <avifishman70@gmail.com>
---
 MAINTAINERS | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 44cb004c765d..2fa95aba0f7f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1598,6 +1598,20 @@ F:	drivers/pinctrl/nomadik/
 F:	drivers/i2c/busses/i2c-nomadik.c
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
2.16.0.rc1.238.g530d649a79-goog
