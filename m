Return-Path: <venture@google.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4001:c0b::243; helo=mail-it0-x243.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="IzgD0AJV"; 
 dkim-atps=neutral
Received: from mail-it0-x243.google.com (mail-it0-x243.google.com
 [IPv6:2607:f8b0:4001:c0b::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yr9xF0gfTzDrbh
 for <openbmc@lists.ozlabs.org>; Tue,  5 Dec 2017 03:55:43 +1100 (AEDT)
Received: by mail-it0-x243.google.com with SMTP id p139so14359385itb.1
 for <openbmc@lists.ozlabs.org>; Mon, 04 Dec 2017 08:55:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=YurVtleWVaC0nNk6nCXVXH8vUjAKs6NmJ+FFfnQngYs=;
 b=IzgD0AJVJBV9P2DRahEcRHWx3cK4RoeYtl/UQOJNBrsnkJqjPCFltBden/kMDzbK01
 3YaVx04BbG1/1Mz50wXqVE5b2AQPzVl4E8mX7b+t9zSBCAzCeSpT6z6GC8oh4AV0U81y
 odvZ2cS1LA/S0NUBmXJz1MUGJ7JgWn6enehcgUql5z48Cab9UZtGzkc3VRDUg4By2j0W
 yfp0YTFV1BbaImUjUl1nnZyUGRbCmJr1M1VIJc35nq+a3sPG3Ld3Xe/Z5yQHQIxy1jwx
 AyEVNdevJiThRqO8anjXMF6sJb2V/XBJrFiIKjJtpr+5ypEh3dK3D6JQ+QivxiE+Wmy5
 2yUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=YurVtleWVaC0nNk6nCXVXH8vUjAKs6NmJ+FFfnQngYs=;
 b=oS33l10cMwoehGpFU3J/A2bbeFo2XbIkGEbqO98k1iXYDIx6texA8evKZJffFD0olw
 Wdzlt/7SOV0YUEdMXjEODEbKJOUeS90YJ5349fBAxgeGPtEcIBfwyUb6nIyDmIcGGymr
 jJ3nf/YdSrnHz8xybYaJtcRfEgaCLTCh/Fv+/gjnllP6dd5gp8ShZJcZjkGJxN5n4uz/
 c4A9kkltbCnRWLEO2k5ydTX2drHrf98ouWHAMSg8Q8LV4Pl9dNKwngtb1az8gD/IQIDs
 ecsyWFqUY+WIksqeYc+riif133VZmu94P3VWbCEpfnOd3Asc7+eCOu7cv0qnqMvdFWbI
 DIkQ==
X-Gm-Message-State: AJaThX5NJFpONmP0F1rwN6iUtEnEVgCdO/YMnLRPbHQCCFzbysVo+x29
 205zM5BSurVwLQimivz5XQhI9w==
X-Google-Smtp-Source: AGs4zMbvBt2zzoDDDgwZfyAdaeRgiUW88JhecBSD0TPEWWSsRlDy00X/RiKrtpqJqVEZk2qJomnn7Q==
X-Received: by 10.36.211.4 with SMTP id n4mr15066515itg.88.1512406541491;
 Mon, 04 Dec 2017 08:55:41 -0800 (PST)
Received: from venture.svl.corp.google.com ([100.123.242.104])
 by smtp.gmail.com with ESMTPSA id p3sm3963817itc.39.2017.12.04.08.55.39
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 04 Dec 2017 08:55:40 -0800 (PST)
From: Patrick Venture <venture@google.com>
To: venture@google.com,
	joel@jms.id.au
Cc: Peter Hanson <peterh@google.com>,
	openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.10] ARM: dts: quanta: i2c-2 idle disconnects
Date: Mon,  4 Dec 2017 08:55:37 -0800
Message-Id: <20171204165537.107035-1-venture@google.com>
X-Mailer: git-send-email 2.15.0.531.g2ccb3012c9-goog
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
X-List-Received-Date: Mon, 04 Dec 2017 16:55:46 -0000

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
