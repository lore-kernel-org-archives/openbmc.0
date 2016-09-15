Return-Path: <joel.stan@gmail.com>
Received: from mail-pf0-x243.google.com (mail-pf0-x243.google.com
 [IPv6:2607:f8b0:400e:c00::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sZbPy4vZlzDsTX
 for <openbmc@lists.ozlabs.org>; Thu, 15 Sep 2016 21:13:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=HQuBQ4VO; 
 dkim-atps=neutral
Received: by mail-pf0-x243.google.com with SMTP id n24so2115131pfb.3
 for <openbmc@lists.ozlabs.org>; Thu, 15 Sep 2016 04:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=nvZEX/zBHwKEnWMamLqtmskvB+GT+mfeQlsqp9coJEk=;
 b=HQuBQ4VOu8zSTjt/n9QmeaHarLCgeYz/BV7ooWuQqrJlN5Ikp0V8ENptl6TMDuwObq
 vTEPpJDiL9pkOcpL+uj2gv1Hhce3gOfrZawfvLvdZEGaDxgSN+QZkMB7jvp4+CRNhOkz
 Er9YQa6nA3mJpGKr/wj6GogZs8XEjKxlJgruFeG4UwrFhbXXvv1+ZFbjYsoOhz2T7QkZ
 kCnOMMeGwhP3sxbeT/kD7St6GJS95wj+YvRW4hFtwK9k+rV4DszhgGmSJnrt35Ejsi+L
 xtodNQFdYjX8w6KcTMN+SIF+aCSNhSi4Zq/FyC+z0YK0HsX7k9c9I+CK6IUA88Q2SgtF
 KEwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references;
 bh=nvZEX/zBHwKEnWMamLqtmskvB+GT+mfeQlsqp9coJEk=;
 b=F2sCZ6e+M8FtBtMFheMTdq8sEpdc9BbLXh/80DB+hv6qZ8x4dSN0xfL3MXvpA35v0v
 8UEkCsl+grIV3tlJngaSopYQiufkfItzj1tnkp0JSZKk/3pjLwSlmGYyGBKgaGBe7Mg8
 9MEqQ4sOybUgfUnNkP6wsrM68Y17HSIfThm425zZz0a7ARjsqfpgbgvsts/KmOrEXBFc
 AsD6kd+u1cYjkIO9z1cQW+Nhg/EKTKZSdCpLVTo1vb/z+06Liv7aAkC2dl4qDq8MIitQ
 xbImP6+xKMsV7SONLV3HpCBw0sQknSqkXAT85xHfp5R8jioBFdWMTUCtHAMrltJXB6cP
 jAmg==
X-Gm-Message-State: AE9vXwOJmayZyJh/rGLzj2g1MzMQqRN2Lhcy9fmEbjO7Q2PJZWyEnIk3U1o3WgfggIaZ1g==
X-Received: by 10.98.74.156 with SMTP id c28mr2304142pfj.32.1473938020939;
 Thu, 15 Sep 2016 04:13:40 -0700 (PDT)
Received: from aurora.jms.id.au ([2403:480:11:8000:7414:b01f:d849:6117])
 by smtp.gmail.com with ESMTPSA id h67sm15827324pfg.32.2016.09.15.04.13.37
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Thu, 15 Sep 2016 04:13:40 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
 Thu, 15 Sep 2016 20:43:33 +0930
From: Joel Stanley <joel@jms.id.au>
To: andrew@aj.id.au
Cc: openbmc@lists.ozlabs.org
Subject: [linux dev-4.7 2/3] arm: dts: aspeed: Add spi1 pins to g5 device tree
Date: Thu, 15 Sep 2016 20:43:07 +0930
Message-Id: <20160915111308.31481-2-joel@jms.id.au>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20160915111308.31481-1-joel@jms.id.au>
References: <20160915111308.31481-1-joel@jms.id.au>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 15 Sep 2016 11:13:43 -0000

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/boot/dts/aspeed-g5.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
index f73a2b18e152..e4e43ae3616a 100644
--- a/arch/arm/boot/dts/aspeed-g5.dtsi
+++ b/arch/arm/boot/dts/aspeed-g5.dtsi
@@ -201,6 +201,17 @@
 						function = "RMII2";
 						groups = "RMII2";
 					};
+
+					pinctrl_spi1_master_default: spi1_master_default {
+						function = "SPI1_MASTER";
+						groups = "SPI1_MASTER";
+					};
+
+					pinctrl_spi1_passthru_default: spi1_passthru_default {
+						function = "SPI1_PASSTHRU";
+						groups = "SPI1_PASSTHRU";
+					};
+
 				};
 			};
 
-- 
2.9.3
