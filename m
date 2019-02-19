Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="feWosojZ"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="B5wszc35"; dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 443xbH1kKKzDqGq
 for <openbmc@lists.ozlabs.org>; Wed, 20 Feb 2019 10:22:18 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 10C6121D0A;
 Tue, 19 Feb 2019 18:22:13 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Tue, 19 Feb 2019 18:22:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 message-id:in-reply-to:references:date:from:to:cc:subject
 :content-type; s=fm2; bh=7nlKoD3qFYyWa5UdNLxDoi4pdJOfoqCTpzcZmcP
 idoI=; b=feWosojZenYtlEqXds4NPpQIGgG8xhONZio+SKuhzK2cIyOF21/Fd1p
 S7EZbgFe65wCVkZokQccMxxfc2HbsGff0fomWoQaRUlBlf/FfkN/+XPSzyWd0EgW
 6YY4H3G0lwYM84lLJ9A+QH+p3XMOqjOA2NQpXXCmM+weoTQeIkxTPOAirrARunNP
 jgM/fk9u2izvE4WW7IFhMCD9rPtJsk+YAEPdK6LWlKq0Zspp176wsB0rDkY+TjKP
 yBTcN0tVlqLONrmrxPMCGMf2sPycnEYRMgaknjhzhCwXc0BUhsr5KzcKKwB18bzr
 NH0yAjyWI4kvG/P2r4vm5NQgC5O09eA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:references:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=7nlKoD3qFYyWa5UdN
 LxDoi4pdJOfoqCTpzcZmcPidoI=; b=B5wszc35Ng1TkJY1xkHxQ9PdJytC3Qjq3
 mhvbFNiVyMcmsF1h8bgsvrkEpuZxlNtI5bT9x7tuiF3z6TFb10lZVk2mVbGtFzeN
 kct68ln/7Wpst1MGeCplVcbDYUdtAmE+0uM6pyBgrPqLebOabkR/NfntPoaWh5ou
 npuR0BvQuisFGyaAaecbAvmHl/EHPTCd1r5TuZdBC2Tfvah30+lSGNNYaO/04nYy
 TkAqlVFvvZCKzGNig/UkDMaBIdHYMXNUNpM53TmU+akcJB1u5FAUHSMMZF/jdCId
 +GyceWYrq6tGQG0lYy6rqCj/0iJ9rRs2pE/xMNO+KldXUl7Zegr6A==
X-ME-Sender: <xms:pI9sXJCfX6A74ScM33yJo_3HqEQyLwBv8M_gGXpGgabBNPTwwa2IWw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedutddrtdehgddtleculddtuddrgedtledrtddtmd
 cutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfhuthen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfrrghrrg
 hmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghr
 ufhiiigvpedt
X-ME-Proxy: <xmx:pI9sXOMhDq31iIna9hYSP0M4dsKw3i2JohW6U7cHAzYsYzBfgtt_8g>
 <xmx:pI9sXJC0aFonEx1cADiIm2AtNcVuQzYmQHHEfjiFpM4FVCrtA4AuHA>
 <xmx:pI9sXB-QzhgiWcyDZ9exyKCKRuMwcLab6jlEfQYkYRCnyqlUpfkhuw>
 <xmx:pY9sXMMUYj4p6SunCU9d30fKT5zjcQtKFCOd1XYzo6iNc3HXXnBWhw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id B25737C1EB; Tue, 19 Feb 2019 18:22:12 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.5-895-g0d23ba6-fmstable-20190213v1
X-Me-Personality: 52947553
Message-Id: <7be5b88e-5a17-4f6f-b0dc-9120945a821c@www.fastmail.com>
In-Reply-To: <CAE33tLEdEsdZ+0NXvAuVeWP3145MvL5w=VZQp-_obQPBLSpDGw@mail.gmail.com>
References: <CAE33tLGC==CvoJLBV+jUnp=RiFph7wxa0q2o6ZfhrqaNMZtBCQ@mail.gmail.com>
 <1550097803.1007491.1657535928.051F6319@webmail.messagingengine.com>
 <CAE33tLG24aYDx0a7pbNCs8KU=ANT161JvT9c_iPpCQ44Lc5Fbg@mail.gmail.com>
 <1550186888.4139421.1658270160.5405B961@webmail.messagingengine.com>
 <CAE33tLHdxOpH8NsPv6xRLdymAisBsy0smwySkc=V=E6nz28fKQ@mail.gmail.com>
 <1550457918.2790490.1659886984.2F457972@webmail.messagingengine.com>
 <CAE33tLH4_f1tYAektG2GLUh47EFEYybwgcTKi1KP3UV3QuZPtQ@mail.gmail.com>
 <e44dbb70-8630-4bc0-9809-f24b6e9a3815@www.fastmail.com>
 <CAE33tLEdEsdZ+0NXvAuVeWP3145MvL5w=VZQp-_obQPBLSpDGw@mail.gmail.com>
Date: Tue, 19 Feb 2019 18:22:09 -0500
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "AKASH G J" <akashgj91@gmail.com>
Cc: openbmc@lists.ozlabs.org
Subject: Re: Unable to read or write from system SPI flash memory.
Content-Type: text/plain
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
X-List-Received-Date: Tue, 19 Feb 2019 23:22:23 -0000

On Tue, 19 Feb 2019, at 14:53, AKASH G J wrote:
> I flashed OpenBMC image to system flash using pflash. After power-off, 
> I tried to boot the BMC (Aspeed AST-2500) from the system flash. For 
> that I used the command *bootm <system flash address>* in u-boot 
> prompt. That gives error "no image found".

Akash, I can't help you any further if you do not give me the exact commands
you are using to flash the system and verify your claims. For instance, there's
no reason to abstract `<system flash address>` here and it's value is actually
crucial to understanding what you are trying to do.

Please, literally copy and paste the output of your console into your response.
Please do not edit it, do not type it out by hand, do not invent or abstract the
commands that you're executing. Without that I'm going to leave it for
someone else to help.

That said, bootm expects a kernel image in memory, not the address of the
system flash. As far as I'm aware, if you're providing anything other than the
kernel address it won't work. If you want to just start executing instructions
at some random address, the `go` command is what you need:

```
root@witherspoon:~# reboot -ff
Rebooting.[42291.288011] reboot: Restarting system



U-Boot 2016.07 (Feb 19 2019 - 10:48:12 +0000)

       Watchdog enabled
DRAM:  496 MiB
Flash: 32 MiB
In:    serial
Out:   serial
Err:   serial
Net:   aspeednic#0
Hit any key to stop autoboot:  0
ast#
ast# help go
go - start application at address 'addr'

Usage:
go addr [arg ...]
    - start application at address 'addr'
      passing 'arg' as arguments
ast# go 0
## Starting application at 0x00000000 ...


U-Boot 2016.07 (Feb 19 2019 - 10:48:12 +0000)

       Watchdog enabled
DRAM:  496 MiB
Flash: 32 MiB
In:    serial
Out:   serial
Err:   serial
Net:   aspeednic#0
Hit any key to stop autoboot:  0
ast#
```


Andrew

> 
> On Tue, Feb 19, 2019 at 5:33 AM Andrew Jeffery <andrew@aj.id.au> wrote:
> > 
> >  
> >  On Mon, 18 Feb 2019, at 15:04, AKASH G J wrote:
> >  > I wrote a bootable version of OpenBMC Linux image in system SPI flash. 
> >  > 
> >  > I tried to boot it before power-off, it was successfully booted. Then I 
> >  > tried to boot the same, that time it was unsuccessful.
> >  
> >  But you just said you flashed an OpenBMC image to the system flash. 
> >  That's never going to work. You need the host firmware on the host
> >  flash to successfully boot the host, and OpenBMC is not the host
> >  firmware.
> >  
> >  Am I understanding you correctly?
> >  
> >  > 
> >  > Do I need to make any change in the Linux device tree for resolving this issue?
> >  > 
> >  > On Mon, Feb 18, 2019 at 8:15 AM Andrew Jeffery <andrew@aj.id.au> wrote:
> >  > > 
> >  > > 
> >  > > On Fri, 15 Feb 2019, at 16:03, AKASH G J wrote:
> >  > > > I just powered off the entire board. After that the data is not present in
> >  > > > the SPI1 flash. But before power-off it was there.
> >  > > 
> >  > > How were you verifying the data was there before the poweroff?
> >  > > 
> >  > > > 
> >  > > > We are using OpenBMC Linux version 4.18.7 and pflash v6.1
> >  > > 
> >  > > Thanks for the versions. Should be handy as we dig deeper.
> >  > > 
> >  >
> >  
>
