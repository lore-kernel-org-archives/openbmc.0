Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=64.147.123.24; helo=wout1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="avxXWXRB"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="Wt4Z3hsn"; dkim-atps=neutral
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44jqx85BJGzDqFH
 for <openbmc@lists.ozlabs.org>; Tue, 16 Apr 2019 13:05:16 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 7410E61F;
 Mon, 15 Apr 2019 23:05:13 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Mon, 15 Apr 2019 23:05:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type:content-transfer-encoding; s=fm2; bh=yebB4
 CKu1LUTL+Ox34gt4MQMR8DVtlBCgbdI6Mfoa6w=; b=avxXWXRB71KiWzB6iu3mv
 DUC7eaiZT0o9C2X9XQNjN62x6fs4Vjx8qvnpMIRmRphYxnKWfrH39lJwZCygBLcU
 ATEqezSNIc+YjeB0z2Oqdrqp7tUxpwKdC+xGCzv616UawKe0mdnE9NSpo4klzAOh
 mALNeHOFXQKoZTEstk3gwJhyu5FGAX2Kx8NePRddgFg3npf5gT60r6evS8ITT8mq
 XGj9760uGPlG5u17DcGrfYnBYVk7rwqFQhmOC0e5NtnFDBKWFjYYn3Lt9+LUHpsW
 iwGpu0fHPmsm2FD5RrHMn3nFlImjYqIUVaY5Ta9ISLOILe/8rVRwPHUiEw/u4y2b
 A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=yebB4CKu1LUTL+Ox34gt4MQMR8DVtlBCgbdI6Mfoa
 6w=; b=Wt4Z3hsnTalPqwTkgh/cZL4RPkV5mm16hUjmafzMZ1IEVtJacFqeLYBCJ
 Wv8w3djHSw/3U2kUZuRJWsfVTXk/4Jmov/CQoUo8l0PA68b3DJjcKKE7P/RY47ST
 TTje4S3/me1nn0Qqs2hBJ/FNC6VG7TMzGIrBLdBq+NWWIDIX1v5U1EU84EImxZ5z
 o2QDdDt1Vq9K9SamB3ZuwMGHWgPA4dZxM4mil/dku/BM41NG8aoSADNG79G8UhWg
 wCtNL95xUgoYH0cqkZDhOpQ8vyVwW8oem6SnkYBdP1XvGoObntTkKm8L+ZY2Aa79
 nJ12uB8epfEBjFlZe3QgFyC79j8TA==
X-ME-Sender: <xms:aEa1XIw4cCDu9WRH4in3_JwmuyYycYXO3jsWiHrl5PphRB0J-J8Y4Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrfedtgdeihecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtgfesthhqredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecurfgrrh
 grmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgv
 rhfuihiivgeptd
X-ME-Proxy: <xmx:aEa1XP8cFyNQScHONc5PnodZCHrrGZHdtm-wPm0qEo8O2N87JMxj2Q>
 <xmx:aEa1XELNu9omK_Lk-ZmDn9nvLCDRYDUnFfVvoYSOzL8vo8tL2rkv7Q>
 <xmx:aEa1XNcgJTX83AAAlQNgdH0pexzvYYpp_qdy3ikZHSiql1V8ecu9wQ>
 <xmx:aUa1XMHU19kNywKCUTxImGNlqh232iXJuUS_2N2Gx7BfCqCgZz9SvA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 51B187C199; Mon, 15 Apr 2019 23:05:12 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-332-g22ddc6a-fmstable-20190412v1
Mime-Version: 1.0
X-Me-Personality: 52947553
Message-Id: <d5906e53-9e7a-44f3-b8af-c09e7c4db62a@www.fastmail.com>
In-Reply-To: <CAO=notx6cuUuARoDLrcrMX0fVQdVYahfvUbDNOwj588_0q-Bbg@mail.gmail.com>
References: <CAO=notxhe24e8-1dTcspD_H7xTy49yEnnn-gJbUciekirzKC_w@mail.gmail.com>
 <CACPK8XfwP_DwqthSwgFGMjqRepGkC1XdziZ+eEds=6ND_Ov71Q@mail.gmail.com>
 <CAO=notwAcxqFTN31Ecfd50rkjKm9X7PQsTFAP4Rc_xvN0wALUQ@mail.gmail.com>
 <e44834c9-2755-1d05-1df1-d0fa930d48bd@kaod.org>
 <CAO=notxCM7hR7bXXOi3Z86PikHxAj7CXSDWda-KV9wWxKSwBdg@mail.gmail.com>
 <CAO=notx6cuUuARoDLrcrMX0fVQdVYahfvUbDNOwj588_0q-Bbg@mail.gmail.com>
Date: Mon, 15 Apr 2019 23:05:11 -0400
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Patrick Venture" <venture@google.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: "Joel Stanley" <joel@jms.id.au>,
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
X-List-Received-Date: Tue, 16 Apr 2019 03:05:20 -0000

On Tue, 16 Apr 2019, at 01:06, Patrick Venture wrote:
> On Wed, Apr 10, 2019 at 10:13 AM Patrick Venture <venture@google.com> =
wrote:
> >
> > On Wed, Apr 10, 2019 at 9:02 AM C=C3=A9dric Le Goater <clg@kaod.org>=
 wrote:
> > >
> > > On 4/10/19 4:39 PM, Patrick Venture wrote:
> > > > On Tue, Apr 9, 2019 at 7:17 PM Joel Stanley <joel@jms.id.au> wro=
te:
> > > >>
> > > >> On Tue, 9 Apr 2019 at 16:35, Patrick Venture <venture@google.co=
m> wrote:
> > > >>>
> > > >>> HI, I ran into some weirdness when transitioning from 4.17.18 =
to 5.0.6
> > > >>> with the quanta-q71l board.  More specifically now my host can=
't talk
> > > >>> to the BMC via ipmi-bt.  All it returns is 0xd5.  on the BMC i=
tself, I
> > > >>> can talk to ipmid file via dbus, and btbridge is running.
> > > >>>
> > > >>> Has anyone else run into weirdness?
> > > >>
> > > >> I've not seen that.
> > > >>
> > > >> My only guess is there is an issue with clocking. Can you try b=
ooting
> > > >> the machine with clk_ignore_unused in your kernel command line?=

> > > >
> > > > I'll give it a shot, although IPMI not working is odd since the
> > > > LPC_CLK is enabled.  But yeah, I'll try that today and reply bac=
k,
> > > > thanks.
> >
> > root@localhost:~# cat /proc/cmdline
> > console=3DttyS4,115200n8 root=3D/dev/ram rw clk_ignore_unused
> >
> > ./gbmctool -command firmware -action get -field version
> > Get Device ID command failed: 0xd5 Command not supported in present =
state
> > E0410 10:12:01.640883  456408 real_main.cc:53] Unable to send code:
> > Command not supported in present state
> >
> > So that didn't fix it unless I need to reboot the host as well.
> >
> > >
> > > I don't see this issue on a palmetto, BMC running with 5.0.5.
>=20
> Looks like the issue is 5.0.6 doesn't have the lpc parameter optional =
patchset.

The only place I've found the patch applied is in one of Joel's personal=
 trees.

Seems bizarre.

Andrew
