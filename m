Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="De4baDOm"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="GAJiqNUB"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3znX220zZXzF1lb
 for <openbmc@lists.ozlabs.org>; Fri, 23 Feb 2018 11:20:58 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id E88CB21784;
 Thu, 22 Feb 2018 19:20:55 -0500 (EST)
Received: from web4 ([10.202.2.214])
 by compute4.internal (MEProxy); Thu, 22 Feb 2018 19:20:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; bh=d8E6DMJUeMPm2FtK/gzSe4QPC4x6i
 2qdbVYvlQastWk=; b=De4baDOmetJL5HFiZjOwKbAlXwl6yHic9/H+RsIBzGbmX
 cWhMnTtXEEZoim42moCwMRFEnC0T/ktkwhuVZ4iqp3z+VdQaorw1xRahjpGSzGSJ
 WBlTf4XEOOBvydo3liuyEuar+QAbEYKol+zkGwaobZBxFNzImTcKXmQqnBYkvN5r
 AxgyaUfSre9gdF28U3+x1F4xYqQyHlBeUX/nhGmshSv1Vmvb4am/yI5oBPyDzuHG
 XcRVglruMZ3kRxMR1YK/gaGRNBHGZ/WeGJIpFvDO7h2kijOCsPncNEn8aFbt8axa
 eSnsCqYKIrR86SGLzXMeRoGzOK8x/CuPevGTVySvg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=d8E6DM
 JUeMPm2FtK/gzSe4QPC4x6i2qdbVYvlQastWk=; b=GAJiqNUBPJ5JzGjOyocM/V
 i48mFVbIgIRYo2TGUBJRXqjuR+JlN2LdO0eO+PJaThHf7rpiGMi1oNcibxWqvKl8
 LFD+Wqa6KRt22ZATg5e/SR8OtY3ddmgjCd8MXzw6ihA0/Ed8+TtJ6SNXpFf9VvGy
 uacHQsZH3GrXnn7/gE5QskU84YxMsVL6FLrHm82d/CvOAhkrP4ZwFY142EpO/opt
 oH0jitBGIyfDOGiIFz2CA1g4LJp3yjNJapOB+OPVedwiV4T6P/MqFfF7YMhwX2fr
 x0A2bISw6oqzeeXrUFy0LHwjbMzg0J15VgEEXTP3VSpixxB+Jp/frXaGFvz1xdKg
 ==
X-ME-Sender: <xms:Z16PWqronFB8ankrjzQoyqsbmIFJqrSNphIQ_7mNoefCaOQw38hi-A>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id C4E83BA43C; Thu, 22 Feb 2018 19:20:55 -0500 (EST)
Message-Id: <1519345255.1028643.1280352848.2D9D620A@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: Joel Stanley <joel@jms.id.au>, Cyril Bur <cyrilbur@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-efbb3405
Subject: Re: [PATCH linux 2/2] drivers/misc: Add Aspeed LPC mbox register
 driver
In-Reply-To: <CACPK8XdxW0H_w7iSskSVk8BvQn5KZM89d03uYYP4xaT=eOc-gg@mail.gmail.com>
References: <20180221032554.9852-1-cyrilbur@gmail.com>
 <20180221032554.9852-2-cyrilbur@gmail.com>
 <CACPK8XdxW0H_w7iSskSVk8BvQn5KZM89d03uYYP4xaT=eOc-gg@mail.gmail.com>
Date: Fri, 23 Feb 2018 10:50:55 +1030
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 23 Feb 2018 00:20:58 -0000

> > +
> > +static u8 aspeed_mbox_inb(struct aspeed_mbox *mbox, int reg)
> > +{
> > +       /*
> > +        * The mbox registers are actually only one byte but are addressed
> > +        * four bytes apart. The other three bytes are marked 'reserved',
> > +        * they *should* be zero but lets not rely on it.
> > +        * I am going to rely on the fact we can casually read/write to them...
> > +        */
> > +       unsigned int val = 0xff; /* If regmap throws an error return 0xff */
> > +       int rc = regmap_read(mbox->regmap, mbox->base + reg, &val);
> > +
> > +       if (rc)
> > +               dev_err(mbox->miscdev.parent,
> > +                       "regmap_read() failed with %d (reg: 0x%08x)\n",
> > +                       rc, reg);
> > +
> > +       return val & 0xff;
> > +}
> 
> This is a mess. I'd prefer:
> 
> static u8 aspeed_mbox_inb(struct aspeed_mbox *mbox, int reg)
> {
>        int val;
> 
>        regmap_read(mbox->regmap, mbox->base + reg, &val);
> 
>        return val;
> }
> 
> static void aspeed_mbox_outb(struct aspeed_mbox *mbox, u8 data, int reg)
> {
>        regmap_write(mbox->regmap, mbox->base + reg, data);
> }
> 
> Reads and writes to a mmio address will never fail. Regmap incurs
> enough overhead already; we don't need to add more in the driver.
> 

The mess was my suggestion when the patches were first posted, and I apologise for that now. Lets go with Joel's cleaned up version.

Cheers,

Andrew
