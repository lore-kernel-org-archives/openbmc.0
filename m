Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4010:c07::241; helo=mail-lf0-x241.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="dIM5zuvd"; 
 dkim-atps=neutral
Received: from mail-lf0-x241.google.com (mail-lf0-x241.google.com
 [IPv6:2a00:1450:4010:c07::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3y6NRN4RGXzDqln
 for <openbmc@lists.ozlabs.org>; Wed,  4 Oct 2017 15:37:19 +1100 (AEDT)
Received: by mail-lf0-x241.google.com with SMTP id q132so11984268lfe.5
 for <openbmc@lists.ozlabs.org>; Tue, 03 Oct 2017 21:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=ygijTvsOupEbcSsbdWhgzy0bPWPC7pCvVvgsIOD4+7E=;
 b=dIM5zuvdyXerSUdAaSmThZLabSm0rmZnoV10sjxlDuIRa5+tx7UAkDk5F3lS9yeWn9
 epNiI1/uVS/jkIMDynUA+iqDcJgQTW3ruo1qr2BtG1DMfUcDkC3olOKiEz9cl43cbNZq
 87mTDCcaBv5owpK1zowP1x/Mdc0YIH+J0/g4uPoVXlNycnS3bolTE6ANK+98G3w1zwNo
 p4NRxlKfFdW5OQhoJ3r9XqEKDrQUnnJWnZROQba43EhJWqk2W2ZUjVLwpP3Owioflt9K
 EXHhVtX+fmcIIVJW05+slxF//X2J27l3yNTyPwpV/X47HfV4Poo+vUudiXzxhvt1tsXl
 fA7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=ygijTvsOupEbcSsbdWhgzy0bPWPC7pCvVvgsIOD4+7E=;
 b=JTgZN7XRy5+664zwnrNBUfyul9Lqd1a09rkbrqOH+ohGZXto/1prKkKsgKxl6+nxJR
 Go999gYullhLPyEPxbBoXTolPo1M1c60cgskB8ZEWopznA6wyPBSbpXi9A8b0UzYeqQx
 058pt7SIkQHwPEqj00Mo3nNivhmDzRldynNJKv732K7h5a7YN5nqLk1tk4gPKnk5BCnk
 Kkxu3QLot/Tw9aEPeRg2fkEvyRw8qUjYEp2cy1LtsG8px7prycUn4oS11jbAbhCBMJBB
 Xk7LJhE4wRhDAFTjWwPXeponfpt19M/+S3tZ2kUCYgAsucaYA0wtUOilzVtBptqmac2A
 g48A==
X-Gm-Message-State: AMCzsaW1y5I52rjea4IqVmxHV2EZBXSZFwQ8fZ5YvyUKnj05QdWe3asi
 Vmtt48FF0ygp0p07+jmBHO+g9iNPl5IfZoMzV1U=
X-Google-Smtp-Source: AOwi7QBS0FMbd6Vf1F/4jzA8DXLXRhpboewPhViDf8GiJUxicuX5hRo3E9jPWPAzreQfnV95RoSr4iAvWe9dm66fWQ8=
X-Received: by 10.25.78.206 with SMTP id u75mr4062026lfk.111.1507091837034;
 Tue, 03 Oct 2017 21:37:17 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.25.195.6 with HTTP; Tue, 3 Oct 2017 21:36:56 -0700 (PDT)
In-Reply-To: <CACPK8Xf9SqzavrCzmzqzc=55MmupAT4k7GL1Ta549M6FN3UvQA@mail.gmail.com>
References: <HK2PR02MB15240578C4FBBB5691498874D97E0@HK2PR02MB1524.apcprd02.prod.outlook.com>
 <CACPK8Xf9SqzavrCzmzqzc=55MmupAT4k7GL1Ta549M6FN3UvQA@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 4 Oct 2017 14:06:56 +0930
X-Google-Sender-Auth: GA88ryeXNFnqjPGNNG9WAmO063A
Message-ID: <CACPK8XfCDSOX+yHhCSnEh609Oiqkz5g=TzaYmRTy0eKN4EHTGg@mail.gmail.com>
Subject: Re: [PATCH] arm:dts: add max31785 to Garrison device tree
To: Yi Li <adamliyi@msn.com>, Andrew Jeffery <andrew@aj.id.au>
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 04 Oct 2017 04:37:21 -0000

On Fri, Sep 29, 2017 at 3:29 PM, Joel Stanley <joel@jms.id.au> wrote:
> On Fri, Sep 29, 2017 at 1:15 PM, Yi Li <adamliyi@msn.com> wrote:
>> Add max31785 device tree node to enable Fan Control on Garrison.
>
> Looks okay to me. I'll get Andrew's ack on the bindings before I merge.

Andrew did an over-the-shoulder code review and acked this.

Merged into dev-4.10.

Cheers,

Joel
