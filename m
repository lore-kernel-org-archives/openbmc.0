Return-Path: <openbmc+bounces-2072-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55B9BCD8CB2
	for <openbmc@archiver.kernel.org>; Wed, 10 Jun 2026 12:18:45 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gb4Z64gJQz2ykX;
	Wed, 10 Jun 2026 22:18:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::32f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1781093918;
	cv=none; b=lSOVALCbF7kgvJLUmcJAT4k5IxgkHX9sLRF0n8m8Ux0u4PprS8QFCYedr9fHoWRjXX2AdaEFE/k81ZlTK5qyHNWtjPgz6neEYgcOOTBBeFEyPLfaTBU5S6MmEjdeCcWJky6Y9ATLsOKhz8yczKoW48sydgrOuppTEQAVJG2M1P2n9WYzpznqYMEiSruqPer/eCDtgzRQbm8KA9fv5W2OsvNtMyJfnh9mxrIyGBUZQ7JDur+r3AbzRq9k7T+kUbbwieUuCfGVqQvxDZ/vfn3x1xH9D3zf+vUpGyEkIgv6a6kn1rYu4me8bEAoHrIux1vQETVi3nU9PkGIh1y4788niw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1781093918; c=relaxed/relaxed;
	bh=0VPo0DaS3Hezc7yA/0Ri7xBuqxAb55K5gZJtR7wfkmI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Yiwj1z6wKs3mkXaFGF62wre9hhKpKAPC5Seydu7fPijXQkwHUV7jsSZ8Z/QkafDd54gLGBVZ5cbu8hVjxbv9VUepLbiCtY7gP+zQsQ6NVmhbp7ApGRZZrSA54CglZCSU1bDi4oDA+b3JVxDFkwciAN8ACROV7kI2sbHSYBgtvozEoTC6kSMm2XGvDDGAczJvcRNdzPHUnDmJk6Zzh1CNy6FgHYPYAXUw8fjcbZTSy/+poXhsrrgFF1VGUQYFQZh07QUTZPsaQxVvLHA9w1UtqohXbyZikGT4dXFPxiahFtLWoz+GB2cjnvyPvMtnoZqa5Lm8G91wLqRmasmZZknSiw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YeDPPWOZ; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YeDPPWOZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gb4Z50Rxrz2xYg
	for <openbmc@lists.ozlabs.org>; Wed, 10 Jun 2026 22:18:35 +1000 (AEST)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-490b915ded5so58208195e9.3
        for <openbmc@lists.ozlabs.org>; Wed, 10 Jun 2026 05:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781093913; x=1781698713; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0VPo0DaS3Hezc7yA/0Ri7xBuqxAb55K5gZJtR7wfkmI=;
        b=YeDPPWOZ+9mDGdkIwdGFCA0FIzXg6Qd+1xcq2KhBRcvx1CBwnHRhZdIAC7JnZX1ltm
         NPeKo17n4rXO5vr4gBSnQnj92xleK5ARKl9+KIzqmuDd00pJlq96TOjFt2uORBRK8L4L
         xeMZVhKWIIn6ufhCblqj8ssQISivkaSNpitXgl+yr9OzwpRNaZ4YGYmVt31tUMlv553s
         uAL83TsLiD/x9fgCH2gvi6F5TVp0Vin0Ojxq08i2yp+9uKFii9gxH4ZBh7OrxK1P+Fe6
         h42cOJltV7ruDz0Cd/SHiv1yU/5Yo7mbUOeky/di72z1dRtEAscPqQrwCDTgR0YvdOjJ
         H7HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781093913; x=1781698713;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0VPo0DaS3Hezc7yA/0Ri7xBuqxAb55K5gZJtR7wfkmI=;
        b=FXZ8Ul8AhTSmxqRtRysGr4EJLJH/yhoAD+k5jDtP1MTnIZrXy9lF0BVU+lzflurw9O
         4wcwNMOtgmVheOH3AIQ1rHYQLUSKWTx80H6z0JrRoXUHtCFebbgP9OAcwF3Z9hcnscaB
         qj1whglu7IECGTEMlME7bmtjRKZEx64Lhyucu899Hp6pjKyld830lHp2osPlHABQaybl
         DN9FMXRx7UJI/y8/5pCpMzg3op7WG9WZM8wCVy9UA53EdG+nR236IEe3NaO3MaKtpxgE
         Yq7NEQbMHB/mWJjDSe5l6d89OvrTuDEgFHG0S9Alofixku0RfcwEi3vLwUhJDS1IX5AV
         Qa0A==
X-Gm-Message-State: AOJu0YzTajgCfu8o1kobCytsNZz/zm1w1VvPKRjAMBesSwDaKqn+1K8o
	jPpHeL4AMzrV8RVbNNHMG1tghJ/zH8BqNH2FvTP2lGsRy1uotfooowQe
X-Gm-Gg: Acq92OHthPPe2akjoK3dEe4Einq51tn2Z9HM2AfdHxnxh4QeRItSxCgU2CTdXzx/uiR
	cJRFyGygGyKahr3HjGZpeA7LX+qqT1gP5ZWdMQE+1/KWADC2TLzVq39JEaVQqTVfXQ1Gap3Oez9
	GQfP1Bo8qKjr9SfWvC5eJmWo5sjaE7TvnqT6y1r0sg+2kM6b2tgfRYsWJL/jw1mXQKPM0Qxem+y
	ndOibOPaSzYXYKHNxGvE2DEI/6kXlnG8YOIW6OPhs3jajvivOotrNawYfJ9vFrrjc3nDnZavKjV
	6zGaH7LMp+O5R3HriyvRDjhnwp/csUQulS2S6JFbDWwBtHq9IMIvj78cofoddPsRXgk/nPIGQn3
	Swj3k/Q4dXJHWrQ6OXEpTcwCx13tH5rwLPqpMA1ztwwuUgITwAOYdkQEX9qDatDU8PMB1bfEysB
	chG51j/OEGJhkmOiR26UG/ZpLHQaVwM8kWLhWZub66Ixz5
X-Received: by 2002:a05:600c:34c7:b0:490:bb45:79ee with SMTP id 5b1f17b1804b1-490c2525299mr414522655e9.0.1781093912703;
        Wed, 10 Jun 2026 05:18:32 -0700 (PDT)
Received: from taln60.nuvoton.co.il ([212.199.177.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc413adbsm566553095e9.15.2026.06.10.05.18.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 05:18:32 -0700 (PDT)
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
Subject: [PATCH v5 0/3] Nuvoton NPCM FIU DTS fixes and binding conversion
Date: Wed, 10 Jun 2026 15:18:19 +0300
Message-Id: <20260610121822.2524634-1-tmaimon77@gmail.com>
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
nodes.

Patch 2 drops redundant clock-names from those single-clock FIU
controllers.

Patch 3 renames the schema to nuvoton,npcm750-fiu.yaml, explains why the
direct-mapped flash window is optional, keeps the requested example
ordering, and simplifies reg/reg-names to the ordered minItems form.

Changes since version 4:
 - Rework patch 2 commit message to describe the DT binding rationale for
   dropping the undocumented FIU clock-names properties.
 - Keep the patch contents unchanged from version 4.

Changes since version 3:=0D
 - Split the DTS cleanup so the reg-names fix stands alone as patch 1.=0D
 - Added review tag to Drop bogus FIU memory reg-names commit.=0D
=0D
Changes since version 2:=0D
 - Drop redundant FIU clock-names from the NPCM7xx DTSI together with the=0D
   bogus reg-names cleanup.=0D
 - Rename the schema to nuvoton,npcm750-fiu.yaml and keep reg/reg-names=0D
   immediately after compatible in the example.=0D
 - Explain why the direct-mapped flash window is optional and model=0D
   reg/reg-names as ordered minItems arrays.=0D
 - Drop clock-names from the schema to match the driver and updated DTS.=0D
=0D
Changes since version 1:=0D
 - Drop interrupts property.=0D
 - Drop unused label.=0D
 - Keep reg as the second property, followed by reg-names.=0D

Tomer Maimon (3):
  arm: dts: nuvoton: npcm7xx: Drop bogus FIU memory reg-names
  arm: dts: nuvoton: npcm7xx: Drop redundant FIU clock-names
  spi: dt-bindings: nuvoton,npcm750-fiu: Convert to DT schema

--=20
2.34.1

