Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 865B1606A31E
	for <openbmc@archiver.kernel.org>; Sat, 28 Nov 2026 02:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wkennington-com.20260707.gappssmtp.com header.i=@wkennington-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=K4JmA3/7
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4jbvw14jtCz3bSy;
	Sat, 28 Nov 2026 13:52:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::530"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1795834352;
	cv=none; b=DwJ2zQtjwY/zgk5+CqknYkO/Q1FUv2RI+eWELQJZLVR1MxY8EsN54MjnqeS3HZG6NQNgglRg/DJvol+8Z2i4SNZr92cx95vAgiXuObWWnhVgsM2cizfZFt2vlDZLsumEKDsES5jqZgXpGtI2LzvzCucOpbONfbw+LqaCqunHdUYevtWFRcKEDHyEvIrQc6k12cu+iEAuasnCeDSZazA/hlosFrYRcPSlTvK8ENgOpM1OoOEKgrUcaU2B0mPsKvYQJc3F6xvujKBFCsXRcEOTWsZ+c1Tb2OFJusHtgjPDQAtwxQeSndRtpV4LkqTWP9RS9fvtA7ZMeVZlFnPX9aZ4AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1795834352; c=relaxed/relaxed;
	bh=mUpNefJE/J90Sefj1ZIu5Iq8L/qVGagwwxyCZBgYA1Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NoiBZa4z4s4qjv+TWEhH0ybJlMR2Qs8+snMRL2MJ/ZyxoNTqoOexNCirZrSdFi8VHNuu2HCJ1ID3KdXrsHuvXbMfbIdLbrIZduAfFOjRbAYEqJS0+ZCd2Z/c3ymklWfeo3a7Xovr6HEmyq++biJJU51eX0Exs5jlmvJ0Kpy/jm+1/0piWvuEOGp2WvoG6duFL0C3yNq0E5UrHJQDpLLoQhd0AJzc4kSo/vnXm0iZ8GTYBBBwUSX/zoT844PGVaQlGajGK2fSRdVOe6T3omw0fd66Zmd7/gDrLeZlCS2KFtfVrNdgx00b5bvf9sFEDVrRLZL5QZdX6jEqEHhAM0yAiA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wkennington.com; dkim=pass (2048-bit key; unprotected) header.d=wkennington-com.20260707.gappssmtp.com header.i=@wkennington-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=K4JmA3/7; dkim-atps=neutral; spf=none (client-ip=2607:f8b0:4864:20::530; helo=mail-pg1-x530.google.com; envelope-from=william@wkennington.com; receiver=lists.ozlabs.org) smtp.mailfrom=wkennington.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wkennington.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wkennington-com.20260707.gappssmtp.com header.i=@wkennington-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=K4JmA3/7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=wkennington.com (client-ip=2607:f8b0:4864:20::530; helo=mail-pg1-x530.google.com; envelope-from=william@wkennington.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4jbvvy0s6Nz2yQJ
	for <openbmc@lists.ozlabs.org>; Sat, 28 Nov 2026 13:52:29 +1100 (AEDT)
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-cd61cef87f1so4102937a12.0
        for <openbmc@lists.ozlabs.org>; Fri, 27 Nov 2026 18:52:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wkennington-com.20260707.gappssmtp.com; s=20260707; t=1795834343; x=1796439143; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mUpNefJE/J90Sefj1ZIu5Iq8L/qVGagwwxyCZBgYA1Q=;
        b=K4JmA3/7rXbA/iosNSbGQheCbkJIlxwiEI8XuAld4bDUt4qT9lZB9pIh2yIZKkETwN
         thr/UCWgPunCNSrZYT3N0m8Ijb982SuQ463uiQanANaYB0ps1epSlapXRgt6QN76kP3p
         VgPMLgbcxv3AV4Yf1aOPrIqHIgDSSqPhkWRWbw7SorPLYmpoW2he3qWx/nSZyyAY4pCJ
         AFdEyeW65cFIJD0+E84ILNBRYhXtO/rxcw/QrOYvOlCDRVnrTEiw3Gy+wu5CeU31SMcM
         ywoEZnXahOWDojtWnF8flrTCCnYeuZlH02TUoj1CgZRFZMyWRtj12qXWOpyWmVq5zNiU
         JbJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795834343; x=1796439143;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mUpNefJE/J90Sefj1ZIu5Iq8L/qVGagwwxyCZBgYA1Q=;
        b=CYb525vpJ9swKWIoor4IO9ZpzT2eva3k4AcH712aYuzn6JYmgIRJKFAOMicd5pFTZl
         MHU0NCjnH/6fxiMWakZP833U8BTjRkUZPXRH7hCRwz9yW1dD2uKu5L0gUVTB0eqG3qbp
         ecNnsitYTHALwIB1n/2Puo2tCiculha+ikcyoQf3lLkstSGyg81LzXPECdgJD+R2SHDZ
         50w4uEBxPYX5+2onkF/z3LiDokJj6vokP/CpMxrOLMb92jZ1IniOdpmKUlD0AI7EWx0q
         uppKl0U7b9tPxjxeyetJn2aeyXgiIrOukPIDYQBKR7GdQY0YTQxu+MitrIZulWluOyHN
         YVcQ==
X-Forwarded-Encrypted: i=1; AL+hErGwnDMF4XKtsSowfXq8f1fBMFhkZXchz6nbjAxIlRFcrQLG+sbCxzZstQNM+cDRkxsj7bk05zFX@lists.ozlabs.org
X-Gm-Message-State: APuU4Z/eDPwfH1/iWpT8xn5uGgYMJ1GUvCAbkkTE85SA47W5iH2Kz+/R
	3J48TgHjxeK1Tjsav/qFS26FCmsYg3LocPkD05vwB5MwjSgKHfQJMculQXGrx9u0f+k=
X-Gm-Gg: AZFdTZfXQCulH2WiHfUGEIUE7Zod6fcBfsh4tSqqqv3EaAYZnsxPFIyiUOljX97GcWr
	0988H0t2a4LqfQlf/oDHgfSH2bzieGBIYHggPDzowhrSjokgqg/yK9J4pvxTDQjxiOtZD8CmhLx
	yEJ8TT6bNWRwaw3y+9ugQ2qDL0bWpOe4JwLGZGdIrOkZiJ2rhHddZ9vr+D/RKVbSxwymVBqqBzG
	kpzkIocKRtG5UjWz2f8n5EmDgdAnnZJ2M+32gzhT2aIYldFycNCMacfoHcERU33lvzPuCBRkUIG
	NgVhzT9XBMzELyBuY2r+jO7ghwU3a348B01HbBgMMrhINCNlbBtcibkXR4eAIx0joY3jCpCnUhC
	9jKOgaryl/xeWYbNnPCjxGcEamvhzFVvnZY8pGAxxZQP+HDIVwegjALJ98zcnR/KBS7nxk9FI+j
	jlukbTsVtCXhBJlejRuNSnLcBtVo3q3pByef9Ozaw1+x68XCJiIflyzOKA0IZhH5QlUWbGhQPZj
	7+ieUp76hMWWaGluKkfkHQEApvw9EbwDr04oExfEOeLhdKp58ZyTqHxkbM19hR0aU7MUk0hfx0h
	aNpreouPP6n6FB8+zOO7BPYs8Yo2OuDDjE1512Yg652th+03t+PB5BpzYjv1zSTAL+Q2KtyRq2b
	GEB+qzCdMldvCYQ==
X-Received: by 2002:a17:90b:3ec8:b0:3ac:8dfe:8ec9 with SMTP id 98e67ed59e1d1-3b41cafdb7dmr22496986a91.47.1795834342573;
        Fri, 27 Nov 2026 18:52:22 -0800 (PST)
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
Subject: [PATCH 1/2] ARM: dts: nuvoton: npcm7xx: Fix PECI controller reg offset in APB
Date: Sat, 28 Nov 2026 02:52:18 +0000
Message-ID: <20261128025219.2679805-2-william@wkennington.com>
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

The peci node lives under /ahb/apb, whose ranges property maps
0x0..0x00300000 to 0xf0000000..0xf0300000. Using the absolute address
0xf0100000 fails address translation and causes peci-npcm to fail probe
with -EINVAL (invalid resource).

Use the APB-relative offset 0x100000 like sibling APB nodes and
nuvoton-common-npcm8xx.dtsi. Tested on an NPCM730 BMC where peci-npcm
and all six CPU/DIMM PECI hwmon devices now probe cleanly.

Fixes: 9949f98ca5a8 ("ARM: dts: nuvoton: Add PECI controller node")
Signed-off-by: William A. Kennington III <william@wkennington.com>
---
 arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi b/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi
index 83cd10b47273..3862adf85b68 100644
--- a/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi
+++ b/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi
@@ -325,9 +325,9 @@ kcs3: kcs3@0 {
 				};
 			};
 
-			peci: peci-controller@f0100000 {
+			peci: peci-controller@100000 {
 				compatible = "nuvoton,npcm750-peci";
-				reg = <0xf0100000 0x200>;
+				reg = <0x100000 0x200>;
 				interrupts = <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clk NPCM7XX_CLK_APB3>;
 				cmd-timeout-ms = <1000>;

