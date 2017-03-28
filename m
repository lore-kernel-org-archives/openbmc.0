Return-Path: <brendanhiggins@google.com>
Received: from mail-qk0-x233.google.com (mail-qk0-x233.google.com
 [IPv6:2607:f8b0:400d:c09::233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vsfSP2wfzzDqZn
 for <openbmc@lists.ozlabs.org>; Tue, 28 Mar 2017 16:23:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="OiZ+A8kX"; 
 dkim-atps=neutral
Received: by mail-qk0-x233.google.com with SMTP id p22so56777162qka.3
 for <openbmc@lists.ozlabs.org>; Mon, 27 Mar 2017 22:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=n6x/1L3CNzotMzeUckiDZ6CFydSodV6PGSVN6Ui0my4=;
 b=OiZ+A8kXTr6Nz7LBSeX4dtMwt2ZQQwvEX3/iEyXJLtaD6a8kuCCF+h61s8XtrBlSKS
 vVbXUPwmX1tArrLBik+GFOMcOEzyqFoPPGdDS0TpDpWJg3PzZbNcaAYcoTep4stqnB09
 8dHh1of2J7RU1BLQoeoTn2hONJk713my7pK8xiVhMRe1pgeV/rDRFtiPaqebnuFdA+6p
 bBurctAsyU2J5C2guY2rnwh/yQFHATTrW7fv1jP25e/XpsZT412heA50hz6AbLWFfC6G
 sAMwG3WwUrExnDDJ0jNlr4TOc6QtMqk8utWGcRaMHpMalXE3hzKoQAeI7sKMbgFHy91t
 p79A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=n6x/1L3CNzotMzeUckiDZ6CFydSodV6PGSVN6Ui0my4=;
 b=W0TUs3SCEHaBIK5q5Wb7G//aAhUGIjNOdfraX/lx1qX2jdFkwwhUFaUdbbzlxgwR3h
 Yq/BwhmSCc4gMMlhgRZ8iCPlspFtSK1i1Jcw+29+81VT/A4WRholpMgf2dloZAAPqKXY
 BUN2BILB6r/e4clRJqwPFo/Xgv7nGG9kfmYw03pwn4PRBeql0xAxY+zoma1qwE8KmWd1
 34PgArK3MuNOISu6ig/BJpQJRviJNytog4v5Ke5mI/A17iKpBQKCqo/UjAffrRo84ir0
 UAqw4rnSYoMnuNYMBGzpIwG9T0YIA2bHb/vlvBNAGsm1YQcVj9PB+vR0LwJmLb9S4rI8
 fd2g==
X-Gm-Message-State: AFeK/H3nvZPCqbAAOo7WX7/bm8mFNROyRTvi5NFD4c/DRAYzCqwUqk2FsxNGiaC0z87Rn6gcXIIAszGgFdXhe/TA
X-Received: by 10.55.130.135 with SMTP id e129mr21285119qkd.111.1490678609915; 
 Mon, 27 Mar 2017 22:23:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.152.38 with HTTP; Mon, 27 Mar 2017 22:23:29 -0700 (PDT)
In-Reply-To: <20161212111005.GA1450@katana>
References: <1480467618-7497-1-git-send-email-brendanhiggins@google.com>
 <1480467618-7497-2-git-send-email-brendanhiggins@google.com>
 <20161211222622.GK2552@katana> <825541481540788@web11j.yandex.ru>
 <20161212111005.GA1450@katana>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Mon, 27 Mar 2017 22:23:29 -0700
Message-ID: <CAFd5g47aOuss=Mg6rvDqYBYHkQw_Bez8F0yNFhD6=e8q6gFoEA@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] i2c: aspeed: added driver for Aspeed I2C
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Kachalov Anton <mouse@mayc.ru>, "vz@mleia.com" <vz@mleia.com>,
 "clg@kaod.org" <clg@kaod.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "mark.rutland@arm.com" <mark.rutland@arm.com>, 
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, 
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "joel@jms.id.au" <joel@jms.id.au>, 
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Tue, 28 Mar 2017 05:23:34 -0000

>> >>  + /* Switch from master mode to slave mode. */
>> >>  + func_ctrl_reg_val = aspeed_i2c_read(bus, ASPEED_I2C_FUN_CTRL_REG);
>> >>  + func_ctrl_reg_val &= ~ASPEED_I2CD_MASTER_EN;
>> >>  + func_ctrl_reg_val |= ASPEED_I2CD_SLAVE_EN;
>> >>  + aspeed_i2c_write(bus, func_ctrl_reg_val, ASPEED_I2C_FUN_CTRL_REG);
>> >
>> > Can't the hardware work both as master and slave on the same bus?
>>
>> The hardware can work as master and slave on the same bus. This is how IPMB over i2c works on Aspeed.

I no longer disable master when a slave is registered. I was concerned
about adding multimaster support because I don't think it will play
nicely with bus recovery; should we maybe provide a device tree option
to turn multimaster support on which will disable bus recovery, since
someone else might be using it?

>
> Thanks! Then the driver should support this. Maybe it is an idea to
> first upstream the master support and add the slave support
> incrementally?

Yeah, probably a good idea. Slave support is now added in
https://lkml.org/lkml/2017/3/28/22.

>
> Regards,
>
>    Wolfram
>
