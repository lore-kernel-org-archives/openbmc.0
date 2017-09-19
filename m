Return-Path: <brendanhiggins@google.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400e:c00::230; helo=mail-pf0-x230.google.com;
 envelope-from=brendanhiggins@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="UlWbsPbf"; 
 dkim-atps=neutral
Received: from mail-pf0-x230.google.com (mail-pf0-x230.google.com
 [IPv6:2607:f8b0:400e:c00::230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xxd9n6g8xzDqNh
 for <openbmc@lists.ozlabs.org>; Wed, 20 Sep 2017 08:40:13 +1000 (AEST)
Received: by mail-pf0-x230.google.com with SMTP id e1so557223pfk.1
 for <openbmc@lists.ozlabs.org>; Tue, 19 Sep 2017 15:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=x4xXaJT+iwfklIZl78tRoUlv5pkmCXjoCNYrMeL1ZhM=;
 b=UlWbsPbfruW4plhy/sb+M/NRbNJGaYOyKNQRNwmjlsV7C1UbQWrQYKIg9ZJM5v4vak
 epYhtLUPtTexnBqYS4t9oDpAsMmdH6qjUxQlRQPFECqdo6cXvV0bND4e7VdB10tJopFs
 pn859AhicqtS8C3kGkkVxthtLcwSFUbcZ3UMUNnYOQj57kvsq7BTIgVwlmRr0KqE3XBR
 U/o/T7MLMZZaba2NKyLVsMOH5amKVqH3JQaQd4I7rFl34xS0OL8cIxT4Dxyu/LUk+l5U
 hV1Za4CCnYsANwqX2uW5r8u1eJZhECX0Zy/39Xq1T9t+A3nv65IyPoKCc89tq7YYGDpG
 bGzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=x4xXaJT+iwfklIZl78tRoUlv5pkmCXjoCNYrMeL1ZhM=;
 b=IHDCnKti2d/9ykLzG25H5T6o/C1c8WeiJGfSc0EzMWfovABxXev7G4eLcZxp5DfM4M
 fMS9XiAxpSNoLFfpD7ceDr9UB8Me1PkwpxV4hQ4WY4+fefmrx3qpIMaREizTSsMynEb8
 tN0/AMWlztGxDb6Upg6/WxfSOwRmZTgTgDHhbeOQLwhQTjNbOqjLJ/YufJ9c2ndPfC0y
 OLXbqutdbaMNNroaEMsLA6YQX8IhXU3wqnDHd3uUVTPSuLbaSemSea4ma9yQFq3F8F5J
 vBsK6dLnmjTxXu3T35sSxzQp84ipXmJN4mGfEj3d68ZFtTxTAJ/B9PGe2CGMgQCtSL4A
 O+UQ==
X-Gm-Message-State: AHPjjUj6EUmkKOz9LLOg2Tz4C7j+vVYl8uA0PTIp5oCl5TvQnRcHhfnM
 oXvPk757nQJRE4VpNAFR9cCgag==
X-Google-Smtp-Source: AOwi7QCxFZS2ZYo6NJxZa2G/Ekiw2v1Ifm0GNdmEZa8kpmrbZ3CpwrQ9HL3UGF/yq/z74vjZ4dWeHw==
X-Received: by 10.98.26.201 with SMTP id a192mr116558pfa.311.1505860811884;
 Tue, 19 Sep 2017 15:40:11 -0700 (PDT)
Received: from mactruck.svl.corp.google.com ([100.123.242.94])
 by smtp.gmail.com with ESMTPSA id v31sm4645309pgn.43.2017.09.19.15.40.10
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 19 Sep 2017 15:40:10 -0700 (PDT)
From: Brendan Higgins <brendanhiggins@google.com>
To: robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk,
 avifishman70@gmail.com, tmaimon77@gmail.com, raltherr@google.com,
 f.fainelli@gmail.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org,
 Brendan Higgins <brendanhiggins@google.com>
Subject: [PATCH v6 3/3] MAINTAINERS: Add entry for the Nuvoton NPCM
 architecture
Date: Tue, 19 Sep 2017 15:40:01 -0700
Message-Id: <20170919224001.22284-4-brendanhiggins@google.com>
X-Mailer: git-send-email 2.14.1.690.gbb1197296e-goog
In-Reply-To: <20170919224001.22284-1-brendanhiggins@google.com>
References: <20170919224001.22284-1-brendanhiggins@google.com>
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
X-List-Received-Date: Tue, 19 Sep 2017 22:40:14 -0000

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
2.14.1.690.gbb1197296e-goog
