Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::844; helo=mail-qt1-x844.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="KGxKFovz"; 
 dkim-atps=neutral
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44Xj3Z5Dg9zDqLN
 for <openbmc@lists.ozlabs.org>; Mon,  1 Apr 2019 17:24:10 +1100 (AEDT)
Received: by mail-qt1-x844.google.com with SMTP id w5so9216063qtb.11
 for <openbmc@lists.ozlabs.org>; Sun, 31 Mar 2019 23:24:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Clibf4YEFqaBoaddPaAB8IpWYI0gtyPufewMgNso4Kg=;
 b=KGxKFovz4mx6WPRmrurchCOa4QR2PRlV/GCVcSUDbW/m78A9z3VBDoMr2sMJ+WqujE
 62fUOu6Vsbv/d0ieq2UpmeTdgtqtL07Vn9hjoXjEDTopPR2NFcp1QHr33RCX4tgNuzYt
 UOrJ6UdEZSbB7uZOlH0R1lATUIlOsp852eiQo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Clibf4YEFqaBoaddPaAB8IpWYI0gtyPufewMgNso4Kg=;
 b=lWSHbPaP6IrX4gHtTJo0QmUAEAsWiAsyDpc50wWyFgYDOqBhouY9Wl752P2XigYROs
 sS8eALvWbqKAY+GeI9/RQBgTLiDn8zJQ9VMQH5HUAxQmacKzBBed8yLbPmWnDp0bTIcj
 3ck/y8QLM41lfJgiO/Y8VtvEkhmYUOTNQ5Pvxj2UqvThBBspMUeb2mrEu9FrLREUuzUc
 RVnVhkQce+VUa1LFNDV/NbB7tUr2pKKNu4ZRZnsDSTMBu57vVym/LvOx5NY0z8e4Z58v
 2eEPC2C/uY92eFDOd1pZHlE9nv/GSvIxroeqP2mOu8MN3PKFdSxLg++Xu5Mfl5t5iktg
 d7fQ==
X-Gm-Message-State: APjAAAXar9cLBysj75OnlwUlJrPVy86LLVutmIZgBxazw/V74m0anSIb
 9za39X6jn+rnzDOTrplgI1mJr/ka2CiIOfcXZic=
X-Google-Smtp-Source: APXvYqwvSu2URqxggnb1F0CMt6wcUF8GgCRaNswBTuByfhVavk0ObXRuIhCJjQORqHvIWEk3z71g0AMinohK8oAAEXs=
X-Received: by 2002:ac8:26e7:: with SMTP id 36mr52557146qtp.37.1554099846859; 
 Sun, 31 Mar 2019 23:24:06 -0700 (PDT)
MIME-Version: 1.0
References: <1553894143-559-1-git-send-email-eajames@linux.ibm.com>
 <1553894143-559-2-git-send-email-eajames@linux.ibm.com>
In-Reply-To: <1553894143-559-2-git-send-email-eajames@linux.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 1 Apr 2019 06:23:55 +0000
Message-ID: <CACPK8Xd3YUmDZYOaXm7OBtM_PT9P=mCqdwozCjQCGB2opSrkow@mail.gmail.com>
Subject: Re: [PATCH dev-5.0 v2 1/5] media: platform: Aspeed: Remove use of
 reset line
To: Eddie James <eajames@linux.ibm.com>, Andrew Jeffery <andrew@aj.id.au>, 
 Ryan Chen <ryan_chen@aspeedtech.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Mon, 01 Apr 2019 06:24:11 -0000

On Fri, 29 Mar 2019 at 21:15, Eddie James <eajames@linux.ibm.com> wrote:
>
> The reset line is toggled by enabling the clocks, so it's not necessary
> to manually toggle the reset as well.

Hi Eddie,

You didn't include a changelog here. You said last week that without
the extra reset line toggle you would get interrupt storms. Can you
fill us in on what changed?

>  #define INVALID_RESOLUTION_DELAY       msecs_to_jiffies(250)
> -#define RESOLUTION_CHANGE_DELAY                msecs_to_jiffies(500)
> -#define MODE_DETECT_TIMEOUT            msecs_to_jiffies(500)
> -#define STOP_TIMEOUT                   msecs_to_jiffies(1000)
> +#define RESOLUTION_CHANGE_DELAY                msecs_to_jiffies(750)
> +#define MODE_DETECT_TIMEOUT            msecs_to_jiffies(1000)
> +#define STOP_TIMEOUT                   msecs_to_jiffies(1500)

These numbers changed but you didn't mention why.

>  #define DIRECT_FETCH_THRESHOLD         0x0c0000 /* 1024 * 768 */
>
>  #define VE_MAX_SRC_BUFFER_SIZE         0x8ca000 /* 1920 * 1200, 32bpp */
> @@ -208,7 +207,6 @@ struct aspeed_video {
>         void __iomem *base;
>         struct clk *eclk;
>         struct clk *vclk;
> -       struct reset_control *rst;
>
>         struct device *dev;
>         struct v4l2_ctrl_handler ctrl_handler;
> @@ -483,19 +481,10 @@ static void aspeed_video_enable_mode_detect(struct aspeed_video *video)
>         aspeed_video_update(video, VE_SEQ_CTRL, 0, VE_SEQ_CTRL_TRIG_MODE_DET);
>  }
>
> -static void aspeed_video_reset(struct aspeed_video *video)
> -{
> -       /* Reset the engine */
> -       reset_control_assert(video->rst);
> -
> -       /* Don't usleep here; function may be called in interrupt context */
> -       udelay(100);
> -       reset_control_deassert(video->rst);
> -}
> -
>  static void aspeed_video_off(struct aspeed_video *video)
>  {

> -       aspeed_video_reset(video);
> +       /*
> +        * Delay (and don't sleep in case in interrupt context) to let the
> +        * clocks stabilize. Without this, mode detection sometimes fails.
> +        * Possibly the registers don't update too soon after clocks are
> +        * enabled.
> +        */
> +       udelay(100);

How did you get to 100us?

> @@ -1464,7 +1459,9 @@ static void aspeed_video_stop_streaming(struct vb2_queue *q)

> -               aspeed_video_reset(video);
> +               aspeed_video_off(video);
> +               aspeed_video_on(video);
> +

This includes 5.1ms of sleeping in the clock driver's enable path; are
you sure we need to turn clocks off and on again? Can we avoid the
full reset by instead resetting the registers to a specific state?
