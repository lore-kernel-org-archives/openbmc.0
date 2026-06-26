Return-Path: <openbmc+bounces-2141-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95092CDE00E
	for <openbmc@archiver.kernel.org>; Fri, 26 Jun 2026 12:30:43 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gmw4Y5yBCz2yZ8;
	Fri, 26 Jun 2026 22:30:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a00:1450:4864:20::635" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1782440490;
	cv=pass; b=c5WJZxmzeZOTQcj18iB+OQnpGxbrmfwUPBs6CJRedHrmHBZCnuXKcuVjILniHpIzmNvIZjQTf3zB/xv2xcEswuR5QGr4SELlVBgsEAFD4M6fZWdDkUuuiWqCAkKYy5Pcl/Rg4mX+V1drGMC7s4NI8a4NWdwP+Afa8CJpkww9YWqbw4vqKtbpFfH67z0HZsJSmVZd6AUQvGaoNdWQKZZe5rNlxuwAmjkrSeb0yfHJ8IN2DSazHMQly52HYkKF5cmaLkc8+VffjTy27GX0xwZ1YF506c3lRq8+mmsDA+yx5dWotrlLEuX1uwQEtaqoWSITqQYaDJCeTQs3gi/vcWx1lg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1782440490; c=relaxed/relaxed;
	bh=7sd/b42PKGYPWc3g69c99WO1tcNR8oQqqaoqVKqNcok=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RyXlkvXky9ga4Ob8cMYo2eMkm0ODwGCN/Fr7kO5KWKvEwX9XBoGrN6jJ3/iwii6sF4Nwd28PN5pTveAxt568awVdRzgIPF/H3fMoRDwx6+VQw701BFNRjaG/QFhOijTuNpYPprxbxSXXdSTi6z/7pGki/kD/p4/Bh1zqTnAxSlAbL3gjhT9DZDA9oqsfxBJPF56wcdQPwGCrd8L6RY7Lym4DxS5VSB6eZPPG2AoBom/EsdnQp8ZpQpCczqUh8xvjw/ZA466dzBKENF6CFLPfroVP6XVX/seo/UBY4p7VphI8VnKqxORVttU4r2drVim5u09mKDwhkEFbP8b4b9/wYA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=F58NlvA8; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::635; helo=mail-ej1-x635.google.com; envelope-from=dbgh9129@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=F58NlvA8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::635; helo=mail-ej1-x635.google.com; envelope-from=dbgh9129@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gmfYj0bMjz2xLq
	for <openbmc@lists.ozlabs.org>; Fri, 26 Jun 2026 12:21:28 +1000 (AEST)
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-c0c15bd6b8fso46787466b.0
        for <openbmc@lists.ozlabs.org>; Thu, 25 Jun 2026 19:21:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782440484; cv=none;
        d=google.com; s=arc-20260327;
        b=LGBoebjoLsGkY5yOKLxq1qwTgwMUEMRDsLK1vX5i2EIbDFeoPHr+fLji0wii4OZSwT
         DGsE2fmotBCIs9XzxtQe1M/H2WspEwBFHBoYZl2no6ZS8cgumggwYa0fbxRXZ1jYGZAj
         XQnOKzwKlYYEldswy5AjXVYRewddvIHE7jIRLkx9UPNedC7hkuSzoG32yGkP7z3JCfGu
         bByejli8BcFMfqrH/sCJrEMPJFSZftiq68w0WUhpqZ32UtTb/z+c8tJSIHkBKjldVBA3
         BWhqzPeKqErsnS5Ch70xIoB7HCZTX8hg39vhkjoTeyR+lU6v6RON1bBpYGJU51f91sWG
         DQtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=7sd/b42PKGYPWc3g69c99WO1tcNR8oQqqaoqVKqNcok=;
        fh=hwTqfCwB5rs+4JxOKJoWgJkJCfe/55v3wRqjMOYm82U=;
        b=cwu16bs6ZEXmO5E/zdvruwbqFtrce/WHkkgZi9R+gg90e1wbAhhYa/rv4Lkax/zzim
         ZOU6b8hW5y8PiOzv3idrryh/Qop71n+gHFpdSKem3ziSyV5QKS3arxIPIImX8Rtn5ZIV
         t9JhvK+5lRg/PkUR2sHkGQZLjyDJABCXGDNWK6kavnIK5zU0AarvEo2EkDYjLB2FN+/q
         kEEbTCkyeLPPyCSwzlj76bODQkVoqVhchlWBHfGoGU7+tMF8rnJ0tngfhKe8jaCF8ixx
         wX8A65XMX4HuyqdNMm3TBjeSR403b5aeMHlUiQ2LQAFZyvNX3YPBGh6Ekrp2ySqIjISz
         qH8w==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782440484; x=1783045284; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7sd/b42PKGYPWc3g69c99WO1tcNR8oQqqaoqVKqNcok=;
        b=F58NlvA8T18LRHyUbOM4BPYx8rZsMcstn3lk7uBAoNhMlrsvnlQer+vq2IHANm+T2x
         +eJpkCA5sbKrXXb6Ib5FyuDSdkF8bl2Mq+4gUkSETgQ2CM+xQDJv/g8B/susTPg1sBMG
         ubKbrDBlENuu47DdWoc+KwKKFSF+loVDNWiDlJ/lNwyvrNrZQvJKW8TrLtFypXQDO+wr
         /mD764XNBTOJy0+I4V4DeJc26CdqIKTMlNkSZnPkNU0gQ74oD4p1eET29uhEG4gdeQk1
         9TMG4i4QzNT9cLrlD7HyovDGJ0Um2McdG1n8Cxqjvl76f3GBjvDkcwKD7RYUmTaUOPMk
         9iLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782440484; x=1783045284;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7sd/b42PKGYPWc3g69c99WO1tcNR8oQqqaoqVKqNcok=;
        b=JdqENQmfJvgVLOjJIHAsIBoZEnNgvlkQWdQcFjOsiV7nas7gE4aOoY+8vJJTt3Mso6
         2ZsgR9m3HvUZ7/DCBWCXGbsGSIBUTSuiG9vYKNZf2/bMQZGSTH3GHQceJdwNbpuJvKTE
         +y0nQ/+wyeppniQRW97bKEYxQ/6me4s5nqOvH+f3R9m8txfIJTgtBGHJLRtzDyoRtIpe
         ZIhUDO8tX8K+4Dk0sjeybHmqXOIiZAumNlMZLK4tAM77MZTet/cU493/Ny9KbUDpGqU+
         ZeZ9/tm+A/YPOSsawb2truvLC1ArjgMWBMkTjvLV5RGVyr0m4pTsV9+Mwq3ycHjMuQ8E
         YgMg==
X-Forwarded-Encrypted: i=1; AHgh+RqZNF91lGZ0PKQFC44uc9cSOQzj7K96Zx/n1LiS0g3tZ1UiAANGnhL/Jfe6QsiJhjjLbBiSaHFA@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy60IjA/w654BM6/3FVP05R7KtYYIh3nAatwaEnRDNNYrDng3oE
	tnYMnQ1rAjXQtF1ehBjxpei5QLmjUXoiPihKJpLBaeH9vSi5PtYLeP71NGzGp3WOOHJs1uLfcpE
	t9tEzVUlMw4NcltBSP1lloAWFzsODQrc=
X-Gm-Gg: AfdE7cktEGkBKwsjyQuQ6n7rIotIbclSeB3uLpSVNuIo1WBClfEm565WP8nTfCtOWyS
	A7EFZUNSpDlItNWX5auB4j9FFuL6fan4yL2i7JMasJKLyVl2YaUgxC7hj2dReHzzl1+FxtaqSMi
	89AdrtbYY1ldPWfhDhlTKVTlXbGECdRz+gqQEJzuUwH6RoMEmod6FUfSunf5wCLB50dVmuzlsWT
	2YEdYLw0NmWvlxWJXp1tDGEdaVI87T+7UrmB0Jjq47JiNwnDMYcnf7zitNRNn0+fBRhMaQv
X-Received: by 2002:a17:907:3f11:b0:bee:d554:f33e with SMTP id
 a640c23a62f3a-c1205dc2df5mr316225566b.21.1782440483670; Thu, 25 Jun 2026
 19:21:23 -0700 (PDT)
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
References: <20260525033846.1346744-1-dbgh9129@gmail.com>
In-Reply-To: <20260525033846.1346744-1-dbgh9129@gmail.com>
From: =?UTF-8?B?7LWc7Jyg7Zi4?= <dbgh9129@gmail.com>
Date: Thu, 25 Jun 2026 22:21:11 -0400
X-Gm-Features: AVVi8Ce5zGEk0A9Nfzhtq_3Kde4UYODFXCcQ5p5Q0_x01uwtJUO7uKu8zJj6rvI
Message-ID: <CACrCO_WeuWEZMvwYk8Y7kB09qQHZQNJWOfv30hJ2JaPVPQ_GqA@mail.gmail.com>
Subject: Re: [PATCH v1] ARM: npcm: Fix OF node refcount leaks in SMP setup
To: Andrew Jeffery <andrew@codeconstruct.com.au>, Avi Fishman <avifishman70@gmail.com>, 
	Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>
Cc: Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
	Benjamin Fair <benjaminfair@google.com>, Russell King <linux@armlinux.org.uk>, 
	openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

Just a gentle ping on this patch.

I would appreciate any feedback when you have a chance to review this.

Thanks

