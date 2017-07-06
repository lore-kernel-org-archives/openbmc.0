Return-Path: <joel.stan@gmail.com>
Received: from mail-pg0-x242.google.com (mail-pg0-x242.google.com
 [IPv6:2607:f8b0:400e:c05::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3x3KzM2kvSzDr6L
 for <openbmc@lists.ozlabs.org>; Fri,  7 Jul 2017 00:35:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="PfR1eytm"; 
 dkim-atps=neutral
Received: by mail-pg0-x242.google.com with SMTP id j186so480077pge.1
 for <openbmc@lists.ozlabs.org>; Thu, 06 Jul 2017 07:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references;
 bh=6BL1oSrCP5NHETRGMxd0EkGl0s07BGL3P+Jj0xFSQUM=;
 b=PfR1eytmLNxLSf8P9wnsIS5qFRLFPvhflLf276K5SwHw3s7KE85ITGac/4rkrv8ZSd
 YX/41Gi5p3FBfMcSUbOYQriKesvKQcF+Bd5it6jX+vSnyFmP1vUi0Tix+0jlt32CxLYz
 0z82JGiAjKxhIj7w8XMmjMuKoJHfl4CJHvZws9haH0owC1UggwTxhKzAfod+fwl2xfLX
 o6qRBTlPO8PDAhDPgPkUjLxaz+1k54rwRkQI+N6DhDNjcgGztg7Wam/Li2DwkUWFDXis
 8e1nuBFROP1ZcsWghfGDv45Ya8R/xWUeAzDSm8s5wG9rYKExEW+6nJZWvCBUL6h+AU8d
 kOUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references;
 bh=6BL1oSrCP5NHETRGMxd0EkGl0s07BGL3P+Jj0xFSQUM=;
 b=TE4WDFuTA/M0ndU3TpMXh4l4icG/L2+wKCxyn1d4F8gntKdJbcbqs7+3OTCTJA9dIF
 eQbmhHePn3IT2vYNTJT+vcxcgwMomFmRA5dsS3sqJg+KpLE8oN3EmjwiOB4+QGgBMhU8
 kE+Niq7Yim1xOXzNZkJZxMEMMwc2Pp5W2/iszMZgx3md49gRsiyg0HHnr6kuB9XrH3RC
 qb23m49aqTevY6L9EroJBLcVJuhBDa8eqOKNgLENlJNsW0kzBTnotA+DRGKEfT1kK9+u
 2JDBJJ8HJhcwbE8Eb4o4/+yMEtxbzpGsXGqDuJ4+hR6yTiraMUCYxdQqIr3Xz4TKGS+b
 81+w==
X-Gm-Message-State: AIVw1120aZN6KX7TkUc9nr2iW5BIUQYmfYXovxm0S9U52Zp5NCewmbdm
 I2eVEpcOn8bx5LhgVEk=
X-Received: by 10.98.198.208 with SMTP id x77mr26640685pfk.229.1499351741500; 
 Thu, 06 Jul 2017 07:35:41 -0700 (PDT)
Received: from aurora.jms.id.au ([45.124.203.19])
 by smtp.gmail.com with ESMTPSA id r84sm739630pfa.57.2017.07.06.07.35.38
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Thu, 06 Jul 2017 07:35:40 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
 Fri, 07 Jul 2017 00:05:34 +0930
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org,
	Eddie James <eajames@linux.vnet.ibm.com>
Subject: [PATCH linux dev-4.10 4/4] ARM: dts: cfam: Fix hub node
Date: Fri,  7 Jul 2017 00:05:03 +0930
Message-Id: <20170706143503.21888-5-joel@jms.id.au>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <20170706143503.21888-1-joel@jms.id.au>
References: <20170706143503.21888-1-joel@jms.id.au>
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
X-List-Received-Date: Thu, 06 Jul 2017 14:35:43 -0000

The hub node was not being probed as it had malformed address-cells and
size-cells nodes.

This fixes probing of i2c devices on the first (non-hub) P9 socket.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/boot/dts/ibm-power9-cfam.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/ibm-power9-cfam.dtsi b/arch/arm/boot/dts/ibm-power9-cfam.dtsi
index 669ed6804f74..16802933558e 100644
--- a/arch/arm/boot/dts/ibm-power9-cfam.dtsi
+++ b/arch/arm/boot/dts/ibm-power9-cfam.dtsi
@@ -1,8 +1,8 @@
 &fsi {
 	cfam@0,0 {
 		reg = <0 0>;
-		#address-cells = <1>;
-		#size-cells = <1>;
+		#address-cells = <2>;
+		#size-cells = <0>;
 
 		i2c@1800 {
 			compatible = "ibm,fsi-i2c-master";
-- 
2.13.2
