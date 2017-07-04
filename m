Return-Path: <joel.stan@gmail.com>
Received: from mail-pg0-x242.google.com (mail-pg0-x242.google.com
 [IPv6:2607:f8b0:400e:c05::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3x1tlh5gFbzDqj4
 for <openbmc@lists.ozlabs.org>; Tue,  4 Jul 2017 16:05:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Xl6/no14"; 
 dkim-atps=neutral
Received: by mail-pg0-x242.google.com with SMTP id d193so6944894pgc.2
 for <openbmc@lists.ozlabs.org>; Mon, 03 Jul 2017 23:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id;
 bh=q4o47Jg6YLRH6gVxrHoc8WT4UKHdF7culqxXdUt+s3Q=;
 b=Xl6/no143u9wM6o4p+RTiEFO1WGdl5xMmDftlr+tcCG88wh2yHBRTuvd+ncLxzLrxE
 D6/d+dk8qkBWAHRJ1D6snLI3PvpgahEz2kAStuxLPFrDUs1uL1mXpiZAcfcifT9C68tu
 s7ppfWjUg4geA9W6J9KWY/5KWcyKdySIcgERYKpfpKwyx2+UxFTVBa863iOR3lxJw9tI
 zW7L51V1S1N2dUflhP7em5MDT+6KRNrjeGT8x9Sz+/yG8ZrYeolDrT2HBrhA+qz6xYjt
 JWJ11y1JOQArHapZT1DGHDFzBpdVXfWIyVKK/L1Gx8osLzq8584TrVYAAcwUjaIIyRFj
 e/RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id;
 bh=q4o47Jg6YLRH6gVxrHoc8WT4UKHdF7culqxXdUt+s3Q=;
 b=DtxWQsmRUhLtXOaXunx6Vfb5SO83YNIK+FrU08d9LEOUwnAsqBeBvUX9dKQFTLlmtx
 GDitMJdxhZ5YAINPmZXPMMvUnU8il7RTHBBGEvSCYraBSe/5ubGFK2m2iHaebi/0zPEl
 3EojEDXv8LXTOv4/CcXEvWsVuMQ31oQutt5/Qb1F9GIhn2M5GnrXTnYM0Lg60NzilRjA
 QG3DRl0jj4uOSN1BAKXLjKd8TuMPchLmrxuBI7l19jtcFosiaKAEXESNfGW8NFbQwmwV
 FQSzd6Sd3XMuNSJqDOuGKeXTDLCK1Qa5G57Bx9w2M50WuC9HlQRZzNcS5Ks8bI1yYfxM
 w6+A==
X-Gm-Message-State: AIVw110DHc3ZFki6MqLhVB2o9pteWWETSEfwoX4RqDeNdVlCTGSBp5jk
 IpfsDuXw3W7UXLiWQB/C1w==
X-Received: by 10.84.129.131 with SMTP id b3mr86323plb.187.1499148334645;
 Mon, 03 Jul 2017 23:05:34 -0700 (PDT)
Received: from aurora.jms.id.au ([203.0.153.9])
 by smtp.gmail.com with ESMTPSA id s64sm45186362pfd.77.2017.07.03.23.05.31
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Mon, 03 Jul 2017 23:05:34 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
 Tue, 04 Jul 2017 15:35:29 +0930
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org,
	Rick Altherr <raltherr@google.com>
Subject: [PATCH linux dev-4.10] ARM: dts: aspeed: Set quality factor
Date: Tue,  4 Jul 2017 15:35:28 +0930
Message-Id: <20170704060528.17290-1-joel@jms.id.au>
X-Mailer: git-send-email 2.13.2
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 04 Jul 2017 06:05:37 -0000

From the timeriomem_rng bindings:

 quality: estimated number of bits of true entropy per 1024 bits read
 from the rng.  Defaults to zero which causes the kernel's default
 quality to be used instead.  Note that the default quality is usually
 zero which disables using this rng to automatically fill the kernel's
 entropy pool.

As to the recommended value for us to use:

Rick Altherr <raltherr@google.com> wrote:
> Quality is #bit of entropy per 1000 bits read.  100 is a
> conservative value that was suggested by those in the know.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/boot/dts/aspeed-g4.dtsi | 1 +
 arch/arm/boot/dts/aspeed-g5.dtsi | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-g4.dtsi
index 9cc959fccfa0..470a6335399a 100644
--- a/arch/arm/boot/dts/aspeed-g4.dtsi
+++ b/arch/arm/boot/dts/aspeed-g4.dtsi
@@ -193,6 +193,7 @@
 					compatible = "timeriomem_rng";
 					reg = <0x1e6e2078 0x4>;
 					period = <1>;
+					quality = <100>;
 				};
 
 				pinctrl: pinctrl@1e6e2000 {
diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
index 992242d3b22e..466b322951e1 100644
--- a/arch/arm/boot/dts/aspeed-g5.dtsi
+++ b/arch/arm/boot/dts/aspeed-g5.dtsi
@@ -232,6 +232,7 @@
 				compatible = "timeriomem_rng";
 				reg = <0x1e6e2078 0x4>;
 				period = <1>;
+				quality = <100>;
 			};
 
 			gfx: display@1e6e6000 {
-- 
2.13.2
