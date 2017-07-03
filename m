Return-Path: <joel.stan@gmail.com>
Received: from mail-yb0-x241.google.com (mail-yb0-x241.google.com
 [IPv6:2607:f8b0:4002:c09::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3x19hh4qlnzDr3s
 for <openbmc@lists.ozlabs.org>; Mon,  3 Jul 2017 12:15:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="DMWloxVY"; 
 dkim-atps=neutral
Received: by mail-yb0-x241.google.com with SMTP id 84so7285252ybe.0
 for <openbmc@lists.ozlabs.org>; Sun, 02 Jul 2017 19:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=YprgtjaczE/Wu9DxNJavvFz5/bZApXgPHnSCnCTt914=;
 b=DMWloxVYGsfy3la1X1cJRXBC8I4YI4uzlpHbV/dL+3CYJzEbXW0vlhXU7MTr3PJGZv
 DHRjU9vuAYPQ8XyYxxWIHu9iVuGJJ3K01oGhHku8aiJBCsbv0tJaWrxh2mWcXI30eF6H
 VZW1X3p2wtunsU9b/q4L9VaK5CCG5hpe6sFoA4k5ytZvzT/u4mIfdCB24j6JkE+/qZB0
 I4WDPSZlowwpsrr6rBfGCiYrO37TDEM5zNjRQ/u9nkdZOBV/LmsEoGA5Ub0lYo2Hrt99
 0qcjFoFJ5bFK/c5MLZHws6GQze/n3RcAjGpKIJZSVuI/koW1+bZMrDGEcbu7nGE0SlvT
 xXJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=YprgtjaczE/Wu9DxNJavvFz5/bZApXgPHnSCnCTt914=;
 b=TWS6EkWh62kOGPp0MeoAWPDWB45WKMCNJbcOV6p8cMFangh8QfQ3Wr9DxxwAdjPEBJ
 QdvcPLWUCZTWWMUU4lgbOl8uG8odZdqnbau+3vKYnjjylQ1gN4+ZX0j0OaVtSR1sf9OJ
 NBSI6twBxpss3i+Pv1QFQdy1XdbF+wUH3J8r0RXsfh8inu2A6zSYpuVje8iRSaXG28lm
 uks/KTHHMua+46QDBfGA9mYly7XdEGnYmSxLzE5Hr2Dtvrt4huyfPkBPfXpKJszJYR4W
 Si84xoX6yxdK/EyGkFxGKEdEOvgIlAogt5x/lLYEikfxxQ50yLczcH0SxVb9RnQmRQ/j
 L4Xw==
X-Gm-Message-State: AKS2vOwz58hR9RYf94PYgqNbLuB6K7zEHvxKSTbbMbtYzR7VJkkWsBs3
 HO9bFkiTTr1dnZU76TZxcAzGi4qjoA==
X-Received: by 10.37.207.202 with SMTP id f193mr25651379ybg.93.1499048130171; 
 Sun, 02 Jul 2017 19:15:30 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.170.239 with HTTP; Sun, 2 Jul 2017 19:15:09 -0700 (PDT)
In-Reply-To: <20170701160412.45558-1-venture@google.com>
References: <20170701160412.45558-1-venture@google.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 3 Jul 2017 11:45:09 +0930
X-Google-Sender-Auth: QuRcRzmg2USwxvvcTOS2PVM_YCo
Message-ID: <CACPK8XfCfm1jS0yLB9tovv+GykoD_YsTuyJGmaEtSBk56O33Tg@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10] drivers/misc: (aspeed-lpc-snoop): Add
 ast2400 to compat
To: Patrick Venture <venture@google.com>
Cc: Robert Lippert <roblip@gmail.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Rick Altherr <raltherr@google.com>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 03 Jul 2017 02:15:34 -0000

On Sun, Jul 2, 2017 at 1:34 AM, Patrick Venture <venture@google.com> wrote:
> This driver can be used on the aspeed ast2400.
>
> Tested: ast2400 on quanta-q71l
>
> Signed-off-by: Patrick Venture <venture@google.com>

Applied to dev-4.10.

Did this driver get applied upstream? If so, please send this patch upstream.

Cheers,

Joel

> ---
>  drivers/misc/aspeed-lpc-snoop.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/misc/aspeed-lpc-snoop.c b/drivers/misc/aspeed-lpc-snoop.c
> index 593905565b74..0647cff6280a 100644
> --- a/drivers/misc/aspeed-lpc-snoop.c
> +++ b/drivers/misc/aspeed-lpc-snoop.c
> @@ -241,6 +241,7 @@ static int aspeed_lpc_snoop_remove(struct platform_device *pdev)
>
>  static const struct of_device_id aspeed_lpc_snoop_match[] = {
>         { .compatible = "aspeed,ast2500-lpc-snoop" },
> +       { .compatible = "aspeed,ast2400-lpc-snoop" },
>         { },
>  };
>
> --
> 2.13.2.725.g09c95d1e9-goog
>
