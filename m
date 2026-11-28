Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 420B7606A33D
	for <openbmc@archiver.kernel.org>; Sat, 28 Nov 2026 02:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wkennington-com.20260707.gappssmtp.com header.i=@wkennington-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Wm4PsyHt
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4jbvw16pNRz3bWn;
	Sat, 28 Nov 2026 13:52:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::102f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1795834353;
	cv=none; b=LylWwV3BCnfcuER5OMioq8GioFMCP3mDoWEl9BPn5Y2NlWcgDTVf5y5s/11J8iIx5pT4e/huYr+c22cHbqrtZ4jbSYJk2UCnGhurEzznyFtXnt/yFy3Mw4JXFBfKRjKP6569fcyik3IsdOZN/x/m2CigxU243my+feKRcC0qTffXGhRFUrx3o8Q0IJwKccetYLMnrd+dGxToGhe33LT66+JxOe7vptBbIbcyE27YyowK1OilFRXnlSufhumuKaUcB7aQwgTabKEPByF0Yf0EzSk8VbKo6Ej763MysvN/gKjur1IEE5ySc/y4vMrXxgL/nfMb/Q5w5VmRqiQ++D2LrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1795834353; c=relaxed/relaxed;
	bh=Q/OKruXLAn2hfDxhFwrAwBRikQ31x+YeeUeY/2L4yVU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WpfNNPOZdrQXqbfV7nLJBquuzWE+a5zpjNQkr5abAnPNc95efViIpxdtGZcklBFWtW7uWosQV2Ay7sS6OAXYvsqv6J9M408SuJ7E2+EkeVyNH+6sE2MkEfq977UbAle/n2r95hP8hd7/TT/+rKaTAzqQc6kIl94M6wSXhR0L04tV7/9zt+dJv2s07UtWo7dpUGlQ2OgCWBq3nHycl6RTtzu1D9DMfOjT4uNywovuF16I17RbEb5GQ7JkYRuKb3AWmMf13euWzxj3odabt3vtCkSxjWobiij0Os8c9yhc2CnlLap01fKHxD0+9eIIKA8QjT1D8btP9Quo26cPiBrGdg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wkennington.com; dkim=pass (2048-bit key; unprotected) header.d=wkennington-com.20260707.gappssmtp.com header.i=@wkennington-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Wm4PsyHt; dkim-atps=neutral; spf=none (client-ip=2607:f8b0:4864:20::102f; helo=mail-pj1-x102f.google.com; envelope-from=william@wkennington.com; receiver=lists.ozlabs.org) smtp.mailfrom=wkennington.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wkennington.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wkennington-com.20260707.gappssmtp.com header.i=@wkennington-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Wm4PsyHt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=wkennington.com (client-ip=2607:f8b0:4864:20::102f; helo=mail-pj1-x102f.google.com; envelope-from=william@wkennington.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4jbvvx5BCLz2yGT
	for <openbmc@lists.ozlabs.org>; Sat, 28 Nov 2026 13:52:29 +1100 (AEDT)
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-3b421e8d111so5711012a91.3
        for <openbmc@lists.ozlabs.org>; Fri, 27 Nov 2026 18:52:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wkennington-com.20260707.gappssmtp.com; s=20260707; t=1795834342; x=1796439142; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q/OKruXLAn2hfDxhFwrAwBRikQ31x+YeeUeY/2L4yVU=;
        b=Wm4PsyHtTHOLJ0QixcugsW0ShKYUJkaraQ12z4JkIhpGPgGDMxJZKBI7fCP1kxXajp
         +qSb/LaeB37bUrQYhTN/DohHZb9kHpg/Wa20//g9WLJ/oybaOVYp4llL4WZjoUw+VfuO
         Zeg/Q+igOQ8fuWM9DsnMrdNgRfD8zElOB5z7ix810VHzj0wHzPod6XwL+YOSTZusQR11
         NZ2uUloP/0cxBKxY6a25vYRJvCmfKBrpvK6v+BioKaQ1+w2YFY/FbrD+Yr8k0+KnOYmn
         GzH+dBywf0LJzdzAXTnUqFw3CR210h03TZh/Pte7/mEUd1rzvoGRy/zuQzcfTd8lGNYR
         CP8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795834342; x=1796439142;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q/OKruXLAn2hfDxhFwrAwBRikQ31x+YeeUeY/2L4yVU=;
        b=BWBrNA+pWq6HbIzK5bduQ8/LNHaVe6wgKxbyxx/epzJ51JPJ9uwsJjBgOZc4TYeiMv
         1mcKZXdLgAp4FDbIyupH/8rMekJGeOPTCPDmM28evRDX8Oy2iLGiDSe0r98WFfJdSXoB
         f0ixCrResN8v+DsVYI2y/4WXI1QdeD9wO84WVZ859voNTu06RNFNYcI39nC0hg+OT6bY
         bOhZs60e8dMedCmlrJj3wSjXJ/1fOATqiA0oajtib3etPoMAILpZk0g73INnXbWy7Al6
         dcpmycwSWGqDosg2npN6ovEcvQDPZJ6eiEJWRVO33jNtJ51bgbISE3OkaBb9G+D7+j+C
         wG8Q==
X-Forwarded-Encrypted: i=1; AL+hErFjyRW7galI+cEYjn5y/AuU7eEdJpLduy3SdqjupMXgoCB9s7B2zEuFLlUGonkgAWLfw/LPuzMW@lists.ozlabs.org
X-Gm-Message-State: APuU4Z/JilzRlZdOTr4cK+W9rVEfKrLp27rc2/Quy1+vzk+vgqkacMPX
	tE0PpQsgIlnaDC60AQM14rRGX+1f/n+NejQQJfoFbY/5AAuHMnfBqSYBK5QYribaqrc=
X-Gm-Gg: AZFdTZepdNcNX/3Wht0yBbeIAKkcR8O5pKoZAvK6asp8MbxiqK0JVeeZ3BDISN7w2XX
	Vkgoj+w/y6Yyahfu6Osw9XhFb7dXOKfFp0xZFkzZ0yyZBT7e8Y3mF1ofE3ki/GoOhd67b2dnaBf
	rBaH6z/0+dMlOPrkUlgyNbdEsFw07jSpvqAqISWmhCreRhk6UbLtA7anhJDQ5YB0CVvRL6ILjD7
	cfsEJic4geubXbgeQpYSL9SoiWn8SYFunOYJlksqdIgGmL01QrHN5zqW5L4Zw81T4JHTtEKbOye
	pYTnxOY2cQ9EJCt5vuVRGKD9yWkyum+yJ9FGPnPcmqNJdDssdCRrC35fPE8Hs8JM+Y06mvSpz/A
	RJwHP817J+jyeKC4TQPU4yNNJSna8Da4pqHZNeSOQbsVwpSXLkOYkFiJQFUW8SE5IPQjGcBPqOk
	QxXKiUxILqLwJ963euuRsr7xezxxzfQBi6upLMEhwnRxT/VxRVbpslO3rzO76nhfVazm9mc0rvm
	WVW8T1bhrP6QwRhUtiPR5DCZaOt9rhwvla/mLsg1ysPsO3NEhAEA/SCOEZpLsY4NcK+mCKOCzLW
	AL6lae12uvJdnM459fx4B0wV57HCDeyM405okcHJ0Sq6NWz5Rb4sFYIbnkcm8S8IxTY5/q3jJHz
	Lh/Vvuuvfj97YBQ==
X-Received: by 2002:a17:90b:3c11:b0:3b4:f92:adec with SMTP id 98e67ed59e1d1-3b41cb20ec3mr25787093a91.56.1795834342067;
        Fri, 27 Nov 2026 18:52:22 -0800 (PST)
Received: from wak.c.googlers.com.com (246.21.127.34.bc.googleusercontent.com. [34.127.21.246])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405ffa98esm43492174a91.17.2026.11.27.18.52.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 18:52:21 -0800 (PST)
From: "William A. Kennington III" <william@wkennington.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>,
	Iwona Winiarska <iwona.winiarska@intel.com>,
	devicetree@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	"William A. Kennington III" <william@wkennington.com>
Subject: [PATCH 0/2] ARM: dts: nuvoton: npcm7xx: Fix PECI reg offset and wire watchdog sysgcr
Date: Sat, 28 Nov 2026 02:52:17 +0000
Message-ID: <20261128025219.2679805-1-william@wkennington.com>
X-Mailer: git-send-email 2.56.0.567.gdb80ae8cd5-goog
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
Precedence: list
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Two fixes for nuvoton-common-npcm7xx.dtsi found while bringing up Linux
7.3 on an NPCM730 BMC:

1. The peci node under /ahb/apb uses an absolute address (0xf0100000)
   instead of an APB-relative offset (0x100000), failing address
   translation and causing peci-npcm to fail probe with -EINVAL.
2. watchdog0..2 omit nuvoton,sysgcr = <&gcr>, causing npcm_wdt to warn
   that reset status is not supported since commit 7762911c0d8c.

Both patches were tested on NPCM730 hardware and verified with dtc on
nuvoton-npcm750-evb.dts and nuvoton-npcm730-gsj.dts.

William A. Kennington III (2):
  ARM: dts: nuvoton: npcm7xx: Fix PECI controller reg offset in APB
  ARM: dts: nuvoton: npcm7xx: Add nuvoton,sysgcr to watchdog nodes

 arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)


