Return-Path: <linus.walleij@linaro.org>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linaro.org
 (client-ip=2607:f8b0:4864:20::142; helo=mail-it1-x142.google.com;
 envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="fDKktDwe"; 
 dkim-atps=neutral
Received: from mail-it1-x142.google.com (mail-it1-x142.google.com
 [IPv6:2607:f8b0:4864:20::142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42PWCB5SwwzF3D5
 for <openbmc@lists.ozlabs.org>; Tue,  2 Oct 2018 17:35:17 +1000 (AEST)
Received: by mail-it1-x142.google.com with SMTP id h6-v6so8410795ith.0
 for <openbmc@lists.ozlabs.org>; Tue, 02 Oct 2018 00:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oR3LpccgihYUDIYwOsXzXwrUkU+td+zzHOTgPNH/0BE=;
 b=fDKktDwer5dJQAdwkvWBCus9SStuDyV0El5E+3XUNbmcIV7dUwrMlv8t6QgxlFv8c9
 fvIyRgRdH1qB00nnH9VJqNJ9VXj+gsJ+irUJBLkY+k5nDjk9XXlN0OZL40aDf/tu70c+
 gfOWW36QNY1BxWlY4Y1pXH3jEVmugQhG4DK5g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oR3LpccgihYUDIYwOsXzXwrUkU+td+zzHOTgPNH/0BE=;
 b=P0y81J01xVwwQNnurREyo5HSL4LGTBnFSGxiM78gbEru78XHjPlxni88ShLpd7yuBD
 d6WIHZPLADthsAsx5N9sbzRUW7zcOZN51VNt2XzzZz3IRyvvr0z4qiGdFKrf49LVSMcg
 6ETDpT0NqstukthfC5td1yV8//7YU6zJ+QfIPPu9rHQImnA5DcuIdxE0BEOFF7P4OORq
 /dLUymTSRgzb2wDdMbzfvFkh921Mne+Y4TLC0PrZUHa13zmfVdVqNs/VgO3hXN27Z8Yg
 SwaJq8qQm0LOj/D5hwgpoe/l4zYSaB+y2rI7v05A92TxoGtPe1pGMhoC24TS38z2YBNB
 R+yw==
X-Gm-Message-State: ABuFfogKNxLnnKAnnE44uChDSE+9fa/aPH395SJ94RKhC5BnmOxkH/bz
 M8hXnL/1ymdILvPtfslJd0MM0xIaUKs2XSDoZIW9ug==
X-Google-Smtp-Source: ACcGV60ilUbzcyEVW7yhcvCQgazrVy9gji+UqoC8SPi/nDVWaYkmO5+chALWYEcwUzX3rjIF+xXPLEg8YSTnG2FqZEU=
X-Received: by 2002:a24:97c8:: with SMTP id
 k191-v6mr1083186ite.130.1538465715171; 
 Tue, 02 Oct 2018 00:35:15 -0700 (PDT)
MIME-Version: 1.0
References: <20181002041437.2493192-1-taoren@fb.com>
In-Reply-To: <20181002041437.2493192-1-taoren@fb.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 2 Oct 2018 09:35:02 +0200
Message-ID: <CACRpkdY4VaH2Yoob2gWwAk11P1NTDdza262zKGs=gju0NH9skQ@mail.gmail.com>
Subject: Re: [PATCH] clocksource/drivers/fttmr010: fix invalid interrupt
 register access
To: taoren@fb.com
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, 
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 mine260309@gmail.com, OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
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
X-List-Received-Date: Tue, 02 Oct 2018 07:35:19 -0000

Hi Tao, thanks for your patch!

On Tue, Oct 2, 2018 at 6:14 AM Tao Ren <taoren@fb.com> wrote:

> -       if (fttmr010->count_down)
> +       if (fttmr010->count_down) {
>                 writel(~0, fttmr010->base + TIMER1_LOAD);

This struct member "count_down" is a bit badly named now don't
you think?

The patch is fine semantically, but please rename this member
"is_aspeed" or something like that and update the code everywhere,
then insert a comments like

/* The Aspeed variant counts downward */
/* The Aspeed variant does not have a match interrupt */

in the code snippets so we see what is going on.

Yours,
Linus Walleij
