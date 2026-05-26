Return-Path: <openbmc+bounces-1994-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C841ACD5BC8
	for <openbmc@archiver.kernel.org>; Tue, 26 May 2026 02:03:46 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gPbdT04w7z2yQn;
	Tue, 26 May 2026 12:03:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::b12a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1779761020;
	cv=none; b=gGvbkyDsyEgyI+bf3YjqlfsiVRkULTi7rxaHHp23fGrqXv7FGhX0lt0vRXPnemb5BG2dHnxTgpu+YTE1TKE7G/nAE+n0+MkefNCEg3z6EMotIUmRmNUeBmMx05F7G4X9vMeoRM/RfgA+6AAsARUzsP49OiVVyz9D7tJldnn4WXO4d/sV9talEFfZD80yBWUsWgUuJyJ0pmEMe/mlCAjTXqXNLQ34lA6x99FkQfiyokiVFtsFtQqTOJOZDZ5yOSVYXkpAUGmJVibWPYsBcKAAHvJmXMo7QO6vYdY+QbMEsLhVuEnLRW7CPwyn3tL90AmxN3okVAMbwQBzBvBvej6saQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1779761020; c=relaxed/relaxed;
	bh=BWQQ9JpV4UKS5FKnJhLCNc99YRzGwDoNphFerrdLYWI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=EPKyvZce2heJpeo0ekF+6pF1b3oDTZScMYWsy4i9V8SXynZm8bJ3xx5UMaRqamNpgoH5EqtAzE8w13eKGiDB8RzWg747W9e3gHmR8nFn2i+j9wlc1OPSBDn2KZ7TL9YSYVFCwgoJeD41yW+uzwHsizp7XgXoajbA9y3R21GqgO1mCtKeY5m6s+PdzI72IXAX8hsOiZr8l+MiH842gF3l5xQQ27/E6M1ZMt67GRCz793YZdSzzvI0xMHiB2Fnj02d4D1MlWVm0Cp0TtuIyUwX04nV3HT8l01EFCChbyQce05oI60O0Oew38XKTToPwK5D7Xy92hm2lTQ/SH47ykNHRg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dYfMZ8S+; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::b12a; helo=mail-yx1-xb12a.google.com; envelope-from=anirudhsriniv@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dYfMZ8S+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b12a; helo=mail-yx1-xb12a.google.com; envelope-from=anirudhsriniv@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yx1-xb12a.google.com (mail-yx1-xb12a.google.com [IPv6:2607:f8b0:4864:20::b12a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gPbdR0xVsz2xPb
	for <openbmc@lists.ozlabs.org>; Tue, 26 May 2026 12:03:38 +1000 (AEST)
Received: by mail-yx1-xb12a.google.com with SMTP id 956f58d0204a3-65c5361142fso9395357d50.0
        for <openbmc@lists.ozlabs.org>; Mon, 25 May 2026 19:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779761016; x=1780365816; darn=lists.ozlabs.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BWQQ9JpV4UKS5FKnJhLCNc99YRzGwDoNphFerrdLYWI=;
        b=dYfMZ8S+y2YUuN50l/ZIzQUqUu1CF9iipBIin7NltPvV+0h4XWi6L+xelm2PKCJwmQ
         /3MxDWomeosvppjcX2H74q1t3UpnH9s3viSiYLA8+xl/n2Axq4bx1asHPACrWF2T1tXU
         TvpZoP7sgPNHzM8z8xGqCqtJCevnhMds1p8/XDd9jVQNFrNMLOU0DlyqhMSwlVPoBOaB
         dbHu2XxTOccTVKohukDekyJL9stNwq4BHiukQvbElIm0B5I5ODEAzbi72HWHbkra7YL/
         KGCRIQDq7Y4W/f6O829pc+nZqbkOXwcvA1F/Urcc+DVHkKzTcemy9sB51Z9JXpB55eLz
         gHcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779761016; x=1780365816;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BWQQ9JpV4UKS5FKnJhLCNc99YRzGwDoNphFerrdLYWI=;
        b=Fmu5yGacZUEfiZp11Djizy4/0DhasiqBZkTh1Hz0kMSL5yGeschNmj1uj7K0dhNG+N
         y20vWfExQKWhgHmsHiR3wttIlly0VoTlt/UA8Uek++hlz7fKD1UegL/BA9w8BxkMLWB9
         7cb0QwNKABwUPNWEG8Tp3fVSccTuRORbpZFqvQQdZdHEy5cY6jSXVBfW49djYEiPiTMr
         fFFAYMXVPJDwVAtpbGyu6JrfKungUXJ6MU9nMy+dv2YYRqlghUa89FexFTjDK0o4Y4B+
         RZxL9gnNbROBDcinEykEkMAzUUHSXs3EsBa0ljvDG+lZBGxZL18gjc4OvKVDKjP538+o
         4T1g==
X-Gm-Message-State: AOJu0YxnqGisuMtPv7cCleeRlWVpLKNA+Zr3H74Mqc3NtD8/03wEJO7+
	Q5SnPIuvVh68W63ltOGTAeH+Pvx+4LmEKImCAvefEg7WXi0PLHBJ2gaW
X-Gm-Gg: Acq92OFcO3G5HKNT+xlrCNhLkqapxGLcrk5hGshKZsIh4d/X/yfk07dHsn+P+1Wovy+
	AfnziSWPDoL2WtgnZDjaT3r2Eqlzd1tqLtMueBaK1dKgsXRoOaUQPKDUqC04+F1HowH8F+EJlf3
	EfOUdPn4Ir2jXUd4gz5vvqQdOrAncE42QgebfizT9aNfquVJK9n0U/GD3ZVfrTMcqgtHU+Um09e
	l51AVrTYLNyR0uwl0KUqG8ruPnT4IXf1RxPy3dEqTi4eGs2n5+KwtT/PCbWgmbedstuoykgUP9s
	SK45Kg1MuW6OGuqjj5PkGA1IylLldo7eL89xZxAOBslRYIfPHyk28B1TpXOc27X1LZMNQYodvFM
	X7fogTx+1C8neZ6GL9FiIZMosCYqsxIx+n5O/PRhLsWXDH0nkK+xjdpuZH7pcq60yVX0wFBeCA7
	tfhntAQGJ56Imii0syycxF09z6DUzqsvP5tXxgiQvTRuJHS54=
X-Received: by 2002:a05:690e:14c3:b0:652:5567:b3ec with SMTP id 956f58d0204a3-65ec98e8e97mr16270347d50.37.1779761015719;
        Mon, 25 May 2026 19:03:35 -0700 (PDT)
Received: from [192.168.2.165] ([2600:1700:220:59e0:cdff:ce3f:ce69:17a1])
        by smtp.googlemail.com with ESMTPSA id 956f58d0204a3-65ecfb62626sm5376016d50.5.2026.05.25.19.03.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 19:03:35 -0700 (PDT)
From: Anirudh Srinivasan <anirudhsriniv@gmail.com>
Subject: [PATCH u-boot v3 0/2] Fix default value of mac clk delays and add
 DTS for Asus Kommando
Date: Mon, 25 May 2026 21:03:22 -0500
Message-Id: <20260525-asus-kommando-v3-0-e6a0ca1b4a3e@gmail.com>
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNQQ7CIBREr2L+Wgz8VgquvIdxQQttiVIMtETT9
 O4SNpoYlzOT92aFaII1EU67FYJJNlo/5VDtd9CNahoMsTpnQIqcIgqi4hLJzTunJu2J1KbWvG0
 aqQRk5hFMb5/Fd4GFtN7PcM39aOPsw6vcJFbWP8bECCNSoRAcKZVcnwen7P3QeVdMCT909Utjp
 lHxI+9FpytWf9Pbtr0BXSINofAAAAA=
X-Change-ID: 20260228-asus-kommando-9de4d6b779a8
To: joel@jms.id.au, andrew@codeconstruct.com.au
Cc: openbmc@lists.ozlabs.org, Ender Hsieh <andhsieh@nvidia.com>, 
 Marc Olberding <molberding@nvidia.com>, 
 Chia-Wei Wang <chiawei_wang@aspeedtech.com>, 
 Anirudh Srinivasan <anirudhsriniv@gmail.com>
X-Mailer: b4 0.14.2

This series adds a DT for Asus Kommando, a pcie ipmi card based on
AST2600. Previous versions of this series didn't have networking support
because networking wasn't working in rgmii-id mode properly. Following
the discussion in v2, v3 of this series aims to fix the underlying
issue in the clk driver in u-boot that adds in mac clk delays even when
none are requested.

First patch in the series updates the clk driver to use a default value
of 0 for the ethernet mac clk delays. This patch also updates 3 existing
DTs that use an rgmii based mode, but do not specify a value for the clk
delays in their DT. These DTs are updated to use the old default value
that we changed to 0. Second patch in the series adds a DT for Asus
Kommando.

To: joel@jms.id.au
To: andrew@codeconstruct.com.au
Cc: openbmc@lists.ozlabs.org
Cc: Ender Hsieh	<andhsieh@nvidia.com>
Cc: Marc Olberding <molberding@nvidia.com>
Cc: Chia-Wei Wang <chiawei_wang@aspeedtech.com>

Signed-off-by: Anirudh Srinivasan <anirudhsriniv@gmail.com>
---
Changes in v3:
- Add additional patch to set default clk-delays in aspeed clk driver to
0 + patch existing DTs that rely on the existing default
- Re-add ethernet node to DT
- Link to v2: https://lore.kernel.org/r/20260328-asus-kommando-v2-1-2a656f8cd314@gmail.com

Changes in v2:
- Drop ethernet node from DT
- Add info to commit message on why this was dropped (references to
  linux kernel discussion about aspeed MAC driver fixes) and how to
  re-enable it
- Link to v1: https://lore.kernel.org/r/20260228-asus-kommando-v1-1-9a288620096d@gmail.com

---
Anirudh Srinivasan (2):
      clk: ast2600: set default clk-delay for all ethernet macs to 0
      ARM: dts: aspeed: Add dts for ASUS Kommando IPMI card

 arch/arm/dts/Makefile                            |  1 +
 arch/arm/dts/ast2600-asus-kommando-ipmi-card.dts | 92 ++++++++++++++++++++++++
 arch/arm/dts/ast2600-fpga.dts                    |  6 ++
 arch/arm/dts/ast2600-msx4-bmc-nvidia.dts         |  6 ++
 arch/arm/dts/ast2600-slt.dts                     | 15 ++++
 drivers/clk/aspeed/clk_ast2600.c                 | 45 +++++-------
 6 files changed, 138 insertions(+), 27 deletions(-)
---
base-commit: 17ae8f018476af91f9c80da8e9ec9ef218e0b6de
change-id: 20260228-asus-kommando-9de4d6b779a8

Best regards,
-- 
Anirudh Srinivasan <anirudhsriniv@gmail.com>


