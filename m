Return-Path: <joel.stan@gmail.com>
Received: from mail-pf0-x244.google.com (mail-pf0-x244.google.com
 [IPv6:2607:f8b0:400e:c00::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wYLxB4cSZzDqhy
 for <openbmc@lists.ozlabs.org>; Thu, 25 May 2017 17:48:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="HLdDqdSd"; 
 dkim-atps=neutral
Received: by mail-pf0-x244.google.com with SMTP id f27so37613420pfe.0
 for <openbmc@lists.ozlabs.org>; Thu, 25 May 2017 00:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Bj1p8JLk5qDylnEHlCXRHMieOwB/SyCCR0q/5proZ84=;
 b=HLdDqdSdIfqBtkFllt0dNjvaPPEC01bRTWdc6qNGrwEV5gfbzPqI2izBagUWoFJRT8
 /uFKBGlfeX7O26VD1YCKuG3c9EYiYILQ8aWGfO/OnLcpGbyWy9g9HBswsOyZ9SyOHB6Q
 Ip3j6HF3CP+RVymttV3PnPBqfVzC41uR+pdUcCCZ1HI15dzyZZbOG779Ss1c17bIBxqH
 JZfMAiAD26vqve1SXYxDD8MRMWdx3NbJSWeCPNTqUN81hdBO/odTAMdE4c/yrnPJZx/c
 Zu033Db/mKq4dSjzvZYasIDFSpFpZ6Ka8aiT+/VNv32D8Zg4ZgNJUyW5ZsHKxSdmWefU
 iXWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references;
 bh=Bj1p8JLk5qDylnEHlCXRHMieOwB/SyCCR0q/5proZ84=;
 b=n8nX+SMwZXYC6X4CTpOlbWP7oRV/usQ8bExqOjBRcs+EeW9bbJgeQq5Cir40aztMnY
 ZyGK8sSnV6/SWPAU8T2Va321nt+CDRKOMHgXlw4x+HMdHaX4spDoEun/caBs4aLDgQFt
 ydjGIprZpi+GpK8nBYrjSwFNuqDc1UaSEBTaKYslh6UH2w62+E10+DMEraMjPq9EGAYf
 TSqUvDco1qN0pM7/AB6MRlPpHj/uds2cRTcPVOdlEJF+1sh0e2kbm7gfGXq13UJHSn59
 OHlQtzjdI34waJ1SSrAtCV5/V/0nwg+uM8rL2wkriFJh4NRRDG8/dbbjHzkGjHqMeQ4l
 sb3Q==
X-Gm-Message-State: AODbwcCLLeWbqNaKnm7uwskxN9fzDJRuAM65IipkNLYiJXJBL1ymZNdT
 ctp4U62XLf7oKp+oVB4=
X-Received: by 10.98.149.68 with SMTP id p65mr43202752pfd.206.1495698524773;
 Thu, 25 May 2017 00:48:44 -0700 (PDT)
Received: from aurora.jms.id.au (bh02i525f01.au.ibm.com. [202.81.18.30])
 by smtp.gmail.com with ESMTPSA id 23sm12765330pfr.127.2017.05.25.00.48.41
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Thu, 25 May 2017 00:48:44 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
 Thu, 25 May 2017 17:48:37 +1000
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org
Cc: Nickolaus Gruendler <ngruend@us.ibm.com>,
	Lei YU <mine260309@gmail.com>
Subject: [PATCH linux dev-4.10 2/2] ARM: dts: aspeed: romulus: Add Maxim
 MAX31785
Date: Thu, 25 May 2017 17:48:18 +1000
Message-Id: <20170525074818.7284-2-joel@jms.id.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170525074818.7284-1-joel@jms.id.au>
References: <20170525074818.7284-1-joel@jms.id.au>
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
X-List-Received-Date: Thu, 25 May 2017 07:48:47 -0000

From: Nickolaus Gruendler <ngruend@us.ibm.com>

This fan controller is present at 0x52 on i2c-12.

Signed-off-by: Nickolaus Gruendler <ngruend@us.ibm.com>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
index 5ca0f6e6a6a4..eae406aeb6ce 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
@@ -206,8 +206,13 @@
 &i2c12 {
 	status = "okay";
 
+	/* Fan Controller */
+	max31785@52 {
+		compatible = "maxim,max31785";
+		reg = <0x52>;
+	};
+
 	/* CPLD */
-	/* Fan Controller 0xa4/a5 */
 	/* Power Supply */
 	/* Temp Sensor */
 	/* Temp Sensor */
-- 
2.11.0
