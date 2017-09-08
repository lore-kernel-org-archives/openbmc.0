Return-Path: <xow@google.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400e:c05::235; helo=mail-pg0-x235.google.com;
 envelope-from=xow@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="JlVg2Sy7"; 
 dkim-atps=neutral
Received: from mail-pg0-x235.google.com (mail-pg0-x235.google.com
 [IPv6:2607:f8b0:400e:c05::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xprlq1f52zDrbn
 for <openbmc@lists.ozlabs.org>; Sat,  9 Sep 2017 07:57:43 +1000 (AEST)
Received: by mail-pg0-x235.google.com with SMTP id q68so6817785pgq.1
 for <openbmc@lists.ozlabs.org>; Fri, 08 Sep 2017 14:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=o6t0mrEdvsUgu0Sdy1EjqZAY+rS49rcJoBfWniSCWLo=;
 b=JlVg2Sy7CHtFcgSFLNisPnKyqbWMNo/b32dbLFyxZyMjPJA8stSAsz5mlaotb2KAEW
 4ZCyR5EE62FLzwk5AK5NSRtTrfJC02g5YoK9zdrJft3jEpOCSR7ESwbjS+MaahkM43mo
 uhqaG32yTxcTPO1vJ9hkhZY7uuRvE4NI/SG6CwbV9h6kpQyeGocZsmRtsjv/olUTTU1w
 C/4oBmnlXQUS4Nu9N7BDo4rW0Aw8K1Rs/dohH48Dbja0CteuvB1PKwze6sewti81P53d
 QGfBuY+nOFvPQ3DbBYC/ngTE4O0GqSZyk3bZr09s0pdBZs9ofzcEPHQ40iQeIj+Z5iji
 iGUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=o6t0mrEdvsUgu0Sdy1EjqZAY+rS49rcJoBfWniSCWLo=;
 b=grRrhTe7Kom7+pIhYlqEDlL8IXwaSlQWirUYsl/Q0tknWyooaiKcRxCNxP+TdefnDt
 wdR4rMaNwHm/o847eqyFdhnYBJteFkzvFVf2SFlGzWSfhVvRt1h1YMG4WXAUv4VadhDn
 G1YtQmYIo/XAMkYp6+oQf+KLdIaJa2YmqeGd1yOS1UFwbJpLxMFXFBCJLzIhosLiEyUh
 TmCQMBOBEX5vI+EqDUQqbd67O9oooyLimXc+8pdjpDs/yV3AWNyRWXawrDKPmflVT6BV
 FciyA/pJwzxZfIfOj8Gb/052iVw3WKIiVLE59z38Fvi3tua6EWaYjxPeF03GTjSzRWtm
 /dzQ==
X-Gm-Message-State: AHPjjUheNpVVJolY0MKHB4rVzHZaU45XzHryJJeLdEPvNs2qpKYH53Dw
 eCJvH/BdT89F32SEH9BNXA==
X-Google-Smtp-Source: ADKCNb4NTvqn2B9uh5WvKJf0h6mL7W5nVbL4qQQApkrGuwlXzbl8G9Ie5caKOgCwOHUJJ7xvV5iM1w==
X-Received: by 10.99.152.26 with SMTP id q26mr4486010pgd.202.1504907860727;
 Fri, 08 Sep 2017 14:57:40 -0700 (PDT)
Received: from pewter.svl.corp.google.com ([100.123.242.121])
 by smtp.gmail.com with ESMTPSA id d21sm5393300pfe.68.2017.09.08.14.57.40
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 08 Sep 2017 14:57:40 -0700 (PDT)
From: Xo Wang <xow@google.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux 4/5] ARM: dts: aspeed: zaius: enable port 80h snoop
Date: Fri,  8 Sep 2017 14:57:27 -0700
Message-Id: <20170908215728.115818-5-xow@google.com>
X-Mailer: git-send-email 2.14.1.581.gf28d330327-goog
In-Reply-To: <20170908215728.115818-1-xow@google.com>
References: <20170908215728.115818-1-xow@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
X-List-Received-Date: Fri, 08 Sep 2017 21:57:44 -0000

From: Robert Lippert <rlippert@google.com>

Signed-off-by: Robert Lippert <rlippert@google.com>
Signed-off-by: Xo Wang <xow@google.com>
---
 arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
index f178baabfb9d..ad760a7e8cb3 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
@@ -156,6 +156,11 @@
 	flash = <&spi1>;
 };
 
+&lpc_snoop {
+	status = "okay";
+	snoop-ports = <0x80>;
+};
+
 &mbox {
 	status = "okay";
 };
-- 
2.14.1.581.gf28d330327-goog
