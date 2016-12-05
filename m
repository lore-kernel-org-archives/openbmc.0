Return-Path: <raltherr@google.com>
Received: from mail-pg0-x22b.google.com (mail-pg0-x22b.google.com
 [IPv6:2607:f8b0:400e:c05::22b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tXXz72xtZzDvtc
 for <openbmc@lists.ozlabs.org>; Tue,  6 Dec 2016 05:17:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="HKJ5Fy46"; 
 dkim-atps=neutral
Received: by mail-pg0-x22b.google.com with SMTP id f188so138687468pgc.3
 for <openbmc@lists.ozlabs.org>; Mon, 05 Dec 2016 10:17:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=w1OkIsD/N6Znx2WgMTRfBITZiRDSkX1QCZagrqJH188=;
 b=HKJ5Fy46x0DZWh76AkO72TTDBqOhXpBoQE7IX7JV8yPHRwilKSDq1Z4XEDna9l2nou
 82WFe05CQFYXPd6Ct8QXpRWMdHSC63IHQ5ATdyYhOMPQvywe0YjRHTrJk/H/nX2tpCe+
 FrV49gwtiSYGC1X8ivupVEh6x2YDEFG6wKaFNZUSxKVU8jB1VB6Bt/Jd02d4Rsu8OVlX
 aHBpCW9Sp0dybMiW8fYh1YaKE/VRUuB1yWpURT00dWhzkLGBDd0yuAOsd7KngWOguJHl
 4D3mfbiFrMxpKachtzXRdDmZF+nt891YV24NxFwm7tm7Mylu5QjBlbzo7Q0DpcOOue3c
 ZXrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=w1OkIsD/N6Znx2WgMTRfBITZiRDSkX1QCZagrqJH188=;
 b=ezoIN/6F3wwR77aVB9AVPfS2/lfDYOwW5GQMUsSKIqtcNii8D3XaAnSU+PXSwQLF5l
 AHRkjwrFTf00D+qnquzszuplvMrsUDI0CmjxiDFkUhM3Xw1Xp/71vFBDexZAt2WurNRV
 n1eWVnvskAcGdbn9zdijvSzMybWNIXqwjoeBiDps9mcaPT0W9KUbSSbGI+ZkENTY2vOb
 rwbyrcgzn4DkGX1IdXeBahh+d7rJ9hsSKD0okDNm9E5dtHHyg2vS5HWTsd5xrhhezbM8
 I77oHCLxvG78GdX0u0m9LbJ/yBulsAbU48XOY3Ed3fuARfInK/HTz2EnThjSPkrB6UWi
 a5Ig==
X-Gm-Message-State: AKaTC009xJRrl9BK7B3pRdX27zAjPdypWGNZgcdl1Cx1xVzlI8n0V/qiUjkkgZGxY1ue6LC0
X-Received: by 10.99.48.68 with SMTP id w65mr104858413pgw.68.1480961825388;
 Mon, 05 Dec 2016 10:17:05 -0800 (PST)
Received: from raltherr-linux.svl.corp.google.com ([100.123.244.62])
 by smtp.gmail.com with ESMTPSA id p13sm29059192pgf.47.2016.12.05.10.17.04
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 05 Dec 2016 10:17:04 -0800 (PST)
From: Rick Altherr <raltherr@google.com>
To: openbmc@lists.ozlabs.org
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH u-boot v3 1/3] aspeed: remove hack loading ramdisk in memory
Date: Mon,  5 Dec 2016 10:17:00 -0800
Message-Id: <1480961822-6631-2-git-send-email-raltherr@google.com>
X-Mailer: git-send-email 2.8.0.rc3.226.g39d4020
In-Reply-To: <1480961822-6631-1-git-send-email-raltherr@google.com>
References: <1480961822-6631-1-git-send-email-raltherr@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
X-List-Received-Date: Mon, 05 Dec 2016 18:17:07 -0000

From: Cédric Le Goater <clg@kaod.org>

Signed-off-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Rick Altherr <raltherr@google.com>
---
 common/image.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/common/image.c b/common/image.c
index 20c4807..0be09e5 100644
--- a/common/image.c
+++ b/common/image.c
@@ -1069,17 +1069,6 @@ int boot_get_ramdisk(int argc, char * const argv[], bootm_headers_t *images,
 				return 1;
 			}
 		}
-/// TODO ... Check Why ..................
-#if  defined(CONFIG_ARCH_ASPEED)
-		/*
-		 * We need to copy the ramdisk to SRAM to let Linux boot
-		 */
-		if (rd_data) {
-			memmove ((void *)rd_load, (uchar *)rd_data, rd_len);
-			rd_data = rd_load;
-		}
-#endif /* CONFIG_ASPEED */
-
 	} else if (images->legacy_hdr_valid &&
 			image_check_type(&images->legacy_hdr_os_copy,
 						IH_TYPE_MULTI)) {
-- 
2.8.0.rc3.226.g39d4020
