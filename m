Return-Path: <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F27DAC28B28
	for <openbmc@archiver.kernel.org>; Wed, 12 Mar 2025 10:13:24 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZCRKQ6W2Mz3dK7
	for <openbmc@archiver.kernel.org>; Wed, 12 Mar 2025 21:13:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::636"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741774389;
	cv=none; b=Qsh4sIK6ox/8tcX4apTvzPBi4IWiUIpTeSGF/X9/F/PP1zLl7kTOLllIBYlucoC3ues8t8CYaqPxxmhT7z0hIQ5FauhbO+JTuZoLuLbgX0/1OWn9jcFA7jNOXreM6fbALPIcei922H9sU9Mo/xPOsUW9Eqlg2PFST9qZmmWpVyV1MC4lr1BuUeexbp2oTuM3wdNbkapAkN6Ma68lOe/9CQzfWnX8wlGVBUConkmcYr6+aqBarh0SCNBo4E5SBfneh0+QrWeZfoph4dtAoGWKIG5KoAh7GWR2e7UZjLywDDjbkA5EwxUuXj0F5ISbdvSCRL/FGtDIlnkbO6I+f05/Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741774389; c=relaxed/relaxed;
	bh=ssZ689uzRDmUxHlgEkNPcIHj8hpdSKUaKA6ZOi0zltg=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=HMfuXR8delttoMDyHYoiXzamQ6X8E2kwXX2iK9xGmjlsv5yMYreI/kP0GhOr9uaUVt1OTJMuVheYCAMFjkZ0Al3YOPYUTr4DUxd5usizuNIz/l3RndVcJug6YseQGXbU8//0LzbGtk7L6yElMfl3+hEiFE2Kkusszw4FaRdOsYcAtXRVaWXa6zBb/KjWvgQ+Em16U7sdmKijzraGZfps04dXBHjeQ7xQO5PT0ImmgYjCYj/y7j/GDZ/MzZ5Bvzn1kerSKu7BOyy8ValHcUSJDI+gYU/oW1yawQz4NCoR3dYyEbDY7eGzLBLF8jUl9qLYidTuFBcsv3OBY9NNTDQYsQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=V32vQu+u; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=V32vQu+u;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZCRKJ4R34z2yDH
	for <openbmc@lists.ozlabs.org>; Wed, 12 Mar 2025 21:13:08 +1100 (AEDT)
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-224341bbc1dso89564295ad.3
        for <openbmc@lists.ozlabs.org>; Wed, 12 Mar 2025 03:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741774385; x=1742379185; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ssZ689uzRDmUxHlgEkNPcIHj8hpdSKUaKA6ZOi0zltg=;
        b=V32vQu+umdbdtp8UVsoSEGuwvgwb6fEkY2tgwxoZkLZhoiANa3pxYYhv29pFndsvNc
         6Xu7uP6GucVUNqfHSn/UxDU0Npa2LbVTMVvhFaHXWJSMyTZzcMIREh7DHQDAsFz7pAtC
         P7rPy3TlaqY3VXAqOhZjVF4DvWECfKVG9tPoH1BaVNtN6wH+S8LQU1oouISReOk4CuFr
         eB7bt2vUUbD0jQdb5v0cds8/jFVYqdYMtN6i2EBJJxFAt6m7eZ4SDRUtjpyOaJN8ArUJ
         I8E+F6OX9/0q3Z8Hk/2HNQSBBwhHZpsjFPS/ABLaQ65eIX0Nfll8WAZRT3zscy3gBKyE
         Biew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741774385; x=1742379185;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ssZ689uzRDmUxHlgEkNPcIHj8hpdSKUaKA6ZOi0zltg=;
        b=DqIUKz5JwclaKOHjXCN3nipt0nB7iZwN9GGnGErBJ4FNsSHK/ziGaFV3cu7gtydk33
         EtCYJKxrUrcvo45kPjfdRGBlcyWcZdYgR3W0nbdjyH29BZQd+qz6dY9Jz/W28szw+1Do
         4nQxMKiCj+o3S7vYWsU8oDGK3G8UeyX2y51TudmeN+kXg0A4Aywu7jdg6SoOd5oA61WO
         WKGUOhypnOyFkaXC1jWwRfQfR6VVnWNF0+VCzOcz6+j7Ex/7TIe+mB4EKtjBkYoEKQ50
         8iyvpoiAHr/1VLsxSLZxXdag2J3K98iqYLoobk4i56CPLfnrtdntmBi0Su2uWTo/NIqK
         uRgQ==
X-Gm-Message-State: AOJu0YzX+78Ltz8nV9xaKCsEbW9X5tiPmC1uOsOk1ZNYCMt6UAqpfIQi
	K5V5AEC2bREUp2qSgb4E0a0CZRu5tKkRZegGFXPyQSD/S4KPlr44oJJsZg==
X-Gm-Gg: ASbGncsaM0M0yV17iX+xZV0DIILPXWIgKwIPDC0i1TAhNkcKPIABOkb7pEWSrXcoGWx
	lNRboatogZeWaF15xU2gUkSi9Esnz2rNfY9OEUUqvwyRFomvrSbOP8kU7o9MugdUb7xl6TI4l0Q
	zav3X9J2YiodN0OjxpgPkgTxMNuhgfuSJVnTzh/EUTPfpF7/MtcL6G9XrRTRqlGPLLU/2fUSotm
	fFsUTIOoIWHSZMgeQxAf7LRWezLOkbUdKgceflotsysyhcTJ46q7P2Qh2t62g3uvrD4t598B58x
	ivscCjl2YppJoMNZbig2vwkNp6p9zsi3C/Z0UYGeRpXWhjHR/8pg5EeHliSAG49XfxoAULUV/Fk
	8WJhdilNOpQKFD89HvbFAdRxEN+EMO+CGNXa3KiIOP+qUV3K2xx1lnhzcHeirlLXT
X-Google-Smtp-Source: AGHT+IEKl5oFC2710eNY+8w6zi7HdnbCuBQqXdthMaPMxtZKo4lbEt2D3MWLVuCTyLQ40sebVOSqIw==
X-Received: by 2002:a17:902:eccc:b0:224:1943:c65 with SMTP id d9443c01a7336-22592e2ca7fmr113093145ad.14.1741774384667;
        Wed, 12 Mar 2025 03:13:04 -0700 (PDT)
Received: from localhost.localdomain (2001-b400-e35c-4352-93e5-842e-726b-dd46.emome-ip6.hinet.net. [2001:b400:e35c:4352:93e5:842e:726b:dd46])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-224109dd5edsm112595815ad.37.2025.03.12.03.12.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 03:13:04 -0700 (PDT)
From: Peter Yin <peteryin.openbmc@gmail.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au
Subject: [linux,dev-6.6 0/4] Align Meta(Facebook) Harma BMC(AST2600)
Date: Wed, 12 Mar 2025 18:12:46 +0800
Message-Id: <20250312101250.3238182-1-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
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
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

Summary:
Align linux device tree entry related to Meta(Facebook) Harma
specific devices connected to BMC(AST2600) SoC.

Link:https://github.com/torvalds/linux/blob/master/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts

Peter Yin (4):
  ARM: dts: aspeed: Harma: Revise node name
  ARM: dts: aspeed: Harma: Add retimer device
  ARM: dts: aspeed: Harma: Modify GPIO line name
  ARM: dts: aspeed: Harma: update sgpio line name

 .../dts/aspeed/aspeed-bmc-facebook-harma.dts  | 76 ++++++++++++-------
 1 file changed, 50 insertions(+), 26 deletions(-)

-- 
2.25.1

