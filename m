Return-Path: <SRS0=8onI=EX=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 840A7C6369E
	for <openbmc@archiver.kernel.org>; Tue, 17 Nov 2020 01:14:53 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB9AE24686
	for <openbmc@archiver.kernel.org>; Tue, 17 Nov 2020 01:14:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W4EdQQK5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EB9AE24686
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CZnzb10WVzDqQ4
	for <openbmc@archiver.kernel.org>; Tue, 17 Nov 2020 12:14:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::443;
 helo=mail-pf1-x443.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=W4EdQQK5; dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CZnt15mGRzDqPQ
 for <openbmc@lists.ozlabs.org>; Tue, 17 Nov 2020 12:10:01 +1100 (AEDT)
Received: by mail-pf1-x443.google.com with SMTP id q10so15890885pfn.0
 for <openbmc@lists.ozlabs.org>; Mon, 16 Nov 2020 17:10:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=tLK4An+hDGibqk+F+KB9Iylic4mHms0AyKGZoLHI+Fo=;
 b=W4EdQQK5c99k1YHeZ5PdPfwRC8Gpa/e69373mXPobeW92VK94XgaPhJ7Lia/01VVpc
 +C0O5aKlrRsUwaAmIYSbEBPt+X3Dd1EW8chADG+6RbSkyZZJB3d4uWi7VD7mPpssPfdq
 QEGa04fY2BH2CBBdtQWEIs03StolYUB2a6rhJBSOGPn1w1ld7qLyGDz9O2ZV0BrnMpY7
 3sCAu4LQeWCztXrLpGgYf/ovvJfQpg+i4FKVpraBdG9pY1d7Im/tfrUXaG3IfczRfjeb
 7ICS9g3uSaYwQ64BQFlC0dZ964Cs76THuj14LmY/CBxQREHuttauSlLHmyiRnHoVrOL7
 TZXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=tLK4An+hDGibqk+F+KB9Iylic4mHms0AyKGZoLHI+Fo=;
 b=KJ9hM8+sFInsJL5ftOaduLh+nX2TmTWEt6TejmE6cX9oxA9QucLpYzoa4eIwc5egl8
 MtkPyVkAonmihMrDr62xjo3uMl4ZqMA+QKeMhmbs/IlUGPlvRRTApwBhfQdmriyIVHmV
 qwlrKxpgemxeypnZRNmmeKbkzqEAZkwN8Y0kKkd1+FKIG+ei4Er2cPc8i5JQHFr7UPQS
 MaSZYssu/MLfLIi2Sw3aqq+olGCz+m6giAO3NAXR3FkNogIMLnidregou33JFSboDNsl
 8ry6sekxvLRS/Mv6wkYDs8v0020Xj2G7L8YBR1Ixd3XNxLOO8mwC+/zdA2LIhjui486j
 evuA==
X-Gm-Message-State: AOAM533i8I9Ywzs+PEF+OCPlaznzYMOUq4slyYfLctko0lhy9qpbtkDg
 Sw4o0mAcVS5E0FucLEqKi4E=
X-Google-Smtp-Source: ABdhPJwKqCZdq0GrtoR6CKHJ9lffDESA4ZjLWcy9Axn4FuX/WQCGOH1oxy+fII7QPTvqfsbwnQJZcg==
X-Received: by 2002:a63:441c:: with SMTP id r28mr1581268pga.184.1605575398722; 
 Mon, 16 Nov 2020 17:09:58 -0800 (PST)
Received: from taoren-ubuntu-R90MNF91.thefacebook.com
 (c-73-252-146-110.hsd1.ca.comcast.net. [73.252.146.110])
 by smtp.gmail.com with ESMTPSA id m23sm7362091pfo.136.2020.11.16.17.09.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 17:09:58 -0800 (PST)
From: rentao.bupt@gmail.com
To: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Jonathan Corbet <corbet@lwn.net>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>, linux-hwmon@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, bpf@vger.kernel.org, openbmc@lists.ozlabs.org,
 taoren@fb.com, mikechoi@fb.com
Subject: [PATCH 2/2] docs: hwmon: Document max127 driver
Date: Mon, 16 Nov 2020 17:09:44 -0800
Message-Id: <20201117010944.28457-3-rentao.bupt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201117010944.28457-1-rentao.bupt@gmail.com>
References: <20201117010944.28457-1-rentao.bupt@gmail.com>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
Cc: Tao Ren <rentao.bupt@gmail.com>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

From: Tao Ren <rentao.bupt@gmail.com>

Add documentation for max127 hardware monitoring driver.

Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
---
 Documentation/hwmon/index.rst  |  1 +
 Documentation/hwmon/max127.rst | 43 ++++++++++++++++++++++++++++++++++
 2 files changed, 44 insertions(+)
 create mode 100644 Documentation/hwmon/max127.rst

diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index 408760d13813..0a07b6000c20 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -111,6 +111,7 @@ Hardware Monitoring Kernel Drivers
    ltc4245
    ltc4260
    ltc4261
+   max127
    max16064
    max16065
    max1619
diff --git a/Documentation/hwmon/max127.rst b/Documentation/hwmon/max127.rst
new file mode 100644
index 000000000000..e50225a61c1a
--- /dev/null
+++ b/Documentation/hwmon/max127.rst
@@ -0,0 +1,43 @@
+.. SPDX-License-Identifier: GPL-2.0-or-later
+
+Kernel driver max127
+====================
+
+Author:
+
+  * Tao Ren <rentao.bupt@gmail.com>
+
+Supported chips:
+
+  * Maxim MAX127
+
+    Prefix: 'max127'
+
+    Datasheet: https://datasheets.maximintegrated.com/en/ds/MAX127-MAX128.pdf
+
+Description
+-----------
+
+The MAX127 is a multirange, 12-bit data acquisition system (DAS) providing
+8 analog input channels that are independently software programmable for
+a variety of ranges. The available ranges are {0,5V}, {0,10V}, {-5,5V}
+and {-10,10V}.
+
+The MAX127 features a 2-wire, I2C-compatible serial interface that allows
+communication among multiple devices using SDA and SCL lines.
+
+Sysfs interface
+---------------
+
+  ============== ==============================================================
+  in[0-7]_input  The conversion value for the corresponding channel.
+		 RO
+
+  in[0-7]_min    The lower limit (in Volt) for the corresponding channel.
+		 For the MAX127, it will be adjusted to -10, -5, or 0.
+		 RW
+
+  in[0-7]_max    The higher limit (in Volt) for the corresponding channel.
+		 For the MAX127, it will be adjusted to 0, 5, or 10.
+		 RW
+  ============== ==============================================================
-- 
2.17.1

