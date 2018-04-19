Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c09::242; helo=mail-qk0-x242.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="p7qoK+BL"; 
 dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="nzrybREY"; 
 dkim-atps=neutral
Received: from mail-qk0-x242.google.com (mail-qk0-x242.google.com
 [IPv6:2607:f8b0:400d:c09::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40RQRW36C7zF22J
 for <openbmc@lists.ozlabs.org>; Thu, 19 Apr 2018 14:07:02 +1000 (AEST)
Received: by mail-qk0-x242.google.com with SMTP id s78so4143827qkl.8
 for <openbmc@lists.ozlabs.org>; Wed, 18 Apr 2018 21:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=cQa6dkrZ2IbiQavFh4n73JHEvUmRv1RaZrhqBK8rBek=;
 b=p7qoK+BLRgcBwVnyVX8hVGkD2qWz2B3uVBYK3RYImGeiSa2I+k+g5uiqiZdNuNH+73
 IYTyuU8Uvhku51oDI4ZCk5F9aUqZZC7LZ0HPGam6nby9uxe2Fae2lNMfXQ6esTL3djR/
 x8i/j97GZ0pUlP7jCJr2bm4NLylNd1bfnSP7tAesHIy0VrwVq6yqJf6z5MYUzftJwEos
 kKCGvv8hUxmCK/HitbPZD03+LqybFUY+37komAfM6cEapYLgnmGn4xy+zQg7iHO0KvMM
 wGS8dTF7nRznVBjgKUTPClo+DctSKgozoKOOxA9KczXzNepurCnhM/GZdhkxfSbDVDnX
 RndA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=cQa6dkrZ2IbiQavFh4n73JHEvUmRv1RaZrhqBK8rBek=;
 b=nzrybREYr3KKIt3Pw7xywkU2RzOXVH4rs/32pmIuJnfPpBRgaWGFF7akwd7MbrcrM5
 I2IyINydYO9paNVLsPnojuSSp8UmRowGJrCS1mjMiszl86p8K6I+TMMbM+5VA5E8B30f
 QOHRjiVMBAi4Dg/96biQsCV5SOp2TvgIn8rYc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=cQa6dkrZ2IbiQavFh4n73JHEvUmRv1RaZrhqBK8rBek=;
 b=l+IAAgOAIMPqjbCwTenOaXn1U/fwNGaOB2aa/2D2HH8TY34q4QHTuO5fZwUgxDwLvl
 c78Xnxbx3THivc9ipxKji3jQ4CoYnTMq39UIeOiycI5/XhZUoAvhPJxFeZwK4NvWP7BM
 sLJ7c+wCTW1GcqDanu2AMjy/PAZR6vUnCfOfnHqj5pOh5zfUVLjX2jMj6Tl6VjXJRZ83
 GfEdda5FwAKDrRDmKo0yNrb1TUuWjbaXxImJmhShme6MpqyUVKIcT5TeRBufYO+235YH
 KiaVb3tYKN0zuYCXg2JKaBKFFfLSW1IPS7I+LNBWpEZXQ7fn7wYPEJg2kT0NbZvX4bp3
 SMaA==
X-Gm-Message-State: ALQs6tBt3dtY4y7NwKJT34KrNAvqSqYm9IDhTh+tjpIiD9kpIiNrHjy7
 pxyCtJeycXJTPlHnfcrD/2Vq/XqaevCUJGEebLQ=
X-Google-Smtp-Source: AB8JxZpSVdSbl+2u11VLJ8j2JEH8OlDMI5HfwBS4zoNgYasxvMK1k1WhqqVSwCJAr6jfec0WrkILBti58Fm9gSCoui0=
X-Received: by 10.55.105.193 with SMTP id e184mr4266582qkc.352.1524110820493; 
 Wed, 18 Apr 2018 21:07:00 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.200.24.79 with HTTP; Wed, 18 Apr 2018 21:06:39 -0700 (PDT)
In-Reply-To: <1524110442.2424770.1343182008.51EBEAAA@webmail.messagingengine.com>
References: <20180412035145.21488-1-andrew@aj.id.au>
 <20180412035145.21488-3-andrew@aj.id.au>
 <CACPK8Xfijj9Ym5pLaP8ES_YYsw+VmDj+=16_6DkU44ckq0sZYw@mail.gmail.com>
 <1524110442.2424770.1343182008.51EBEAAA@webmail.messagingengine.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 19 Apr 2018 13:36:39 +0930
X-Google-Sender-Auth: ms-xqyzOrEu4QqmUoh8uqY_0hWo
Message-ID: <CACPK8Xd-mOYCn_LiiUG3jBtBj5ChUEd3r4BMt7gUz_Qd+PJ=Mg@mail.gmail.com>
Subject: Re: [RFC PATCH linux dev-4.13 2/3] dts: aspeed-g5: Expose VGA scratch
 registers
To: Andrew Jeffery <andrew@aj.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Jeremy Kerr <jk@ozlabs.org>, 
 Benjamin Herrenschmidt <benh@kernel.crashing.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 19 Apr 2018 04:07:04 -0000

On 19 April 2018 at 13:30, Andrew Jeffery <andrew@aj.id.au> wrote:
> On Thu, 19 Apr 2018, at 12:57, Joel Stanley wrote:
>> On 12 April 2018 at 13:21, Andrew Jeffery <andrew@aj.id.au> wrote:
>> > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
>> > ---
>> >  arch/arm/boot/dts/aspeed-g5.dtsi | 48 +++++++++++++++++++++++++++++++=
+++++++++
>> >  1 file changed, 48 insertions(+)
>> >
>> > diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspe=
ed-g5.dtsi
>> > index 1468b4ad22dc..8321df50c593 100644
>> > --- a/arch/arm/boot/dts/aspeed-g5.dtsi
>> > +++ b/arch/arm/boot/dts/aspeed-g5.dtsi
>> > @@ -158,6 +158,11 @@
>> >
>> >                                 };
>> >
>> > +                               vga_scratch: scratch@50 {
>> > +                                       compatible =3D "aspeed,bmc-mis=
c";
>>
>> Convention is to use aspeed,<socname>-<hardware>, so this would be
>> aspeed,ast2500-bmc-misc.
>
> Yeah, this partly comes back to the naming problem you mentioned in the o=
ther patch. The functionality is generic, and so probably shouldn't mention=
 aspeed at all, let alone the SoC revision.
>

I disagree. The bindings need to be hardware specific, but the code
can be generic.

We have a preceidnce for this in the reset controller. There's a
controller called reset-simple that contains generic code (with some
quirks for some systems it supports), and a list of compatible
strings.

On the other side of the equation, the bindings themselves are
specific to each SoC.

If we get push back for being generic we can cite them as our inspiration :=
)

>>
>>
>> > +                                       reg =3D <0x50 0x20>;
>> > +                               };
>> > +
>> >                                 hwrng@78 {
>> >                                         compatible =3D "timeriomem_rng=
";
>> >                                         reg =3D <0x78 0x4>;
>> > @@ -1425,3 +1430,46 @@
>> >                 groups =3D "WDTRST2";
>> >         };
>> >  };
>> > +
>> > +&vga_scratch {
>> > +       vga0 {
>>
>> Do these names come out in the userspace API?
>
> Yes, though you can override the use of the node name by adding a label p=
roperty inside the node. That way if someone complains about the node namin=
g we don't have to break userspace.

Similar to the leds bindings, sgtm.

>
>>
>> > +               offset =3D <0x50>;
>>
>> Would reg <> be more devicetree-y than offset =3D <>?
>
> There's a mix. I was looking through some other syscon-type stuff and som=
e of those drivers used offset. This approach might avoid militant opinions=
 around the relationship between the unit address and the reg property, as =
you "can't" have multiple nodes with the same unit address. There's some di=
scussion on this in the PECI threads.
>
>>
>>
>> > +               bit-mask =3D <0xffffffff>;
>> > +               bit-shift =3D <0>;
>>
>> Should we assume this is the default? Or something else? Having a
>> default for the common case would be nice.
>
> Whilst the nodes I've added in these examples expose an entire register, =
I think this would actually be a bit of an unusual case. More likely you'll=
 want to expose a single bit from some register, in which case a default fo=
r mask (though maybe 0x1?) or shift isn't going to make any sense.

Ok. If you can think of something that makes the bindings less verbose
I'm all for that.
