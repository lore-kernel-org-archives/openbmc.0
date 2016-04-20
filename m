Return-Path: <joel.stan@gmail.com>
Received: from mail-ob0-x242.google.com (mail-ob0-x242.google.com
 [IPv6:2607:f8b0:4003:c01::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qqQJg42JlzDqBW
 for <openbmc@lists.ozlabs.org>; Wed, 20 Apr 2016 12:08:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=krkhgqD0; 
 dkim=pass (1024-bit key;
 unprotected) header.d=jms.id.au header.i=@jms.id.au header.b=e8cq2dn9; 
 dkim-atps=neutral
Received: by mail-ob0-x242.google.com with SMTP id 4so3146216obi.2
 for <openbmc@lists.ozlabs.org>; Tue, 19 Apr 2016 19:08:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=AFWToRi+09aJzCcLFDAdLa7om/SbEkgjs2t2l0Jsb9U=;
 b=krkhgqD0qIQUzGnolxZkZuwglJmBVuDrZi+lSiI8j+XdnycypEjBsdQod0f0jFsrb4
 ebm65bNb8TTyDJnNeByFv6d399OyT2sRYoM9u9gwonhuAMqM5jDssvR8XNCQbkmAq/Le
 D8LsmO/Ao7/fYnp1jjYVehTTDrKno5V6kMNg+EM0OIfS6Bta4OghxARlph+aFqTkZq7Z
 opi62XRhhyVXTczZqEcmH6CITY9u12CMBY51HOH11RjVgN1zuYYIIfJijnF0kXuGa2is
 eof9mbFDcEZEshhcseFYMfJdl8AF7GZ0JNEOfKloWSThhLjATO6RoAoqCuLGw3HztSdc
 gfZw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=AFWToRi+09aJzCcLFDAdLa7om/SbEkgjs2t2l0Jsb9U=;
 b=e8cq2dn9rd8vnAVIRqzMqpFwcpcDZoPSKqKncmRBWyCuZ+/a9xdz5GKImHtOwjpmHu
 /q/fu6W5DMC+9zAUFq07LX2DA2U11WZgMVXlekz+OJvLkjTXTAR5xunuZBeGoem7Gcwi
 BVWtYV0UkacNu+clberMH5nf8QaK3owegEtyU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=AFWToRi+09aJzCcLFDAdLa7om/SbEkgjs2t2l0Jsb9U=;
 b=LbBC4MBs+xwsp1PA+fag9VTCvPvXKf8HIpqNalDkx8DbQ/55pkW8Q4j5+kh2+tQiqx
 8+gZ4JFqq8ZR7K8OcsVrtLO9r1/zq+/ZGL0xBjuTELCn8z1vuD3yI75eZqoq2lzwZalD
 IEBbVXlcMjWy8xTuL7dNxrKeXbA5oNIjVj6GdvRoWzW0SficOrJ5cJlDI99z6FdhfyPu
 sIL0PyTak6FOgHq4WW6hu7LtExoHgHSWC94FITdNAXjx1/M48db/FQAQ0OGissho7G2A
 ooYUW1NMv8sbt/zIlCRMy57y8lcHP/ENohf1RplWycTOEr9+WO/6r4IauswR/E5n05Vd
 AvJA==
X-Gm-Message-State: AOPr4FWm0WHcojbyvA8SUntI/xrwKjm1bp8LWWOewCbfW5e8RJJcujzA1JxbbMBpJ+/BFZ0W60CfGLozLYc1iA==
X-Received: by 10.182.216.236 with SMTP id ot12mr2847735obc.69.1461118081076; 
 Tue, 19 Apr 2016 19:08:01 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.60.79.200 with HTTP; Tue, 19 Apr 2016 19:07:41 -0700 (PDT)
In-Reply-To: <DB4PR05MB0941E4F3E91B9059E718B644D56C0@DB4PR05MB0941.eurprd05.prod.outlook.com>
References: <DB4PR05MB0941E4F3E91B9059E718B644D56C0@DB4PR05MB0941.eurprd05.prod.outlook.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 20 Apr 2016 11:37:41 +0930
X-Google-Sender-Auth: mvS3ZsmkcgFFykhChEtteakofSY
Message-ID: <CACPK8XeFo0-=wTNH_qvbE-ujCe-vYzpR-z_0CRop-0cYWVH+kA@mail.gmail.com>
Subject: Re: Several general questions
To: Shay Slobodkin <shays@mellanox.com>
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 20 Apr 2016 02:08:07 -0000

Hello Shay,

Nice to hear from you again.

On Wed, Apr 20, 2016 at 12:26 AM, Shay Slobodkin <shays@mellanox.com> wrote=
:

> 2. Several u-boot versions were mentioned this week at mailing list, we
> currently use u-boot based on 2013.7 with porting AST2520 stuff from
> Aspeed EVB u-boot. Can you suggest a u-boot version to merge with?

We're in the process of cleaning up the u-boot. You have three options

 1. v2013.07-aspeed-openbmc tree. This is the tree used in Barreleye
 2. v2016.03-openbmc tree. There's a few versions floating around, but
it's the barreleye tree rebased on 2016.03.
 3. wait for us to add aspeed support to upstream u-boot. This isn't ready =
yet

It might make sense to go with 1 with the intention of moving to 3
when it's ready, but it's up to you to.

> 4. We saw that most openbmc systems are using jffs2 file system. We thoug=
ht
> to use ubifs as it has some advantages over jffs2. Can you share the
> motivation of using jffs2 for BMC project and is there special reason for
> doing so?

This was a design decision made when implementing this part of the
system. Milton might be able to remind us what the reasons were.

If you wish to instead use ubifs I think that it is a good choice.

> 5. Some Aspeed EVB drivers such as USB, PWM were not ported to openbmc
> kernel tree yet. We were planning to port them and wonder if there is any
> special reason they weren=E2=80=99t ported yet.

As Chris mentioned, this was simply because we didn't require them.
Our dev-4.4 tree contains support for the following:

 - irq controller, uarts and timer. these are the basics required to boot
 - i2c master. Only byte-at-a-time, no DMA support
 - gpio. direction, state, and interrupts are supported
 - internal rtc. this isn't battery backed so we disable it and
instead use a i2c attached battery backed rtc
 - watchdog. required for rebooting the soc
 - spi-nor. this is the mode we use our flash in; it supports both the
SMC and FMC
 - ethernet mac with NSCI
 - bt character device, for in-band IPMI communication with the host
 - vuart

As we didn't use the PWM, USB host nor USB device on Barreleye so no
time was spent on these.

If there is interest in writing clean drivers for these devices I
would welcome patches, and can assist with review and integration.

I'm no longer working on our own tree. My focus is now cleaning up
patches and submitting them upstream. Last week I sent out a series
that adds basic support for the ast2400:

 http://lists.infradead.org/pipermail/linux-arm-kernel/2016-April/422110.ht=
ml

I intend to follow that up with some fixes as well as ast2500 support today=
.

Cheers,

Joel
