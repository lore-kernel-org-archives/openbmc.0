Return-Path: <openbmc+bounces-2384-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D52C9C5AC67
	for <openbmc@archiver.kernel.org>; Thu,  6 Aug 2026 21:51:17 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hGLZQ4Wlxz3brv;
	Fri, 07 Aug 2026 07:51:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1786052504;
	cv=none; b=kJZl6zZptOy26sKV3+dL9sAvkz4qFu3w+l+gr78KwmWfVW/qcT4nF01Jays6fuFQfx8VMFn83LO8cQJ91iDsJ6ZFQQDDxDFaUsxlLNw5oDT6FIyQQE3EfB5Wi+d9fs2RVPWuSN+cKgyI2wRUWIcWrYTgOtAyaar4tghnxrrCuJwlrM7sJtqLsgIISdnhATkkMoBVAGuPkgZ5674O63EAcgihnBdAp2fplhZTBviqGcvz58NXQF8ZBtweTjWWTG7BK3knm2PddlJLoigzQkz1EyigUE/Hz7Ka6pjU8/tNIM4ednwJhUWoSK/MWlT9z1qLfjaeFx8FT+ePk6HJh07fDg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1786052504; c=relaxed/relaxed;
	bh=emwhs/R12V88FksqW/fCHLiEZt+g/eeVJZV7F/tinJU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gGivtDKNGERrdJJ+F3otvhQAEnQ/UD7nb88PA9TFiass9wKN00Xatl4Fk3gKXWuWe4WCsgLDGsZ3XFlQ1C9sYWSkAwbyGPsxodL1TlK2JK3A9QFrvFSviJ9LFwAWSdt5xIspaXboqJu8kQRUxFxjvFbKjL+OEf8e8U/zY8JNHhmCB7CoPmuK1jSdwZHAFSIcZFf1XLfptYXa8g44qV7GHH/9rOLZdUdrgmbYPjT91GaalBeHb8grlOPGIa7SXuw4bWKHi9qDIxPRFMut25LrX3NIImfE/PInRhb205MPVdAA7JayvDYZvMB4w9IISKYwMIgmuAsSybiefzDByxC99g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hFjhKrHP; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=linusw@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hFjhKrHP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=linusw@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hGLMV6BvRz3br2
	for <openbmc@lists.ozlabs.org>; Fri, 07 Aug 2026 07:41:42 +1000 (AEST)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4B14B600B0
	for <openbmc@lists.ozlabs.org>; Thu,  6 Aug 2026 21:41:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04A2E1F00A3D
	for <openbmc@lists.ozlabs.org>; Thu,  6 Aug 2026 21:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786052499;
	bh=emwhs/R12V88FksqW/fCHLiEZt+g/eeVJZV7F/tinJU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=hFjhKrHPrnTV9AX10vJFnzua6fH29RdjhXZxDjVAXlDA9J+sh6DZabN9flRgi4shl
	 d0JOIBkGrW2l6GrRxVp20xoUJoyE9KzvkvlUAUrMAp0t4sendDUS2MqPbZ7QNxq2AD
	 BvuCcqRkuRKjq6vS+/UFihOeOZJdMx92IC1CAwn/jyMZc/2BGDmDXHx7mtpFjDI7xg
	 IjpfTNW90JyxD6PFRbamS+r3NIbqIw5+It7nwLeSFzEouuWhtM4Y85eBAiw9DQD/t3
	 1ph+Qpgb/QOrp74+XR5M+nXH9kZ5F9x9pCsszMCDtQUJ5VlSCX8KkPGlIWH2G8Iq+b
	 eFhfsMc9TZjbg==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5aeb2bc82ccso3341125e87.2
        for <openbmc@lists.ozlabs.org>; Thu, 06 Aug 2026 14:41:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rov7/HNjJJxIPPAYn1HtflrLnaauwiDjyH579+H/14Fcdfjjz1C/MOPubVlkr8qq+MSYxqScJan@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyGL2vlVu9F4kt0aaqEzkJwxUGyfDawKuVorvPUenIXkwkA3QKX
	rBZLDq8LMaQFroiroQwPkXdTOb/SAeMOOSao1TZCg0zV4InQ94bFk3LTN69bLm6do7E/cSvceDc
	5hTNIIfgE2OUYCfeuCn5rdDZAvXEy6B0=
X-Received: by 2002:a05:6512:10cf:b0:5b1:da61:a13f with SMTP id
 2adb3069b0e04-5b2f4cd3e1emr2391855e87.43.1786052497832; Thu, 06 Aug 2026
 14:41:37 -0700 (PDT)
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
References: <20260802-b4b4-irq-trigger-mask-pinctrl-v1-1-1c398ab53d28@oss.qualcomm.com>
In-Reply-To: <20260802-b4b4-irq-trigger-mask-pinctrl-v1-1-1c398ab53d28@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 6 Aug 2026 23:41:24 +0200
X-Gmail-Original-Message-ID: <CAD++jLm+sfo2pB=cM3v2-ewwdkaomRvTdKh9VVKNU8mJS3wPyA@mail.gmail.com>
X-Gm-Features: AUfX_mxUELB5EjLZQ8CDlb5p0mqmJmh3sKO6rvUX7_wSkyifvS8Bgv83X4i36kE
Message-ID: <CAD++jLm+sfo2pB=cM3v2-ewwdkaomRvTdKh9VVKNU8mJS3wPyA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: Use IRQ trigger mask helpers
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
	Manivannan Sadhasivam <mani@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Sean Wang <sean.wang@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Avi Fishman <avifishman70@gmail.com>, 
	Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
	Benjamin Fair <benjaminfair@google.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Viresh Kumar <vireshk@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-actions@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	openbmc@lists.ozlabs.org, linux-arm-msm@vger.kernel.org, soc@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 2, 2026 at 4:06=E2=80=AFPM Maulik Shah <maulik.shah@oss.qualcom=
m.com> wrote:

> Use IRQ_TYPE_LEVEL_MASK and IRQ_TYPE_EDGE_BOTH instead of open-coded
> trigger type combinations in irqchip callbacks.
>
> No functional change intended.
>
> Assisted-by: Claude:claude-sonnet-5
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>

Nice cleanup, patch applied!

Yours,
Linus Walleij

