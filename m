Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D427C606A323
	for <openbmc@archiver.kernel.org>; Mon,  9 Nov 2026 03:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L168rH5N
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4jNGFY4ZYBz2yHD;
	Mon, 09 Nov 2026 14:57:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1232"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1794196641;
	cv=none; b=XuKmHfAYFbBzvlg5dwuO+38bI+95atbGRJVEVI5ee8VT7mmNL2PxeWVEhPC0V1MlTkJlM/XTAYIuL/79SmYraTvd4e+41edOvIaMQUYpTKQFFdqEnxkdvYlTTpVkIOEWEyZAwV3xi/6dpfgA1l93FejCcKJozgg+37R0CVWCEZvgFu7BubHLJw1NhozvgyzApK/VADbaZozKUTSTD6wR7TlHYFrlU2aQBQRq2nabammQv3Ir1/9Tymfc1WTl10jSj60sydECroMLG62+AqptbHkT6LID/x0IDSZha6FoFtQVMqDtlXaE9uHjrJPSxZtUqwK21lBfv3V8+c2CeIg+/A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1794196641; c=relaxed/relaxed;
	bh=zzUsqoWWp/37aI1KkAkv33nSCnrwJtj8I9U8iTKFJOg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hDVOLglsZbWvp7U81jGAtkgRb95BtyaVrHetxhYb8Z2VF3vhl6PE3o94Ei/bBLciKrmTlO7txIAOqBi/lNGm1TnRqrh9lDeRO9IHb1YITYMCciKekgqzxhlQbZ5I962IiBmPv/qw2KgHbTjgDlQnS+KHOGfX60985QQCP13EcKwFr91uEdDJxt3pFRiUkd7A6234/wj/42fj1d6GJO+eC2u+qr+E69jYQE3qIuy1J/hrRxj8W7ImqhFcCv3rFF2kZc5f0aZtT66n89sEoYX1cH83nnLIHEZsH37fW4BQjqvjMXsHlkTlqlnRiu3CuFQ3Knk7WjXJv+vHf9S2dTGyXg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L168rH5N; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1232; helo=mail-dl1-x1232.google.com; envelope-from=prasanth.padarthi10@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L168rH5N;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1232; helo=mail-dl1-x1232.google.com; envelope-from=prasanth.padarthi10@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-dl1-x1232.google.com (mail-dl1-x1232.google.com [IPv6:2607:f8b0:4864:20::1232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4jNGFX221Pz2xGr
	for <openbmc@lists.ozlabs.org>; Mon, 09 Nov 2026 14:57:19 +1100 (AEDT)
Received: by mail-dl1-x1232.google.com with SMTP id a92af1059eb24-1a8cc11ac42so264562c88.0
        for <openbmc@lists.ozlabs.org>; Sun, 08 Nov 2026 19:57:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794196637; x=1794801437; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zzUsqoWWp/37aI1KkAkv33nSCnrwJtj8I9U8iTKFJOg=;
        b=L168rH5NVNpc2hnejbnu7sDlvN/NLHwSmYwv4YRBONyYnQ3Ho/6c5zQ5uSmSZJfU3n
         3HkTGmfoxNCPmYqhii4gDJ2yNQh0K4bUIN/NumycecnNAavBfjDX+qE0wK453N821waq
         cyFKB6J9d4BMQaAA1gZdbkrl784lUlzi2utU9eqix5Jco9p3pi/8d6LzMVpf+DrvyHUh
         +FqarGSfaXptN7kCIjdAitiF4P4r33do4TFscrb2nLdqieZluEh/Wj4BkPb4dQT9fxAO
         +LsFxuFBdnvbluKY1EBhQRdStBoq6bdcrlnUzLMTj+YH2PwmwlXr5f/Bo9K9MNR8+Dtl
         PcZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794196637; x=1794801437;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zzUsqoWWp/37aI1KkAkv33nSCnrwJtj8I9U8iTKFJOg=;
        b=zTRlDPapUbHUG409j4X9MKHzA55oSr7JmzMxBlqzl/u8rw10HONreKfli+R+/i/g4k
         h/2p14Ls9DWhuA7P/bCMMOzT5nVU/9uG0RpRng6BscMtNNnvpUSijHSvLIOUFjCPNthO
         yrieytIiKL4cgiyDfKDyfuFFwoa9//W7h6XRNZBDXGnSA6qxvnvjxPsrrnr3It7ZCNPD
         kkmMiCI/wBx1W5dvIUxcHpFoxypViww9fTfcrIFgC9FqB5A9mD32J9+yyQjrLijy3/jS
         vO3hMLvDLhks85XPj0t8JMxvgqV2MRiCmk/MREz74JJSp2uDNK2Q6KaJwgYuFxcH+Rjr
         Cxag==
X-Forwarded-Encrypted: i=1; AL+hErHywSt+7w5KIkosIchmBui2iihPXnF+ghSnv7lN0ax9H5WadyPlG99XRipD7vx7pVrbYOuwyKy4@lists.ozlabs.org
X-Gm-Message-State: APuU4Z+ENGpllXyMEqumiwBkv5RQST0hbw5DWQca5wFMcjPjRojU4cg+
	4JlijxZ5n65OyzC3rVQDp9vlQmmAhaBrq9b0FTNGCJVLhnrdkEyRBF3N
X-Gm-Gg: AYBFou0t/qEE5uv6TH8ifkHE2GbSR7sAm5jsWSfSaG/wWZt+q8Zm7JmrswdXefD6lM7
	z0LSyhHMpStw8UqvirR9avpSEeMCOFMcc7+I2D/IbbZr70Ph8pbijtl4fuHcTIBH0QjqBFnezzx
	CaocvsxGADvaFbAmGgBAtv4M5/JnIu+J5FTfc7mjD2+sv8RY5V/rxkZ31JMCJjNQwca3YWHMU8q
	PSwbyO7S+F3RpU6+aCx/Fe9JDwUAtkVaIjBGdOM2xxvPfOxa4y6ufxecJFJOLHlHLL1JP0MARkt
	TAy474+VqrguzmeyfEysm572apxXwLUG/Tp6ujfNi6YL4RvyRdOIHGFb6UlRV6wj0EDwA0lsqzO
	rNNEb/g9T/L1msN5apEDzu1VWJ4slaLRWwjh1ZSutb42q5PV8BZnwFFF9G2/hLNQd9FGLoBvujy
	f7HAsO5MzWEmAAD3kdpqg66ChROLmkzary/1xSkRyPtpjuOqPUiBUAVl0cg3+e4/1Ll7kN5URIq
	9LwrmJ+DYyqckQ1Ae2nItOyxOqBT+0fLNyMW0DthDbEUAvCprQqtgBYrxvyomBHJsKQC31UMJXL
	RG8IjuuFmhlye3XVHtkzHb/f+b0u+lsrhNZwyOpa9/iPng==
X-Received: by 2002:a05:7022:1709:b0:184:992:c9ec with SMTP id a92af1059eb24-1b39fecbba5mr4108971c88.38.1794196635837;
        Sun, 08 Nov 2026 19:57:15 -0800 (PST)
Received: from debian.prasanth ([103.183.205.43])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b37560d95dsm8720109c88.11.2026.11.08.19.57.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 19:57:15 -0800 (PST)
From: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
To: andrew@codeconstruct.com.au,
	linusw@kernel.org
Cc: joel@jms.id.au,
	ryan_chen@aspeedtech.com,
	billy_tsai@aspeedtech.com,
	linux-aspeed@lists.ozlabs.org,
	openbmc@lists.ozlabs.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
Subject: [PATCH v2] pinctrl: aspeed: Use managed pinctrl registration
Date: Mon,  9 Nov 2026 09:26:33 +0530
Message-ID: <20261109035633.93522-1-prasanth.padarthi10@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261107012236.28069-1-prasanth.padarthi10@gmail.com>
References: <20261107012236.28069-1-prasanth.padarthi10@gmail.com>
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
Precedence: list
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The shared Aspeed probe helper registers its controller with
pinctrl_register(), but does not unregister it on device unbind.
The registration can therefore outlive device-managed data.

Use devm_pinctrl_register() to ensure the controller is unregistered
during device teardown.

Fixes: 4d3d0e4272d8 ("pinctrl: Add core support for Aspeed SoCs")
Signed-off-by: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>
---
Changes in v2:
- Add Fixes trailer.
- Add Reviewed-by trailer from Andrew Jeffery.

 drivers/pinctrl/aspeed/pinctrl-aspeed.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed.c b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
index 7e0ebf11af16..eb5f404af8c2 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
@@ -461,7 +461,7 @@ int aspeed_pinctrl_probe(struct platform_device *pdev,
 
 	pdata->pinmux.maps[ASPEED_IP_SCU] = pdata->scu;
 
-	pctl = pinctrl_register(pdesc, &pdev->dev, pdata);
+	pctl = devm_pinctrl_register(&pdev->dev, pdesc, pdata);
 
 	if (IS_ERR(pctl)) {
 		dev_err(&pdev->dev, "Failed to register pinctrl\n");

