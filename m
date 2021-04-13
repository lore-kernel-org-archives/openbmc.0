Return-Path: <SRS0=JXsw=JK=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BA0BC433ED
	for <openbmc@archiver.kernel.org>; Tue, 13 Apr 2021 08:11:32 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A145611F2
	for <openbmc@archiver.kernel.org>; Tue, 13 Apr 2021 08:11:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0A145611F2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FKJGV4Ct5z3c2k
	for <openbmc@archiver.kernel.org>; Tue, 13 Apr 2021 18:11:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=EYE4jzPs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62b;
 helo=mail-pl1-x62b.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=EYE4jzPs; dkim-atps=neutral
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FKJC33fHNz3bcW
 for <openbmc@lists.ozlabs.org>; Tue, 13 Apr 2021 18:08:31 +1000 (AEST)
Received: by mail-pl1-x62b.google.com with SMTP id w8so5451771plg.9
 for <openbmc@lists.ozlabs.org>; Tue, 13 Apr 2021 01:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+tImnKjA4SMUgrlaWMskFIXyAu4SEswhFxGNbllUsU4=;
 b=EYE4jzPseENKAT/Ke3BLEeGIsFdSr6T5iFD8ZOk6JnkgdJIfwj9jnbE4KXYSDvtTA3
 l9gPuKPgWqNZCSli30sxY24gigg+J7mdf4alafFfcxr2Sb/rxqLccKAIYwPHs2MpUznL
 x0vTby4g0ZYEV5wtplMG+5k5WG33o4ZdyYdD3y1XDX8kyMRTA0/Ljna60EIZyu3K/h6g
 UAX6zq7jdtdQBo6ph+cjw+M9HGad1i8cTzSKGi+5/jv5jMaSFE22prJ7YaoToq0zFYhU
 x28cudJWvSQEzgvRjgjGs+3KsatODa+zm9Ecqt7H3Z2x9NvYSJTo7Apwbe1jmsMs9yVm
 otiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=+tImnKjA4SMUgrlaWMskFIXyAu4SEswhFxGNbllUsU4=;
 b=AmWFeW7Lk6Edb1cavfJ3bR9uVkHBbQ5VwPeHZ0W6imCKuNBHxGVH+2jMEJWkSVsi0X
 8cITv5/sukoyB4Nf2cNqPAiF+swr1pw1hMmctiGRekkdDzypbZIQBm9nZk0svybmZyPo
 DQOVcwBKWrmz9/VRDpm3PlNQyVnNDA1DTrvGxYK2d+SOw85a88oIu8CF621Fyj5nXfQO
 /mlJUdvkLxadNLiJNRTPjkomellTL1HdakS0k6/ji4jcq697SGk6RaUfk5AVLV4sF73W
 KZD/Ng3nen8h9HqF5puihr+ucEaPtGkH0BAQkFe815oLL1v7U9ZfF92cLlw3/K2peFXe
 tlvA==
X-Gm-Message-State: AOAM530XX44Oja1ve3580y+YLslBGBth4uL97MA7eDP7/IDPbVKq4ZaZ
 gnjE7u9ldH9D3VuZ7RkuU6AkCbQZxlA=
X-Google-Smtp-Source: ABdhPJxVwi4NyRezkXJxsYgUG4K/09dOehNKYqxsC+EWATXI7SB9WccyMvRdQXlhSr1cZADmCrSR7w==
X-Received: by 2002:a17:902:bcc4:b029:e8:e13c:60f1 with SMTP id
 o4-20020a170902bcc4b02900e8e13c60f1mr31376419pls.25.1618301309329; 
 Tue, 13 Apr 2021 01:08:29 -0700 (PDT)
Received: from voyager.lan ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id nh24sm1443507pjb.38.2021.04.13.01.08.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Apr 2021 01:08:28 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org, Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>,
 Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH u-boot v2019.04-aspeed-openbmc 07/11] hash: Allow for SHA512
 hardware implementations
Date: Tue, 13 Apr 2021 17:37:51 +0930
Message-Id: <20210413080755.73572-8-joel@jms.id.au>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210413080755.73572-1-joel@jms.id.au>
References: <20210413080755.73572-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

Similar to support for SHA1 and SHA256, allow the use of hardware hashing
engine by enabling the algorithm and setting  CONFIG_SHA_HW_ACCEL /
CONFIG_SHA_PROG_HW_ACCEL.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 common/hash.c    | 24 ++++++++++++++++++++++--
 include/hw_sha.h | 26 ++++++++++++++++++++++++++
 lib/Kconfig      | 15 +++++++--------
 3 files changed, 55 insertions(+), 10 deletions(-)

diff --git a/common/hash.c b/common/hash.c
index c00ec4d36c41..a19cba07d779 100644
--- a/common/hash.c
+++ b/common/hash.c
@@ -86,7 +86,7 @@ static int hash_finish_sha256(struct hash_algo *algo, void *ctx, void
 }
 #endif
 
-#if defined(CONFIG_SHA384)
+#if defined(CONFIG_SHA384) && !defined(CONFIG_SHA_PROG_HW_ACCEL)
 static int hash_init_sha384(struct hash_algo *algo, void **ctxp)
 {
 	sha512_context *ctx = malloc(sizeof(sha512_context));
@@ -114,7 +114,7 @@ static int hash_finish_sha384(struct hash_algo *algo, void *ctx, void
 }
 #endif
 
-#if defined(CONFIG_SHA512)
+#if defined(CONFIG_SHA512) && !defined(CONFIG_SHA_PROG_HW_ACCEL)
 static int hash_init_sha512(struct hash_algo *algo, void **ctxp)
 {
 	sha512_context *ctx = malloc(sizeof(sha512_context));
@@ -249,10 +249,20 @@ static struct hash_algo hash_algo[] = {
 		.name		= "sha384",
 		.digest_size	= SHA384_SUM_LEN,
 		.chunk_size	= CHUNKSZ_SHA384,
+#ifdef CONFIG_SHA_HW_ACCEL
+		.hash_func_ws	= hw_sha384,
+#else
 		.hash_func_ws	= sha384_csum_wd,
+#endif
+#ifdef CONFIG_SHA_PROG_HW_ACCEL
+		.hash_init	= hw_sha_init,
+		.hash_update	= hw_sha_update,
+		.hash_finish	= hw_sha_finish,
+#else
 		.hash_init	= hash_init_sha384,
 		.hash_update	= hash_update_sha384,
 		.hash_finish	= hash_finish_sha384,
+#endif
 	},
 #endif
 #ifdef CONFIG_SHA512
@@ -260,10 +270,20 @@ static struct hash_algo hash_algo[] = {
 		.name		= "sha512",
 		.digest_size	= SHA512_SUM_LEN,
 		.chunk_size	= CHUNKSZ_SHA512,
+#ifdef CONFIG_SHA_HW_ACCEL
+		.hash_func_ws	= hw_sha512,
+#else
 		.hash_func_ws	= sha512_csum_wd,
+#endif
+#ifdef CONFIG_SHA_PROG_HW_ACCEL
+		.hash_init	= hw_sha_init,
+		.hash_update	= hw_sha_update,
+		.hash_finish	= hw_sha_finish,
+#else
 		.hash_init	= hash_init_sha512,
 		.hash_update	= hash_update_sha512,
 		.hash_finish	= hash_finish_sha512,
+#endif
 	},
 #endif
 	{
diff --git a/include/hw_sha.h b/include/hw_sha.h
index 991e496a3cb2..8cdf821218a0 100644
--- a/include/hw_sha.h
+++ b/include/hw_sha.h
@@ -8,6 +8,32 @@
 #define __HW_SHA_H
 #include <hash.h>
 
+/**
+ * Computes hash value of input pbuf using h/w acceleration
+ *
+ * @param in_addr	A pointer to the input buffer
+ * @param bufleni	Byte length of input buffer
+ * @param out_addr	A pointer to the output buffer. When complete
+ *			64 bytes are copied to pout[0]...pout[63]. Thus, a user
+ *			should allocate at least 64 bytes at pOut in advance.
+ * @param chunk_size	chunk size for sha512
+ */
+void hw_sha512(const uchar * in_addr, uint buflen,
+			uchar * out_addr, uint chunk_size);
+
+/**
+ * Computes hash value of input pbuf using h/w acceleration
+ *
+ * @param in_addr	A pointer to the input buffer
+ * @param bufleni	Byte length of input buffer
+ * @param out_addr	A pointer to the output buffer. When complete
+ *			48 bytes are copied to pout[0]...pout[47]. Thus, a user
+ *			should allocate at least 48 bytes at pOut in advance.
+ * @param chunk_size	chunk size for sha384
+ */
+void hw_sha384(const uchar * in_addr, uint buflen,
+			uchar * out_addr, uint chunk_size);
+
 /**
  * Computes hash value of input pbuf using h/w acceleration
  *
diff --git a/lib/Kconfig b/lib/Kconfig
index 984a783fd16f..f77272d0a94a 100644
--- a/lib/Kconfig
+++ b/lib/Kconfig
@@ -273,19 +273,18 @@ config SHA384
 config SHA_HW_ACCEL
 	bool "Enable hashing using hardware"
 	help
-	  This option enables hardware acceleration
-	  for SHA1/SHA256 hashing.
-	  This affects the 'hash' command and also the
-	  hash_lookup_algo() function.
+	  This option enables hardware acceleration for SHA hashing.
+	  This affects the 'hash' command and also the hash_lookup_algo()
+	  function.
 
 config SHA_PROG_HW_ACCEL
 	bool "Enable Progressive hashing support using hardware"
 	depends on SHA_HW_ACCEL
 	help
-	  This option enables hardware-acceleration for
-	  SHA1/SHA256 progressive hashing.
-	  Data can be streamed in a block at a time and the hashing
-	  is performed in hardware.
+	  This option enables hardware-acceleration for SHA progressive
+	  hashing.
+	  Data can be streamed in a block at a time and the hashing is
+	  performed in hardware.
 
 config MD5
 	bool
-- 
2.30.2

