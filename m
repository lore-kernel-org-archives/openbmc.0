Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55A3B606A31C
	for <openbmc@archiver.kernel.org>; Sat, 28 Nov 2026 02:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wkennington-com.20260707.gappssmtp.com header.i=@wkennington-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=LSIB5TmU
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4jbvvz3CSXz30V2;
	Sat, 28 Nov 2026 13:52:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::532"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1795834350;
	cv=none; b=nCk8wb0m9xffYPNF5v/KYYUT2at2u0uG0INWBnOl95YVhhJrHJu5IIQVD639A/qCfTKRoiSw3pM3L1r4n3n+tmUE4JGduc5s6TTAuLlMNqnRbVcfjYWyhB4Tbfg+DdZKJaIwmNfdqmhlAVwacnF3J9EKzu0HkxNTQG0tdAU9T65m8oznW14hfdnKsDmvsGbDeJAeISFzj6uuIb67XdP2A3FVHpR3AD9NNVR9Nn/jeeVb93MDCDHiuvDdqCfFrrszFRGxft4BTr54oNP3NkKFQu+m6uULmzvptDSLjX66xw4HzFUgVJ3tgSYRbqEEt5Ysl056KPMl0BbP54WeWVODXA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1795834350; c=relaxed/relaxed;
	bh=t00wUIQOglo4PlqX8mnXlhh7m8/kx6uygSjOG16Nct4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XP1Mfdk7XWhcnQUVnUz2n11FftNMDMTijkgU0/zq1BGqhVGON5/FSh0Nm1wuSu4shMtum1qUmz71pY+Ab0BHSWfNYbW2xC5ts4lctRa4mQjxclq0L6HJm4vfAE5jmqapUg5nb32tmkH5NArSoZjwzpmG/Jx0ndhW6uUHooGGNawcLAN0ALJD5NVyceLr0HUWitJAHNCEvsNKlMTnRqcd5dLg2+nfuisdkpnsM6ffXVxqF9Uea/qtbYCraZpnx1XGNMYI519YGvEUs/Jzf/aRgD08P+8PdOMIhr2TLPRb4iJzlsUlBM7ePybOd0XMP88DZxWB+23y83TVY+fs8W5alA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wkennington.com; dkim=pass (2048-bit key; unprotected) header.d=wkennington-com.20260707.gappssmtp.com header.i=@wkennington-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=LSIB5TmU; dkim-atps=neutral; spf=none (client-ip=2607:f8b0:4864:20::532; helo=mail-pg1-x532.google.com; envelope-from=william@wkennington.com; receiver=lists.ozlabs.org) smtp.mailfrom=wkennington.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wkennington.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wkennington-com.20260707.gappssmtp.com header.i=@wkennington-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=LSIB5TmU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=wkennington.com (client-ip=2607:f8b0:4864:20::532; helo=mail-pg1-x532.google.com; envelope-from=william@wkennington.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4jbvvw5GgMz2y97
	for <openbmc@lists.ozlabs.org>; Sat, 28 Nov 2026 13:52:26 +1100 (AEDT)
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-cc4be0e5351so5556937a12.0
        for <openbmc@lists.ozlabs.org>; Fri, 27 Nov 2026 18:52:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wkennington-com.20260707.gappssmtp.com; s=20260707; t=1795834343; x=1796439143; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t00wUIQOglo4PlqX8mnXlhh7m8/kx6uygSjOG16Nct4=;
        b=LSIB5TmUkK10enN0+qe4oki2PinqyBRXN6TIQrECHI3JGMaumJEDUA0rQOtYB0XySr
         u7vCuxPhHwY8CTl7xUuEZ7KPLv+ai5MfAJ35sF+WBnqTNjBYTZc2xXbB+CbQjcT8NLB2
         vcAoltrjAgysf10DW2chzHR379icoWLLKC3wezwX6Wt9E987i94lHoU3Q2FOFrFzyoGk
         wbBKHAth0rqCOEwqOh+iBFQcC/M/3aHSO6rBGhhaD1SAYKoULhn47bjQg3vEYFE4KX99
         bqa9GPgN9VaWnmOY+cKrMQN6zUPS7jwnccJH6ccTY13cxbPoiLOL2jQgg3peITa8ODMy
         Hung==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795834343; x=1796439143;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=t00wUIQOglo4PlqX8mnXlhh7m8/kx6uygSjOG16Nct4=;
        b=alW2N6jJElQeI4EF9m76xJ8jDMx+ho253nz2kcSWz295vNngcDPHWzty2fPHoDTDvU
         LBRQaL6mBZ85ToFgDRrdwaDQWEi9mIi1smxW1oB+2ElFaVX5ALEC+0NdbtDwei67VTjl
         sHwwsOiV0i7iIExw8QU46evDjyQgyxj/m2NXM5aF+Q82UyfQzcL4PMFX4HY2vWjrKole
         7u7zPOtIT+Q1eA0kQHL7Xo0LLMUD00xmLpJzcXNZLt30ef/oU7gCJCgT9RfblxZwoI4e
         DQcujKtyLmPkNHheJaHYodn62J5/pEuGcgiZrFM/TBOR6IrgU+VYUd99/ltLVjuua9p8
         Co2w==
X-Forwarded-Encrypted: i=1; AL+hErHq9npLAbQZLlgmEUE/lnwa9neDLeR+q3VKJXn+T+cX1Av5YgQULJhG3x0n0eL9lMNLedgKNJu5@lists.ozlabs.org
X-Gm-Message-State: APuU4Z/qsvhVUeqq12B/BQjNp0s64agfpwtRQQleTNFqUfvfoMgaL0ug
	YV98JLy4IWTZomint3XXAUUYpjevi1ci33QZWQpAgF9NmBHHj2FCWlwzQe/BExQRBuA=
X-Gm-Gg: AZFdTZcWPUC5Q5f4m5q6YXdSfxfK257T68HteP2SQDVFhax1HV1lFqDRtMwCahy8dMC
	bd8b/erotOfhAD707IFlkVckqXBIbnsUqUfXH5TrrLj04BQRm5nFlwILRio7lijstq2gTB00NUD
	xXRjgD/ksvR2c9d2borhRT7XNzNejd4MFyo2Bb4KFCETrXH50p7Ax0zk0hrJS/u1SkI90ZEuGPn
	BG0PBxpmTffZEBzKlRlNOBeo3/ya1gLVLqlDnqRMyMscEqJD/maVS1hum6v2hkalQ+LYaMLgt/1
	H0TVUSOxA5jnarxjXYDluu9bpUa6DxdsK4hWcunnW58vsUmjVooTehcyZo+flZy8s9tuqdgdtJF
	4h2uY8IcmQf6A5yqBA3hnMZseOKEexjk+F4Cxx5m+s+ciS/AoiNUQjUU1zwCksFwvINTwSk1Zx3
	TK+em2q2B2WCugw1RdR+YWjQhzzDTD4g0V6NdamFxWxJSETy2j94CZPF1SAyrjB82/Bh1aV9C5t
	7piv2k6M+ML2qBlH33qFc/J5Dec/5O21esjoNFcAuF1oOiySMSsXhvr9aMzcw9tXm2ECpgH4I6T
	gmvgWLGAC+ZfRmPFopBO8yrwWLgHwjoxSCY+bfxlXLsnmvNS2DenVBOJNGrRAzOa5DMsAX4XHFv
	zxpLSiLZ70ObYRCz1xs0+tS/Yai2iq13Xpqg=
X-Received: by 2002:a17:90b:2f8c:b0:3b3:af8e:ea8d with SMTP id 98e67ed59e1d1-3b41c92a403mr26168454a91.39.1795834343106;
        Fri, 27 Nov 2026 18:52:23 -0800 (PST)
Received: from wak.c.googlers.com.com (246.21.127.34.bc.googleusercontent.com. [34.127.21.246])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405ffa98esm43492174a91.17.2026.11.27.18.52.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 18:52:22 -0800 (PST)
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
Subject: [PATCH 2/2] ARM: dts: nuvoton: npcm7xx: Add nuvoton,sysgcr to watchdog nodes
Date: Sat, 28 Nov 2026 02:52:19 +0000
Message-ID: <20261128025219.2679805-3-william@wkennington.com>
X-Mailer: git-send-email 2.56.0.567.gdb80ae8cd5-goog
In-Reply-To: <20261128025219.2679805-1-william@wkennington.com>
References: <20261128025219.2679805-1-william@wkennington.com>
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
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Since commit 7762911c0d8c ("watchdog: npcm: add bootstatus support"),
npcm_wdt looks up the GCR syscon via the optional nuvoton,sysgcr
phandle (defined in nuvoton,npcm750-wdt.yaml) to read reset status and
logs a warning when it is absent:

  Failed to find nuvoton,sysgcr, WD reset status not supported

Wire <&gcr> to watchdog0..2 in nuvoton-common-npcm7xx.dtsi. Tested on
an NPCM730 BMC, clearing the warning and enabling bootstatus.

Signed-off-by: William A. Kennington III <william@wkennington.com>
---
 arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi b/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi
index 3862adf85b68..e9765fd6ef8e 100644
--- a/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi
+++ b/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi
@@ -375,6 +375,7 @@ watchdog0: watchdog@801C {
 				reg = <0x801C 0x4>;
 				status = "disabled";
 				clocks = <&clk NPCM7XX_CLK_TIMER>;
+				nuvoton,sysgcr = <&gcr>;
 			};
 
 			watchdog1: watchdog@901C {
@@ -383,6 +384,7 @@ watchdog1: watchdog@901C {
 				reg = <0x901C 0x4>;
 				status = "disabled";
 				clocks = <&clk NPCM7XX_CLK_TIMER>;
+				nuvoton,sysgcr = <&gcr>;
 			};
 
 			watchdog2: watchdog@a01C {
@@ -391,6 +393,7 @@ watchdog2: watchdog@a01C {
 				reg = <0xa01C 0x4>;
 				status = "disabled";
 				clocks = <&clk NPCM7XX_CLK_TIMER>;
+				nuvoton,sysgcr = <&gcr>;
 			};
 
 			serial0: serial@1000 {

