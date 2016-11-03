Return-Path: <xow@google.com>
Received: from mail-pf0-x236.google.com (mail-pf0-x236.google.com
 [IPv6:2607:f8b0:400e:c00::236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t8yw03WCCzDvVp
 for <openbmc@lists.ozlabs.org>; Fri,  4 Nov 2016 08:36:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=JrB/ROms; 
 dkim-atps=neutral
Received: by mail-pf0-x236.google.com with SMTP id 189so38062920pfz.3
 for <openbmc@lists.ozlabs.org>; Thu, 03 Nov 2016 14:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LKPXH5UOvFQAw1K8p+FYyd/pykt1ZcchnMy1NbDx9HQ=;
 b=JrB/ROmsd1zBj/n0NLfjou212RYGf6edlpWJ0mSKaJT+z8wTuXTnHGyDHq3yPD1Z4d
 4C3O554Y06GK9eTW1aLRMzp6aBtWFDpscsQB+NgDwMoezvDBTRCqz9PQfKSZUhDnItzM
 0ViLuPhCRM61rOPXN6ra03NP2C71ZB1igmznaqBVQS3NcCFihfmGugbUMQpDQTOEoJMI
 gDJ6rpbPvihjEXzpcNr9Nzpi056jqfjwtn4q+ympmNJ5Z4b7mMZR/AvgoaJrgSYWLBQm
 f8lSJ8F6v9gKw8moXxiLkfxxFCPZZwtKf67c0frtaKOEWLa3dhAmFmOzILdeR/fy3hIB
 crsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LKPXH5UOvFQAw1K8p+FYyd/pykt1ZcchnMy1NbDx9HQ=;
 b=Qg2v47ufy3D4jEc13kGcdtEe2plq3u3Grllra+Iq4pLX3CqnEuBAG7qpBiw6bVLytX
 A7dOfspPjLpyH8RcgfqzbAlotn0SJYQDyEolGs0mEyX8mNHUYmRGLye/wYNYFXsZLlfW
 +VAK/y96/h5uO9ErVf823nt/GDVQqOpdkVrIdUDX/WJzm/69pGWdEFZIY/1HdHt6IjaF
 fWLSwAhoH/mUpsPKbcaFqBdU1o8wBswVU++1DhQ6B6NabMkd1b8aDJ+9o20s92xidUWV
 vKD47DHE+XXkknLRaw29Htmka7QJBAq8YW68KBhnadhoddzO+CHSiiStKP0JCGD+nkNj
 wRJw==
X-Gm-Message-State: ABUngvcX61oE++82YXPZck1fNh5bGA8OIFdKIne6XNNdZP9/3fLoiiCQAgD6j2RymDhfEoPv
X-Received: by 10.98.17.196 with SMTP id 65mr20262918pfr.55.1478208989381;
 Thu, 03 Nov 2016 14:36:29 -0700 (PDT)
Received: from pewter.svl.corp.google.com ([100.123.242.121])
 by smtp.gmail.com with ESMTPSA id r88sm14841891pfe.93.2016.11.03.14.36.28
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 03 Nov 2016 14:36:28 -0700 (PDT)
From: Xo Wang <xow@google.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux] ARM: dts: aspeed: zaius: Add UCD90160 power sequencer
Date: Thu,  3 Nov 2016 14:36:24 -0700
Message-Id: <1478208984-91788-1-git-send-email-xow@google.com>
X-Mailer: git-send-email 2.8.0.rc3.226.g39d4020
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
X-List-Received-Date: Thu, 03 Nov 2016 21:36:33 -0000

Add binding to instantiate hwmon sensor support for the UCD90160 power
sequencer on the Zaius board.

Signed-off-by: Xo Wang <xow@google.com>
---
 arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
index 9e59649..673bab8 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
@@ -111,6 +111,11 @@
 		reg = <0x68>;
 	};
 
+	ucd90160@64 {
+		compatible = "ti,ucd90160";
+		reg = <0x64>;
+	};
+
 	/* Power sequencer UCD90160 PMBUS @64h
 	 * FRU AT24C64D @50h
 	 * RTC PCF8523 @68h
-- 
2.8.0.rc3.226.g39d4020
