Return-Path: <hsienchiang@gmail.com>
Received: from mail-pa0-x243.google.com (mail-pa0-x243.google.com
 [IPv6:2607:f8b0:400e:c03::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3s7D1V0zJ0zDqPn
 for <openbmc@lists.ozlabs.org>; Mon,  8 Aug 2016 20:19:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=Ggc0GaB1; 
 dkim-atps=neutral
Received: by mail-pa0-x243.google.com with SMTP id hh10so23826870pac.1
 for <openbmc@lists.ozlabs.org>; Mon, 08 Aug 2016 03:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=from:to:cc:subject:date:message-id;
 bh=6glcMgJghqdLSVn4UPAPodZSOXzV5EXD7oh9UMDXX1k=;
 b=Ggc0GaB1yjJyfnVBdrna5ZIlzANPMJqa5NewDdi721vJVWEyCJYfje3oqva+qMIkaY
 jToaWD5pMwgIZPPErQGhaSicjxNEIomdWYszmvkIUnNjz3FK2q2KXbb4Ovg4f+4fnn9d
 1pFf9soTsPcpVqUnE5ODUDTR71AFXIv2bo3Fv5NKbSQEaH+v/no/6lCMnq2YFe1eNXga
 bTzGKWJCQxAfh96xczm/hgs8RV5D9FLPGxUJ8RVdyPmkKfMRd3JyphI/2NyjQRMH9+MZ
 THpkothFwgIG9X/lmBs0HF0ibqMtv3Os+ILZAFE3NUlGxy/gcikV+dPbOEeQw72O+DTg
 HlHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=6glcMgJghqdLSVn4UPAPodZSOXzV5EXD7oh9UMDXX1k=;
 b=ZHbLcoYzR0T3gpUUrLjx8341O0fz5e7ZdfPh3XkaBOZqq63FonZCugUqJgg78JFexe
 SwckSVXSyB6+tCnOUquyZjXtfi/umnT5mEMAVaKnRcsm45HCwqMTheS/gcWrfw/YDM8d
 Y+c7O3RVdKXFFYcSv2EVSL3bnXKEk5QxdT/pAP8KHeIrslyesDrAkabkRLo4FM2MxDWL
 ohINxc6/D1Srd+5LBSRFK4pxPy/5FkAkZm+XGyw9CW9/8btL6NUeYxBXDYizQtgvsZWq
 DxAFWU9HV5eccVKeb0T+z/RlF9dfjZUoq1Mp9ZugScg8nmeB9YiWWW6Fa075m9FgGP1e
 KAaw==
X-Gm-Message-State: AEkooutnJCao3KrMaGwxafJNdfVHxduwuqe1Z7GyvVyGeCevBp2IXwVO3vzmWkcclcrpZA==
X-Received: by 10.66.170.44 with SMTP id aj12mr161370340pac.131.1470651595937; 
 Mon, 08 Aug 2016 03:19:55 -0700 (PDT)
Received: from localhost.localdomain
 (101-139-149-6.mobile.dynamic.aptg.com.tw. [101.139.149.6])
 by smtp.gmail.com with ESMTPSA id f6sm46840066pfa.17.2016.08.08.03.19.54
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 08 Aug 2016 03:19:55 -0700 (PDT)
From: johnhcwang <hsienchiang@gmail.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH] boot/dts: Keep the LED initial state during kernel loading
Date: Mon,  8 Aug 2016 18:19:00 +0800
Message-Id: <20160808101900.22154-1-hsienchiang@gmail.com>
X-Mailer: git-send-email 2.9.2.574.gc6b0597
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
X-List-Received-Date: Mon, 08 Aug 2016 10:19:59 -0000

Base on the Barreleye HW spec, the beep LED shouldn't be
turned to OFF until BMC ready.

Now the LED will be turned to OFF when the kernel loading,
so enable the LED sub-node property "default-state" to keep the LED
initial state.

Signed-off-by: johnhcwang <hsienchiang@gmail.com>
---
 arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts b/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
index 0e567e8..3146ea9 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
@@ -132,12 +132,15 @@
 
 		heartbeat {
 			gpios = <&gpio 140 GPIO_ACTIVE_HIGH>;
+			default-state = "keep";
 		};
 		identify {
 			gpios = <&gpio 58 GPIO_ACTIVE_LOW>;
+			default-state = "keep";
 		};
 		beep {
 			gpios = <&gpio 111 GPIO_ACTIVE_HIGH>;
+			default-state = "keep";
 		};
 	};
 };
-- 
2.9.2.574.gc6b0597
