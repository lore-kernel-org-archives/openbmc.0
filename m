Return-Path: <openbmc+bounces-2764-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7FBFCC6B2D
	for <openbmc@archiver.kernel.org>; Fri, 16 Oct 2026 04:29:16 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4j5X4z47m0z2yTQ;
	Fri, 16 Oct 2026 15:28:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1792080156;
	cv=none; b=KHGkXzDzGHMdy7kvBSantc+Qi/u4JylPb6Q7rNpG3Q7CwrX23O4AWkJzLHJKjr24aNHTXDvJ7V2tfYr0nI5W4m8RgQFoTes4ZtFQfpSCXqb8Pi6DYN2Dm+PB+/DslFAYHeGbPTZmTEXT68YP2xixmstItcafz3rqRcgBFdyJlr9LJMKAloseypLa1clDkK7pNMNhARZHqM6HE3+qvqYPJtcSMW/aeaNtDEEmjBjeU3GlzewryYPL/E1auLASS8wGRB2rKYi1jGoWn6pk78I3yGMg1PPLbkt+uyKxjULe4MlcTPYSz5Ejlq04+SBlN6C9bPRQNleuBsrm0rkFiuiMMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1792080156; c=relaxed/relaxed;
	bh=oUZJWgh1jtbi+p1yrcW64LX48+HiL8UrWIoerSJqBPI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jIcBV6Nu69Dldjoss3IA0Y7Q0hPSAl6/TU2jeXX9vnifTSGqXzoiB28tnCW0L4Iiizzl5uPWjyfnfPF7m40duyOwHDZmC/hDmga6rwNnrsJKlD6qLGbXZ5ntq/EbWVSuztMXDc3fmp465ONHN5fU+E9tvbpEkzfQpQeqQ6vafnkVQWJSSh2iHRdCMxK17s6rsdRH8/q/yjJ5bDS2k7YeWfogoTHE3TQx0eGOk3uKnzuSqzoThlG1AdNKQAtNYENmkHOupqgPu5fwd6gmnn+/yLZtFmu/QhHGQ9Rp8eHW0Ra26CGzbxXbr32dvLD+y9t/5nVjmKT7rXOwPrWPivGgyA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=KFhvYlcJ; dkim-atps=neutral; spf=pass (client-ip=185.246.85.4; helo=smtpout-03.galae.net; envelope-from=miquel.raynal@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=KFhvYlcJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=185.246.85.4; helo=smtpout-03.galae.net; envelope-from=miquel.raynal@bootlin.com; receiver=lists.ozlabs.org)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4j5CWv737Vz2xM9
	for <openbmc@lists.ozlabs.org>; Fri, 16 Oct 2026 03:02:35 +1100 (AEDT)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 0667A4E41249;
	Thu, 15 Oct 2026 16:02:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CE53A6075C;
	Thu, 15 Oct 2026 16:02:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 525A510328BDA;
	Thu, 15 Oct 2026 18:02:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792080147; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=oUZJWgh1jtbi+p1yrcW64LX48+HiL8UrWIoerSJqBPI=;
	b=KFhvYlcJ9F22guPUjZxJPxJYLAH9q4fjgmaXZ+8gV7KT68G1HOHtoBIeUiFh+ixPw3Roo5
	oFbNqrPTplqQq6xi8B/x2Urk3sfAVW982EqN0D6CY2+6iJ0baGIkhkKLbKLFofTbUuN2Uc
	Se1egGcwX1g2Tg9KvjMZs8klYroS2EpC1wlTJDQKbnHJYPHPsYteX25gKW4cNApXIg3zhQ
	H6iUIhiB3QkPHRwmJloogKIgpz4v1R/dbfE0nLObxtAgmBE3WzC3BdS+kIyaV8qe3lcABn
	giZHno8HDLemMMbzlZ/+Fb9cSVSYTWEbjcTPYoTL6iYRoTp6qDDzPQ7w5Gk4GA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Thu, 15 Oct 2026 18:01:21 +0200
Subject: [PATCH v10 08/10] MAINTAINERS: Add myself as Nuvoton MA35D1 clock
 controller
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
Message-Id: <20261015-perso-ma35d1-upstream-clk-v10-8-47c97b54a809@bootlin.com>
References: <20261015-perso-ma35d1-upstream-clk-v10-0-47c97b54a809@bootlin.com>
In-Reply-To: <20261015-perso-ma35d1-upstream-clk-v10-0-47c97b54a809@bootlin.com>
To: Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Richard Cochran <richardcochran@gmail.com>, 
 Arnd Bergmann <arnd@arndb.de>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 openbmc@lists.ozlabs.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

I have the platform, I currently use it for my developpements and
therefore I care about the clock controller driver and the SPI
controller driver not being constantly broken. I would like to step up
to help the Nuvoton team (not visible in the diff since they created
an MA35D1 catch-all entry) in the maintaince of this driver.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6977bc6245b0..c9f482b5edd8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19541,6 +19541,14 @@ F:	drivers/nubus/
 F:	include/linux/nubus.h
 F:	include/uapi/linux/nubus.h
 
+NUVOTON MA35D1 CLOCK CONTROLLER DRIVER
+M:	Miquel Raynal <miquel.raynal@bootlin.com>
+L:	linux-clk@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/clock/nuvoton,ma35d1-clk.yaml
+F:	drivers/clk/nuvoton/clk-ma35d1*
+F:	include/dt-bindings/clock/nuvoton,ma35d1-clk.h
+
 NUVOTON NCT6694 MFD DRIVER
 M:	Ming Yu <tmyu0@nuvoton.com>
 S:	Supported

-- 
2.55.0


