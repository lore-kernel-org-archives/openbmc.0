Return-Path: <joel.stan@gmail.com>
Received: from mail-qk0-x242.google.com (mail-qk0-x242.google.com
 [IPv6:2607:f8b0:400d:c09::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rgLtm1lHjzDqmj
 for <openbmc@lists.ozlabs.org>; Fri,  1 Jul 2016 00:06:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=nRWpKO4G; 
 dkim-atps=neutral
Received: by mail-qk0-x242.google.com with SMTP id r68so14041176qka.3
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jun 2016 07:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=5FiAVNcFctQKh98eLY7xcLbp3EAlor9pI4lYCRit5dc=;
 b=nRWpKO4GXfJiSFVsXPPM/qv90mkiRUhbK2ce17prFhTVweneI8x9VZoFmJi7zA73Kj
 xag9o+dzna4DhnkhCGEforwKQzIwM+D4PCkhKze29M9q5IdHsLg2Xzioh/VX2boingjj
 uzMBLYT4UA68LJtXn8oKwe1SqIDATXnXrZi9ObR1Lu2+qIRf12OrgI1Uh5j1UBueWze5
 pOjFlpnalNeUW1cufHrl54xfV0qAQ7KW0hAUinohYF/0CPCiz5SWgIh5K5Iy7LpIzXLH
 4OJ/1KOEqHGJH3zGv+AjGAgVQHbvXBlYVHKzb8bIJLFJB1aaCFivNCGxg7UGwxPvXMH3
 jQBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=5FiAVNcFctQKh98eLY7xcLbp3EAlor9pI4lYCRit5dc=;
 b=TvDf/9ASG86RRIFPUs6SZS0AQzyr28YgeqBpoSlhABVfmhwCe2eVGJEfFCg1sibRd+
 EipRXbV2uhalMKr+egI24w/lz6QRsn5WaOY71560KA6tCJSWAVmG0ezxAMWhCMFg+F+z
 r1aw5jE2DTZa/ntJ84Pz2uKp8JUPv/gR6ORqnxKvBbebWKXtLFEoSSo2IyH5U6SS5HC1
 SpRuG+9ypci4f/25zFuqrqGBIoaGUTMlGcWpGvMzW9VKfsiueY8+BDFGAYh80u5MG4ty
 MAxSD7TvqHjMyRBAT6Q9dUEcCJOLsLEsmc8IMrJA+hv61Ftffwc7PKWiqWs1OgAODwhp
 r95w==
X-Gm-Message-State: ALyK8tKMs5A3o3qzAZu8kL/ABLjLht1dK1J8s6i9vdcaD6EnjzlOJncUm54Qh98kod3do4kaeao6NyZwm17LCQ==
X-Received: by 10.55.149.3 with SMTP id x3mr19584521qkd.140.1467295582356;
 Thu, 30 Jun 2016 07:06:22 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.237.37.148 with HTTP; Thu, 30 Jun 2016 07:06:02 -0700 (PDT)
In-Reply-To: <1467282471-16560-10-git-send-email-gwshan@linux.vnet.ibm.com>
References: <1467282471-16560-1-git-send-email-gwshan@linux.vnet.ibm.com>
 <1467282471-16560-10-git-send-email-gwshan@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 30 Jun 2016 23:36:02 +0930
X-Google-Sender-Auth: aETgApxCInG7z86eO3pcTWRI5cg
Message-ID: <CACPK8XeWo7-UxofpF-6yjF+uMvD0YzKP8xwEgxG07MMQTa2D0Q@mail.gmail.com>
Subject: Re: [PATCH 09/10] net/farady: Match driver according to compatible
 property
To: Gavin Shan <gwshan@linux.vnet.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Benjamin Herrenschmidt <benh@kernel.crashing.org>
Content-Type: text/plain; charset=UTF-8
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 30 Jun 2016 14:06:25 -0000

On Thu, Jun 30, 2016 at 7:57 PM, Gavin Shan <gwshan@linux.vnet.ibm.com> wrote:
> This matches the driver with devices compatible with "faraday,ftgmac100"
> declared in the device tree. Originally, device's name from device
> tree for it.
>
> Signed-off-by: Gavin Shan <gwshan@linux.vnet.ibm.com>
> ---
>  drivers/net/ethernet/faraday/ftgmac100.c | 16 +++++++++++-----
>  1 file changed, 11 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/net/ethernet/faraday/ftgmac100.c b/drivers/net/ethernet/faraday/ftgmac100.c
> index f2205ae..23e27f1 100644
> --- a/drivers/net/ethernet/faraday/ftgmac100.c
> +++ b/drivers/net/ethernet/faraday/ftgmac100.c
> @@ -1422,14 +1422,20 @@ static int __exit ftgmac100_remove(struct platform_device *pdev)
>         return 0;
>  }
>
> +static const struct of_device_id ftgmac100_of_match[] = {
> +       { .compatible = "faraday,ftgmac100" },
> +       { }
> +};
> +MODULE_DEVICE_TABLE(of, ftgmac100_of_match);
> +
>  static struct platform_driver ftgmac100_driver = {
> -       .probe          = ftgmac100_probe,
> -       .remove         = __exit_p(ftgmac100_remove),
> -       .driver         = {
> -               .name   = DRV_NAME,
> +       .probe  = ftgmac100_probe,
> +       .remove = ftgmac100_remove,

You dropped the __exit_p annotation that was here.

> +       .driver = {
> +               .name           = DRV_NAME,
> +               .of_match_table = ftgmac100_of_match,
>         },
>  };
> -
>  module_platform_driver(ftgmac100_driver);
>
>  MODULE_AUTHOR("Po-Yu Chuang <ratbert@faraday-tech.com>");
> --
> 2.1.0
>
