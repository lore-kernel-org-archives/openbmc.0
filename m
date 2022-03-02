Return-Path: <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A94D1C433EF
	for <openbmc@archiver.kernel.org>; Wed,  2 Mar 2022 09:25:25 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K7pcg2Zp6z3brJ
	for <openbmc@archiver.kernel.org>; Wed,  2 Mar 2022 20:25:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=YV/F6Xpu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::634;
 helo=mail-pl1-x634.google.com; envelope-from=medadyoung@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=YV/F6Xpu; dkim-atps=neutral
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K7pbx0RZ6z30Jk
 for <openbmc@lists.ozlabs.org>; Wed,  2 Mar 2022 20:24:44 +1100 (AEDT)
Received: by mail-pl1-x634.google.com with SMTP id e13so1069025plh.3
 for <openbmc@lists.ozlabs.org>; Wed, 02 Mar 2022 01:24:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=WaWcwOHmu+CzQ075186NMnPBJxGmawZeuD/n9EcEdJQ=;
 b=YV/F6XpueBprSxXpQ6q0Cm3rSGNkZEJG8x9nlQAWmqx/yxUilVZV3Q1eRdrbBlSe1n
 +E4ziQn6svN4oFkSBNZRKYfOAFTPU12IDOpC0a4kNlL2zigBPVsAgRcUHQT+ADNdYGSH
 6qxCLxtcYBJsnNm6m+XTAjnuzMoZIl8Vj0hQP2827+CzP2k76GINKQdwmB23vgoGxdvk
 b7+17LJmP0skdRmMef8H/GqS0yzbwUT+ZOQunWgjTtbQNM81cJ7QiiVAQV6LlcKnUSEs
 58xKWwBWlAWPNxIxZm4jBr5285OrJhCIrJLEfXuLcduRliEPzZv/v6VUniwVH4Kn5qMz
 WHjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=WaWcwOHmu+CzQ075186NMnPBJxGmawZeuD/n9EcEdJQ=;
 b=knsjct/SLveLp9ZI68xUMtqQwGYkjSh/DwekMvPR5AOk8u3/MZfsC0UnA09bSbEnvS
 vgVG9DIE1JGQ+UQruKglTIVDWpgrgj393jvfC5SH0nAZJOGmNf+AHwOHbkfQ/a7FnvXQ
 rsEvEvbPfkiwlYUpVgtcHZIxEnJicvE1Yl77dQnMUA2DbtyHPv46DMSVKYHzUhtdztdg
 cJMHAT1zUc6eeJa4C8cOqa4R9nF6RjZrzfqEwh97REqlNu6hU2KeHilHr9MqJidWy4Yw
 rwevX82OAscfaNy7rmCnbLOpiubv1cmBBi2LWMu96aQUWA9LTr0DIVVCDGqHbXNAYSJQ
 6Srw==
X-Gm-Message-State: AOAM530YV+gL0DG5K62BhgMxivDbZm/tt5L/A+SYu8u9CT0KN2OGedNI
 XAUSXCG0XMfmn0iieON1Zv0=
X-Google-Smtp-Source: ABdhPJxQUjpx4IZqwNjxYN691wEWHajSm3tH6KYSJTbQPvAxF9vngl/KgZHDYw3IJw7JlEunIdCumg==
X-Received: by 2002:a17:903:32c8:b0:150:1189:c862 with SMTP id
 i8-20020a17090332c800b001501189c862mr30385943plr.134.1646213083073; 
 Wed, 02 Mar 2022 01:24:43 -0800 (PST)
Received: from localhost.localdomain ([112.78.94.140])
 by smtp.gmail.com with ESMTPSA id
 q22-20020a056a00085600b004f397d1f3b5sm21351153pfk.171.2022.03.02.01.24.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Mar 2022 01:24:42 -0800 (PST)
From: Medad CChien <medadyoung@gmail.com>
X-Google-Original-From: Medad CChien <ctcchien@nuvoton.com>
To: rric@kernel.org, james.morse@arm.com, tony.luck@intel.com,
 mchehab@kernel.org, bp@alien8.de, robh+dt@kernel.org,
 benjaminfair@google.com, yuenn@google.com, venture@google.com,
 KWLIU@nuvoton.com, YSCHU@nuvoton.com, JJLIU0@nuvoton.com,
 KFTING@nuvoton.com, avifishman70@gmail.com, tmaimon77@gmail.com,
 tali.perry1@gmail.com
Subject: [PATCH v2 0/3] EDAC: nuvoton: Add nuvoton NPCM EDAC driver
Date: Wed,  2 Mar 2022 17:24:31 +0800
Message-Id: <20220302092434.16625-1-ctcchien@nuvoton.com>
X-Mailer: git-send-email 2.17.1
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
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org,
 Medad CChien <ctcchien@nuvoton.com>, linux-kernel@vger.kernel.org,
 linux-edac@vger.kernel.org
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

Add support for Nuvoton NPCM SoC.

Medad CChien (3):
  ARM: dts: nuvoton: Add new device node
  dt-bindings: edac: npcm-edac.yaml
  EDAC: nuvoton: Add nuvoton NPCM EDAC driver

 .../devicetree/bindings/edac/npcm-edac.yaml   |  62 ++
 arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi |   7 +
 drivers/edac/Kconfig                          |   9 +
 drivers/edac/Makefile                         |   1 +
 drivers/edac/npcm_edac.c                      | 714 ++++++++++++++++++
 5 files changed, 793 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/edac/npcm-edac.yaml
 create mode 100644 drivers/edac/npcm_edac.c

-- 
2.17.1

