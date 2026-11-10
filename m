Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81724606A320
	for <openbmc@archiver.kernel.org>; Tue, 10 Nov 2026 23:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qVXWsx2f
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4jPMhy117mz2yR1;
	Wed, 11 Nov 2026 10:06:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a00:1450:4864:20::62f" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1794286172;
	cv=pass; b=boV82FhEsLFdEEAHvhbdqgjP5PlRM8BCaONpamFgIuaG2KD9f0k1t7wygb8R6LQmqnfArq2Vb5O5kVkuPFFfe/q9+1I4sDhquX9t5FBKlJtpUic9nrBem0RqimHzOUtb0MnocPGE4atQ720Rfn02Ap/3vA62nAGmDV5tbN/vnr//9GGOK2bMJcHH3heRQ6Y2jb5K9ZQKEDdntfnQu2geSzd6sld0xyXsx//CNh6x83TBjZ+8LswXYOOdaQuxAqVl0/ztrsFPBMccGfFjfJxZEGEW7jOtWJtljD8EYHSHcK4BqtLiGEIcDDh+Khtc80BGQbIsL0o3Tw/2YJBTTh8dHw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1794286172; c=relaxed/relaxed;
	bh=ToRZM5Foy++C1k59kSDpzw5FEF6siS+FDf6LC+WQ3Lg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NIYqB/Zjq6AN89psvsGW5gU0vVBq+pmwMgS14w7xjhRWVbXyDbF4pcd2dnKhKofAvPyiaSdmIlae/OI/CfpWfBKsei+QASOeTYICVwde72YA3zJXgjicmFvgDXziKvGB/WVgoK15wQmWGSKQw3Dj1JaydMwEoh8Egse1scrUH/zAHGx508DpxF3O+BSO1vicBur9/+Wg7uf6pCzvjthc8bdrEoOoH/j2IX3JtPokKTmMHsMlfJCWxDTTfZpidPYge3ErBJ8HO6FiwT6oO1UWMFl5bBulOWRqeZju6V1TtvdnqXiQp+omkBfKj6PjHpL/K/Oiu/zA1COoyxVDx7V2Tg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qVXWsx2f; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::62f; helo=mail-ej1-x62f.google.com; envelope-from=mhun512@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qVXWsx2f;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::62f; helo=mail-ej1-x62f.google.com; envelope-from=mhun512@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4jNvMG4K2Pz2xjN
	for <openbmc@lists.ozlabs.org>; Tue, 10 Nov 2026 15:49:29 +1100 (AEDT)
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-c434376dbebso302190366b.1
        for <openbmc@lists.ozlabs.org>; Mon, 09 Nov 2026 20:49:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794286165; cv=none;
        d=google.com; s=arc-20260327;
        b=M3tx9xNW6qxcFRT8tAmiJsk2xLXiDDO0nW2r5sHZ9fgD1YWuWBPFi0LFzakwBJvz+M
         FQvO7iq0+MT83AesC4kyGV6RBXmVXVt8QxrzLJaQ9WlZMJEk64kWldtRXwfgkeCO5BqR
         ssFYAg8XDbSmWSBnijLjZrDfd0EdsVsvyP+9/cv9x3S+Kv2XIOwdV4Aen16a9oWP0U+m
         UFUFm8c6MmBRCZxk34TuqNf5o5Mssr2fYEWNaSDGi4iQ68uQ6p1BlaxCCNKZ4rImbqc0
         hLjXxj4Ma6i5WmfpXo29dGpZY0Fp4X1vIU+ErTtJcqJdbnB0K2O35K8xPZiiHlP492XR
         JFrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ToRZM5Foy++C1k59kSDpzw5FEF6siS+FDf6LC+WQ3Lg=;
        fh=sxHcrmWZqU5Tflxl1nDgq71GacEkjdPXfufA7MxwEzs=;
        b=dvdyRNaMWIrgIoodUnzmVJ1D7oVQCdGUDLZLoP9gonIoGxUipykYj7GjHcM7SIY9DH
         ++LkFPb/2qb7ouu9TRDmCBVp4guEbi+anczC11qHL5bVwcuISRiVi403RZlQmzfKSDrm
         JcxV4TmsvZeclElfnyVsMdTORlcLbLIA9pHtSZEOf44ei8QgykVHTlX1dPlZ8zMI+/rU
         6+D8kyHzDghdtXYUsZRzOvvb+fB95Xi1v2IR/0QPiIjDHihK8KEVqbRXHIwr8wRt33vK
         IFgUygzEzrGxt65+QwPkO8rVMzT4DU8CqlwwEKcuelkHIkI+8rLx+YuQVwLUoXTt2USD
         T94w==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794286165; x=1794890965; darn=lists.ozlabs.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ToRZM5Foy++C1k59kSDpzw5FEF6siS+FDf6LC+WQ3Lg=;
        b=qVXWsx2f9Zkj9TQevZdznxoTAiT+qZQjccpZhnHs/YNFOiwtg7APiFxq/XVoFiKcRL
         syL6Yx1BKzMDR7k6AUbkI8gH6jHhpbU7ljUxgjJsUTljizjOOIGmw2Xz/1M/AnRVAiKS
         SWrtn/2XRWspKEegfebUcoUqvML6u+OgP8W3WOoeFlI+Dksz37P3EzfRm91RTnsD+riC
         gvb09qE8GZxhZ6XfMmtHlZkDVTRAlU1PqJKEgaZIGb2oep7KAO76/sQF5Z1wNHB+z7lx
         bKafu9JXvyAl6SRM9Kle9uAT9/9hkn0B42DxcP2wOEXkMtuSN70670E/IWMcQTQwfQWx
         CSQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794286165; x=1794890965;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ToRZM5Foy++C1k59kSDpzw5FEF6siS+FDf6LC+WQ3Lg=;
        b=wERcLPtbw50HrsV+L4w2aKjfOBqZnU5SkMvjP2l2vxLaRalvHlMfo7lEGapARhWkcK
         6gCnGGjT7JyseKZJpcXjicp/i0zTtZ5h0t1TjpwiaXDyb9OnAcg2fLDZYzD3oxvEMo1H
         R7YxDgFJWUtjPsSryKsxv7yEhYUPzYnf8IyYpcZjpisI+pOfPNPwzCo9xwiEbFcDGx9s
         pumKoA6JRnxpKn5ZYscwDOLLEMtzUoDQKtyWRp8ot4rHfli6J7mQgLmUuAO1y+y6jf7y
         /1K+jTerZXprPVGeeWcEazrBnkrqLd26dbQk6X4Qojkk756xr/HyWKQYqd7igbTxXJYW
         nKBQ==
X-Forwarded-Encrypted: i=1; AL+hErFBWd8vxU1sxdzaCzeLOmK83holrcrLbPK+nMayed3KYFKaf2HQVAxqRiDPVSdsB/hlcuoGn5WR@lists.ozlabs.org
X-Gm-Message-State: APuU4Z+BbotjOwiJ6ONdDiK5PuydDLGCqaWRG54nP62QHv9saPyArSjJ
	+sWHL+vLSziJ4mdey60PW6EqPavEWBix0kXhdJAtBezOQnQUQTsc+uIhZ9KvfDQmXByuRKy2jFp
	CWiNbswiGD1M2aUrhuczsFqJbcx9l1Q==
X-Gm-Gg: AYBFou0+wh6g7AFlgxPsr+a3kNQhFaLOmSDPwgDflohJwvjYcJDqn7yJvD/Lj2d78cY
	FD7WCTBgz+48p4kv/i3zLZkfq27PD/KxSWCU50ilVycL3q3Mhr9JqbeGqjDsFSF3DtLf787uaJ+
	bTsg0ryV5WSd3HU4NHRPzE5FMQG6zMUr3JE80XLmSD2APCJaJ6QbODgz8LX84UwtWSlq+gfUREn
	70e9oov+NLwz71x+digxvWuYE6n+dW2NNezVuvQfmaxg4qva/sFBMlcL9hbZnG7tLCeJUX6ZvxZ
	wSHa7JRMLQOLmHqKGREBXk6FKYtI3LYono0dhJkcMfjdZd/DgVLMPVHAqTmDCf60RQrD92AM6j4
	qplx6sweZfVP/qKyFElBfFykagnHcM/DOhcH8VjaKxzd3ajvciEazvk4HCvAdSZKTbkEY3PkBeK
	yVgtfe1yau4QYGM3ySmaMic85prV0IbRIrggLXWK51RSVCqus=
X-Received: by 2002:a17:906:240f:b0:c41:4512:560d with SMTP id
 a640c23a62f3a-c5049699729mr80819466b.16.1794286164826; Mon, 09 Nov 2026
 20:49:24 -0800 (PST)
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
References: <gm-top10-20261015191529-g65-295aa0ac5211@mhun512.gmail.com> <KL1PR06MB694295F7F33B8FEDA284C65DF1602@KL1PR06MB6942.apcprd06.prod.outlook.com>
In-Reply-To: <KL1PR06MB694295F7F33B8FEDA284C65DF1602@KL1PR06MB6942.apcprd06.prod.outlook.com>
From: Myeonghun Pak <mhun512@gmail.com>
Date: Mon, 9 Nov 2026 23:49:13 -0500
X-Gm-Features: AclHuK9dEbOFpKZBzF18DRp2ysCfTdn-dJEdIFaJ5Bm7I0rvJVmVsW64xtISAdQ
Message-ID: <CAGEsz8F3XkYkLOzrncnLVNHSgfC3tZ_zYdVrTR4xavq+h9anhw@mail.gmail.com>
Subject: Re: [PATCH] media: aspeed: acquire IRQ after reset and clock resources
To: Jammy Huang <jammy_huang@aspeedtech.com>
Cc: "eajames@linux.ibm.com" <eajames@linux.ibm.com>, "mchehab@kernel.org" <mchehab@kernel.org>, 
	"joel@jms.id.au" <joel@jms.id.au>, 
	"andrew@codeconstruct.com.au" <andrew@codeconstruct.com.au>, Ryan Chen <ryan_chen@aspeedtech.com>, 
	Billy Tsai <billy_tsai@aspeedtech.com>, 
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, 
	"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Jammy,

Thanks for the review. I will address your comments and send v2.

Thanks,
Myeonghun

