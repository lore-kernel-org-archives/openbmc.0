Return-Path: <kunyi@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::143; helo=mail-it1-x143.google.com;
 envelope-from=kunyi@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="DeCWSUgE"; 
 dkim-atps=neutral
Received: from mail-it1-x143.google.com (mail-it1-x143.google.com
 [IPv6:2607:f8b0:4864:20::143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42VKyF5CRKzF323
 for <openbmc@lists.ozlabs.org>; Wed, 10 Oct 2018 14:55:49 +1100 (AEDT)
Received: by mail-it1-x143.google.com with SMTP id q70-v6so6062122itb.3
 for <openbmc@lists.ozlabs.org>; Tue, 09 Oct 2018 20:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JeEn/am5M6qKBvT7+zGcCUs+9S1c77225MwgzSrfyNg=;
 b=DeCWSUgEvq69i7BLL30XxTq0XyUyc/AsVw9EF8NkhfCdlNY56V0jhXQ2cSWVZTGt+7
 DVxECGWfGSj2ujjffoCPtti4S28B6w664YrYJOPVGxd9MYB+ecBzO+RsoiuBCVJyttiO
 iydbBdLU/w9f1fyTIJ/1gTrR5bKQGSqw/HsCN8y4k51YIvVHURkKTDegRZt23TaJH6Hg
 chrly2NRMw1W08CWnavxtGc4lGEQ6cgfTdVYzIyzA/bHEvdqR6cDClKCj5sbD6B/phmb
 JjteJYGb7ItkKLDT3PB7dnSlfbxjZvkj9H5k65Q5LdRWw40qHLFDa3zx6ai7I/mAP1oV
 ubxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JeEn/am5M6qKBvT7+zGcCUs+9S1c77225MwgzSrfyNg=;
 b=e6yIK7d5y0uYBMCgjopLvr7ZHZEo7MIeF2vitJ8FkbUfL4sfpT9xxd+NemXv7aL86R
 f+SQCOZvjPi2mB+N1F+24Ggph3sv13nK70sGDGcblnCHVvdwYgzXxY2Fh+XZzv44qXnb
 3U9lnLSKKuRZZhNV31+qO/56z+lt4wLwty6kLM93MUphBWK3xFv+C+3BZj5vBcmVrpHS
 FBdfflDNbeb2QHY6Tt7sNOgMxRMt7xBm+B12faMZS+sX0q/Awpo0w805O/PmowvOo0a7
 lVJESw0laJmtP8mDZh8ilEna7T52ryqqbXlYRR1XH3lyF60KqkxaJVv7vxgqmZ1zOMvB
 V71Q==
X-Gm-Message-State: ABuFfojp6Fn/ccLfschBGx1mDZPu5L/jOayDV6R3Qoe4OeJOBQiBDGZC
 LBLnmfgG+mQYXxU1NA8g1kg3G+GxFKbIXMkOxt+Gig==
X-Google-Smtp-Source: ACcGV63lJm306JHqgVLWTW3zYS5496/WsgnnwFNCoQ/GPDm9D83TJ05WM+0YX+Fv0SWo5Rk39POLs0ub3YMp2GGCf+g=
X-Received: by 2002:a24:454e:: with SMTP id
 y75-v6mr3684703ita.72.1539143745651; 
 Tue, 09 Oct 2018 20:55:45 -0700 (PDT)
MIME-Version: 1.0
References: <20181008214925.86281-1-kunyi@google.com>
 <20181010003832.GA21971@roeck-us.net>
In-Reply-To: <20181010003832.GA21971@roeck-us.net>
From: Kun Yi <kunyi@google.com>
Date: Tue, 9 Oct 2018 20:55:19 -0700
Message-ID: <CAGMNF6WC054KEMk-cOwEUoLzWEq4wpfCXAwDzsvLDWZpWsqzTw@mail.gmail.com>
Subject: Re: [PATCH] hwmon: (npcm-750-pwm-fan): Change initial pwm target to
 255
To: Guenter Roeck <linux@roeck-us.net>
Cc: avifishman70@gmail.com, tmaimon77@gmail.com, jdelvare@suse.com, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, linux-hwmon@vger.kernel.org, 
 Robert Lippert <rlippert@google.com>, Benjamin Fair <benjaminfair@google.com>
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
X-List-Received-Date: Wed, 10 Oct 2018 03:55:51 -0000

Great, thanks!

On Tue, Oct 9, 2018 at 5:38 PM Guenter Roeck <linux@roeck-us.net> wrote:
>
> On Mon, Oct 08, 2018 at 02:49:25PM -0700, Kun Yi wrote:
> > Change initial PWM target to 255 to prevent overheating, for example
> > when BMC hangs in userspace or when userspace fan control application is
> > not implemented yet.
> >
> > Signed-off-by: Kun Yi <kunyi@google.com>
>
> Makes sense to me, and in line with other drivers. Applied to hwmon-next.
>
> Thanks,
> Guenter
>
> > ---
> >  drivers/hwmon/npcm750-pwm-fan.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/hwmon/npcm750-pwm-fan.c b/drivers/hwmon/npcm750-pwm-fan.c
> > index 96634fd54e0b..c0fab54c0094 100644
> > --- a/drivers/hwmon/npcm750-pwm-fan.c
> > +++ b/drivers/hwmon/npcm750-pwm-fan.c
> > @@ -52,7 +52,7 @@
> >
> >  /* Define the Counter Register, value = 100 for match 100% */
> >  #define NPCM7XX_PWM_COUNTER_DEFAULT_NUM              255
> > -#define NPCM7XX_PWM_CMR_DEFAULT_NUM          127
> > +#define NPCM7XX_PWM_CMR_DEFAULT_NUM          255
> >  #define NPCM7XX_PWM_CMR_MAX                  255
> >
> >  /* default all PWM channels PRESCALE2 = 1 */



-- 
Regards,
Kun
