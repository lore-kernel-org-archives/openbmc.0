Return-Path: <joel.stan@gmail.com>
Received: from mail-pg0-x243.google.com (mail-pg0-x243.google.com
 [IPv6:2607:f8b0:400e:c05::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tNBmk5VF9zDvy5
 for <openbmc@lists.ozlabs.org>; Tue, 22 Nov 2016 15:09:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="ugIWTu3u"; 
 dkim-atps=neutral
Received: by mail-pg0-x243.google.com with SMTP id e9so749553pgc.1
 for <openbmc@lists.ozlabs.org>; Mon, 21 Nov 2016 20:09:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=sender:from:to:subject:date:message-id:in-reply-to:references;
 bh=IISGxrh5NlA/wBP6RlSIi40MPc+i7s1ay41TxXevkis=;
 b=ugIWTu3uXJCeEoPfkUtsQ8s1RKZ5Ka8nGjUzh8+e0k0djGS3GLLgZOQRPSopXLQqbr
 Hw5XhHybV0idH/mW/SxFXGa5CrV4jfOJVYf5zGA4Ese1sPad1+Z2sjdxD/RPDJjTtKjH
 vyKFhiYClWfWdHz3u4ahdrzCj1/NB02LwlNEoA52iZv0I3OtyEQxwn1Oh2wDVEs2B27j
 A/ONcjM5W9rZCJp9LsXmFJbLEMLJA0I2HduGZvZ9UL2OKb+1pITYSUdUmqmrQi0NyjEq
 WYtMEm36vWRqCc/7QERKAoe3H9ZmLTFyiMvIiTDfqaVO1NReVqs0t25dw6jsoxtzapWt
 WF5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references;
 bh=IISGxrh5NlA/wBP6RlSIi40MPc+i7s1ay41TxXevkis=;
 b=BZFyN72lwcr11GAeIFjUEO/RoEAGPNjs2b969x8AyFrZM7YAD5mztU5Su42HjSLhHe
 ZijAvqZ9HIKuBNCYvYx6ZDbUU2UBOHP4WoG+EkyRkqUG0IMlKbPzlV2t6Xc06K3Mg6d+
 vdaDkho2Rm/ODH96jl55JyOxqW7TY7lwO/X428lj2nYI//vW4ySscWDk40TrLC0n3GME
 JKrzbbNUdKdZLJqEp16CqJeCB1RtYZ2rdA/xlcjaKBnbBoC6WgTw1tcvbElBB15+31pw
 /005PUVdMpf7Wg0LlMqDGm4XtMgUxBiEpxHXVeIbiaJ5VB8gcAWUlIbttglEConz00IO
 Z5Gg==
X-Gm-Message-State: AKaTC039/lLb3o1c6Ccyr7rtz5DbCLrrQxjTxzjAxIVJk7FQjsYLX63aggua9J8BfRZZhQ==
X-Received: by 10.98.150.206 with SMTP id s75mr23322899pfk.155.1479787749186; 
 Mon, 21 Nov 2016 20:09:09 -0800 (PST)
Received: from aurora.jms.id.au ([2403:480:11:8000:34fc:e5f1:fa3d:d083])
 by smtp.gmail.com with ESMTPSA id s197sm22813585pgc.38.2016.11.21.20.09.05
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Mon, 21 Nov 2016 20:09:08 -0800 (PST)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
 Tue, 22 Nov 2016 14:39:01 +1030
From: Joel Stanley <joel@jms.id.au>
To: andrew@aj.id.au,
	openbmc@lists.ozlabs.org
Subject: [PATCH 2/7] arm: dts: aspeed: Add UARTs to Witherspoon
Date: Tue, 22 Nov 2016 14:38:44 +1030
Message-Id: <20161122040849.31604-2-joel@jms.id.au>
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
X-List-Received-Date: Tue, 22 Nov 2016 04:09:11 -0000

In addition to the internal BMC debug UART Witherspoon has a RS-232
connection on the back of the chassis, and an internal connection to the
APSS.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
index c7458ae6efd7..5c463f4112f6 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
@@ -42,6 +42,29 @@
 	};
 };
 
+&uart1 {
+	/* Rear RS-232 connector */
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_txd1_default
+			&pinctrl_rxd1_default
+			&pinctrl_nrts1_default
+			&pinctrl_ndtr1_default
+			&pinctrl_ndsr1_default
+			&pinctrl_ncts1_default
+			&pinctrl_ndcd1_default
+			&pinctrl_nri1_default>;
+};
+
+&uart2 {
+	/* APSS */
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_txd2_default &pinctrl_rxd2_default>;
+};
+
 &uart5 {
 	status = "okay";
 };
-- 
2.10.2
