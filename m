Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="vLRvxGI0"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="SNVPL4zP"; dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43dGTP6mcRzDqRF
 for <openbmc@lists.ozlabs.org>; Mon, 14 Jan 2019 12:43:37 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 262E228CD8;
 Sun, 13 Jan 2019 20:43:35 -0500 (EST)
Received: from web3 ([10.202.2.213])
 by compute4.internal (MEProxy); Sun, 13 Jan 2019 20:43:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 message-id:from:to:cc:mime-version:content-transfer-encoding
 :content-type:references:subject:date:in-reply-to; s=fm1; bh=otR
 6+LW7YYtCw1eoPvNwllwp2TyfXDukMLcx93kQF2Q=; b=vLRvxGI0pxHhXXm8T5C
 yA7MgzfcW5o95cu29hB++7XJAA5fwG3XqIPVWtLJZ4LxZa2+ekNZ2jMXzJknIz2Y
 334nJc0ikEbpOmag4LiyjcaRfY4dOEcCwtlDoKQqkwNyqRMgooJA0HxNdQcvJQ5X
 x2F5qPw4qDHvWihR32OmCqQGBXfE7t0QGOuvZmYuXoPuqI+4RXQIB1XoGaWGYN8v
 Iyx2M442oks+yKSgy03bV53KubH6aMH92kCGXH39SKtYIAPBFzd9hzPk8nOcRZ+q
 Zr4QgFrtAI13p+yUio2tHZHZOfskHPLUx16uNHjv9POjv+As/jU9nrqfDFCnbiIw
 fUg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=otR6+LW7YYtCw1eoPvNwllwp2TyfXDukMLcx93kQF
 2Q=; b=SNVPL4zPlMoPAZAZUoewjRXZtq+WV8Rko98e7lUjREH+WyTcS1wl56PDo
 Ij4T2JDulKHzUO+C2QPMG/LcHxtpsdDQFK/STWVxLpw45zN7kVLYZQsb/Yr1LsJg
 PWpm+INsauLOYfjIU+tuKa8GEB2dqca/aVOs5H6IK1/KB6WzyX+ApoO6tj15s2aq
 ZKODz6aYdtQ++CGrAVW0XOSsbK1qt5H65cj4026W7cTh7euy8Dp7YTCnqfvlsy0F
 DJjb6Mh2kCguWQPGJcp4T53+3peNqYINwjLekuHQ+7AIXlAe+vA3WC/ARC9+EAkO
 TmD4ipfhvm6V/Vod2oWo+6xvTpo6g==
X-ME-Sender: <xms:Ruk7XMQnFYTgMj9L87QcM3UDx_j-QBTT8mWzTFNH8bPWGNDFaxYmFQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedtledrgedtgdefkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfhuthenuceurghilhhouhhtmecufedt
 tdenucenucfjughrpefkhffvggfgtgfofhfuffgjsehtqhertdertdejnecuhfhrohhmpe
 etnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucff
 ohhmrghinhepohiilhgrsghsrdhorhhgnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnh
 gurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:Ruk7XOD7kIAi1sdaGzROV9ZphhDfdqgZXdZGOadNIjVoul6R-7trQA>
 <xmx:Ruk7XE1rMTS3QfMWXBmlm_GpnyRD4-ujmPN2sbqFpK3vr7Qwlf5T1Q>
 <xmx:Ruk7XEXnbF9RTAmXw8JwbFLdLRQ0OUGI1DaVuGMMntr0hfy2Yv3hCA>
 <xmx:R-k7XKjZzEj5C8D0ZZKSGC1BpNWn4WbWGRHEHH4j9J5bduR-EhjUbw>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id 1D8FF9E564; Sun, 13 Jan 2019 20:43:34 -0500 (EST)
Message-Id: <1547430214.2367641.1633616584.6059DC2B@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: =?utf-8?Q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 openbmc@lists.ozlabs.org
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-36e4bfd3
References: <20190111035638.19725-1-andrew@aj.id.au>
 <a0e97564-63de-0820-d550-d2b45e92bee0@kaod.org>
Subject: Re: [RFC qemu legoater/aspeed-3.1 0/4] Handle short timer periods
Date: Mon, 14 Jan 2019 12:13:34 +1030
In-Reply-To: <a0e97564-63de-0820-d550-d2b45e92bee0@kaod.org>
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
X-List-Received-Date: Mon, 14 Jan 2019 01:43:41 -0000

On Fri, 11 Jan 2019, at 20:44, C=C3=A9dric Le Goater wrote:
> Hello Andrew,
>=20
> On 1/11/19 4:56 AM, Andrew Jeffery wrote:
> > Hello,
> >=20
> > We've had an issue for a while, since the introduction of 4451d3f59f2a
> > ("clocksource/drivers/fttmr010: Fix set_next_event handler") in Linux, =
where
> > our qemu instances have a "sticky" behaviour. The VM becomes unresponsi=
ve at
> > unexpected times for unpredicable but often long periods of time.
> >=20
> > This series, along with the associated patch to Linux's fttmr010 driver=
[0],
> > aims to resolve it.
> >=20
> > [0] http://patchwork.ozlabs.org/patch/1023363/
>=20
> I gave the whole a try and on a x86 host, QEMU reaches :
>=20
> [    8.282333] systemd[1]: Set hostname to <romulus>.
>=20
> on a ppc64el :
>=20
> [   11.497910] systemd[1]: Set hostname to <romulus>.
>=20
> which is much better than before.
>=20
> As the QEMU patchset does not seem to impact support for older images,=20
> I have updated the aspeed-3.1 branch and also created a new branch for=20
> dev : aspeed-4.0.
>=20
> > The series an RFC series because it doesn't fix all the cases, just
> > demonstrates a potential way forward. The approach is to provide back-p=
ressure
> > - to test if the reload value is set to a value that's smaller than some
> > experimentally determined value (in this case, 20us), and if so, config=
ure a
> > period of at least 20us. The MAX() of the requested and minimum values =
is then
> > set in the reload register rather than the requested value, which can t=
hen be
> > read back by Linux. The fttmr010 driver, upon observing the greater val=
ue,
> > starts pushing back on the clock event subsystem, which then iteratively
> > determines a minimum acceptible event period before proceeding with the=
 boot
> > process.
> >=20
> > The implementation does not take care of the match register cases, but =
at the
> > moment they are unused by Linux on Aspeed SoCs. The match register case=
 is not
> > taken care of because I'm not sure if this implementation is what we wa=
nt to
> > use going forward, or whether we want to do something that's completely=
 hidden
> > in the qemu model. However taking advantage of Linux's existing support=
 for
> > determining minimum timer periods seemed like easy solution.

Do you mind helping me hash out the full behaviour?

The key requirement is that any modelled timer period not be shorter than e=
.g. the
20us I picked. So there are a number cases:

MIN_PERIOD =3D ticks(20us)

1. RELOAD < MIN_PERIOD
2. RELOAD >=3D (2 * MIN_PERIOD), MATCH{1,2} < MIN_PERIOD
3. RELOAD >=3D (2 * MIN_PERIOD), (RELOAD - (RELOAD - MATCH{1,2})) < MIN_PER=
IOD
4. MIN_PERIOD <=3D RELOAD < (2 * MIN_PERIOD), MATCH{1,2} < RELOAD
5. RELOAD > (2 * MIN_PERIOD), MIN_PERIOD < MATCH1 <=3D (RELOAD - MIN_PERIOD=
), 0 <=3D (MATCH1 - MATCH2) < MIN_PERIOD
6. RELOAD > (2 * MIN_PERIOD), 0 <=3D (MATCH2 - MATCH1) < MIN_PERIOD, MIN_PE=
RIOD < MATCH2 <=3D (RELOAD - MIN_PERIOD)
7. RELOAD < (3 * MIN_PERIOD), 0 < MATCH1 < RELOAD, 0 < MATCH2 < RELOAD

The provided patches only solve case 1 (with the assumption that the match
registers contain an irrelevant value).

For the rest, I think we need to implement the following:

Each time RELOAD, MATCH1, or MATCH2 are modified, check the constraints
above, and expand all values as necessary to accommodate the minimum period
constraint of 20us. With the constraint of "not-before" on a timer event,
conceptually the algorithm looks like the following for the most general ca=
se of
two valid match register values:

* Define registers RELOAD, MATCH1, MATCH2

* Sort the values of RELOAD, MATCH1 and MATCH2 such that we have values
R > X > Y > 0 where R maps to RELOAD, and X and Y to MATCH1 and MATCH2 as
appropriate

* Set dY =3D MAX(MIN_PERIOD - (Y - 0), 0);
* Set Y =3D Y + dY
* Set X =3D X + dY
* Set R =3D R + dY
* Set dX =3D MAX(MIN_PERIOD - (X - Y), 0);
* Set X =3D X + dX
* Set R =3D R + dX
* Set dR =3D MAX(MIN_PERIOD - (R - X), 0);
* Set R =3D R + dR

* Assign R, X and Y back to RELOAD, MATCH1 and MATCH2 as appropriate

With this we require R <=3D (UINT32_MAX - (2 * (MIN_PERIOD - 1))) to
allow for any adjustments.

The downfall of this approach is it only works for a stopped timer. I can't=
 see
how we could expand time on a running timer to account for a short match pe=
riod
*and* keep consistency with the monotonic decrease of the status register.

Unless we use shadow registers or track things like ticks-per-tick? Current=
ly the
way the timer is implemented is it derives the ticks and time periods direc=
tly from
the configuration of the model. If we implement a set of shadow registers t=
hat
contain the expanded times above and we translate between the configured va=
lues
and the dilated time it might be possible?

That's a half-baked thought, so if it doesn't make sense please ask questio=
ns and
I'll try to untangle the idea from the wool in my head.

It seems this needs some deep consideration :/

Andrew
