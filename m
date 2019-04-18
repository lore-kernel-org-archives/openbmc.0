Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="u7pOdwTa"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="mIHanfBY"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44l8982xx9zDqB5
 for <openbmc@lists.ozlabs.org>; Thu, 18 Apr 2019 16:20:12 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id CD421221B2;
 Thu, 18 Apr 2019 02:20:09 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Thu, 18 Apr 2019 02:20:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type:content-transfer-encoding; s=fm2; bh=ldWf2
 RCiNPwSe+BGxqVQ7ucaJZfEnca/qZKoSoH9f+8=; b=u7pOdwTaktS5lZ9CqR9NS
 Rtla4wgiaIrH0nLlcvsuuIChuwUjteI8AMuZE4f66NTsP+0+jebHoxHDiBg+y5/E
 8ta1SeJnSx7QGoCroYb+Tlee5DK6zTwMaduMT+GyiEZDxIjl5KyQs8K1iCqxcTed
 yl97smyRM3xrYwKEZ5uW1UEkuphru5DtFFWzYRvWN8iswxSjE+lizT2SVaNSwfxX
 lSrUKaHxl00Qu7aVtxjRWdA/PbArb0RM4WpIrQPH51o/aB6U6Pj4W2pCtQDPrjqa
 1f5nwZbV7wh6Q3z4d27lxGfJ6Ae5+Xqvy6tHwbtMX9pVo5H1BE+dQQsJ1Foau9U+
 w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=ldWf2RCiNPwSe+BGxqVQ7ucaJZfEnca/qZKoSoH9f
 +8=; b=mIHanfBYf83CgLELyqUt9knxr9FLXueFFtZRa1kUQh6RYZPUC5xt4Jshz
 SVyhxAfj1YchFJixJxe7NR/aEnhmswLzoVjb2CkeH75vyU3Dif6E9DICOS3IQMgf
 rf/OS1Rcrr9zCl9gSWS56RsV8cDWSWoqH3S92PBdTGGKwAwXqP9cLKp1Xwh0K7kG
 JJcRb3QL4SX6u4RDV712FWN07FoGs30/GKPAKXP1feGXINljB2fpHFbQDxgoQ7VP
 z2c6ayHZczBOHPL3E+BZ1FNWRBx+FFGiyCPY5/svz5TCyTlng4rjiCNlWGjwDG49
 sEl0F2o/G7oszbNiwXVgecWAuzTIA==
X-ME-Sender: <xms:GBe4XINQaojMuwmzfkndDqIhyQEzwN-XEOgyRzQItgJWJAV4WEIltA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrfeeggddutdefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgfgsehtqhertderreejnecuhfhrohhmpedftehn
 ughrvgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfrrg
 hrrghmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushht
 vghrufhiiigvpedt
X-ME-Proxy: <xmx:GBe4XGoQ_17-m9jLMQFfGksXjtQsSrj2DKHtUoozyUz2WHEj8HyxIg>
 <xmx:GBe4XBdJvwsCuBcVoww3J0_TaZgPyP9ARAjN4iFkDc6FIbOD67RBNw>
 <xmx:GBe4XPZN-vfbtupWH_5LqZP-BP1dKoYFdwpzNzCNFqUMjwgnksUSqQ>
 <xmx:GRe4XHaRSmDh64moXqO34hXcsc4BFr538ZBb9b1Q4VSlrCs3FOSlww>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 1C35B7C199; Thu, 18 Apr 2019 02:20:08 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-443-g918f9d3-fmstable-20190416v3
Mime-Version: 1.0
X-Me-Personality: 52947553
Message-Id: <66a33cb9-19fe-4ccb-8449-76d2ba807cb1@www.fastmail.com>
In-Reply-To: <CAO=notwm0eqmk1G+B-YziEf0Y=6PjAPM-Pu=d1Kc6Q_3QD0B7g@mail.gmail.com>
References: <CAO=notxhe24e8-1dTcspD_H7xTy49yEnnn-gJbUciekirzKC_w@mail.gmail.com>
 <CACPK8XfwP_DwqthSwgFGMjqRepGkC1XdziZ+eEds=6ND_Ov71Q@mail.gmail.com>
 <CAO=notwAcxqFTN31Ecfd50rkjKm9X7PQsTFAP4Rc_xvN0wALUQ@mail.gmail.com>
 <e44834c9-2755-1d05-1df1-d0fa930d48bd@kaod.org>
 <CAO=notxCM7hR7bXXOi3Z86PikHxAj7CXSDWda-KV9wWxKSwBdg@mail.gmail.com>
 <CAO=notx6cuUuARoDLrcrMX0fVQdVYahfvUbDNOwj588_0q-Bbg@mail.gmail.com>
 <d5906e53-9e7a-44f3-b8af-c09e7c4db62a@www.fastmail.com>
 <CAO=notwm0eqmk1G+B-YziEf0Y=6PjAPM-Pu=d1Kc6Q_3QD0B7g@mail.gmail.com>
Date: Thu, 18 Apr 2019 02:20:07 -0400
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Patrick Venture" <venture@google.com>
Cc: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 "Joel Stanley" <joel@jms.id.au>,
 "OpenBMC Maillist" <openbmc@lists.ozlabs.org>
Subject: Re: transitioning from 4.17.18 to 5.0.6
Content-Type: text/plain;charset=utf-8
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
X-List-Received-Date: Thu, 18 Apr 2019 06:20:13 -0000



On Tue, 16 Apr 2019, at 23:56, Patrick Venture wrote:
> On Mon, Apr 15, 2019 at 8:05 PM Andrew Jeffery <andrew@aj.id.au> wrote=
:
> >
> > On Tue, 16 Apr 2019, at 01:06, Patrick Venture wrote:
> > > On Wed, Apr 10, 2019 at 10:13 AM Patrick Venture <venture@google.c=
om> wrote:
> > > >
> > > > On Wed, Apr 10, 2019 at 9:02 AM C=C3=A9dric Le Goater <clg@kaod.=
org> wrote:
> > > > >
> > > > > On 4/10/19 4:39 PM, Patrick Venture wrote:
> > > > > > On Tue, Apr 9, 2019 at 7:17 PM Joel Stanley <joel@jms.id.au>=
 wrote:
> > > > > >>
> > > > > >> On Tue, 9 Apr 2019 at 16:35, Patrick Venture <venture@googl=
e.com> wrote:
> > > > > >>>
> > > > > >>> HI, I ran into some weirdness when transitioning from 4.17=
.18 to 5.0.6
> > > > > >>> with the quanta-q71l board.  More specifically now my host=
 can't talk
> > > > > >>> to the BMC via ipmi-bt.  All it returns is 0xd5.  on the B=
MC itself, I
> > > > > >>> can talk to ipmid file via dbus, and btbridge is running.
> > > > > >>>
> > > > > >>> Has anyone else run into weirdness?
> > > > > >>
> > > > > >> I've not seen that.
> > > > > >>
> > > > > >> My only guess is there is an issue with clocking. Can you t=
ry booting
> > > > > >> the machine with clk_ignore_unused in your kernel command l=
ine?
> > > > > >
> > > > > > I'll give it a shot, although IPMI not working is odd since =
the
> > > > > > LPC_CLK is enabled.  But yeah, I'll try that today and reply=
 back,
> > > > > > thanks.
> > > >
> > > > root@localhost:~# cat /proc/cmdline
> > > > console=3DttyS4,115200n8 root=3D/dev/ram rw clk_ignore_unused
> > > >
> > > > ./gbmctool -command firmware -action get -field version
> > > > Get Device ID command failed: 0xd5 Command not supported in pres=
ent state
> > > > E0410 10:12:01.640883  456408 real_main.cc:53] Unable to send co=
de:
> > > > Command not supported in present state
> > > >
> > > > So that didn't fix it unless I need to reboot the host as well.
> > > >
> > > > >
> > > > > I don't see this issue on a palmetto, BMC running with 5.0.5.
> > >
> > > Looks like the issue is 5.0.6 doesn't have the lpc parameter optio=
nal patchset.
> >
> > The only place I've found the patch applied is in one of Joel's pers=
onal trees.
>=20
> That would explain why I couldn't find it in the usual places.
>=20
> >
> > Seems bizarre.
>=20
> Sorry, I stopped following that patchset a while back, I just assumed
> it landed.  Was there some push back?

Not that I'm aware of. Vijay has been pinging Joel periodically, I'm not=

sure why he hasn't merged it. I'd like to wait until Joel can respond in=

case there's something I've missed here.

Andrew
