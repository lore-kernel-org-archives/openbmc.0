Return-Path: <linus.walleij@linaro.org>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linaro.org
 (client-ip=2607:f8b0:4864:20::d42; helo=mail-io1-xd42.google.com;
 envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="MZNPrxCx"; 
 dkim-atps=neutral
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42Q6Jh3vs5zF35x
 for <openbmc@lists.ozlabs.org>; Wed,  3 Oct 2018 16:57:07 +1000 (AEST)
Received: by mail-io1-xd42.google.com with SMTP id p4-v6so4176443iom.3
 for <openbmc@lists.ozlabs.org>; Tue, 02 Oct 2018 23:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kjd071kaXG+9T4Ak4vdc9WPfUZj0908319uN3P+WKCI=;
 b=MZNPrxCxTbz0+/6S8rRypmX9DYTn7PeqfgVCJzQjNh6Tb5bqlh1okrVWU2H94Fagax
 qu77DBkuetBH1H1V0+oEDoRmTSllVjEETJfomY+r7EL05CgMyU5c/arD8I4taevr5h6S
 pSKuBs3GsLWp0KqLzlWu8QhKvpGNEUVELDSm8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kjd071kaXG+9T4Ak4vdc9WPfUZj0908319uN3P+WKCI=;
 b=IFedBcPCPo7gw2TB8Y3pLHMOAlkBjpvNHTmGjnH6xohDqt6Rc1ym/m43xTXWYz9aS+
 byoeUMZCxP4r7RG2OPcYRtkB+ae97eDt3Dhsk+JQz3RsD0FrWyJmF1ENiC/9MqSdz2xr
 ijuPCyGysnQfi/7kcyp/eLmFmiLeKJT0nAgGWr+Nw/HSe5UjlzPlGBr+hHhiSonMArUx
 MBVyS8SX4CYCoiCsrAMm3yCTkwa3V9wX/DDPCy2jOX9rlj+1brIH5n3g3FihDQU5N1/d
 HxAOLxw/UWeCRKSXR5bERUQD8sD5HvxrPpti7sqyhvPiWOaiDMC4HGyQo/O7lelX8ck6
 QjPg==
X-Gm-Message-State: ABuFfogqai+2YEhMWV96GD/cp/ZM92qb8OrkwCnezeZMa3RM0hMmzLxd
 1HRFwfGybx/4UokcwC+EhtDeq4Jy+9g0v5QJWzA+Mg==
X-Google-Smtp-Source: ACcGV61NmmaMMm7GYkKMMyTKA8ito3N4uB+CzhSTzJdjw8n4EP5l+Lg76A6R9yq4zkLupStvKxmenrXNtpK6V0rp/ug=
X-Received: by 2002:a6b:4006:: with SMTP id k6-v6mr37094ioa.277.1538549825328; 
 Tue, 02 Oct 2018 23:57:05 -0700 (PDT)
MIME-Version: 1.0
References: <20181002041437.2493192-1-taoren@fb.com>
 <CACRpkdY4VaH2Yoob2gWwAk11P1NTDdza262zKGs=gju0NH9skQ@mail.gmail.com>
 <3a294c92-bcc6-b42e-b3af-72bc5f607fd9@fb.com>
In-Reply-To: <3a294c92-bcc6-b42e-b3af-72bc5f607fd9@fb.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 3 Oct 2018 08:56:53 +0200
Message-ID: <CACRpkdZXum+bQg1FO+EHhKWpxtPYXfeRhoAKkFXeMQh1Jng3Ww@mail.gmail.com>
Subject: Re: [PATCH] clocksource/drivers/fttmr010: fix invalid interrupt
 register access
To: taoren@fb.com
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, 
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Yu Lei <mine260309@gmail.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-aspeed@lists.ozlabs.org
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
X-List-Received-Date: Wed, 03 Oct 2018 06:57:09 -0000

On Wed, Oct 3, 2018 at 12:08 AM Tao Ren <taoren@fb.com> wrote:

>     1) adding "is_aspeed" flag. "count_down" is kept because potentially faraday-fttmr could also be configured as count_down timer (although I don't see any reason to do so).
>     2) renaming "count_down" to "is_aspeed". By doing this, we set restriction that faraday-fttmr will always be upward.
> What's your thought? Do you want me to include all the changes in this diff?

My thought is go for (2) and do all changes in one patch :)

Yours,
Linus Walleij
