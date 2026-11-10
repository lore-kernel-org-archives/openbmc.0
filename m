Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AE67606A335
	for <openbmc@archiver.kernel.org>; Tue, 10 Nov 2026 23:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hAHsqZUA
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4jPMbM1t4Hz30WQ;
	Wed, 11 Nov 2026 10:01:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::f2d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1794286696;
	cv=none; b=awk5EGvc/2mS1eUwGKkbBXpDqyvXQRwtnyzWZIJcLlFv+k5O/JvCEMcZ9IJGMfqa0YtZCqphgCry4withaIn5hJWifidrWgw0h7Kef//QT58WjhB0dHUa3K6EP1JOC5MYRt8tsiJ2Da0CV6e79e2XzYZhPP35H/jJg9lwGOt7Fe8xLUd3XRwbXVhzNaE6QfjuuhXmXYMXsVBW8U7o/VmE/tPnqcvE7h1D4hDQ8dG7bI9BWs1Sp3CJKVBqA/gCm/BHu7H/OWoNBBstJRYPFqo26s553NBgdCXjTIAvm7yA23wPmZTDvao8cegBXMzgonJV42h1Zuz0bG7B0g8cvn8eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1794286696; c=relaxed/relaxed;
	bh=LQH6/FLfD+l3EuP607p4MXIkH0GyDF3Widek8GlB+OA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=M+cDBL5gthKJka5JdxW79WJCWjLg09B6pcWJExjNw1eSOxDE738FQ0prKbBKqI0/7LdCPYNcg4mkFyI+UsygUkUZx2Ft1ixsoL2sg4qyuTGV7XBq4r9oqooA3ccHtNpkBq1Stoy0FOSVHZFMROzSrGh8SkDGG7XTxjkdH79l2Uu/4KczdCT3rBri2rdBGGRhbI0OuHXoJRTPVsaE3IVzffWvgt8Xsmk4CIQLtZg/lgq4kVVgw1sddsNO/veVoIDgD5yhIpGVSo+po4bVT3vCQ6jk/8+1CswDEuJg7D4gP2wxjZet7saOeEHT5JOTx+OGt5Wgq3ZX+/haJG0pPp+aKg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hAHsqZUA; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::f2d; helo=mail-qv1-xf2d.google.com; envelope-from=mhun512@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hAHsqZUA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f2d; helo=mail-qv1-xf2d.google.com; envelope-from=mhun512@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com [IPv6:2607:f8b0:4864:20::f2d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4jNvYM10lCz2xf8
	for <openbmc@lists.ozlabs.org>; Tue, 10 Nov 2026 15:58:14 +1100 (AEDT)
Received: by mail-qv1-xf2d.google.com with SMTP id 6a1803df08f44-91ea0c05c92so16322706d6.0
        for <openbmc@lists.ozlabs.org>; Mon, 09 Nov 2026 20:58:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794286691; x=1794891491; darn=lists.ozlabs.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LQH6/FLfD+l3EuP607p4MXIkH0GyDF3Widek8GlB+OA=;
        b=hAHsqZUAwYvp712snw/JYPNR1zBIHI7HcHN+2Vst8K493o+085Ang+rVkrlnDIyTdh
         iJfyHPeBT8Yp3FxJRRC2VKgRFiRniNklGrA7DnAviDMgKqWjRehBJCglewKlD7bwxTGm
         OGbKyv9zHjzEVUMyxRNetsvB3RQZc8qoT4WSTmSno+l5y+WxpdjIYWd34J3M0gWOrEb2
         Yb+2bWa6xjEl8ztS5cpFdPhqCJ5mcDAzRG68za0zF7Kuo78LJC/wxWhHH7/T+JUvLahV
         vm3hdeXVgurWC8nadGGRXVRpi8wRqalI7n+bHSI+q/zMwwmGhTRhRSHUjTzgHR7pKTuU
         fDMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794286691; x=1794891491;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LQH6/FLfD+l3EuP607p4MXIkH0GyDF3Widek8GlB+OA=;
        b=2c58nuE6qM4iTTfBp2GNkcBGJTOH3f1FNcL/LAZWUz957/w7TA1O4UAD35YdM+UXJk
         /Af59R62pdR6EDcSMctY+yQ1ZF6Ibnqrv+D1lay3+WHPViO0ZvMjAKWV9Y4X4cP0Oi/w
         xLnCr+hJJjA6MIdal8FNdfmuXgwN5B6GUBkkLwK2zvLsA/slupkeTTl+UENt8N7eOJCA
         q5KX0zZ3fyTKoX50aHTg5Poe3S+a367LYKMNHv5SSAgvqVsnxZEHR/KNZHO3rVrBVpDt
         Z6YHozVdrJQOty5BXBVcYkaikhhOC+g1sgIZyjtr7DZWakEvYjIiNag64roPnz252bj4
         3v0g==
X-Forwarded-Encrypted: i=1; AL+hErFWOSXK08kYLQaYldsuLQAqLhN+gbEmKLDEQEkiJ++ul+XFOF0LVO61ET0WKc293EldrPK8HYeg@lists.ozlabs.org
X-Gm-Message-State: APuU4Z+xxU3C59Oc0jhg71QvVXDB+Cbqmw57gK3Ca9ZfcapFPkt7nY7H
	lnPfeFBCLyCfrvxNTeRgGcLwtp4SbCCdwtn6yaA7DK5wYrzKZkEsaHQ=
X-Gm-Gg: AYBFou16lJVmLuuh/pbawr5u9FOXGkqTktuEA9rsL/JRAIwPexEUoTa6kAs8bmoqClu
	uH16D1zjPt4kiadEL1TYiqS923NE0eRP+BwAjgQYUHHbBOhyQg6i9MUM3WiR/3JMBYyBrkDbtDA
	rw9MjOQP4O3AFI5eStPRHX4QXUl3oZS1bnZUPduT3KYxka5ThR77j8em99f6mBIt4NqBYG41DPT
	ER1bj2C8+KO88TgeFHy0+w2XLhtcUHm3gGrcnJy1VfN9Cfj4PbLQ7P6Hy14oO9FjOpR83CmpfGy
	dA/lVlIdwjT2yiqkgQw26c01xdppaj07vq8FkC/8ecpjtu1J+XgxUbji4aGJMAR4vyZWKnPkcSf
	7FNxZs9EHxOVrCvUj4xUiNiLOfquPs09DQHc5VSoVn0697PHH6/MQIx0dm6s4aU6Bi6KGeE0BL9
	YNbhQAlQG/InvV7K1wVzYWCl9Yx6azmRET5BLOvBhnXKq+PmX3gc/0AoyMNskzrhw7Pd78rr1Ql
	WsaU20bFT/0d0QOJhdfUe5fXmAsa9JtraSp7Ny1xl1SeRKSDNy5h4QLoB5qhXCHhLEzV7aiqi2d
	xkGP0zw0SZnrXfjj7GLXGFK3ouqf9IVdTrWBDoTw/Cunkbfh7zpJR+9lOIpuT0gNiQE8DL8jPUZ
	J+zfYCr9PXsfMZk6GHydtdKXc+bQrJXpfb0XFoZxjcGiPqO0cIvrWEPJlMnDJUH2N
X-Received: by 2002:a0c:e018:0:b0:91e:c6ec:1d9f with SMTP id 6a1803df08f44-91eef9a214emr27070326d6.52.1794286691211;
        Mon, 09 Nov 2026 20:58:11 -0800 (PST)
Received: from localhost.localdomain ([104.39.152.7])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ef04f89c1sm12462836d6.23.2026.11.09.20.58.09
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 20:58:10 -0800 (PST)
From: Myeonghun Pak <mhun512@gmail.com>
To: Eddie James <eajames@linux.ibm.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Jammy Huang <jammy_huang@aspeedtech.com>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Ryan Chen <ryan_chen@aspeedtech.com>,
	Billy Tsai <billy_tsai@aspeedtech.com>,
	linux-media@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH v2 0/2] media: aspeed: order probe cleanup and last close
Date: Mon,  9 Nov 2026 23:58:07 -0500
Message-ID: <20261109235731-aspeed-v2-0-mhun512@gmail.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FORGED_GMAIL_RCVD,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This revision requests the IRQ after its dependencies and synchronizes
IRQ/work before manual probe cleanup. The second patch fixes last-close
ordering and keeps the engine available until VB2 release completes.

Compile-tested on ARM64 with LLVM, W=1.
No hardware testing.

Changes in v2:
- Rebase onto managed reserved-memory initialization.
- Remove the research sentence and Assisted-by tag.
- Join the IRQ and delayed work before manual probe-failure cleanup.
- Keep VB2 release before normal last-close hardware shutdown.
- Drain the IRQ producer before cancelling resolution work.
- Balance IRQ disable/enable within stop and check STOPPED before power-on.

Myeonghun Pak (2):
  media: aspeed: join IRQ and work before probe cleanup
  media: aspeed: drain IRQ work before stopping the engine

 drivers/media/platform/aspeed/aspeed-video.c | 38 +++++++++++++++++++++++++-------------
 1 file changed, 25 insertions(+), 13 deletions(-)

