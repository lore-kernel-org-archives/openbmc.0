Return-Path: <openbmc+bounces-2058-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93FF0CD8CB9
	for <openbmc@archiver.kernel.org>; Tue,  9 Jun 2026 15:54:59 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gZYQ41grpz2yv2;
	Wed, 10 Jun 2026 01:54:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::336"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1781020491;
	cv=none; b=O5HiyPIyNiFW/JGkwzZdpVlqyGMeDFoclwYGOWWL8irLJ+pRiEWbWLwOMc2PP4XxUsOf/xSE6HHYQoqeUoQtDzgnkgExZ1yLzB4QRG6SEcGE7ekGiWSDQuH3d/dDSkheKzbYawhvQCzE0kGu9xfgsY+EalKnt+4j4lAhY6UwvKhT7jsSDqgKHYDWzcvqYHOU6znb8mf0wPZG+aI5oZAq8nX6j2Pu+FiK6+qBnQ+LzDeClnTHqzP1hLvVvbo0rtE35JiYQRFMyn8Jp6KD1gkCF5zWg7oYyzj7vDGtmSE97Qeh3M/njaUkF8nWMDftCP/xI7Xa73FsjbZXgnDPOey+/w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1781020491; c=relaxed/relaxed;
	bh=LtLhNP/JYbWvZK0JJLLTL9lcnhVPXd/ZGsnix6syTLk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=LrQpmiXEnb4r6/cquDo0c4iY9gov7p/KX+dVtKB++cH+LCBJcWI3cFThrTKOoUuOM8Db6Zylwq+0YK7gKx47XsJ8dl3Pid6qtlv6HtwH+8/1umxoJHGE7k+/c4r+kN52Ye7ASbBYMupE9cE2tfGQCRAD1uHqUAiZ7PDvcVNIenFKg0p4fRV2NaxVacAUebqqpyTAXMNJgOYKWXbWlTx5hxb/V/LgIfxR9MQIW81QYE34sObQxeBGb/Dd50eYNFXvRvOTexU0G1xvEzYAC5nU8uUnOfS1RnndvDIWVNcEFkMWPprnWAd0CYHiJAr/w3hITD4DPISt3Xk8zlt2SGF5Yw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=pK+6d54q; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=pK+6d54q;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gZYQ23FfZz2xll
	for <openbmc@lists.ozlabs.org>; Wed, 10 Jun 2026 01:54:49 +1000 (AEST)
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4905529b933so62119395e9.0
        for <openbmc@lists.ozlabs.org>; Tue, 09 Jun 2026 08:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781020486; x=1781625286; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LtLhNP/JYbWvZK0JJLLTL9lcnhVPXd/ZGsnix6syTLk=;
        b=pK+6d54qijona/ZwBP3MPLr4SvlingGuVRZWNC5eoazUlq9oxuZjUCMvdtmojRVXFT
         CI7kDFjaG3AU77ask1Ho7dKlQYcWd/7wPlB+auav6wkLIX/TuvYcNcmXUYmC/tDB1QJy
         y0fuTdYzKdf5RpF23Wph46OTQc5U23OxKcSXzlRSYjfG4eKp7egCjcGI5T5/Pyn3YtpG
         i+BVPm0u7uHyOPg9Xv3mtNHNuuc3kA/E1gXNNCEx2L6te6BKONUSdrS9QUc/UPHPknid
         4FMiV6N9A9UtD5KZAY+HXB/U4q5QDNNEWDt8XkRnMbVwunZiM4o/77alnEONO8o/0gJT
         O5Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781020486; x=1781625286;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LtLhNP/JYbWvZK0JJLLTL9lcnhVPXd/ZGsnix6syTLk=;
        b=otFa4AlelKNJF6wOpgJDiSLd9JuyY6G32oWObH2vCXLusb1SYEEwWvoW9oTh9UwJfP
         +/ohyTlcSWkCX2KI9sVJMxva/ghtFjI4jEZsY98FiTY792OkXtfBZDY4YUM2/UcK6VDp
         beuefiVOQOFwrqp8FPVh4UkpNCyZFyttDRgZMUt6ziRwFlFxjD+TC7QWH+XmiCd3FJUH
         8/gUUOWRIWUykI1hbtliA66vUaQQWCBpfuUiY2mbLNyRq4h7MsaGG0sN3yAeJ8QPTo5/
         jMwfNJLfK90Ru1X8DWm05+SygLsZ27+xIKpjI8EZIc2JrDHhUCmK9gXNrDwYh9Iub3Ia
         obIg==
X-Gm-Message-State: AOJu0Yz9Quq0Bu94Jrw0oMt5eBLagl/yAQ9Khp8fdQrtBRzeiHUbHAGo
	Y3j8lb0mhRZmNNiOdiCQWTGU/1wGVMlzCsRxYDopqOHezfLI6mv8NgWg
X-Gm-Gg: Acq92OFbddQKhZUclAPD8HNMSEVRQcpaazsN3vww3okcE/hx/cLQ7nVYUecgcnzo/zb
	p0qG3zs/Prm/103qGPG6veWgNiizKh3rbs8Hp8Yud/4AdoOFWEkc5C1A4ahoMs8/WeTO5mMwksi
	SMpCuQTNvcibo8V/p7a2yipFY/U4wWbtAsNdV13xQjukgEeDudiuujB+XoWuH4TWfwbCikhKpsi
	AHhrhbZ6hMHxUMxyARKEYE6Gom/SuHqnRH1nz0/9bIu4tKogub44msMunR3qFP73s7vLGiPWv4W
	+/vEy/T/X2IvljsPxsUdF5FTpK+qKFtZkbpPIsDhVp+xx0Xyj2ne1eiPM5zkBS9CqZ6NMft+/1K
	BkIEtpfl28neJiZZhD2ncQLvrDb4WSK0q7PCA2C0xj4dwytojj5WvBZEcY95ag2kgBScwuGj3Ma
	QrcSUMHyuQHe1QwCpqUxJbUE9KOZBcHRIHMFb9rVFfkYiI
X-Received: by 2002:a05:600c:5248:b0:48f:d612:3c4a with SMTP id 5b1f17b1804b1-490c25604demr339249455e9.1.1781020486137;
        Tue, 09 Jun 2026 08:54:46 -0700 (PDT)
Received: from taln60.nuvoton.co.il ([212.199.177.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3d663csm545506645e9.11.2026.06.09.08.54.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 08:54:45 -0700 (PDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: andrew@codeconstruct.com.au,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: openbmc@lists.ozlabs.org,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	avifishman70@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com
Subject: [PATCH v3 0/2] Nuvoton NPCM FIU DTS fixes and binding conversion
Date: Tue,  9 Jun 2026 18:54:35 +0300
Message-Id: <20260609155437.3285042-1-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.34.1
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
Content-Transfer-Encoding: quoted-printable

This series fixes the in-tree NPCM7xx FIU controller nodes so their
resources match what the DTS actually describes, and converts the legacy
Nuvoton NPCM FIU binding to YAML DT schema.

Patch 1 drops the bogus "memory" entry from reg-names on the NPCM7xx FIU
nodes and removes redundant clock-names from those single-clock
controllers.

Patch 2 renames the schema to nuvoton,npcm750-fiu.yaml, explains why the
direct-mapped flash window is optional, keeps the requested example
ordering, and simplifies reg/reg-names to the ordered minItems form.

Changes since version 2:
 - Drop redundant FIU clock-names from the NPCM7xx DTSI together with the
   bogus reg-names cleanup.
 - Rename the schema to nuvoton,npcm750-fiu.yaml and keep reg/reg-names
   immediately after compatible in the example.
 - Explain why the direct-mapped flash window is optional and model
   reg/reg-names as ordered minItems arrays.
 - Drop clock-names from the schema to match the driver and updated DTS.=0D

Changes since version 1:=0D
 - Drop interrupts property.=0D
 - Drop unused label.=0D
 - Keep reg as the second property, followed by reg-names.=0D

Tomer Maimon (2):
  arm: dts: nuvoton: npcm7xx: Drop bogus FIU reg-names and clock-names
  spi: dt-bindings: nuvoton,npcm750-fiu: Convert to DT schema

--=20
2.34.1

