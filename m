Return-Path: <venture@google.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4001:c06::244; helo=mail-io0-x244.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="cr8wDbV4"; 
 dkim-atps=neutral
Received: from mail-io0-x244.google.com (mail-io0-x244.google.com
 [IPv6:2607:f8b0:4001:c06::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ylyKK3XnZzDqjB
 for <openbmc@lists.ozlabs.org>; Tue, 28 Nov 2017 06:58:28 +1100 (AEDT)
Received: by mail-io0-x244.google.com with SMTP id s37so26766499ioe.10
 for <openbmc@lists.ozlabs.org>; Mon, 27 Nov 2017 11:58:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=YurVtleWVaC0nNk6nCXVXH8vUjAKs6NmJ+FFfnQngYs=;
 b=cr8wDbV4oqHkoJKQFCnAYYbzZFcUJnAWQQHUwTzARouR9nf8rd1BwfQk8jDF2kACZh
 hDo1utb3Ly0Y8U+uV6WTy6fGgt33Yl/3IrVeEPnai2m9usm4nPQyBpbR30a+G/fbPgZG
 k3LP5OECJM8PRwT8m1/qat/KlvE09qFs7UhzPuRFsDH5wIpgNePKz52j38mnKS1xJ+Cd
 ptPz7giqRc1ltOY958sCJUWC42XBugtlWfxEvgRf1AwFTe8yAyETEbkpg9gRSXK80pEn
 Ixz2gvPNoUNRXKZD2z4PsbRO06+DjPVy7YTrJefNgADy6ywQP4xOaSQ5OVN2lsUwhWAq
 k5hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=YurVtleWVaC0nNk6nCXVXH8vUjAKs6NmJ+FFfnQngYs=;
 b=FTWqopgqLC5cH+kFEvmAmGjfI1dQDyI1hxlTUwHJI+Yn7UsiucNXiZxhuLuxaa44z9
 KZ4JQVULnd62ZJLuSvtsMuGRntBmebsciwDihayh+kDcJY4TAOfDDLbc14+3ToX6lZD3
 +uZOU2oC589xGWGZ0oJWk5GsvbpNq0X2e65uO4TbFKWE8JvycwoBfZO85Q2Sw+ppqSKh
 eiSPEDqpW8wcQUelVXUnrq2Jo7JNhyo7SyQSnp3KXsKNpe/TbCUU4iDk16nStFfUJrHQ
 0bibFQ2pHMt7foHKQ1+XCuGr7I947QQ3ESOBnsW2dvqDw2gDKsbgX7WSYzklOhaNtKFj
 E59g==
X-Gm-Message-State: AJaThX7u6ydsPwLr3sSn0wDphtcf2own269QGthtgtf7OVuAIbcxTMqg
 gysIoAUL/3AVVJRD5zdr/fxaFw==
X-Google-Smtp-Source: AGs4zMbfsBNSGfNjeHs4QNUPWVD2mlb5QVpsCJQRvSonomcY0iTazS3yE9OoUAG5IepW8aRkq/3GvQ==
X-Received: by 10.107.129.35 with SMTP id c35mr44764093iod.258.1511812706584; 
 Mon, 27 Nov 2017 11:58:26 -0800 (PST)
Received: from venture.svl.corp.google.com ([100.123.242.104])
 by smtp.gmail.com with ESMTPSA id g93sm9382515ioj.51.2017.11.27.11.58.25
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 27 Nov 2017 11:58:25 -0800 (PST)
From: Patrick Venture <venture@google.com>
To: venture@google.com,
	joel@jms.id.au
Cc: Peter Hanson <peterh@google.com>,
	openbmc@lists.ozlabs.org
Subject: [PATCH linux] ARM: dts: quanta: i2c-2 idle disconnects
Date: Mon, 27 Nov 2017 11:58:22 -0800
Message-Id: <20171127195822.185140-1-venture@google.com>
X-Mailer: git-send-email 2.15.0.417.g466bffb3ac-goog
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 27 Nov 2017 19:58:30 -0000

From: Peter Hanson <peterh@google.com>

Two top-level pca954x muxes branch off Quanta q71l i2c-2 bus; they
have different addresses, so there is no confusion in that sense.
However, by default, the pca954x driver skips disconnecting the
selected channel. This supports expected topologies, but will leave
two channels selected at the same time when connected in parallel.

This commit adds the i2c-mux-idle-disconnect property to both muxes
to inform the driver that disconnecting is not optional on bus 2.

Signed-off-by: Peter Hanson <peterh@google.com>
Signed-off-by: Patrick Venture <venture@google.com>
---
 arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts b/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
index 7ed3a773b2d5..05cfbf086c84 100644
--- a/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
@@ -227,6 +227,7 @@
 		reg = <0x74>;
 		#address-cells = <1>;
 		#size-cells = <0>;
+		i2c-mux-idle-disconnect;  /* may use mux@77 next. */
 	};
 
 	/* 0: PCIe Slot 1,
@@ -243,6 +244,7 @@
 		#address-cells = <1>;
 		#size-cells = <0>;
 		reg = <0x77>;
+		i2c-mux-idle-disconnect;  /* may use mux@74 next. */
 	};
 };
 
-- 
2.15.0.417.g466bffb3ac-goog
