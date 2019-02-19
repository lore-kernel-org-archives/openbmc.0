Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=64.147.123.25; helo=wout2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="BLcL4+Y8"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="oUqv9c7w"; dkim-atps=neutral
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 443LYh16NBzDqDP
 for <openbmc@lists.ozlabs.org>; Tue, 19 Feb 2019 11:03:52 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id B7A9231E1;
 Mon, 18 Feb 2019 19:03:49 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Mon, 18 Feb 2019 19:03:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 message-id:in-reply-to:references:date:from:to:cc:subject
 :content-type; s=fm2; bh=p8hIUYfGpDqUNv7+rBTQchiwiqvhv/lxvkW6R8x
 dcJE=; b=BLcL4+Y8V+7mgDM9nVzlUMYCe9vR8qf2Z/6c8cNvtnEFNJN9wiS5GEg
 51/F3fqSmos7YILcUcHJdZn8hcXxw44NCxtdG9EVJqQ7sfwjwXm/lpRK/Flp1izD
 pyygHip7wf74qxk80lldpJWEXvO+p/GinD3xbrMo2sjHZ/dP5NTtmwtZdg4OZhlR
 hbX7AWtYHM9wJ3O47oIrHt1SmLcro1g2hBOod3YX86BhT/oNB7P55aj2Ev9A/Y5V
 mm/KGNkXL8S4dxFsQ2MJEbtFFW/GeWFzxl9BhQT/TmvihAU5hvMJNYbSe/AoCK8R
 wWhF4U2w/hrSHbuWu4bJbkMeNCJn3jQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:references:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=p8hIUYfGpDqUNv7+r
 BTQchiwiqvhv/lxvkW6R8xdcJE=; b=oUqv9c7wicYronjCJ7ZLe0Boly5BCaS8d
 VwkdHbAdpIp9SCKDCCpiQi2A83L3pnupJbDcc3ejy1pnUkdJ3XpZRG+RT2Qr6cM/
 mHV7jX5PHhJgNrAKxvK733uuPuUsSM57hVmICY8pYTRsfencF76WfgDLUBtT2WWy
 7ditA5HqSSGDLMzB+csPyqemwZixRGfdqDrsZphRBFpC2R1U6xWwqaCO/laDWSds
 /l0VwK7Mh76NBAneGUrdLS1qPc/3wlQzcqEGd+2mRD7AP5h2tPPP17vlJ0iVWBVH
 b7hi0G5g1USXrnRHB5TTDqXOvtoW/xXSvCwv8q42y8wbE90xuLmhA==
X-ME-Sender: <xms:5EdrXAnFwzWaVcHnEQNYOERPcfGj9tXrKvsOPIJ6iEbfzQIDyATJew>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedutddrtddvgddujeculddtuddrgedtledrtddtmd
 cutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfhuthen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfrrghrrg
 hmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghr
 ufhiiigvpedt
X-ME-Proxy: <xmx:5EdrXLpl3vZd5fReyviXiGbmojiZvCRQO8aKCpUmW7O_ftsmeL7pkA>
 <xmx:5EdrXKCl38cjxyKBEMtQVSQbKwn13u4mUjVhASjEa8EYe0ccG0gtEA>
 <xmx:5EdrXGGCNav51ejNMAfHY458albdoYyUjPv797zTsXYEFf4Nbe5JxQ>
 <xmx:5UdrXLMMGFt8wffXGaqbBVk_5axZyIvMwXOcL2JWQ9424-tKQW0pUw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 9D2DC7C1EB; Mon, 18 Feb 2019 19:03:48 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.5-895-g0d23ba6-fmstable-20190213v1
X-Me-Personality: 52947553
Message-Id: <e44dbb70-8630-4bc0-9809-f24b6e9a3815@www.fastmail.com>
In-Reply-To: <CAE33tLH4_f1tYAektG2GLUh47EFEYybwgcTKi1KP3UV3QuZPtQ@mail.gmail.com>
References: <CAE33tLGC==CvoJLBV+jUnp=RiFph7wxa0q2o6ZfhrqaNMZtBCQ@mail.gmail.com>
 <1550097803.1007491.1657535928.051F6319@webmail.messagingengine.com>
 <CAE33tLG24aYDx0a7pbNCs8KU=ANT161JvT9c_iPpCQ44Lc5Fbg@mail.gmail.com>
 <1550186888.4139421.1658270160.5405B961@webmail.messagingengine.com>
 <CAE33tLHdxOpH8NsPv6xRLdymAisBsy0smwySkc=V=E6nz28fKQ@mail.gmail.com>
 <1550457918.2790490.1659886984.2F457972@webmail.messagingengine.com>
 <CAE33tLH4_f1tYAektG2GLUh47EFEYybwgcTKi1KP3UV3QuZPtQ@mail.gmail.com>
Date: Mon, 18 Feb 2019 19:03:48 -0500
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
X-List-Received-Date: Tue, 19 Feb 2019 00:03:52 -0000



On Mon, 18 Feb 2019, at 15:04, AKASH G J wrote:
> I wrote a bootable version of OpenBMC Linux image in system SPI flash. 
> 
> I tried to boot it before power-off, it was successfully booted. Then I 
> tried to boot the same, that time it was unsuccessful.

But you just said you flashed an OpenBMC image to the system flash. 
That's never going to work. You need the host firmware on the host
flash to successfully boot the host, and OpenBMC is not the host
firmware.

Am I understanding you correctly?

> 
> Do I need to make any change in the Linux device tree for resolving this issue?
> 
> On Mon, Feb 18, 2019 at 8:15 AM Andrew Jeffery <andrew@aj.id.au> wrote:
> > 
> >  
> >  On Fri, 15 Feb 2019, at 16:03, AKASH G J wrote:
> >  > I just powered off the entire board. After that the data is not present in
> >  > the SPI1 flash. But before power-off it was there.
> >  
> >  How were you verifying the data was there before the poweroff?
> >  
> >  > 
> >  > We are using OpenBMC Linux version 4.18.7 and pflash v6.1
> >  
> >  Thanks for the versions. Should be handy as we dig deeper.
> >  
>
