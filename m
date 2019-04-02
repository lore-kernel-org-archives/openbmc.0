Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::744; helo=mail-qk1-x744.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="LcNVONRc"; 
 dkim-atps=neutral
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44YBj64FtszDqKf
 for <openbmc@lists.ozlabs.org>; Tue,  2 Apr 2019 12:39:54 +1100 (AEDT)
Received: by mail-qk1-x744.google.com with SMTP id z76so6919604qkb.12
 for <openbmc@lists.ozlabs.org>; Mon, 01 Apr 2019 18:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UmtxGJPEz31XPAYYewuAYV6KmA3MXdkBoAat+vCtHh4=;
 b=LcNVONRc4mZEzXVr1anGnOTs1d99xnMOUEGZY7OZl0DvvQzzai6boFZJ6WtxHWonNp
 8Pi+JrukWUjHk1DSvBO277Y62CElytyyDaoMeUEnZP0sKLdUJ4NVGe/Q8p7o76dcyy8L
 kke3AupgVPJCHjKDF7WGRO97qlVi2NoiFuA8c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UmtxGJPEz31XPAYYewuAYV6KmA3MXdkBoAat+vCtHh4=;
 b=YP3UAGYbdw03Iqxk+TtRrwXtWKDvr3i4pH1jcc+l6vKpoStdrUN2K/vsmsTX/3Oo1B
 +lgxE+HoaOqHjhA7s4D3453LyKREx/eKiWP26tSLQIpSfPQwNS5avbX7+OepAYzcosKZ
 CBz7cSRZ7S09d14MQXKJCbX0DzAmxI7GXzxPbBqKBm+Ul3YY0ns0gWTS8SYuPc2bUBiK
 Fccszbtnd/2Cs5oVM3DGhmJP1iLVRlp/zzjsh4/keDvG1Kw8eH+Itb065Vu5vo4LbFFw
 w57QsfGTObO8FYnjxhRUohy53D9nUaYuJciyNLLTmz38pW8n/TZnckDU8rtGnDI2itMk
 kBGw==
X-Gm-Message-State: APjAAAUzW9gaSsUbZuoOUA7YJECpYmw983/uJZQNuhsa6s7vqTfMS5vU
 QU6/zbF+fdzIMUnO3RqQoi1RPYnAp25h1egpKjU=
X-Google-Smtp-Source: APXvYqxt1UiwFCeb511aHd3QcqRluXVqgXUeYKteZ+lct/AUCAuaOjThGHXe+Q4+n6C1QyKzFL6KIuRpX2j0lNfrE2I=
X-Received: by 2002:a05:620a:126e:: with SMTP id
 b14mr53014114qkl.49.1554169190372; 
 Mon, 01 Apr 2019 18:39:50 -0700 (PDT)
MIME-Version: 1.0
References: <1553894143-559-1-git-send-email-eajames@linux.ibm.com>
 <1553894143-559-2-git-send-email-eajames@linux.ibm.com>
 <CACPK8Xd3YUmDZYOaXm7OBtM_PT9P=mCqdwozCjQCGB2opSrkow@mail.gmail.com>
 <6ff90bb3-f460-0670-5a63-ea1e9f4203d4@linux.ibm.com>
In-Reply-To: <6ff90bb3-f460-0670-5a63-ea1e9f4203d4@linux.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 2 Apr 2019 01:39:38 +0000
Message-ID: <CACPK8Xf6UW=jvD9RNg0esig1B332wxcXQ00hVmQsxC4TNpV9OA@mail.gmail.com>
Subject: Re: [PATCH dev-5.0 v2 1/5] media: platform: Aspeed: Remove use of
 reset line
To: Eddie James <eajames@linux.ibm.com>
Cc: Andrew Jeffery <andrew@aj.id.au>, Ryan Chen <ryan_chen@aspeedtech.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Tue, 02 Apr 2019 01:39:55 -0000

On Mon, 1 Apr 2019 at 14:32, Eddie James <eajames@linux.ibm.com> wrote:
>
>
> On 4/1/19 1:23 AM, Joel Stanley wrote:
> > On Fri, 29 Mar 2019 at 21:15, Eddie James <eajames@linux.ibm.com> wrote:
> >> The reset line is toggled by enabling the clocks, so it's not necessary
> >> to manually toggle the reset as well.
> > Hi Eddie,
> >
> > You didn't include a changelog here. You said last week that without
> > the extra reset line toggle you would get interrupt storms. Can you
> > fill us in on what changed?
> I disabled interrupts before turning the clocks off. That wasn't the
> only issue, so I had to add the delay after turning clocks on in order
> to reliably get the resolution.
> >
> >>   #define INVALID_RESOLUTION_DELAY       msecs_to_jiffies(250)
> >> -#define RESOLUTION_CHANGE_DELAY                msecs_to_jiffies(500)
> >> -#define MODE_DETECT_TIMEOUT            msecs_to_jiffies(500)
> >> -#define STOP_TIMEOUT                   msecs_to_jiffies(1000)
> >> +#define RESOLUTION_CHANGE_DELAY                msecs_to_jiffies(750)
> >> +#define MODE_DETECT_TIMEOUT            msecs_to_jiffies(1000)
> >> +#define STOP_TIMEOUT                   msecs_to_jiffies(1500)
> > These numbers changed but you didn't mention why.
> Increasing these helped improve stability when changing resolution.

You need to mention why in your commit message.

> >
> >>   #define DIRECT_FETCH_THRESHOLD         0x0c0000 /* 1024 * 768 */
> >>
> >>   #define VE_MAX_SRC_BUFFER_SIZE         0x8ca000 /* 1920 * 1200, 32bpp */
> >> @@ -208,7 +207,6 @@ struct aspeed_video {
> >>          void __iomem *base;
> >>          struct clk *eclk;
> >>          struct clk *vclk;
> >> -       struct reset_control *rst;
> >>
> >>          struct device *dev;
> >>          struct v4l2_ctrl_handler ctrl_handler;
> >> @@ -483,19 +481,10 @@ static void aspeed_video_enable_mode_detect(struct aspeed_video *video)
> >>          aspeed_video_update(video, VE_SEQ_CTRL, 0, VE_SEQ_CTRL_TRIG_MODE_DET);
> >>   }
> >>
> >> -static void aspeed_video_reset(struct aspeed_video *video)
> >> -{
> >> -       /* Reset the engine */
> >> -       reset_control_assert(video->rst);
> >> -
> >> -       /* Don't usleep here; function may be called in interrupt context */
> >> -       udelay(100);
> >> -       reset_control_deassert(video->rst);
> >> -}
> >> -
> >>   static void aspeed_video_off(struct aspeed_video *video)
> >>   {
> >> -       aspeed_video_reset(video);
> >> +       /*
> >> +        * Delay (and don't sleep in case in interrupt context) to let the
> >> +        * clocks stabilize. Without this, mode detection sometimes fails.
> >> +        * Possibly the registers don't update too soon after clocks are
> >> +        * enabled.
> >> +        */
> >> +       udelay(100);
> > How did you get to 100us?
>
> I used the delay from between the reset assert/deassert used in the old
> aspeed_video_reset function.

Is this what aspeed said we needed? What happens when it's less?

>
> >
> >> @@ -1464,7 +1459,9 @@ static void aspeed_video_stop_streaming(struct vb2_queue *q)
> >> -               aspeed_video_reset(video);
> >> +               aspeed_video_off(video);
> >> +               aspeed_video_on(video);
> >> +
> > This includes 5.1ms of sleeping in the clock driver's enable path; are
> > you sure we need to turn clocks off and on again? Can we avoid the
> > full reset by instead resetting the registers to a specific state?
>
> In this case the engine has failed to stop streaming, so it's not
> obeying commands via the registers. Only option is to reset the engine.
> It's an error condition.

This would be a good comment to add to the source code.

>
> >
>
