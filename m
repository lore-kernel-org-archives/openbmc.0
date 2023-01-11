Return-Path: <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78B76C46467
	for <openbmc@archiver.kernel.org>; Wed, 11 Jan 2023 09:34:13 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NsMvR4gJDz3cFL
	for <openbmc@archiver.kernel.org>; Wed, 11 Jan 2023 20:34:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=fvIOX+2M;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1029; helo=mail-pj1-x1029.google.com; envelope-from=milkfafa@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=fvIOX+2M;
	dkim-atps=neutral
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NsMtJ4LXdz2xH6
	for <openbmc@lists.ozlabs.org>; Wed, 11 Jan 2023 20:33:10 +1100 (AEDT)
Received: by mail-pj1-x1029.google.com with SMTP id n12so15297337pjp.1
        for <openbmc@lists.ozlabs.org>; Wed, 11 Jan 2023 01:33:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=j5JGnjWO3i/HQRaWW/ClYSWUxpQJi0bOfxlRYOsa604=;
        b=fvIOX+2MbyDpb6mAaTbFjM1YhPGD7tQoZqeQcQ7md/GTnBQ8bYFDxwy/OHcXg0dttY
         Gl9Gkgm9G8gCKwKqEF1IHB5tZGq3Si/jVapjNqAeRig9M7j2cxAZ27h1oT7BSqMkF3ZQ
         BsuAwFBnp3/9SgjHzk+9m0ZMhgbrk4rVYmcBEsmvPqZobX+wJNU7FF/vacqlVbqos4ho
         bxiCzsIeLWcl3Qe+Ig1mm/wDVrz7/3yrXu/nViheKuZgDhOOpkwCBBu1+UYZYBS0BNa/
         2xqFKnTJ/ddZ2lQiSsTZn9Ei0ipn35200FjhN1JHzrr/phZYLP/++k16tr1sDhSrtzjR
         yvMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j5JGnjWO3i/HQRaWW/ClYSWUxpQJi0bOfxlRYOsa604=;
        b=ChhMoJbvCr2DwmkmX3WzrOJaycLJ5XQvnqNg+4+NitKXEK+Ee1bBCi2hJOWdAf9907
         NfxaSvG3VClIKZEmsgSI3JSg7NaB4dhw6tbDD0gsNnSrnTCXgrSQMZyXsMwZyeaS6hbi
         4/BU3iMEs0wInNGcowZzwqDYDC/wO7nqa9UPAkCQXYD3bSXQk/dgeSobYi37beS9Ietq
         aczPX4Lb3V6ZGyyCdrlfJ+Aeb0GT0Wfl1j13XNMrrKS3qY4NyeDXxn7Aho1b/j3VCbtc
         nUtRwX+U9+TDtYZkE8anx01URnfAYPz+gNWDzZ24tFsFU2NmqeIsRuZlW0KmBFIXl0r1
         Rs5g==
X-Gm-Message-State: AFqh2koJXtWcU/yL8IZMFJV2riSV32B8ODg5ldr3R/la5JWmCct4Fyje
	/1adLUb/I5PA6OS7G/6PHGw=
X-Google-Smtp-Source: AMrXdXv79Hzh19xnHhzpgtg3TWw5dDoLxm/jbNYyJredZsg0UrZElvPKgiCoOEFY/BNiSAmjhRC4eA==
X-Received: by 2002:a17:902:7c8a:b0:192:835d:c861 with SMTP id y10-20020a1709027c8a00b00192835dc861mr51821244pll.68.1673429588518;
        Wed, 11 Jan 2023 01:33:08 -0800 (PST)
Received: from hcdev-d520mt2.. (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id u6-20020a170902714600b001769e6d4fafsm2001341plm.57.2023.01.11.01.33.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jan 2023 01:33:08 -0800 (PST)
From: Marvin Lin <milkfafa@gmail.com>
To: krzysztof.kozlowski@linaro.org,
	robh+dt@kernel.org,
	bp@alien8.de,
	tony.luck@intel.com,
	james.morse@arm.com,
	mchehab@kernel.org,
	rric@kernel.org,
	benjaminfair@google.com,
	yuenn@google.com,
	venture@google.com,
	avifishman70@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com
Subject: [PATCH v18 0/3] EDAC/nuvoton: Add NPCM memory controller driver
Date: Wed, 11 Jan 2023 17:32:42 +0800
Message-Id: <20230111093245.318745-1-milkfafa@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: KWLIU@nuvoton.com, YSCHU@nuvoton.com, Marvin Lin <milkfafa@gmail.com>, devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, ctcchien@nuvoton.com, kflin@nuvoton.com, linux-edac@vger.kernel.org
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

This patch series add DTS node, dt-bindings document and driver for memory
controller present on Nuvoton NPCM SoCs.

The memory controller supports single bit error correction and double bit
error detection (in-line ECC in which a section 1/8th of the memory device
used to store data is used for ECC storage).

Changes in v18:
  - Driver refinements
    - Adjust line breaks, order of variable declarations and destroy resources.
    - Catch weired cases by WARN_ON_ONCE.
    - Add defines for constants, and provide injection examples in comment.
  - Correct subject prefixes of patch 2/3.

Changes in v17:
  - Correct subject prefixes of patch 1/3.
  - Change dt-bindings document name to "nuvoton,npcm-memory-controller.yaml"
    and refine the document format.

Changes in v16:
  - Correct dt-bindings document path in MAINTAINERS.
  - Fix wrong indentation in driver.

Changes in v15:
  - Move dt-bindings document to memory-controllers directory and remove
    superfluous string in content title.

Changes in v14:
  - Fix compile warnings.

Changes in v13:
  - Support error injection via debugfs.
  - Fix coding style issues.

Marvin Lin (3):
  ARM: dts: nuvoton: Add node for NPCM memory controller
  dt-bindings: memory-controllers: nuvoton: Add NPCM memory controller
  EDAC/npcm: Add NPCM memory controller driver

 .../nuvoton,npcm-memory-controller.yaml       |  50 ++
 MAINTAINERS                                   |   8 +
 arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi |   7 +
 drivers/edac/Kconfig                          |  11 +
 drivers/edac/Makefile                         |   1 +
 drivers/edac/npcm_edac.c                      | 543 ++++++++++++++++++
 6 files changed, 620 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/nuvoton,npcm-memory-controller.yaml
 create mode 100644 drivers/edac/npcm_edac.c

-- 
2.34.1

