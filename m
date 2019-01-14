Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="qNHTJ8IR"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="Lsdsn+Gj"; dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43dH8l2htSzDqNC
 for <openbmc@lists.ozlabs.org>; Mon, 14 Jan 2019 13:14:15 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 9BEFD2883E;
 Sun, 13 Jan 2019 21:14:12 -0500 (EST)
Received: from web3 ([10.202.2.213])
 by compute4.internal (MEProxy); Sun, 13 Jan 2019 21:14:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 message-id:from:to:cc:mime-version:content-transfer-encoding
 :content-type:date:in-reply-to:references:subject; s=fm1; bh=2TO
 iQQGOpHnwM9qYihAzLKXtvgVPTbUoia+sKL59uXo=; b=qNHTJ8IRbIXsokOKriC
 hoYjpAEDDw6HmuZagdqzCft4IGYxsKP7+YMCUcBlmdkATwCBufoN7iD96iBiV59E
 sjb+pr6VzP7c2Ec4VOheE/TMSL9SPR9pcucJKPn458l2MlK8tEDR/X8jIB0NH4i1
 9G4TMd+K93A3n3S8FOR0i48yBuFqv8gnQrU3ORijSFiU5N53pNtXf3Flf620k239
 bvhu//NGfbBbqTpw3myQr/H0bwl3a+/pziV1XCdhS9h9N55Zw+U8diXqirzHbBOO
 cZ1Wyv57YhHvaPR2CLP16x4+ruXHzLjqLIfiCDIQ5k64sTfab14Bo6kDWj0XxOdb
 y8A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=2TOiQQGOpHnwM9qYihAzLKXtvgVPTbUoia+sKL59u
 Xo=; b=Lsdsn+GjxGKZ0N3WCwQ61zCwI+wMuN3WqxuWvYQ+g/SIVAU6IAGdlwYiw
 UpfeQo0lt6dRqwv8dWL+YkUMlVPl6Tyqse54WiJLKIwvhLT5zCSXJNLv6rQk3lRd
 MU4kLNh65l2gNqzgY4NYPRW0bRcdqWtIFL0N96nkqQx4sE5Mw4OjmpbtL8k0BT4M
 SdZhKCHNBpgR8sYqHXFVIBJ+dWf5KRajWFUevz8/zva2j+cKBuC4ggaptzTqycbr
 ZKrwjtyOkIrsN7Qzg9ylevsPRgfLZYzAXQDltBEi/N056rDuk/QzKv5ngnEMWyXC
 Lg0LHvFydSRqoj4DiRmEqB4c6a7pQ==
X-ME-Sender: <xms:c_A7XKHRfySJ-QPOctXx1pM_3EBIzY3Urr_6CfDlI7pVXOGk_hg1HA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedtledrgedtgdegfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfhuthenuceurghilhhouhhtmecufedt
 tdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkffhvfgggfgtof
 ffjghfufesthejredtredtjeenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceo
 rghnughrvgifsegrjhdrihgurdgruheqnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnh
 gurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:c_A7XDuAc6mvCqMNnyJEaOAyuxRJ88xSSphu_g0UHZNrcKchv_AeQA>
 <xmx:c_A7XGXzinY8jOw5HB2So3RyJ4ZUfZ8a008M_OZu9acJOg3ufH2Tbg>
 <xmx:c_A7XL6RUDgCn1VVKN67uPwH_Uphv9zbxo8TvyFtYgC6D3YgA1tE5A>
 <xmx:dPA7XK4-XD1GKBjnuo4OXYp42hYImFfSzk2StlefT5KU0OBOOGMr3Q>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id 27D409E564; Sun, 13 Jan 2019 21:14:11 -0500 (EST)
Message-Id: <1547432051.2375740.1633677528.34818C65@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: Christian Svensson <blue@cmd.nu>
Cc: clg@kaod.org, Christian Svensson <bluecmd@google.com>,
 "openbmc @ lists . ozlabs . org" <openbmc@lists.ozlabs.org>,
 Joel Stanley <joel@jms.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-36e4bfd3
Date: Mon, 14 Jan 2019 12:44:11 +1030
In-Reply-To: <CADiuDARu6fwudJjcfJ0=sDpjQvtsog+GT5gUWu1WPTzPejFaZg@mail.gmail.com>
References: <20181112142137.160970-1-bluecmd@google.com>
 <21acbd66-c75c-d5e3-fcfb-fa75421a7879@kaod.org>
 <CADiuDAQ1mjh56ibSd+tNq2NFiJFtLcAfyoC8fdd=y+4Mu+jD6w@mail.gmail.com>
 <1542068863.1552891.1574692280.790D270F@webmail.messagingengine.com>
 <CADiuDARPsPGkHP1HRm1RVP=G2scSLozSON3o5h_PuA3ngT5eXg@mail.gmail.com>
 <CADiuDARu6fwudJjcfJ0=sDpjQvtsog+GT5gUWu1WPTzPejFaZg@mail.gmail.com>
Subject: Re: [PATCH] qemu: aspeed_timer: Use signed muldiv for timer resets
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
X-List-Received-Date: Mon, 14 Jan 2019 02:14:16 -0000

On Fri, 11 Jan 2019, at 23:00, Christian Svensson wrote:
> Ping. What's left to be done here?

I've taken Cedric's tree and pushed it to openbmc/qemu master, so the patch
is there. Did you send it upstream originally? That's where it should go, but that
will probably require fixing the issue I pointed out last time.

Andrew

> 
> On Tue, Nov 13, 2018 at 9:58 AM Christian Svensson <blue@cmd.nu> wrote:
> 
> >
> >
> > On Tue, Nov 13, 2018 at 1:27 AM Andrew Jeffery <andrew@aj.id.au> wrote:
> > > By inspection the concept of the patch seems okay to me. However, the
> > issue
> > > that host-utils.h takes care of in addition to providing helpers is
> > support for
> > > those helpers on systems that don't support 128-bit integers. The patch
> > should
> > > be sent to the upstream lists, and I don't think we should be breaking
> > > qemu-arm-* generally for systems that we might not care about.
> >
> > Ah, yes - I missed that there were two - one for systems with int128 and
> > one for them
> > without. Hm, that does complicate things.
> >
> > Given that we only have one operand that is ever negative, how do you feel
> > about a patch
> > that goes along the lines of:
> >
> > if (delta >= 0) {
> >   t->start += muldiv64(delta, NANOSECONDS_PER_SECOND, rate);
> > } else {
> >    t->start = (int64_t)t->start - muldiv64(-delta, NANOSECONDS_PER_SECOND,
> > rate);
> > }
> >
> > That should avoid any issues I think, save us/me from implementing a
> > signed muldiv,
> > but cost a bit on the readable code side.
> >
> >
