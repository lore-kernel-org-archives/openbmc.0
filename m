Return-Path: <arndbergmann@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c0d::244; helo=mail-qt0-x244.google.com;
 envelope-from=arndbergmann@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="tD96tFWa"; 
 dkim-atps=neutral
Received: from mail-qt0-x244.google.com (mail-qt0-x244.google.com
 [IPv6:2607:f8b0:400d:c0d::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40H2pP2FczzF1tS
 for <openbmc@lists.ozlabs.org>; Thu,  5 Apr 2018 22:54:21 +1000 (AEST)
Received: by mail-qt0-x244.google.com with SMTP id g5so26741051qth.7
 for <openbmc@lists.ozlabs.org>; Thu, 05 Apr 2018 05:54:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=JuSM6BTC6seJrAqDQ4rJsCM6oo2ToozR4Jhk5gnoEJk=;
 b=tD96tFWaNwPiuBVLkYUKuP+dFrS/CiFxgSVjDcb6i+ge1MxOB2NNmpStvNjJYD/VXN
 3TtAx6r3HXlWYwlZwFemAly23zLhGeHsihNTJsVunJHZDASPMFJ6hlYME6lOmu2+Ohkv
 JhL5WlbaCEs6kz2fkgTpfXorFvjB7asRP1U8Bv9kuGFbcFTI7m+IG5yHLMbcU5rjlM45
 TuD4wAonECc5+b8GtyNW0Jgh8v+UqkZ71fBR6siplcH3RVgqQGveIVXXpqP9bT7K1fsx
 u/4YU2w1/KU3kPxhTmrveEpxdWqsQQ5FBqxwKb+KqQVnYv4tpFBMN1pPceV8k+o5tTDl
 9kkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=JuSM6BTC6seJrAqDQ4rJsCM6oo2ToozR4Jhk5gnoEJk=;
 b=Vp4t6s5yPMHQNRI4bOYx3XAl1IK500Ad5uBwEKRlgwZrhhe68TRwqdfOCsLtdomwgR
 18AkoBOjXh+gQ310pqs1g4GUZxaLKa1azHhEqwLcfeOIPbgQdD2ovVhijWuYOutwDb3g
 5Nt6b+TrxswcAVOoDgxQcE/+GLfXdzftrGrc8aKtoyry01dWkDomVub7hnpewOjBz3mI
 MF6pYDf6M0HJoYQm8qh74yaBink9SBJHDxXxMsqQcGvxpvShc8g8DbCOwEJx36/BLoW8
 cdd3pj9BWQ88MclXAUzEC4nYl/vXQdqt+2R6FLv6r7k78N6jP3fJ3IpgwpTl7b9va+VW
 sQlw==
X-Gm-Message-State: ALQs6tBUNPEJK01uIYLfWyCJvMnR68+o+opHUetHB9N+8tnt8XAIYYLq
 WHsK+onA+0eaEKKl+hHt7GI7fuJGzQV2QUvFJfQ=
X-Google-Smtp-Source: AIpwx48RBlOlU985RFUECFD939shttCAnH8FxOaDvWYntc2miasAqtbRrNyOIQ0d4i/l88w4PYrqDs7o00fFjoTv0lg=
X-Received: by 10.200.47.26 with SMTP id j26mr31757925qta.185.1522932858873;
 Thu, 05 Apr 2018 05:54:18 -0700 (PDT)
MIME-Version: 1.0
Sender: arndbergmann@gmail.com
Received: by 10.12.185.25 with HTTP; Thu, 5 Apr 2018 05:54:18 -0700 (PDT)
In-Reply-To: <CAP6Zq1jvCvM+uG8kU_JAYzm9e3BG28AS80ANmn_0a0HmiVBm3A@mail.gmail.com>
References: <1521155412-29229-1-git-send-email-tmaimon77@gmail.com>
 <1521155412-29229-3-git-send-email-tmaimon77@gmail.com>
 <CAFd5g44NOFRmQbDJfRLw_SwsHwVB-hxsUYMYSmkqeyRKmXqSqQ@mail.gmail.com>
 <CAP6Zq1jvCvM+uG8kU_JAYzm9e3BG28AS80ANmn_0a0HmiVBm3A@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 5 Apr 2018 14:54:18 +0200
X-Google-Sender-Auth: 6Z_XjyCz879wd07McNwlYYYJpMY
Message-ID: <CAK8P3a3HBkqgas-QkAr_J767ffBMXJTJeqqVY9fFxw2Yexi27g@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] arm: npcm: Enable L2 Cache in NPCM7xx
To: Tomer Maimon <tmaimon77@gmail.com>
Cc: Brendan Higgins <brendanhiggins@google.com>,
 Patrick Venture <venture@google.com>, 
 Avi Fishman <avifishman70@gmail.com>, Joel Stanley <joel@jms.id.au>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, Nancy Yuen <yuenn@google.com>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 05 Apr 2018 12:54:22 -0000

On Fri, Mar 16, 2018 at 10:51 PM, Tomer Maimon <tmaimon77@gmail.com> wrote:
>
>
> On 16 March 2018 at 07:52, Brendan Higgins <brendanhiggins@google.com>
> wrote:
>>
>> On Thu, Mar 15, 2018 at 4:16 PM Tomer Maimon <tmaimon77@gmail.com> wrote:
>>
>> > Enable L2 Cache in Nuvoton NPCM7xx BMC.
>>
>> > Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
>> > ---
>> >   arch/arm/mach-npcm/npcm7xx.c | 2 ++
>> >   1 file changed, 2 insertions(+)
>>
>> > diff --git a/arch/arm/mach-npcm/npcm7xx.c b/arch/arm/mach-npcm/npcm7xx.c
>> > index 5f7cd88103ef..c5f77d854c4f 100644
>> > --- a/arch/arm/mach-npcm/npcm7xx.c
>> > +++ b/arch/arm/mach-npcm/npcm7xx.c
>> > @@ -17,4 +17,6 @@ static const char *const npcm7xx_dt_match[] = {
>> >   DT_MACHINE_START(NPCM7XX_DT, "NPCM7XX Chip family")
>> >          .atag_offset    = 0x100,
>> >          .dt_compat      = npcm7xx_dt_match,
>> > +       .l2c_aux_val    = 0x0,
>> > +       .l2c_aux_mask   = ~0x0,
>>
>> You need to limit this to the specific bit(s) you want to set and verify
>> that
>> the l2c driver does not already manage that bit appropriately and that it
>> can
>> not be specified via the dtsi.
>
>
> Do you mean that I need to specify it the same as been done in V7?
> because when I run with the above l2c_aux_val and  l2c_aux_mask parameters I
> get the same result.
>
> Also if I am not adding the l2c_aux_val and  l2c_aux_mask parameters to the
> DT_MACHINE_START
> the L2C cache does not initialize.
>>
>>
>> We discussed this a little while ago with Rob here:
>> https://www.spinics.net/lists/arm-kernel/msg613372.html
>
>
> Sorry in this link I see only Russel king comment regarding the L2C

I'm not sure what the outcome is, and the patch changelog doesn't
explain what the patch is for, so I've not applied it. If you need the
patch for correct operation, please resend it with a proper changelog
comment explaining why it's needed and why you ended up not setting
any of the bits.

The last email in that thread mentions
L310_AUX_CTRL_CACHE_REPLACE_RR, is that required after all?

     Arnd
