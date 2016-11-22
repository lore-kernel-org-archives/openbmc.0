Return-Path: <joel.stan@gmail.com>
Received: from mail-pf0-x243.google.com (mail-pf0-x243.google.com
 [IPv6:2607:f8b0:400e:c00::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tNBn25kcJzDw0c
 for <openbmc@lists.ozlabs.org>; Tue, 22 Nov 2016 15:09:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="rth32bSW"; 
 dkim-atps=neutral
Received: by mail-pf0-x243.google.com with SMTP id c4so478971pfb.3
 for <openbmc@lists.ozlabs.org>; Mon, 21 Nov 2016 20:09:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=sender:from:to:subject:date:message-id:in-reply-to:references;
 bh=PsZbabU8t6/151QGpt7cJrAwRVng3UXcX+xxftc9TKk=;
 b=rth32bSWn6v4WOQPC9R5PLme5p4nwFOWyNfvvr/Arak3XT6DrbfElXD37Wum6BHYi8
 BKpN3NwNg+vJdhBnCT3PZilICP4xrW8ZMgnaDJF9GpFICAeUVrEmrSn8uImSwP5R+zh2
 ZTlxMiCRFeeOkg0gCfhG3B1e+uNJU69ppon8UxEoVrWOK+mbuxdin8ZWD7Jg05BHafX5
 SxCT0h5EMfLaUqY6IAS6JWnshWnjKHdfQ81o2kJlAj9De3Rxp6PbUFWu4ol56gZPzyU7
 Jlmd7SoMYcffzp09q/PxY5nTmgR/QsEost8N/xFZ16tbO/bwuyiAG+mfFG73OwYs0W+U
 a3Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references;
 bh=PsZbabU8t6/151QGpt7cJrAwRVng3UXcX+xxftc9TKk=;
 b=P7Bbs37W+h5W+X3gypxZF5Zi9cjL27bVXHC9wGkfcIzHZTirgKOEZt14GqTUQb5Xxy
 p0EWBfDK2u/WplHA2s/3S21RFTrdXsGwYrrKYlbcsAmeOiUraNXJv/od2c7aTAF1+GGP
 lildORb3zr3SCwCA+oDTukVFKcdhk17pKoQp6XcoPABgim+sQN34/ihk7vRzIVGJSoQp
 TSTXsrrSAsZe9YwKuVxnscPYwDE3W0CNldAAswV89lwV5/vhNA3zRBPhEc54H7mpae0E
 3SgQ7tOfcqinATl8MmTq8jbPlvcG991HLvIrPh0aHKNJ2fpENaKXywxv0ewxUl/g/4oX
 CfFw==
X-Gm-Message-State: AKaTC03CrMK7hP5s07Lkn/8y6r2/heNP5ke1Jnrpy892n3Dvn+XSNVPpZ0v283HOYRbj4A==
X-Received: by 10.99.43.8 with SMTP id r8mr39212798pgr.83.1479787765229;
 Mon, 21 Nov 2016 20:09:25 -0800 (PST)
Received: from aurora.jms.id.au ([2403:480:11:8000:34fc:e5f1:fa3d:d083])
 by smtp.gmail.com with ESMTPSA id u23sm40754853pfg.86.2016.11.21.20.09.21
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Mon, 21 Nov 2016 20:09:24 -0800 (PST)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
 Tue, 22 Nov 2016 14:39:17 +1030
From: Joel Stanley <joel@jms.id.au>
To: andrew@aj.id.au,
	openbmc@lists.ozlabs.org
Subject: [PATCH 4/7] arm: dts: aspeed: Remove unused pinmux from Palmetto
Date: Tue, 22 Nov 2016 14:38:46 +1030
Message-Id: <20161122040849.31604-4-joel@jms.id.au>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20161122040849.31604-1-joel@jms.id.au>
References: <20161122040849.31604-1-joel@jms.id.au>
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
X-List-Received-Date: Tue, 22 Nov 2016 04:09:27 -0000

These were set as the common code in the board file set them to these
states. A close reading of the schmeatic suggests this is not required.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
index 8fe248f4d531..d16c67935499 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
@@ -71,14 +71,7 @@
 	pinctrl-0 = <&pinctrl_flbusy_default &pinctrl_flwp_default
 
 			&pinctrl_vgahs_default &pinctrl_vgavs_default
-			&pinctrl_ddcclk_default &pinctrl_ddcdat_default
-
-			&pinctrl_pwm1_default &pinctrl_pwm2_default
-			&pinctrl_pwm3_default &pinctrl_pwm4_default
-			&pinctrl_pwm5_default &pinctrl_pwm6_default
-			&pinctrl_pwm7_default
-
-			&pinctrl_bmcint_default &pinctrl_flack_default>;
+			&pinctrl_ddcclk_default &pinctrl_ddcdat_default>;
 };
 
 &mac0 {
-- 
2.10.2
