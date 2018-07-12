Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::543; helo=mail-pg1-x543.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="XADTsFqr"; 
 dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41R5Mv4qGyzF35b
 for <openbmc@lists.ozlabs.org>; Thu, 12 Jul 2018 16:18:03 +1000 (AEST)
Received: by mail-pg1-x543.google.com with SMTP id k3-v6so3595406pgq.5
 for <openbmc@lists.ozlabs.org>; Wed, 11 Jul 2018 23:18:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id;
 bh=Lp5TUje1SqkMOyy+p4CN5UzbsyiWB34SA8VlrETgQzY=;
 b=XADTsFqrVbaFNjA9MwwlMWqrVdlH2SFRjYLWg0MmOgCz5TCehyhzzV7Pq5niOrCYJT
 SJdimVqZzJtS/IL8vAK+9FVOjO2mafc6+DRb4YZhqvu3cuQgviChRbq5qJkUCkSkzpad
 g8gyNTEHfx1JEpKjByj7yk/jgyYL5JMNQzsg/NGKRA3jPowWd0LFsmD25+cehrvbE4df
 ytT0CHzpCeTgiNuGi3sOoSoTil7Lg99k+2MQH+6d4rp0eP93R0LxbNZwKBidl/RTDCqk
 jF6S4UmdN+daajg2s9eJR+HRQfvOjLwWcD+nlpetiDoda1NZmUg0ND7J2TXuk5p1NP9X
 uVcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
 bh=Lp5TUje1SqkMOyy+p4CN5UzbsyiWB34SA8VlrETgQzY=;
 b=j3uB2b9gQBRKQnh/iE8APSgezvKJyHG6WiUabsOS14K1z/qKgtD46vpP51t815TS+x
 7bfI1lvET/KdmeOJqY9Q1lQQsEAhfPlumHcFmeGgXdmlbr05FOG6nQ+sS2JxEpO5dQss
 +GASOdjGjOmHkF6mIhtRi2IAxdKeUxqYLDBg0QnXtdelWMjirAgreiJNfuovvf9VUydY
 sr5tk7Zd8j428XH76R267gQ9d3rH1d9qjXqt2os9degF4FSAiuO8Lk2V/+pQ/WRXNkto
 1z+kn1QDWWfN5V36gIGRvy2Ao7yDxGgKT072tR6lqrwZEWXi7uaIqJQNdKcm4q8Th9BZ
 RxwQ==
X-Gm-Message-State: AOUpUlGW5ZUxEebB3YhjuWiV4yHf18KdFpNFrfkOCB1anXcndrcqP9zu
 PaDCeRo9qj7q89gw3PgjnPwr7IJC
X-Google-Smtp-Source: AAOMgpdlnKtESiXPuHnVflODi4wSiz+E5gjQ62pu5bnvHkUbYnvT0pjpzWu2ieD+xWB7WFsVeI1ohg==
X-Received: by 2002:a63:ab4c:: with SMTP id
 k12-v6mr878544pgp.386.1531376280676; 
 Wed, 11 Jul 2018 23:18:00 -0700 (PDT)
Received: from aurora.jms.id.au ([203.0.153.9])
 by smtp.gmail.com with ESMTPSA id v82-v6sm31690960pfd.64.2018.07.11.23.17.57
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 11 Jul 2018 23:18:00 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
 Thu, 12 Jul 2018 15:47:53 +0930
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org
Cc: Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH linux dev-4.17] ARM: dts: aspeed-g4: Expose SuperIO scratch
 registers
Date: Thu, 12 Jul 2018 15:47:42 +0930
Message-Id: <20180712061742.10283-1-joel@jms.id.au>
X-Mailer: git-send-email 2.17.1
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 12 Jul 2018 06:18:04 -0000

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/boot/dts/aspeed-g4.dtsi | 87 ++++++++++++++++++++++++++++++++
 1 file changed, 87 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-g4.dtsi
index e86fa80712e5..6af12872ee74 100644
--- a/arch/arm/boot/dts/aspeed-g4.dtsi
+++ b/arch/arm/boot/dts/aspeed-g4.dtsi
@@ -316,6 +316,10 @@
 						interrupts = <8>;
 					};
 
+					sio_regs: regs {
+						compatible = "aspeed,bmc-misc";
+					};
+
 					mbox: mbox@180 {
 						compatible = "aspeed,ast2400-mbox";
 						reg = <0x180 0x5c>;
@@ -1366,3 +1370,86 @@
 		groups = "WDTRST2";
 	};
 };
+
+&sio_regs {
+	sio_2b {
+		offset = <0xf0>;
+		bit-mask = <0xff>;
+		bit-shift = <24>;
+	};
+	sio_2a {
+		offset = <0xf0>;
+		bit-mask = <0xff>;
+		bit-shift = <16>;
+	};
+	sio_29 {
+		offset = <0xf0>;
+		bit-mask = <0xff>;
+		bit-shift = <8>;
+	};
+	sio_28 {
+		offset = <0xf0>;
+		bit-mask = <0xff>;
+		bit-shift = <0>;
+	};
+	sio_2f {
+		offset = <0xf4>;
+		bit-mask = <0xff>;
+		bit-shift = <24>;
+	};
+	sio_2e {
+		offset = <0xf4>;
+		bit-mask = <0xff>;
+		bit-shift = <16>;
+	};
+	sio_2d {
+		offset = <0xf4>;
+		bit-mask = <0xff>;
+		bit-shift = <8>;
+	};
+	sio_2c {
+		offset = <0xf4>;
+		bit-mask = <0xff>;
+		bit-shift = <0>;
+	};
+	sio_23 {
+		offset = <0xf8>;
+		bit-mask = <0xff>;
+		bit-shift = <24>;
+	};
+	sio_22 {
+		offset = <0xf8>;
+		bit-mask = <0xff>;
+		bit-shift = <16>;
+	};
+	sio_21 {
+		offset = <0xf8>;
+		bit-mask = <0xff>;
+		bit-shift = <8>;
+	};
+	sio_20 {
+		offset = <0xf8>;
+		bit-mask = <0xff>;
+		bit-shift = <0>;
+	};
+	sio_27 {
+		offset = <0xfc>;
+		bit-mask = <0xff>;
+		bit-shift = <24>;
+	};
+	sio_26 {
+		offset = <0xfc>;
+		bit-mask = <0xff>;
+		bit-shift = <16>;
+	};
+	sio_25 {
+		offset = <0xfc>;
+		bit-mask = <0xff>;
+		bit-shift = <8>;
+	};
+	sio_24 {
+		offset = <0xfc>;
+		bit-mask = <0xff>;
+		bit-shift = <0>;
+	};
+};
-- 
2.17.1
