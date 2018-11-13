Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.29; helo=out5-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="F2a+iDSh"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="OTAlfDEi"; dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42v7kX4CM2zF35p
 for <openbmc@lists.ozlabs.org>; Tue, 13 Nov 2018 11:27:48 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 8361C22157;
 Mon, 12 Nov 2018 19:27:45 -0500 (EST)
Received: from web3 ([10.202.2.213])
 by compute4.internal (MEProxy); Mon, 12 Nov 2018 19:27:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 message-id:from:to:cc:mime-version:content-transfer-encoding
 :content-type:in-reply-to:subject:references:date; s=fm1; bh=zKb
 JQEkVlpuyKkLWTFk9XpR6BkC93Nn59c4q8yB6i1Y=; b=F2a+iDShh+gAzq/UwIY
 Fnm/aGUSeAJG4xkS07G0UQ3E/cH3wMxpXg8hd2CahFOneahxS2FtEe9wGEOTqKYS
 lnpXmLFl0uWsnkqOTeb5xpi1tpDtquhiS6EEaIZR+EFBSD0AoZXawSkb/yPKsPaP
 3vm4AXgPdtvJeuKO9VfwAEXsq6IokcaZO3BQ3Sh98jd/5LbkRs288YvR3mZsMygv
 DqTTqkftmTantQIZLcPWaBgrCXz23vb9SYJJ8EXEL8Kd4GZ4cv/KUEYw0xzourWZ
 5vkBnI+R+AoF8TVbJmvsrUYX6fUrqT2nnu3mbE18jzHwZmL1jEiqrKVwTfH+Po6I
 C8Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=zKbJQEkVlpuyKkLWTFk9XpR6BkC93Nn59c4q8yB6i
 1Y=; b=OTAlfDEi9+uOV01kZ5ZdMDfGntrJIyiDhuTP7KPrPRSK/rdlvAryRnUoy
 B/8e3eQ6ioewKUmkVa42XRNRzopNGrQeFIVgJx3keRulH+OdURk/4pwvJQklQ2Bw
 B3MSZWJCO4Ap7dyu9+OT3mdu+CVZGsXBMuo4F7FuJByzC9Kggi3XF1hR6Qz8rl8L
 GLx9tjQtWjwPrZuPPkwaYfzsx2hk0FuJkQ/DTb8ZxNe9Fyrp4M94r+NGEt54F/3W
 cEZXgANYSRTLR3rPS+JksqIxN4nuh2N9hCuwmaBbeMST+ICDUFJBN4/frWLGxgVe
 9pGdF7vF3Av8UqdrDIN6KzsuQTp2g==
X-ME-Sender: <xms:fxrqW2F6jz9RzoYf3Sh02Ap0e4nZ1EHxcpx7AoZgYeqreboaNYo3PQ>
X-ME-Proxy: <xmx:fxrqW5jwOoykKAlx1IOWFmMZJedvV6Hi9kmuY5KUnG__2jGOtzUdEg>
 <xmx:fxrqWzU21A-T2XMcdApktYxVpiNSMYHrscqwi4AtDMFjcawwIgAPOg>
 <xmx:gBrqW1KquLE69tg_nRM0GcvVcuG4phuWqpFDZVI40vz7wxDJb8lKaA>
 <xmx:gBrqW60Ty5HHuMVQFXytj24_2DE06SjuIw9M5d57COBJfDugjN91MA>
 <xmx:gBrqW9APArCDZ5qDfUIMqiuhkX-K63vPFyKfkx7hhPd-EO0WEI84xg>
 <xmx:gRrqW4Rz_VY3ROLKw-N2g6sW0a13MRvMDzdogzMaROS3XYb6hhYO7w>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id DC2589E570; Mon, 12 Nov 2018 19:27:43 -0500 (EST)
Message-Id: <1542068863.1552891.1574692280.790D270F@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: Christian Svensson <blue@cmd.nu>, clg@kaod.org
Cc: Christian Svensson <bluecmd@google.com>,
 "openbmc @ lists . ozlabs . org" <openbmc@lists.ozlabs.org>,
 Joel Stanley <joel@jms.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-c0552f07
In-Reply-To: <CADiuDAQ1mjh56ibSd+tNq2NFiJFtLcAfyoC8fdd=y+4Mu+jD6w@mail.gmail.com>
Subject: Re: [PATCH] qemu: aspeed_timer: Use signed muldiv for timer resets
References: <20181112142137.160970-1-bluecmd@google.com>
 <21acbd66-c75c-d5e3-fcfb-fa75421a7879@kaod.org>
 <CADiuDAQ1mjh56ibSd+tNq2NFiJFtLcAfyoC8fdd=y+4Mu+jD6w@mail.gmail.com>
Date: Tue, 13 Nov 2018 10:57:43 +1030
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
X-List-Received-Date: Tue, 13 Nov 2018 00:27:53 -0000

On Tue, 13 Nov 2018, at 05:15, Christian Svensson wrote:
> Hi
> On Mon, Nov 12, 2018 at 7:37 PM C=C3=A9dric Le Goater <clg@kaod.org> wrot=
e:
> > isn't QEMU using the helpers from :
> >
> >         include/qemu/host-utils.h
> >
> > which do about the same ?
>=20
> Multdiv64 only takes unsigned ints, and while I'm not familiar with the
> details of how that propagates to the division, it seems to result in
> nonsensical values for negative inputs.
> Before copying this logic here I looked for an equivalent for signed ints
> but did not find any suitable one, and the expansion seemed simple enough.
>=20
> You can see more details in
> https://github.com/openbmc/qemu/issues/14#issuecomment-437692215.

By inspection the concept of the patch seems okay to me. However, the issue
that host-utils.h takes care of in addition to providing helpers is support=
 for
those helpers on systems that don't support 128-bit integers. The patch sho=
uld
be sent to the upstream lists, and I don't think we should be breaking
qemu-arm-* generally for systems that we might not care about.

Andrew
