Return-Path: <linus.walleij@linaro.org>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linaro.org
 (client-ip=2607:f8b0:4864:20::142; helo=mail-it1-x142.google.com;
 envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="D8F2W07j"; 
 dkim-atps=neutral
Received: from mail-it1-x142.google.com (mail-it1-x142.google.com
 [IPv6:2607:f8b0:4864:20::142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42SwvY5B5NzF384
 for <openbmc@lists.ozlabs.org>; Mon,  8 Oct 2018 08:03:37 +1100 (AEDT)
Received: by mail-it1-x142.google.com with SMTP id c85-v6so9403099itd.1
 for <openbmc@lists.ozlabs.org>; Sun, 07 Oct 2018 14:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PvrFfuoUNDi7qj4rnHFmBEJS1sAyLTIEO2Ozt4HkCec=;
 b=D8F2W07jedMw0WjejvrDxc6UX/vFkHqNE0+k1dp08L6D5YkBfI7RgbVOeVAklDuMYV
 BBEef4cs4owIOeavrO7CUAptsG8DOawKlYccV3EBzsLOvZz19CQeKZpPF3o++22soUbp
 c7gtkKmK7CXJSNgmmjSlITNJcGO0VhAyElSfI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PvrFfuoUNDi7qj4rnHFmBEJS1sAyLTIEO2Ozt4HkCec=;
 b=JMq4d5PoCyRKOBmvpslNZgjCcTwVN2XK4HgQCJsbU5wKisJr2YTPCFPYljySXQ7zaG
 e6+YzTtNA6bt43h4Xcb7zDbbWzSuNYtwQLAU44hvOETuAjICBMGK1MibiFbXA7WqAg/m
 vtcFNW3mAB4DGPr6TFWcyiiHXSwzhSUUoR4XP6zNhts3mWlHpt6egT6qp4iEEgcd1jZ8
 oqcqQ8tIk9Yc+o6VJ0TOwBaOKFul7X2mhmkEVOB1XpgNk7V7FGA5N22MZn0WJ305imA/
 kgv0ehP805HG12LyDpDGmJJDiDNrGh+PJfs9PoF60C8Se3yo3GAzuLLsXJMRpllvEbKH
 cGOA==
X-Gm-Message-State: ABuFfojlbypYSmclLU1nhdXKlPYnJ1USdZKjQF2o/xkRBMr9ju9L22eJ
 1V6BCdr6MbwrvCaIOfDQjMile66T5Fj+PIk9srt5xQ==
X-Google-Smtp-Source: ACcGV62il1fk/MD0I9NnLoNsZEXETVCWShsoCnGLUjWi1WWa3SrEMXZmxQjMGoio5GbjantboUbDBn9nuykWg9BzoBQ=
X-Received: by 2002:a02:7789:: with SMTP id
 g131-v6mr16252652jac.66.1538946214954; 
 Sun, 07 Oct 2018 14:03:34 -0700 (PDT)
MIME-Version: 1.0
References: <20181003215350.3550926-1-taoren@fb.com>
In-Reply-To: <20181003215350.3550926-1-taoren@fb.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 7 Oct 2018 23:03:23 +0200
Message-ID: <CACRpkdbbUO9_VOtnZL+Xf_0nTTgSruaaPOLnvZ4M+NQfPLzvWQ@mail.gmail.com>
Subject: Re: [PATCH v2] clocksource/drivers/fttmr010: fix invalid interrupt
 register access
To: taoren@fb.com
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, 
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Yu Lei <mine260309@gmail.com>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-aspeed@lists.ozlabs.org, OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Sun, 07 Oct 2018 21:03:38 -0000

On Wed, Oct 3, 2018 at 11:54 PM Tao Ren <taoren@fb.com> wrote:

> TIMER_INTR_MASK register (Base Address of Timer + 0x38) is not designed
> for masking interrupts on ast2500 chips, and it's not even listed in
> ast2400 datasheet, so it's not safe to access TIMER_INTR_MASK on aspeed
> chips.
>
> Similarly, TIMER_INTR_STATE register (Base Address of Timer + 0x34) is
> not interrupt status register on ast2400 and ast2500 chips. Although
> there is no side effect to reset the register in fttmr010_common_init(),
> it's just misleading to do so.
>
> Besides, "count_down" is renamed to "is_aspeed" in "fttmr010" structure,
> and more comments are added so the code is more readble.
>
> Signed-off-by: Tao Ren <taoren@fb.com>
> ---
> Changes in v2:
>   - "count_down" is renamed to "is_aspeed" in "fttmr010" structure.
>   - more comments are added to make the code more readable.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
