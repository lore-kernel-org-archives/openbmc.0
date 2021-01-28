Return-Path: <SRS0=LnGq=G7=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A926C433DB
	for <openbmc@archiver.kernel.org>; Thu, 28 Jan 2021 11:01:36 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E48716146D
	for <openbmc@archiver.kernel.org>; Thu, 28 Jan 2021 11:01:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E48716146D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DRHbK6JBjzDr1d
	for <openbmc@archiver.kernel.org>; Thu, 28 Jan 2021 22:01:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42f;
 helo=mail-pf1-x42f.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=QRMo7O1B; dkim-atps=neutral
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DRHQ34lFDzDrBB
 for <openbmc@lists.ozlabs.org>; Thu, 28 Jan 2021 21:53:31 +1100 (AEDT)
Received: by mail-pf1-x42f.google.com with SMTP id u67so3753278pfb.3
 for <openbmc@lists.ozlabs.org>; Thu, 28 Jan 2021 02:53:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=b/1JgigsyE0bZl4sGNmB21W2UsqvyzYNe4+nXSzsAKo=;
 b=QRMo7O1Bp0nhHLzqgtbFgYZcS70o125WR6qhXXYec6GiqH8FQQyhSRjiI1/daU1Hsn
 LjYUVuMHyURplfoBK2zT6WQ5P/coq+jI1LSQH0VXcKv6dSIlF8bpe/SJkJvTflwpCq9E
 9pb5hjBxdsoTLC4XkdGTsY+qmGjxOv6pY6BCG0sFEsRFXinm8D5mWToUs6IoOnssPa25
 wHc6WzP8VUhfjuCBBSLFTaqP90XYlzWVSFFIvhB0wCjFGpD+wTG6OizEfabdUNpL8EGt
 ADZdGhfVvXheabr2p08EI0C7+VT1jhN6i9CRGhI/29XWEw9dzoP8RARZ4K4OuKW1/XaT
 foXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=b/1JgigsyE0bZl4sGNmB21W2UsqvyzYNe4+nXSzsAKo=;
 b=sSnxpFz4wp6n87sxbIGbWlWriTkHo8lbKRdQrKOl0ILUaKekS4S7xAYUZ8gjaO1k14
 AtVZgWe7xN+Vrk+U/h7vsm89yyY6Ah4+bF5S8xj0z1MOoCsl0dGdi8r/VEK/yhrtY8bR
 CAaAGao74Fkjaoy/7yJjlSE06NEv0LdWjFXKrhV+MxR7swYhZaN/yd8obHhNC4RJRN6b
 h7dBCsnfXszqxomTBaNYP38p0l12spf/S8kcW8eYF6FW+F3I9/DuPk8ipTAulXFtIUZa
 9ghYJ1bYKozKnf2JiD15SS20PdkJuJoUkzVML+1vzn5CH7xLgl6lOUOVxiWZDrjHAcgK
 /yfA==
X-Gm-Message-State: AOAM5339QT8ZSNyCfGHVzXhe2t1P29AymURaO7Dsqey85yiGG07MaxnB
 xttYhRt2bQVzZP6UZEqknYhfwreVyWs=
X-Google-Smtp-Source: ABdhPJzp3ZChAp0kiCSehHEHdBZgObLRVJdkqoFHLrMnaATwBcbYF+s3SXvNBj/qlnOnPnpnDbavqw==
X-Received: by 2002:a63:af05:: with SMTP id w5mr15668552pge.22.1611831208790; 
 Thu, 28 Jan 2021 02:53:28 -0800 (PST)
Received: from voyager.lan ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id q197sm5102748pfc.155.2021.01.28.02.53.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 02:53:27 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: Andrew Jeffery <andrew@aj.id.au>,
	openbmc@lists.ozlabs.org
Subject: [PATCH u-boot v2019.04-aspeed-openbmc 4/7] image: Check hash-nodes
 when checking configurations
Date: Thu, 28 Jan 2021 21:23:01 +1030
Message-Id: <20210128105304.401058-5-joel@jms.id.au>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210128105304.401058-1-joel@jms.id.au>
References: <20210128105304.401058-1-joel@jms.id.au>
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
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

From: Simon Glass <sjg@chromium.org>

It is currently possible to use a different configuration's signature and
thus bypass the configuration check. Make sure that the configuration node
that was hashed matches the one being checked, to catch this problem.

Also add a proper function comment to fit_config_check_sig() and make it
static.

Signed-off-by: Simon Glass <sjg@chromium.org>
(cherry picked from commit 67acad3db71bb372458fbb8a77749f5eb88aa324)
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 common/image-sig.c | 36 +++++++++++++++++++++++++++++++++---
 1 file changed, 33 insertions(+), 3 deletions(-)

diff --git a/common/image-sig.c b/common/image-sig.c
index 48532b15a31a..44c797530d0e 100644
--- a/common/image-sig.c
+++ b/common/image-sig.c
@@ -330,20 +330,39 @@ int fit_image_verify_required_sigs(const void *fit, int image_noffset,
 	return 0;
 }
 
-int fit_config_check_sig(const void *fit, int noffset, int required_keynode,
-			 char **err_msgp)
+/**
+ * fit_config_check_sig() - Check the signature of a config
+ *
+ * @fit: FIT to check
+ * @noffset: Offset of configuration node (e.g. /configurations/conf-1)
+ * @required_keynode:	Offset in the control FDT of the required key node,
+ *			if any. If this is given, then the configuration wil not
+ *			pass verification unless that key is used. If this is
+ *			-1 then any signature will do.
+ * @conf_noffset: Offset of the configuration subnode being checked (e.g.
+ *	 /configurations/conf-1/kernel)
+ * @err_msgp:		In the event of an error, this will be pointed to a
+ *			help error string to display to the user.
+ * @return 0 if all verified ok, <0 on error
+ */
+static int fit_config_check_sig(const void *fit, int noffset,
+				int required_keynode, int conf_noffset,
+				char **err_msgp)
 {
 	char * const exc_prop[] = {"data"};
 	const char *prop, *end, *name;
 	struct image_sign_info info;
 	const uint32_t *strings;
+	const char *config_name;
 	uint8_t *fit_value;
 	int fit_value_len;
+	bool found_config;
 	int max_regions;
 	int i, prop_len;
 	char path[200];
 	int count;
 
+	config_name = fit_get_name(fit, conf_noffset, NULL);
 	debug("%s: fdt=%p, conf='%s', sig='%s'\n", __func__, gd_fdt_blob(),
 	      fit_get_name(fit, noffset, NULL),
 	      fit_get_name(gd_fdt_blob(), required_keynode, NULL));
@@ -384,9 +403,20 @@ int fit_config_check_sig(const void *fit, int noffset, int required_keynode,
 	char *node_inc[count];
 
 	debug("Hash nodes (%d):\n", count);
+	found_config = false;
 	for (name = prop, i = 0; name < end; name += strlen(name) + 1, i++) {
 		debug("   '%s'\n", name);
 		node_inc[i] = (char *)name;
+		if (!strncmp(FIT_CONFS_PATH, name, strlen(FIT_CONFS_PATH)) &&
+		    name[sizeof(FIT_CONFS_PATH) - 1] == '/' &&
+		    !strcmp(name + sizeof(FIT_CONFS_PATH), config_name)) {
+			debug("      (found config node %s)", config_name);
+			found_config = true;
+		}
+	}
+	if (!found_config) {
+		*err_msgp = "Selected config not in hashed nodes";
+		return -1;
 	}
 
 	/*
@@ -454,7 +484,7 @@ static int fit_config_verify_sig(const void *fit, int conf_noffset,
 		if (!strncmp(name, FIT_SIG_NODENAME,
 			     strlen(FIT_SIG_NODENAME))) {
 			ret = fit_config_check_sig(fit, noffset, sig_offset,
-						   &err_msg);
+						   conf_noffset, &err_msg);
 			if (ret) {
 				puts("- ");
 			} else {
-- 
2.29.2

