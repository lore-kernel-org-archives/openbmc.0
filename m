Return-Path: <openbmc+bounces-2107-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FA28CD98F0
	for <openbmc@archiver.kernel.org>; Wed, 17 Jun 2026 04:12:49 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gg9S00kR5z3c71;
	Wed, 17 Jun 2026 14:12:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1034"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1781669551;
	cv=none; b=UmTg33FyvA3Q7OivCWW0OPPhn6/lS3AlQ48cefDiyI9BwOscFmVqdKOofnWmZU6/SYACJWKbaTilzzT//gnvOwLo5LO467C+NKkmzOEX/YlGdvpZMB1ZwCj8AV6pYwJUk2a7rkqfZMyUj/u8OqrtKpePSb3Q0zvLvsvb6YvxmhWdsRIyj9EjXEZr8yeHHnNWT4KNdRa3+5Qx+6WnY/E/sYHALS3RGwQC7tpXWdxaQ4zmpxeP4v5Br7dREzJ8dmo3MQG0qHZOBJrKI8gRrx3Br3c+V5T8kG8z1yUagxBHiF5KRIh6NgK4Sss4J1wURPDyhlb++huzUEninZRMHTebgg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1781669551; c=relaxed/relaxed;
	bh=fJDudshQkqMB7aPEKV0E9L4qqDFygklX+SUMIrfy0VY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Q8RVyqg1v4fNrPhHahwKBLaFLnZTSU4UFqIgsz86WVqOyl2jjJJbK244ycBAFjzhuQiyZGTYHv+UH36HE3Cir4bbTjzfOzpgM7JWyl+H2kwswlU4k/yJx0duafWyg1bULI+oc0qqJQyg6CUllmW0oVsBsUhYc9NdyDBvhGUGsNtVBboZo0B4dY5XgJfk3dnDevGxweXzbKiFtx21PpeRQNoz9EYpkzcDOa8ZrKzBq1O4frKYXp/zBTCNiyeK8hY5b9CgUxZ2Z+Dk5zDH80eOaSUbEu9XnwhmH8GutoIae1vfXx71fukpMOP3CN8PKMrEIwtO60uRda5pjA8ysPiDzA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=P8n6ZyRC; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1034; helo=mail-pj1-x1034.google.com; envelope-from=potin.lai.pt@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=P8n6ZyRC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1034; helo=mail-pj1-x1034.google.com; envelope-from=potin.lai.pt@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gg9Ry0fDCz2yMl
	for <openbmc@lists.ozlabs.org>; Wed, 17 Jun 2026 14:12:29 +1000 (AEST)
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-37c8e7c8185so400440a91.3
        for <openbmc@lists.ozlabs.org>; Tue, 16 Jun 2026 21:12:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781669546; x=1782274346; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fJDudshQkqMB7aPEKV0E9L4qqDFygklX+SUMIrfy0VY=;
        b=P8n6ZyRCLmy9vvjj5ZTDnab79DOLmmtocntNfg9G0tzI9xpN6Egz1XwMewtjctSpVy
         CV8g0RHtFO7OH+Rc/d4t8TbxaPgv3yD9AnliIx8UAHgU5mqPIt2xnroyCtqopFEqIzNF
         OLnzNLz+hGqJpl7+Qd3bHSmur9E/RPcZ0h5QOO+hovqNemeGzWcwurJQDvAl96xH9jAU
         AMf4bNXB0AGWdPq4BG3FJOS83EH3JT6uLeSX2Zvl26UAo9KRAqnt+hyyaTVvw46RqkO4
         ErOZKyg7XmWFd8SwtjoS0WOac2tnhlxV0GDTkpq07A/lhD2cDDIUD57pc9J38rLpOgUN
         6yjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781669546; x=1782274346;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fJDudshQkqMB7aPEKV0E9L4qqDFygklX+SUMIrfy0VY=;
        b=aDN7WmVAlIa5yK11InYPZOKEka6aeaIKKqOoeyqAUfuUUoMMa80phhup3RaApIXx3j
         pTMfbBVUx4g/6r4oSom2qI+LDjSdF/nEkncE6YMxT0dPvsIHbPTOnwNJjWmt///gjTI7
         MN7bB+IoQOYOt+lLmCe2uuyMnuLw0TXStOgEllD8gP/FipvIQJJ4AP//bDm5zmLs+bLg
         sVv1w7aoca5L8b9diXQt7ieXnbaX08DvzHJCCM0v2Jbq1hN2IYxMusangw87yBIo01dB
         YGuo2HZbD6nN9iL/eNH7soQC3TE12ceAHmcoDhE52fWoiQmtz+/zY9hw6uTi9wAA/56O
         V0jw==
X-Gm-Message-State: AOJu0YzJ4vv4BD+wj6WFLNhOg44juwhbIAVTN1X64+PszgDuGYnv3oaU
	kAGzXw/HBsM3K05eiA3nr2Uo7kKBpI5EYA45ZPzFIXxAPIso/k3qjJJtvfTqxg==
X-Gm-Gg: AfdE7ckRE7OOc95N+Yz+C2L8VKtdaHsOCmRHBkMOs2rxKwJLMc5x//04KruD4CvVT/j
	mnlJS0KRRbgTlza4NzxKinFgNFXDAqKZiMe0SvYSLEUgZDLDhqWI2xYZu7S2eXok1rt3ciYVxqV
	Zqlg3kqw/xXRAoQJfU4XcdqMpDPP3TEh6ScGQHggVSHFGmu3oPLEigZd07hndUbUu18I+1205Jx
	zVeh63XpmXhr+uYALh2ekbfjqK7cBMIbvjBHlH9hZmf5TjmNFnP1riK4qqoF+ahLzwwGVPYUC3E
	5Pl4rfr3a+KmauvvfOALcAFSqLUKD9dXJfz+dBLf4kX1sX6nPg34umOxn8JZx9DZuHUWLti8yaI
	fxFTaDjoQU6RAnlncJJEAlmiBgo/+1L6FWo6zndpIKdvOPgOX2+Zt/PzeeEIqC4HG6zCW0YhJ6z
	L+EMF38wxtR8M8lJY/UxsuVBFEMkJaTpnrSQqpJD2G2/z6QBrbQTrNbDwK8mdkxNTcJ1pwKIwoZ
	pU3kkBlWnLf
X-Received: by 2002:a17:90b:562e:b0:37c:6f15:4039 with SMTP id 98e67ed59e1d1-37c93825962mr2245187a91.21.1781669546361;
        Tue, 16 Jun 2026 21:12:26 -0700 (PDT)
Received: from java-bs-ipv4.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c86651a0090sm12804302a12.26.2026.06.16.21.12.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 21:12:25 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au
Cc: Potin Lai <potin.lai.pt@gmail.com>
Subject: [PATCH linux 6.18 0/2] hwmon: (pmbus/lm25066) Support SMBus Current Limit configuration
Date: Wed, 17 Jun 2026 12:10:08 +0800
Message-ID: <20260617041015.3684032-1-potin.lai.pt@gmail.com>
X-Mailer: git-send-email 2.52.0
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
Content-Transfer-Encoding: 8bit

This series adds support for configuring the current limit behavior via
software override on LM25066-compatible devices (excluding LM25056) using
the DEVICE_SETUP (0xD9) register.

When the 'ti,current-range' property is specified in the device tree,
the driver configures the DEVICE_SETUP register's Current Limit Configuration
bit (bit 2) to activate SMBus/software override and sets the Current Limit

Setting bit (bit 4) to "low" or "high" threshold accordingly.
Since LM25056 does not support software override (bit 2 of DEVICE_SETUP is
reserved), it is explicitly excluded from this support in both the device
tree binding schema and the driver.

LORE Link: https://lore.kernel.org/all/20260615-lm25066-cl-config-v3-0-decb4f5b0b77@gmail.com/ 

Potin Lai (2):
  dt-bindings: hwmon: pmbus: ti,lm25066: add current limit properties
  hwmon: (pmbus/lm25066) add current limit configuration support

 .../bindings/hwmon/pmbus/ti,lm25066.yaml      | 20 ++++++++++
 drivers/hwmon/pmbus/lm25066.c                 | 37 +++++++++++++++++++
 2 files changed, 57 insertions(+)

-- 
2.52.0


