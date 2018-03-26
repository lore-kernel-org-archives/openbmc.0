Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400e:c01::242; helo=mail-pl0-x242.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="FlmuaU+h"; 
 dkim-atps=neutral
Received: from mail-pl0-x242.google.com (mail-pl0-x242.google.com
 [IPv6:2607:f8b0:400e:c01::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 408j8c325GzF1wh
 for <openbmc@lists.ozlabs.org>; Mon, 26 Mar 2018 16:18:08 +1100 (AEDT)
Received: by mail-pl0-x242.google.com with SMTP id x4-v6so11280744pln.7
 for <openbmc@lists.ozlabs.org>; Sun, 25 Mar 2018 22:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id;
 bh=NotKIiSrbaKXAeqfn+W2cYPw8COp1QEWVHWkLY1phSA=;
 b=FlmuaU+h01hIj3yZbIM3qwmaDUoGUWjMFFTAuJyiHgLw6WJUmJQrFLm2F1cHxCQNa7
 4TjpOfOww/jcDt5dH1Hlaf4xvfryaUoynkpRGbBhTPAqmNSfKwHR6hH6TiHlxoSUFsdK
 22hkttsQDVsRFU0nIKFogyTFbx5rGH31/RoLS73WsJC792nm6I+upuCmmwFJeyR1DpaC
 Oe3drHOu61ZnRP4esRy49P1OFbZdFbqLt/+y1dsPF7Sb+VtleV3Km1oEpWAaFuMGA/L3
 UJRD0uAMccToTVo1pUg/StmkOnDKC5qEGFQijphDqL7vMxVQi0p+APfKydcU15uOyJbT
 dNbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id;
 bh=NotKIiSrbaKXAeqfn+W2cYPw8COp1QEWVHWkLY1phSA=;
 b=nNC6IFlol7RZnp3O6aptKOSMIynvBXJrdoAg+OWzaAgsXUhaiFlvalxB1Frm06XntO
 a96TpIc2NBljBC89ahgQVRCuWuo4kskhlk3QPuc6SaW5Gk3pOkRoiEZOuoYSXkCREjz2
 AJ6optZq/ccNxy3y7vZCIceTWW9uveGs1RB+7fSG0JmmBtuGOE2NnFk5Dg/R16Lyn7C2
 m68ohE6ezLY9cmuXxZH7QR/md983SdWoxTVXKS3y7IQJ4U1F+RPnX8OjK/F9rRq5wbhc
 0Yk2LWLzFIJ3sRQIROR8/En94gHnjBGWg0FzmbbCfYZY/Mt+6HbDHyrT5gTZ2gDRdlqC
 Rshw==
X-Gm-Message-State: AElRT7Gy5Yr8JjdE+nblxf0Tcl9OSSLvrKqlQAwwn4dmfIeHG7V8psij
 hqTKU4Nk9Jg/kbA3AHfQPn86FH6u/uM=
X-Google-Smtp-Source: AIpwx491Wd+4c28XSs1bBPYWVA35BHKGEae7N734idQlI5LEiu+i7ogZswmnJAcNaRojHzXITxUO7A==
X-Received: by 2002:a17:902:b406:: with SMTP id
 x6-v6mr6628673plr.232.1522041486192; 
 Sun, 25 Mar 2018 22:18:06 -0700 (PDT)
Received: from aurora.jms.id.au (bh02i525f01.au.ibm.com. [202.81.18.30])
 by smtp.gmail.com with ESMTPSA id p89sm11330949pfk.63.2018.03.25.22.18.03
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 25 Mar 2018 22:18:05 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
 Mon, 26 Mar 2018 15:48:00 +1030
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.13] ARM: dts: aspeed: Describe random number device
Date: Mon, 26 Mar 2018 15:47:58 +1030
Message-Id: <20180326051758.16800-1-joel@jms.id.au>
X-Mailer: git-send-email 2.15.1
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 26 Mar 2018 05:18:08 -0000

There is a random number generator that updates a register in the SCU
every second. This is compatible with the timeriomem rng driver in the
kernel.

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
 arch/arm/boot/dts/aspeed-g4.dtsi | 7 +++++++
 arch/arm/boot/dts/aspeed-g5.dtsi | 7 +++++++
 2 files changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-g4.dtsi
index 6205228b18ea..3d391b428b25 100644
--- a/arch/arm/boot/dts/aspeed-g4.dtsi
+++ b/arch/arm/boot/dts/aspeed-g4.dtsi
@@ -120,6 +120,13 @@
 				pinctrl: pinctrl {
 					compatible = "aspeed,g4-pinctrl";
 				};
+
+				hwrng@78 {
+					compatible = "timeriomem_rng";
+					reg = <0x78 0x4>;
+					period = <1>;
+					quality = <100>;
+				};
 			};
 
 			adc: adc@1e6e9000 {
diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
index 0a866da8db32..1468b4ad22dc 100644
--- a/arch/arm/boot/dts/aspeed-g5.dtsi
+++ b/arch/arm/boot/dts/aspeed-g5.dtsi
@@ -157,6 +157,13 @@
 					aspeed,external-nodes = <&gfx &lhc>;
 
 				};
+
+				hwrng@78 {
+					compatible = "timeriomem_rng";
+					reg = <0x78 0x4>;
+					period = <1>;
+					quality = <100>;
+				};
 			};
 
 			gfx: display@1e6e6000 {
-- 
2.15.1
