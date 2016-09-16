Return-Path: <joel.stan@gmail.com>
Received: from mail-vk0-x244.google.com (mail-vk0-x244.google.com
 [IPv6:2607:f8b0:400c:c05::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sZxYV068HzDsZP
 for <openbmc@lists.ozlabs.org>; Fri, 16 Sep 2016 10:51:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=ObxE+Kbv; 
 dkim-atps=neutral
Received: by mail-vk0-x244.google.com with SMTP id 192so198193vkl.0
 for <openbmc@lists.ozlabs.org>; Thu, 15 Sep 2016 17:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=+poumxyzXaDq+OExnbg4sm/wOznN9SSTPaRVjRBFoD8=;
 b=ObxE+Kbv/YRXFkq40n4OUKdr8grNEzv39wBU5WGkokQ0mEVs91dmw6N4MOnZ7FGJQG
 Dn9XEFUOj3vw7aYrsz3f7ivcsmx0hAJw0Ypn3p/bx1Bf/KyKK3n39xY4LybG3E9Qsh72
 WlmFmhGJwRpo9gS2g7Ualb/+Dkga5Ea0oiXXk69q/9F5fCdvOHgokHGHmXyADXf667dL
 ontXuWWuS8CpKyWauyDPNOLyrs8AOnDuapbWEaWRMaOyDet/qCeKeRzSIvuO22Anh9LH
 7NNtBCWlQrfRAReGn0RAGRJpAaMlwbliPc2TuaIpR+4J3dIt4lufV027w4McS9EntDop
 +YRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=+poumxyzXaDq+OExnbg4sm/wOznN9SSTPaRVjRBFoD8=;
 b=aZDBD/YEFigvfZFFnHvHlF48S+1uifceWUgdmjQK97axodFJMRlzDLcve9t+goAXhc
 fyLh4eQj3ctL+FyHrEztgXIgY9RGtgDJveKLHbnbLv/+nCyG8ztlvFxmUUSE/5dt4DDk
 j4BnICv/IM5u/t+ZUaAiauZEn1quRdYEqZvqYEa1imy69kL/6BuOXNXf4OjMpkTc9VCk
 ELiHAqWLADPr6415XiLFN8p10QDSRt5hQl3U+UN1/VHkX5rl78vgBJc6EYw8w8BkxHEI
 M4MFcRpH6hciQ6enQFFVdJ2vObOvI+oJXyo8i0tt5vbAUkZKF/PQXwxEVrpT0opgRAZk
 uoIA==
X-Gm-Message-State: AE9vXwOpqHO6YZJIW2Egql9nSJfMVPnmi1IIyKAQmFme23+jtOfNJw5rqerMIfv0tL3DMwuj9Sg+2ynxdbT/Cw==
X-Received: by 10.31.137.140 with SMTP id l134mr743401vkd.67.1473987083621;
 Thu, 15 Sep 2016 17:51:23 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.176.80.221 with HTTP; Thu, 15 Sep 2016 17:51:02 -0700 (PDT)
In-Reply-To: <1473986374.13249.5.camel@aj.id.au>
References: <20160915111308.31481-1-joel@jms.id.au>
 <20160915111308.31481-3-joel@jms.id.au>
 <1473986374.13249.5.camel@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 16 Sep 2016 10:21:02 +0930
X-Google-Sender-Auth: 5i8mgLsaElMG-76jxYq5_wavgk8
Message-ID: <CACPK8Xcx6s4rt+y1XbJZMCOL9zF82GSge5ciuCpToCtYD+V_AA@mail.gmail.com>
Subject: Re: [linux dev-4.7 3/3] arm: dts: aspeed: Add SPI1 master pinmux hog
 to g5 machines
To: Andrew Jeffery <andrew@aj.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Fri, 16 Sep 2016 00:51:26 -0000

On Fri, Sep 16, 2016 at 10:09 AM, Andrew Jeffery <andrew@aj.id.au> wrote:
> On Thu, 2016-09-15 at 20:43 +0930, Joel Stanley wrote:
>> This is for reuqired for using the PNOR on ast2500 based systems.
>>
>> Signed-off-by: Joel Stanley <joel@jms.id.au>
>
> Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
>
> Have we sorted out how we're going to deal with the strap register
> configuration (given the pinmux driver treats it as read-only)? I don't
> see a u-boot issue for it yet.

I've opened https://github.com/openbmc/openbmc/issues/579 as I haven't
decided if we want it do it in u-boot, kernel or somewhere else.

Cheers,

Joel
