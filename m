Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::c34; helo=mail-yw1-xc34.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="Yi3uYMeH"; 
 dkim-atps=neutral
Received: from mail-yw1-xc34.google.com (mail-yw1-xc34.google.com
 [IPv6:2607:f8b0:4864:20::c34])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42rgBQ3JTszF3Tp
 for <openbmc@lists.ozlabs.org>; Fri,  9 Nov 2018 10:54:54 +1100 (AEDT)
Received: by mail-yw1-xc34.google.com with SMTP id v5-v6so54756ywa.13
 for <openbmc@lists.ozlabs.org>; Thu, 08 Nov 2018 15:54:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=qf0ebuVZsGi8zVKDfammBpl/zi4KDk2rskV4ObwbnWU=;
 b=Yi3uYMeHyr/HCigIjHAVCazM8QP9EwcEngpBULTl4bMojUY6ci4knYEID2+hvImGIL
 YOi/AbTES3GmlXR9u+fPlCr4Bcw6U/VfD3sG7XLsi9Nmai9ynSU/xsaitrPgjRbGnM2H
 SFj/M7WECaPkfNtgbtX4DPEDxwwSHLftx/d8g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=qf0ebuVZsGi8zVKDfammBpl/zi4KDk2rskV4ObwbnWU=;
 b=Xi+mPPcX3Nm2MPLhUfR+OTHwmJNTrs+ODM2W48eQWNU4FxFdfhqO+qtei37vaEBTP1
 /gc90fV0+e81JqrZoNCoprR0X5y8RZrxpl+nFmAhWg7U/HEFnzM23Fz4uVAnLcXm0HrY
 OmRQMB6x4Y3ol9J3bbk1IqHQ/Iodixkt6N99Dt2XSwxG1eUOpAJoQLd5+xG+D61SpH67
 LEM7EeK/MWRrohPnoYSKNbM3U9wzJUAY1XrOT8Im0nuxJOHY5Ox8ualp+pWRE3/CHhYf
 sD+JDaZPA2Wfa+EF4zEYCaoxZ9te5Zda6rERbyIqY7maIRdbLejXSzGYo5inU+G/jTmf
 3neg==
X-Gm-Message-State: AGRZ1gKmmH2wR2l2z/k9P590benbQ9pGpHw82xClX0nvc75kDptUtWjx
 rIkW+P60xXx9V9V/4rBzfttROQUZVaKB9zqxNxk=
X-Google-Smtp-Source: AJdET5d/Mv9Z1vSCUM4p4vwXl9VlzBn9nnk1zh/mhdIRUj5AHHAvTsT1awKAgefNVgdAFU0aGKTIc04Ecc/8wda1xMY=
X-Received: by 2002:a37:781:: with SMTP id 123mr6411301qkh.231.1541721291957; 
 Thu, 08 Nov 2018 15:54:51 -0800 (PST)
MIME-Version: 1.0
References: <3ff8d429943e44139b73cb16199a560e@yadro.com>
 <3D1C8267-BC6F-44F1-B12F-020E147B225B@fb.com>
 <a6ba63dc-eecc-9a24-e479-8036d53804bd@fb.com>
 <CACPK8Xf6hD9ne530ZLWgE-Tuc9MCXiHrFpx-zJ_SdsDV81Lohw@mail.gmail.com>
 <c59de915-9608-4c44-adc3-82d83d6e279a@fb.com>
 <20181108123011.GA8718@bbwork.lan>
In-Reply-To: <20181108123011.GA8718@bbwork.lan>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 9 Nov 2018 10:24:40 +1030
Message-ID: <CACPK8Xcbv9UZSr=6N+UUyWnVggve7GrzO9FGdQ8jA9ZUVbQ8Jw@mail.gmail.com>
Subject: Re: pull request to the u-boot-aspeed
To: a.filippov@yadro.com
Cc: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Thu, 08 Nov 2018 23:54:55 -0000

On Thu, 8 Nov 2018 at 23:00, Alexander A. Filippov <a.filippov@yadro.com> w=
rote:
>
> Thanks to all for replies.
>
> On Thu, Nov 08, 2018 at 11:06:22AM +1030, Joel Stanley wrote:
> >
> > I'd encourage you to submit the i2c driver for review to upstream
> > u-boot. Cedric and I have spent some time recently in improving
> > upstream u-boot support for the aspeed SoCs.
> >
>
> The upstream already has the implementation of the aspeed i2c driver.
> So, I had to look there before taking up our implementation...
>
>
> On Thu, Nov 08, 2018 at 08:12:03AM +0100, C=C3=A9dric Le Goater wrote:
> >
> > i2c is already available from mainline U-Boot. But mainline does
> > not have ast2400 support (dram training is missing) only ast2500
> > was implemented.
> >
>
> Is it the reason why the OpenBMC still use v2016.07?

We haven't found time to work on upstreaming u-boot.

If you were to add support for the ast2400 we could move all platforms
to the upstream tree instead. This would be preferable to maintaining
our own fork.
