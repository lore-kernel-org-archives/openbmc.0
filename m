Return-Path: <andrew@aj.id.au>
Received: from homiemail-a11.g.dreamhost.com (sub3.mail.dreamhost.com
 [69.163.253.7])
 (using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qywW94kQLzDqCQ
 for <openbmc@lists.ozlabs.org>; Mon,  2 May 2016 17:13:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dkim=fail reason="signature verification failed" (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=osyc/qwx; 
 dkim-atps=neutral
Received: from homiemail-a11.g.dreamhost.com (localhost [127.0.0.1])
 by homiemail-a11.g.dreamhost.com (Postfix) with ESMTP id CEEFA6E074;
 Mon,  2 May 2016 00:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=message-id
 :subject:from:reply-to:to:cc:date:in-reply-to:references
 :content-type:mime-version:content-transfer-encoding; s=aj.id.au
 ; bh=p4qvizDbmT2SBocXjM/PnlpWo+I=; b=osyc/qwxJUC3yFfD40cGmy3opMf
 T0fEUtLA82/76BjLuGwtnyr20gYJmu0LE/N2FeWjLLZNGXeB3D61qQdR/fI0AzcM
 VzPM/5bOWQGB7Jg8xcgQD72U/ddTvCNHm0ALlYGMtIiyY5/bCQLkfz2qQqJhRNJR
 rKEpDlh493gW3Lnk=
Received: from keelia (unknown [203.0.153.9])
 (using TLSv1 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: andrew@aj.id.au)
 by homiemail-a11.g.dreamhost.com (Postfix) with ESMTPSA id 99EBB6E072;
 Mon,  2 May 2016 00:13:05 -0700 (PDT)
Message-ID: <1462173181.3462.29.camel@aj.id.au>
Subject: Re: qemu: Question about including Facebook's Yosemite board
From: Andrew Jeffery <andrew@aj.id.au>
Reply-To: andrew@aj.id.au
To: Joel Stanley <joel@jms.id.au>, Teddy Reed <teddy.reed@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Date: Mon, 02 May 2016 16:43:01 +0930
In-Reply-To: <CACPK8XeO=pANLMuVKW-1MkJ3eRymHMynH0Q-PjjJNnTX-TeLTg@mail.gmail.com>
References: <CADUykeoN5=KtG7FKuCOrDEY5u46VjJN3mvqmuC8CpkaemFrMNw@mail.gmail.com>
 <CACPK8XeO=pANLMuVKW-1MkJ3eRymHMynH0Q-PjjJNnTX-TeLTg@mail.gmail.com>
Organization: IBM OzLabs
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.18.5.2-0ubuntu1 
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 02 May 2016 07:13:10 -0000

On Mon, 2016-05-02 at 12:06 +0930, Joel Stanley wrote:
> On Sun, May 1, 2016 at 5:57 AM, Teddy Reed <teddy.reed@gmail.com> wrote=
:
> >=20
> > I'd like to model the Facebook Yosemite board in QEMU, which from the
> > QEMU model perspective, is almost equivalent to the Palmetto. The onl=
y
> > requirement for the board, outside of the AST2400 capabilities, is th=
e
> > inclusion of 2 flashes.
> >=20
> > Here's an example of what I mean:
> > https://github.com/theopolis/qemu/blob/bc20ef6a7a17f8424571234d4429e7=
e6b67f17e8/hw/arm/fbyosemite-bmc.c#L78
> Great! This is really useful.
>=20
> >=20
> > If you don't mind including those flash definitions in the Palmetto
> > model I can save some QEMU complexity by not adding another board
> > definition, which IMO is ideal. If that's the case, I can also submit
> > a patch to add the flashes ASAP.
> I'm torn. Similar to Andrew's work to get the GEM ethernet device
> working in the palmetto board, I'm not sure we want to add hacks to
> that don't represent the physical system. OTOH, it's nice to be able
> to boot a flash image in Qemu.

I think we need to be a bit nuanced about it to avoid throwing the baby
out with the bath water. We haven't yet modelled the flash controller,
and the hack (almost*) gives us the ability to boot the bitbake flash
output file. Regarding the GEM NIC: we have a ftgmac100 QEMU model, but
it has issues; having networking is an advantage if you consider
running automated testing[0] as part of a CI setup. It's better if the
models reflect the hardware but since they are not ready to go I think
the benefit the hack is reasonable.

We're in the right place if we're making an up-front decision about
technical debt and having a plan for paying it down. With networking we
can resolve it by fixing up the bugs in the existing (but not upstream)
ftgmac100 model, and ripping out the Cadence GEM. In the case of the
flash controller we have to write it from scratch, but we need to do
that regardless. I think what we should push back against is bad code,
which we can do with code review.

Andrew

* Should, with the DRAM-training-SCU-bit-workaround

[0]=C2=A0https://github.com/mkumatag/openbmc-automation
