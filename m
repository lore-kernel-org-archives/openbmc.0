Return-Path: <joel.stan@gmail.com>
Received: from mail-pf0-x244.google.com (mail-pf0-x244.google.com
 [IPv6:2607:f8b0:400e:c00::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xGKtq4pG6zDrKQ
 for <openbmc@lists.ozlabs.org>; Mon, 24 Jul 2017 22:09:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="kSf0D8oe"; 
 dkim-atps=neutral
Received: by mail-pf0-x244.google.com with SMTP id q85so10337668pfq.2
 for <openbmc@lists.ozlabs.org>; Mon, 24 Jul 2017 05:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references;
 bh=iTC7BWHAGXnE+s47y3vG1xrGYlWbMWNQ3xpgOy9WDZ8=;
 b=kSf0D8oeSnAbeitwevbCtF/lEIDdUGr6ySzFMX4LCXI28b8sM5p5igfGCFSNgVW7Pj
 NKTKi5FgDBEUV8uY6wMH17ywD3J+u2MDuBZtjo2R4DbBBv6uH8Keuebg/MnfdmjEIZms
 ta0sSxoD6H3tU/sHyU3S9soZUxKREsQLjM0HXPkEQKa1lQAq25J6RB3saePZajDylz2H
 CZN9Hxfw/3JDbnzbU8N/Y5w+vYjHvDzo6DioJrVtCTLym6t9ns4yL2fDUYGf8U38fwgx
 S45A16/obEWQ/To6B4xE5c/KmrtJyLUJcYCJBJdiirYGgZHcWGcXUzmgN2mOpQ1lH8Ii
 WMTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references;
 bh=iTC7BWHAGXnE+s47y3vG1xrGYlWbMWNQ3xpgOy9WDZ8=;
 b=aQUfJASJURLPlwnMIWVDQOBp68FDaO7u7DL64Jnn7Mcy8BST9Ow7nNPQW9UoKUb9Uk
 PWA4BGFBdyaODkS8HnGanFKFt0PCk/sJc5n26Ntupa88WOnT7W++1lGeCTi+kRGVSp0p
 aMwCwBnQ+Mpygolti8ompS6SkBSgn5+20BVWNw1dlAncM7QAyNCwq4qzZKE/b8W51hfW
 zIuV1OtLCuae3UYRqBMwui/0Cn91EKzcqhhPlT8/ITV1jFEjEEvMBcqFfdDxmZaBJ/Ao
 8mydnMFHp02AesKBuIUK72EUX8mIkX+FZPdOMwUZkHrgyZW11Va5WJ2aNVoQ6XafciOF
 vw9A==
X-Gm-Message-State: AIVw1128NosNhD2ozlE9178EaLqRXyHewEMI3g7uvrF0+Cj/CCv7qSe2
 vTkUW6MVFGzZZ+9TKig=
X-Received: by 10.98.21.71 with SMTP id 68mr6009928pfv.199.1500898193065;
 Mon, 24 Jul 2017 05:09:53 -0700 (PDT)
Received: from aurora.jms.id.au ([45.124.203.15])
 by smtp.gmail.com with ESMTPSA id u62sm23576433pfa.18.2017.07.24.05.09.50
 for <openbmc@lists.ozlabs.org>
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Mon, 24 Jul 2017 05:09:52 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
 Mon, 24 Jul 2017 21:39:45 +0930
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.10 2/2] ARM: dts: aspeed: firestone: Request UART
 pins
Date: Mon, 24 Jul 2017 21:39:35 +0930
Message-Id: <20170724120935.1862-2-joel@jms.id.au>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170724120935.1862-1-joel@jms.id.au>
References: <20170724120935.1862-1-joel@jms.id.au>
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
X-List-Received-Date: Mon, 24 Jul 2017 12:09:56 -0000

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts b/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
index cc479efd1763..39a836cbdfa5 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
@@ -75,10 +75,28 @@
 
 &uart1 {
 	status = "okay";
+
+	pinctrl-0 = <&pinctrl_txd1_default
+			&pinctrl_rxd1_default
+			&pinctrl_nrts1_default
+			&pinctrl_ndtr1_default
+			&pinctrl_ndsr1_default
+			&pinctrl_ncts1_default
+			&pinctrl_ndcd1_default
+			&pinctrl_nri1_default>;
 };
 
 &uart2 {
 	status = "okay";
+
+	pinctrl-0 = <&pinctrl_txd2_default
+			&pinctrl_rxd2_default
+			&pinctrl_nrts2_default
+			&pinctrl_ndtr2_default
+			&pinctrl_ndsr2_default
+			&pinctrl_ncts2_default
+			&pinctrl_ndcd2_default
+			&pinctrl_nri2_default>;
 };
 
 &uart5 {
-- 
2.13.3
