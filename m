Return-Path: <kunyi@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::d44; helo=mail-io1-xd44.google.com;
 envelope-from=kunyi@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="rFBFeYB5"; 
 dkim-atps=neutral
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42lGY70yPMzF2Dw
 for <openbmc@lists.ozlabs.org>; Wed, 31 Oct 2018 16:07:22 +1100 (AEDT)
Received: by mail-io1-xd44.google.com with SMTP id n11-v6so8808330iob.6
 for <openbmc@lists.ozlabs.org>; Tue, 30 Oct 2018 22:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=al38zN158vEK+UMiRUUX5xYRuCANomIVDi6OaGoVjWs=;
 b=rFBFeYB5eM8UvoifhgSNVuM9d5ryIuG+fbx6dMamTEdJvxX8kxj0umyin+jpkx8n+f
 /bg+HJTexliEOkw3+jTrgXhkSQJRSOC2oA5+HbFzqlSqR7y4MIgKTKGnaVNoxEDC12mE
 btAzJXeBzSKJ7Hi51kaNnb09gKk4UOlSAHoR54oR32amb2pJdcGJaDWKuYyPOtaN0f52
 ESAlpqzNCweLiBveWlOD6h4TO3XFiNtYRdTIjV+0tTRwswoVKT7tVIT8uxK8UYRpcW+5
 c73JNIIOYM4S09uwLFi30q/wqyqGWQ+NmRMhFmENLRp58vXQQDvdDTzD6xDo34I3C9pb
 vt5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=al38zN158vEK+UMiRUUX5xYRuCANomIVDi6OaGoVjWs=;
 b=LIoFQeVGn32YC0jg2ioLTQdJpKT2z0nOBfdr4Fcww/xmYIM/NZDz/Drt9JxC4cjLy6
 TQlD1zM8VSgvu5BuQj/XPXV1nxFzpRnLxPJL+UYvLrFmkiE3rtM13lDBYzDkOR/nr0LW
 Rq6osEwPthM3aC+iZx29QfaWDCi5f9BH7KTTXZGJ1gHHP7wc+N2L0YXW1EtT7ytFfCbj
 al1//RNpP6Ny4letNjCuyPTcLw3Asx0HglbkcCChfMQAQIgoilyvGtZK4j204XA+5qRq
 rfsSnbc2341ULLVo1CJ8wubXcKF7JuhDgxhTTTvts51FGW9zsy9ZGH6JWtX7Qtc8ZvYp
 XPxQ==
X-Gm-Message-State: AGRZ1gJ6KeKlXg0ss9yLSNntIY/AT39Tjw9Z0ndutSrLB/ReHhL7qxso
 hRtioClEHq3h+R/Dagn8lO4moIkMSrFLBf0J3ONsVA==
X-Google-Smtp-Source: AJdET5cId2PXgceyy3RB8DAHdrnuNjGCBGVK1Es5DnrIXMbnbUT1oWVAPN8jRx030HvuLmYNiU7EAJe9SixyS/qAxvc=
X-Received: by 2002:a6b:b450:: with SMTP id
 d77-v6mr1051979iof.15.1540962440110; 
 Tue, 30 Oct 2018 22:07:20 -0700 (PDT)
MIME-Version: 1.0
References: <20181017213012.233957-1-kunyi@google.com>
 <20181017213012.233957-3-kunyi@google.com>
 <CACRpkdbS_aOpFORVnK3QJUsF1p-mVxtMas-q6fOp7emTx281Lg@mail.gmail.com>
In-Reply-To: <CACRpkdbS_aOpFORVnK3QJUsF1p-mVxtMas-q6fOp7emTx281Lg@mail.gmail.com>
From: Kun Yi <kunyi@google.com>
Date: Tue, 30 Oct 2018 22:06:52 -0700
Message-ID: <CAGMNF6VMLqRwVb=+-qU=nC9hW-idV-fLrnHFL9_xv7Ajha17og@mail.gmail.com>
Subject: Re: [PATCH 2/2] pinctrl: pinctrl-npcm7xx: Set BGPIOF_VOLATILE_REG
To: linus.walleij@linaro.org
Cc: linux-gpio@vger.kernel.org, tmaimon77@gmail.com, 
 linux-kernel@vger.kernel.org, avifishman70@gmail.com, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, broonie@kernel.org
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Wed, 31 Oct 2018 05:07:24 -0000

On Tue, Oct 30, 2018 at 5:08 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Wed, Oct 17, 2018 at 11:30 PM Kun Yi <kunyi@google.com> wrote:
>
> > Indicate that the pins are both controlled by the pinctrl driver and the
> > generic GPIO driver, thus GPIO driver should read the register value
> > before updating, instead of using the stored shadow register values.
> >
> > Signed-off-by: Kun Yi <kunyi@google.com>
>
> This is quite a rough measure, if we instead use regmap-mmio
> we can exercise fine control over what register are volatile and
> not instead of saying that all of them or some of them are.

Thanks for your review Linus! I don't have time to rewrite using
regmap-mmio at the moment though. I have discussed with the driver
author and we will first patch the pinctrl driver by making the
pinctrl functions use the gpio-mmio accessors instead of directly reg
read/writes. When I have time I will look into your suggestion to
improve the driver.

>
> Yours,
> Linus Walleij

-- 
Regards,
Kun
