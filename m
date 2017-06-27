Return-Path: <brendanhiggins@google.com>
Received: from mail-qk0-x22a.google.com (mail-qk0-x22a.google.com
 [IPv6:2607:f8b0:400d:c09::22a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wxfQj5FZLzDr8M
 for <openbmc@lists.ozlabs.org>; Tue, 27 Jun 2017 18:36:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="v9z8FjyL"; 
 dkim-atps=neutral
Received: by mail-qk0-x22a.google.com with SMTP id d78so19560340qkb.1
 for <openbmc@lists.ozlabs.org>; Tue, 27 Jun 2017 01:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=U9RvQdIKJKn3+dZKPzRyeb60DBI4QlI2+Q8swCz5ZoE=;
 b=v9z8FjyL2dBWGUpLBbMV0FYlDkOuBaNbViKK1PXDyT3qr4r9O3cEeMEAGI9xsnZdau
 bEvhbh32NIHaInJO+FD9/wIoAatHIktytk/wgcD79eYDI2yhg+WX+drp9Ph96RlPxD2I
 XVPoCgBKLEGN/JFCOQ15Cbv9FtA+YW68nma6qu6O61q5duiqtxmsjbXboe7AMCz07H/m
 zIrsEkLqO1T2GM8q5OyeoF3J9EiySQwte3AgiX89PviKN5weLb35yA4w/qmNB3E/pQCv
 1SAQUHUeMTKmHxdV2qBmN4dd754rg/AotTuWTbMaL88+IMPUdka9aGG7R9Y62ceujDaB
 tXxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=U9RvQdIKJKn3+dZKPzRyeb60DBI4QlI2+Q8swCz5ZoE=;
 b=nKv3G8yCoInIUpLbypYh50iy4FMXqiceiY2lyrfw94v9jc/l+3gEgRsaZY1rYwfBu9
 ypb/ZwUS/wSBxdZciIcN80PJuAPcsxwt5AmmIBvWyxT6OXyHAM7UpyzpQN1jMs7qZS6h
 g6AW5bz8XWKKT3NP9A1AZ0TbJGTc0FI2KJBPDg+Au4bSg4c/2xncnCuxQutR0Dr/xaFZ
 flPyZxnVvtmRgMiez65IX/FkvNQB2V9qnxcuAWsVl1jminNAQi4w8YL8WFCMishsMMxq
 m142q20drddn2NZvRq2vHFGKERTwIxhipp4FcM/y3ySLh5pLCLC3cCmFrCy4L6pNT/zW
 owyw==
X-Gm-Message-State: AKS2vOylO08GP7T0Yyqgydz48+ZjhDqLlO06/wpURaNBAw+gZEKRUANu
 LjeKV1gekFdB1GaQHTXrVFuE984l1beY
X-Received: by 10.55.74.13 with SMTP id x13mr4704265qka.254.1498552571223;
 Tue, 27 Jun 2017 01:36:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.200.45.67 with HTTP; Tue, 27 Jun 2017 01:36:10 -0700 (PDT)
In-Reply-To: <CACPK8XepziqsQVC6R_97s24=8o5F-TZCO1+opZxBJW8SNHRHkg@mail.gmail.com>
References: <20170620211516.13095-1-brendanhiggins@google.com>
 <20170620211516.13095-4-brendanhiggins@google.com>
 <20170623184305.xqqhjgrbdmgk6lsr@ninjato>
 <CACPK8XepziqsQVC6R_97s24=8o5F-TZCO1+opZxBJW8SNHRHkg@mail.gmail.com>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Tue, 27 Jun 2017 01:36:10 -0700
Message-ID: <CAFd5g459JVzKNdY461pma=e_kvW-xO-mAiVA6Rxvq7Dt_kueVA@mail.gmail.com>
Subject: Re: [PATCH v11 3/4] i2c: aspeed: added driver for Aspeed I2C
To: Joel Stanley <joel@jms.id.au>
Cc: Wolfram Sang <wsa@the-dreams.de>, Rob Herring <robh+dt@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Greg KH <gregkh@linuxfoundation.org>, 
 "David S . Miller" <davem@davemloft.net>, mchehab@kernel.org,
 martin.petersen@oracle.com, 
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, linux-i2c@vger.kernel.org, 
 devicetree <devicetree@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
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
X-List-Received-Date: Tue, 27 Jun 2017 08:36:14 -0000

On Sun, Jun 25, 2017 at 11:18 PM, Joel Stanley <joel@jms.id.au> wrote:
> On Sat, Jun 24, 2017 at 4:13 AM, Wolfram Sang <wsa@the-dreams.de> wrote:
>> On Tue, Jun 20, 2017 at 02:15:15PM -0700, Brendan Higgins wrote:
>>> Added initial master support for Aspeed I2C controller. Supports
>>> fourteen busses present in AST24XX and AST25XX BMC SoCs by Aspeed.
>>>
>>> Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
>>
>> Applied to for-next, thanks for all the hard work!
>
> Congratulations Brendan. It's great to see this driver in the tree.
>
> Cheers,
>
> Joel

Thanks! And thank you to everyone who helped! I am not the only person who
put in a lot of hard work.
