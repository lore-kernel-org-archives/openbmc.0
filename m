Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x241.google.com (mail-yw0-x241.google.com
 [IPv6:2607:f8b0:4002:c05::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vS9Q63hrvzDqBV
 for <openbmc@lists.ozlabs.org>; Tue, 21 Feb 2017 17:22:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="pFtfPQjz"; 
 dkim-atps=neutral
Received: by mail-yw0-x241.google.com with SMTP id 2so3496941ywn.3
 for <openbmc@lists.ozlabs.org>; Mon, 20 Feb 2017 22:22:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=E6/cEq+D18bPABCNfHmngKJyh1lhS2a7D6XZzuYSGD4=;
 b=pFtfPQjzXW33xfvnISmv3SpLwjgkLnMPaVuEB3lyAMd21wNCmiygRhiD0lgCpMqouL
 bt4G2oMesYO5GQ2m/eHi3gqY7Gq5cV0rO1BM6pMJD5ZsCL1KL6tQCAO4D/J6X8hD892m
 +ForH+/AljLv/VHvKyhm+NR/41x+r8ARVWvaGs+ymeevHuZ4+S/xT2NdwwZw5iXIYCdP
 IJRgzH9+QQ+uWdNx4GAurqw0L9XzT9dslJcE7aAQ2UFr+LPqnzIJbWZXM1IONL0HwF0o
 EmtbESUKNah13fEmWkMpBH5mLW2G4AXxD2pICBAZlnE+6gRdfq3SaaT018AaSfkVJtfV
 W8sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=E6/cEq+D18bPABCNfHmngKJyh1lhS2a7D6XZzuYSGD4=;
 b=uWkqpNnO8W3avSvty1zporV7v5fWYL5YGUejxD11Kelf0FMHwRFLdLptGnBReDpno0
 /zxoufy+KKdsxz7MLpAp0y/ZsrpyEPJ7DKlw+IqVJJ+pspwHULoHh/wzUmp9vBv8Yy4O
 YJ/Y99PVzXnB6cAYzPCHqOGzyONZcc0pjTIROY6uCBG4JhgfH2Qqh6gVvE9P+WubQxye
 QneO6790C8AoPV5jPMPWaPwMaGUQU6qn0nnssD0d37aZHHCtXQeuYJ9Hw6aeA4zpbFzb
 GxB8mMmD+NlJHY8KNEG/cpvwpbO1sIRWm0ibUUdJejru9tGDlG2CZhUEoCAEHj8rvGps
 7z2g==
X-Gm-Message-State: AMke39nhHU4EAkqpl118r5D8DdxdNqyoBSQ7Ca+D+e0rz0kxtPv2VVHdvp+I1UvNwrBITjVxlcwp4L71ckOLAQ==
X-Received: by 10.129.71.10 with SMTP id u10mr20212628ywa.174.1487658124477;
 Mon, 20 Feb 2017 22:22:04 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.27.133 with HTTP; Mon, 20 Feb 2017 22:21:44 -0800 (PST)
In-Reply-To: <1487303690.3661.42.camel@aj.id.au>
References: <20170214005104.11940-1-andrew@aj.id.au>
 <20170214005104.11940-3-andrew@aj.id.au>
 <CACPK8XfM6seGAO_Qfj5gM_G=D2cbVTbHLQXA034eerpPC7BFPQ@mail.gmail.com>
 <1487302684.3661.40.camel@aj.id.au>
 <CACPK8Xf-M-J838adk7Yre==y4PF_-6xHyfacs=WWy+NY8XpQPA@mail.gmail.com>
 <1487303690.3661.42.camel@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 21 Feb 2017 16:51:44 +1030
X-Google-Sender-Auth: w-LAqpDPrXh1aI7tcOs1vex59mM
Message-ID: <CACPK8Xdq2tE=0yQC1GkySrZkw=_NKtthMQhoEOBGj1wvem1dHA@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.7 v2 2/3] ARM: dts: aspeed-g5: Add LPC Host
 Controller node to LPC
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Patrick Williams <patrick@stwcx.xyz>, Rick Altherr <raltherr@google.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
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
X-List-Received-Date: Tue, 21 Feb 2017 06:22:07 -0000

On Fri, Feb 17, 2017 at 2:24 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
> On Fri, 2017-02-17 at 14:11 +1030, Joel Stanley wrote:
>> > On Fri, Feb 17, 2017 at 2:08 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
>> > On Fri, 2017-02-17 at 14:02 +1030, Joel Stanley wrote:
>> > > > > > On Tue, Feb 14, 2017 at 11:21 AM, Andrew Jeffery <andrew@aj.id.au>
>> > > wrote:
>> > > > Required for pinmux, which tests some bits in the LHC's IO space.
>> > > >
>> > > > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
>> > >
>> > > Large Hadron Collider!
>> > >
>> > > Does the ast2400 want to know about it's particle accelerator too?
>> >
>> > Nah, the ast2400 doesn't require a particle accelerator for pinctrl,
>> > and I don't think we have any other reason to need it (yet).
>>
>> I think we need it for mbox, assuming we end up enabling ast2400
>> platforms with that functionality.
>
> The registers used by mboxd are the "Host Interface Control" registers
> (HICRx), which are different to the "LPC Host Control" registers
> (LHCRx) used by pinmux.

Thanks for clarifying.

Applied to dev-4.7.

Cheers,

Joel
