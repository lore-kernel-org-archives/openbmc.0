Return-Path: <joel.stan@gmail.com>
Received: from mail-ua0-x242.google.com (mail-ua0-x242.google.com
 [IPv6:2607:f8b0:400c:c08::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sgPLc55dlzDsj3
 for <openbmc@lists.ozlabs.org>; Fri, 23 Sep 2016 16:57:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=B3oY/NVf; 
 dkim-atps=neutral
Received: by mail-ua0-x242.google.com with SMTP id 51so1059604uac.1
 for <openbmc@lists.ozlabs.org>; Thu, 22 Sep 2016 23:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=ZwUnLvblFoAszLfFCM+MJmGgVR5++d77ShBK2hr6tek=;
 b=B3oY/NVfsFXt4sEyPCVblBUgfrC51wGD6q1X0oimXbLGh/RzFprsIC1Bao7P7mIDCq
 /NGS+ke/DcvsP7StH4tReoySDq95Fj4PUPcDYHOvsRD3G0iUeznCY/MhSBdCkOop8R1r
 NHai9E1UrfWUopBK5NTI5px1R406HWwJuHranct3kpLby5QsIjv6sXO9MgnXAwFsuKNq
 gpn8EahH+vR/mAZgEDXLPbY5R4NNY1KRHmUBpYugazU7vOzme5IMiC9J3KJisEnA8WV0
 NjwvkxJYirTWZb+HXY0DeCiPNAD5/ObXncEAv6iin+AOMRzoApP5qnm8PS8bgykhauba
 OZqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=ZwUnLvblFoAszLfFCM+MJmGgVR5++d77ShBK2hr6tek=;
 b=LDUOmtUj1uQa6UU2HQXGX+RFmPnF3qGzOWnJeAIdsFrbmIRPX8aEPUPzjJ9LDfL8Sh
 S9YllT4GouwaJNaV37ZHQNicRIhF8voOF3jb3G+s/GqbwdIf+wLXwaeMggUb6rz95YFa
 REvIiA3ofBQc7tkpusp7b/6LxC4gnvmJNDbOj4PA9Zb2m2FkJKHv/47pM9CSAM8YE7Ia
 0YAjSVHCS9/1tzBEyvfhE/eWQwDia+FHY7iI/M38Uh801C+ccJt2kjdTj7p/cqJaUHGm
 s5TI13buLycONEUbjd652pZqCGX3QyeZ0HC4kaZ47H8hfGnlscj/tpEkP4cjG0bZnU0S
 xPCA==
X-Gm-Message-State: AA6/9Rk/i5nvtB/oP7tlr9XFWvALVqQPEFUa67OK+X6AyR66MwTYQoHEDjLA0gk5ZccF3P1kUV1iibBsjVlh3A==
X-Received: by 10.176.3.206 with SMTP id 72mr2745831uau.145.1474613846211;
 Thu, 22 Sep 2016 23:57:26 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.176.7.71 with HTTP; Thu, 22 Sep 2016 23:57:05 -0700 (PDT)
In-Reply-To: <1474058133-27363-5-git-send-email-tpearson@raptorengineering.com>
References: <1474058133-27363-1-git-send-email-tpearson@raptorengineering.com>
 <1474058133-27363-5-git-send-email-tpearson@raptorengineering.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 23 Sep 2016 16:27:05 +0930
X-Google-Sender-Auth: BxoMBl53ZiQ5YQPe-jGEY6Uacp8
Message-ID: <CACPK8XcGXcrZT1JYo5Y7LNwp07zm-i8TOH53TAWcdYN+B0u2GA@mail.gmail.com>
Subject: Re: [PATCH 04/17] Allow no-hw-checksum override in devicetree outside
 of NCSI mode.
To: Timothy Pearson <tpearson@raptorengineering.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
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
X-List-Received-Date: Fri, 23 Sep 2016 06:57:29 -0000

On Sat, Sep 17, 2016 at 6:05 AM, Timothy Pearson
<tpearson@raptorengineering.com> wrote:
> This is required for Firestone networking to function correctly.
>

This should not be required. Can you please test without this patch
and see if networking works?


> Signed-off-by: Timothy Pearson <tpearson@raptorengineering.com>
> ---
>  drivers/net/ethernet/faraday/ftgmac100.c |    3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/net/ethernet/faraday/ftgmac100.c b/drivers/net/ethernet/faraday/ftgmac100.c
> index 778c625..3a6367d 100644
> --- a/drivers/net/ethernet/faraday/ftgmac100.c
> +++ b/drivers/net/ethernet/faraday/ftgmac100.c
> @@ -1423,8 +1423,7 @@ static int ftgmac100_probe(struct platform_device *pdev)
>          * in that case.
>          */
>         netdev->features = NETIF_F_IP_CSUM | NETIF_F_GRO;
> -       if (priv->use_ncsi &&
> -           of_get_property(pdev->dev.of_node, "no-hw-checksum", NULL))
> +       if (of_get_property(pdev->dev.of_node, "no-hw-checksum", NULL))
>                 netdev->features &= ~NETIF_F_IP_CSUM;
>
>
> --
> 1.7.9.5
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
