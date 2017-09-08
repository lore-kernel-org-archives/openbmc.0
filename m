Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="hWpTMDNB"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="epTPjH+v"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xpLK66nDKzDqR8
 for <openbmc@lists.ozlabs.org>; Fri,  8 Sep 2017 12:06:18 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 2B40D20C63;
 Thu,  7 Sep 2017 22:06:16 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Thu, 07 Sep 2017 22:06:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=icCtGkv03aiYp+rUIgj+btEfmKu/I3h5aWuyy8wKE
 F4=; b=hWpTMDNBDrg8JUDqQBU7E2dYJRTmKBtgeoon39NB/o9PzPL2gb7wDlPGK
 3P4AIXNrH0Sx51pMSYLNVz+qixknmUTDEqTLX3IAz3rnOkwtvScp6/x86p2iouBK
 0YDQ1LMd0SidSxiRu/JPGeHPEMJj4AnoP5BPVYWNQTXKI4MQ2DpEK/MOWfEmUSCM
 ow3NmHSqMz4xljpCYIg5a4C8X4UH8/urQZMSsAG5h9EKmmz6l3WJIiQQg03F9GVt
 I4YqlpCtHLYla9k7Mvv+LpboyLLxhQFdLJEwHcZiOHkchgLHkWqiWDbp1tZ7cljE
 9M5zSYge6MEQdLfNOw9fzf3p+pvNw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=icCtGkv03aiYp+rUIg
 j+btEfmKu/I3h5aWuyy8wKEF4=; b=epTPjH+vpMnATDf0aJNdMiXQmZIJtF8xwg
 3r4wD2pt/vM8kWGBaM3CkGuBnn/lzKA++UN4QKFyd3v7QwnERHcLIuqGNr3TDIfD
 Ku4FLHJdtGecXe/8ZxkgsN82VCplEGpDMNGBi0LNSHsuALsa5zWD/YFUXYvUPAQ0
 zkr/d+MlVRgdMhq0jdNtWPu6cCndw5vz3zOM+S5y9Fpw/FT5H9Cc9HSZ3iLQ3Zuq
 5MAoL3PmHPAMuGN7wgm8tdHcU9NbuUGgUz7ed+3uY4mLxtJZUcL132ip9wZYWwmo
 hzZQZKA8WVXMmc22dzk/AT/dU2cbFpZ490EdjirYsv+Oaf/Z0aaA==
X-ME-Sender: <xms:GPuxWUU76E2fXvgZPv6S9GkkfMvnH_dg1Fkg8_goPSw0q_-jBPVZqw>
X-Sasl-enc: 0Drv8r9JHf1s+UI6EEqG/a8WYrtOabb1fXl1wzX+QjSi 1504836375
Received: from keelia (unknown [122.99.82.10])
 by mail.messagingengine.com (Postfix) with ESMTPA id 98F19241D9;
 Thu,  7 Sep 2017 22:06:13 -0400 (EDT)
Message-ID: <1504836369.6124.2.camel@aj.id.au>
Subject: Re: [PATCH] hwmon: pmbus: Make reg check and clear faults functions
 return errors
From: Andrew Jeffery <andrew@aj.id.au>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, jdelvare@suse.com, corbet@lwn.net, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 openbmc@lists.ozlabs.org, joel@jms.id.au
Date: Fri, 08 Sep 2017 12:06:09 +1000
In-Reply-To: <f5752c40-4f1a-c6d6-ee4f-8099e802815e@roeck-us.net>
References: <20170905070132.17682-1-andrew@aj.id.au>
 <20170905170002.GG11478@roeck-us.net> <1504657417.28363.8.camel@aj.id.au>
 <20170906225102.GA32210@roeck-us.net> <1504740749.5042.2.camel@aj.id.au>
 <b9209305-6273-6147-a6de-033a1b3d190b@roeck-us.net>
 <1504797770.5105.7.camel@aj.id.au>
 <cbbca5f6-4c40-d20e-b27d-2e965822ccb4@roeck-us.net>
 <1504832527.6124.1.camel@aj.id.au>
 <f5752c40-4f1a-c6d6-ee4f-8099e802815e@roeck-us.net>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-uysjrYDqCPcEeFgRvZbA"
X-Mailer: Evolution 3.22.6-1ubuntu1 
Mime-Version: 1.0
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
X-List-Received-Date: Fri, 08 Sep 2017 02:06:20 -0000


--=-uysjrYDqCPcEeFgRvZbA
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2017-09-07 at 18:26 -0700, Guenter Roeck wrote:
> On 09/07/2017 06:02 PM, Andrew Jeffery wrote:
> > On Thu, 2017-09-07 at 17:27 -0700, Guenter Roeck wrote:
> > > On 09/07/2017 08:22 AM, Andrew Jeffery wrote:
> > > > On Thu, 2017-09-07 at 06:40 -0700, Guenter Roeck wrote:
> > > > > On 09/06/2017 04:32 PM, Andrew Jeffery wrote:
> > > > >=20
> > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0
> > > > > > > Guess I need to dig up my eval board and see if I can reprodu=
ce the problem.
> > > > > > > Seems you are saying that the problem is always seen when iss=
uing a sequence
> > > > > > > of "clear faults" commands on multiple pages ?
> > > > > >=20
> > > > > > Yeah. We're also seeing bad behaviour under other command seque=
nces as well,
> > > > > > which lead to this hack of a work-around patch[1].
> > > > > >=20
> > > > > > I'd be very interested in the results of testing against the ev=
al board. I
> > > > > > don't have access to one and it seems Maxim have discontinued t=
hem.
> > > > > >=20
> > > > >=20
> > > > > Do you have a somewhat reliable means to reproduce the problem ?
> > > >=20
> > > > It seems we hit a bunch of problems by just continually
> > > > binding/unbinding the driver, if you don't apply that hacky oneshot
> > > > retry patch. We can hit problems (in our design?) with something li=
ke:
> > > >=20
> > > > # cd /sys/bus/i2c/drivers/max31785; \
> > > > 	echo $addr > unbind; \
> > > > 	while echo $addr > bind; \
> > > > 	do echo $addr > unbind; echo -n .; done;
> > > >=20
> > > > It should hit issues covered by this patch, as the register checks =
are
> > > > used in the operations used by probe.
> > > >=20
> > >=20
> > > Hmm ... I didn't use your driver but my prototype driver which also s=
upports
> > > temperature and voltage attributes, so if anything it should create m=
ore
> > > stress on the chip.
> >=20
> > I did add the temp and voltage attributes...
> >=20
> > Any chance you can give mine a try? I don't know what I would have done
> > to invoke this kind of behaviour, so it would be useful to know whether
> > or not it happens with one driver but not the other.
> >=20
>=20
> Will do.

Thanks. For reference, here's a devicetree description:

https://github.com/openbmc/linux/blob/dev-4.10/arch/arm/boot/dts/aspeed-bmc=
-opp-witherspoon.dts#L283


>=20
> > > =C2=A0 No error so far, after running the script for a couple
> > > of minutes. How long does it take for errors to appear, and how do I =
see
> > > that there is an error ?
> >=20
> > I'm seeing failures after anything from a handful of bind/unbinds, to
> > hundreds of bind/unbinds. It seems to vary.
> >=20
> > > Does the driver fail to instantiate ?
> >=20
> > Typically probe fails so the loop exits. It usually gets -EIO and the
> > shell spits out "No such device".
> >=20
> > Thanks for testing, it's a useful data point for us hunting down the
> > source of our problems.
> >=20
>=20
> I aborted the test after ~2,500 loops without error.

Yeah, I'd consider that fairly stable.

Cheers,

Andrew
--=-uysjrYDqCPcEeFgRvZbA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZsfsRAAoJEJ0dnzgO5LT5WoAQAJ2A8k0ItMqxdp1MmQLc0s7u
CXsjY58TW1t/i/WQSEaKTw+3aTNZRciXkpkyO0KkstApJVW3IlByhZ71e2jn7/59
cZlY9GjQhqS6CNl0P0i2bOB5+WEL+tma4/44IBJO3G8/wrMWDATVXIKiZjaGINdn
LdomDKMBvd/aQSkSpciJs0HfRiBBQo5oaxAnP9l6XYLRbBV/g0sYJyUMcpG4AZTh
sVzDjxGtQ5+ZbxX2SsWqIA5bOkV9bgo19ZM06KxvNUhh8TUzNx2tN3NYxWIUaf54
fBiPDdbH7BGWxwDHQUTanPLR32b9UiIgFnXGSMiPQiLmljX41O9Nf3r74JolOJSh
YyGULVGBl1s29+qd6KSpLVEv/90HTKhM//wrt0PmUSa2ACpydK8ItRGFuLS415Yp
BQeKdnRVRQbjsfW3tSJhsM/uIWo4xEJuvrEXjpQSmpmxaEoXv0Y2TKe3imUipDEg
5NElO76Y3q4ShDAs9O6OF4Oa60QZIO9cEaXycn2t3jxYwxfmTUubVncPshBKe0lV
61wr28ckEkE1q6DvLl8VOibywVSiJ//b7jcDSL0AxgraRnj0jP2y7EJjGozhMhqf
M9KIsnRqs+b/9Dhm/aIXkQFd9d1crAwSMPHuTaOsi8xLe8ffllb25kWoe2aohfgX
HiebK2YNSrEnE2iVbFjQ
=SYGU
-----END PGP SIGNATURE-----

--=-uysjrYDqCPcEeFgRvZbA--
