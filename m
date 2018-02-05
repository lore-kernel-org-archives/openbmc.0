Return-Path: <brendanhiggins@google.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400e:c01::241; helo=mail-pl0-x241.google.com;
 envelope-from=brendanhiggins@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="SlTO+46b"; 
 dkim-atps=neutral
Received: from mail-pl0-x241.google.com (mail-pl0-x241.google.com
 [IPv6:2607:f8b0:400e:c01::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zb4Kc5kB1zF0vK
 for <openbmc@lists.ozlabs.org>; Tue,  6 Feb 2018 10:58:12 +1100 (AEDT)
Received: by mail-pl0-x241.google.com with SMTP id 11so83121plc.9
 for <openbmc@lists.ozlabs.org>; Mon, 05 Feb 2018 15:58:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=m4f4Hl+hd46YbCK4BUClmAVoFWOa6ByLLAnPohaqIw0=;
 b=SlTO+46bRTd4QyC9jVudJBKf6OzxC5DbBJP89CVJmc8BbtRRYleTORerTm4MjPVazM
 T7Lx1zy0eBrnd1pVEQYyVKSj5ZeWaj7pOcTDVFlvskrjS5xC8S8YG9O3pTQK/jPVTr41
 As4gBl9vtRFUZy7bt+96Ya8hMS0gAUfg0vVjOfWRZwAS0olL5OIhPvqlgl/+TQrhes00
 XzRsdRfoDapKPOTiQ9guw/x1IKDTjyRfZkzcWOSrVe8vddSJ1kPG/NLMVseSS32iJDsZ
 H1Se6lfgnHtPCOBlDFzr8+Iut8Zzta7qgptADk8TB0UpA0SXN51AhiHqwxkQqq5B1y2z
 hlrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=m4f4Hl+hd46YbCK4BUClmAVoFWOa6ByLLAnPohaqIw0=;
 b=AlB7Sn6LdQHqrfC4FPKRm45iOWa3jm4pA7XKX4zwpkNUSzE0jlzPrmPH4vQYp25T47
 Vc8DCGJmwlGldwuvVFx4wk7YdHKWUfjakX6IM85vYXLPFlUHg4jqVvhr6Ouk6EOejce7
 3VScTeSUgGxvKEdEHVR4qpkmnakUWR9neiP+wCAt2E0pMbXOdun0/moNb5skeOsvl0CK
 e5l7VC6Ho79kOnb7k3uJHtDeE2IBpKQutKz4QJvT8LioKogYu6O4yox6gaa2pcFRe4Zd
 34jIzEQRAp++2bw6UUZ7pJ44t12Qcdxx6bgWPIuMEd4a7wZ6A4CDEXOsUPYXtzCtwEN0
 x+0Q==
X-Gm-Message-State: APf1xPAqZwdimn/DF6eM/QXkXEnfjk0ydSOugij0ke54FahxI+Q4VZeN
 c3DOVujpq6OEc3F3Xu7aPSNh0w==
X-Google-Smtp-Source: AH8x2260fVUL0COK9mCw2IIIIu6IGFj5JDdFNxif1hbXaC9IvycFYW0guIyLVNJ1QbNerhjhdzStuA==
X-Received: by 2002:a17:902:6ac7:: with SMTP id
 i7-v6mr482687plt.368.1517875090411; 
 Mon, 05 Feb 2018 15:58:10 -0800 (PST)
Received: from mactruck.svl.corp.google.com ([100.123.242.94])
 by smtp.gmail.com with ESMTPSA id c1sm17803694pfa.119.2018.02.05.15.58.09
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 05 Feb 2018 15:58:09 -0800 (PST)
From: Brendan Higgins <brendanhiggins@google.com>
To: robh+dt@kernel.org, linux@armlinux.org.uk, mark.rutland@arm.com,
 tmaimon77@gmail.com, avifishman70@gmail.com, f.fainelli@gmail.com,
 julien.thierry@arm.com, pombredanne@nexb.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org,
 Brendan Higgins <brendanhiggins@google.com>
Subject: [PATCH v9 3/3] MAINTAINERS: Add entry for the Nuvoton NPCM
 architecture
Date: Mon,  5 Feb 2018 15:57:57 -0800
Message-Id: <20180205235757.246758-4-brendanhiggins@google.com>
X-Mailer: git-send-email 2.16.0.rc1.238.g530d649a79-goog
In-Reply-To: <20180205235757.246758-1-brendanhiggins@google.com>
References: <20180205235757.246758-1-brendanhiggins@google.com>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.25
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 05 Feb 2018 23:58:13 -0000

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
