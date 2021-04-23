Return-Path: <SRS0=AkVc=JU=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 023D7C433ED
	for <openbmc@archiver.kernel.org>; Fri, 23 Apr 2021 17:31:30 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 78DF1613DE
	for <openbmc@archiver.kernel.org>; Fri, 23 Apr 2021 17:31:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 78DF1613DE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FRhCz6gDxz300C
	for <openbmc@archiver.kernel.org>; Sat, 24 Apr 2021 03:31:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=UkNz4E71;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::32c;
 helo=mail-ot1-x32c.google.com; envelope-from=proclivis@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=UkNz4E71; dkim-atps=neutral
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FRhCY15Tfz2xy7
 for <openbmc@lists.ozlabs.org>; Sat, 24 Apr 2021 03:31:02 +1000 (AEST)
Received: by mail-ot1-x32c.google.com with SMTP id
 35-20020a9d05260000b029029c82502d7bso14529605otw.2
 for <openbmc@lists.ozlabs.org>; Fri, 23 Apr 2021 10:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=LX+HNtbn2uiDL1E0iXAq5Gl7ixnYAw1JvwLQsPoNpZI=;
 b=UkNz4E71reMaoGdsJj9m1YfX8GMFhLFUEwsvUuJ7aslRX+X33x39zgc7hzmzrQulNF
 qCLPGpqrQK2vFSCNILymWV2g0PdrP/xjgtJsYmel4z+Za7MStWgvG7+CUJ6zmhWmHlJq
 7xa41X+yYqnb+H3JJRQgOOdFyoWLQqJYNq/Dg0tulETJ2iYRRGBBY3y0w2WZVsgvROpZ
 3h2xLdlTGkz4a+LE9mNEwp7d4yoE/+loi0SzzmrI4iX9WPnEZOQxHXzwcxJFksw9rWGE
 XCArr7KPi0v/z0KzJGBN3CkdSm7wZ2Tl8rhX59ZSORMd9eeWWs2a3cs8CZHpGemSCzY/
 Zvhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=LX+HNtbn2uiDL1E0iXAq5Gl7ixnYAw1JvwLQsPoNpZI=;
 b=UstuphbE+f08LuI1V9CJgfmd9lg3RHPQcZgv4D1vZ5eap8n63ss/d9Ip4q7uoPki/3
 JNrA3Qmxm0II8pzrxr2iUpvy3yFMJ7JUiV9wdMcvMNHqhthhKwOqSZFum8glwW+pf6Fl
 85o/8if0OK28jTjahKcJiATG/qJ2s6zDHAm+7SVC80cLaEx0/OE1DWoZDFGTadfba4dm
 EPWZX+fTZr9lnw5Y6jj8vniYbFv5Jhe0EcxQn0EgMn+SPGRuXzl17i4xAXl01sSv4jgw
 FLxWDwlsqXz2zwAsb3vgbfuoVqWalkpnSUcfd1a9uQ0KjHiqKduw+zfRr9IPEwQhzgjN
 3PzA==
X-Gm-Message-State: AOAM531p+fwwKONSYC8K5ISxA2lc10HZnU37kbl+HVScsTwkXWSFViUv
 YE4T19reaK1GCW04ttc6mOT3szGtDkE=
X-Google-Smtp-Source: ABdhPJzXC04xZanXLAz8An0aJR3m/q+oKYfp2q5HvBFaknnX1i4C8tjWYDH+FcL3gRByKbPMZRkX3Q==
X-Received: by 2002:a05:6830:1103:: with SMTP id
 w3mr4205543otq.304.1619199055389; 
 Fri, 23 Apr 2021 10:30:55 -0700 (PDT)
Received: from ?IPv6:2601:281:c001:2359:7982:337a:e73e:2882?
 ([2601:281:c001:2359:7982:337a:e73e:2882])
 by smtp.gmail.com with ESMTPSA id l4sm1374025oic.26.2021.04.23.10.30.54
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 23 Apr 2021 10:30:55 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.60.0.2.21\))
Subject: Re: PMC
From: Mike Jones <proclivis@gmail.com>
In-Reply-To: <YIMBmRyyjcchQFhA@heinlein>
Date: Fri, 23 Apr 2021 11:30:54 -0600
Content-Transfer-Encoding: quoted-printable
Message-Id: <845C5760-C7CA-4ACB-A465-63BF0EA851DB@gmail.com>
References: <YILLjQfgD4Q2vH5L@heinlein>
 <31F00F60-DF2D-40FB-A9BC-85538975398D@gmail.com>
 <1F0D01CD-2A39-49B3-9E63-DDFCA3371672@gmail.com> <YIMBmRyyjcchQFhA@heinlein>
To: Patrick Williams <patrick@stwcx.xyz>
X-Mailer: Apple Mail (2.3654.60.0.2.21)
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

Patrick,

Now I see clearly.

I=E2=80=99ll see more where the ADI team wants to go in terms of =
demonstration.

Are there existing PMC implementations for ORv3, or is the work of your =
interest the first? Is their existing hardware to base OBMC running in a =
BMC to work from?

Mike

> On Apr 23, 2021, at 11:19 AM, Patrick Williams <patrick@stwcx.xyz> =
wrote:
>=20
> Hi Mike,
>=20
> On Fri, Apr 23, 2021 at 08:49:05AM -0600, Mike Jones wrote:
>> Patrick,
>>=20
>> We are using spec: Open Rack V3 48V BBU.
>=20
> Got it.
>=20
> I think you'll want to look here:
> - https://www.opencompute.org/wiki/Open_Rack/SpecsAndDesigns
>=20
>> In the case of a PMC, since I don=E2=80=99t know the OCP architecture =
well, is there a PMC device in the rack that would manage a BBU, or do =
devices that plug into their rack each have a PMC?
>>=20
>> Looking at the above spec, the functions of the MCU are quite =
limited, so I assume there is a PMC device that is managing these other =
elements like a BBU.=20
>=20
> If you look at the Power Shelf design you'll see mention of a PMC/PMI
> connector.  This is a slot for which two different designs can fit =
into:
> PMC or PMI (and I don't recall exactly what the "I" stands for).
>=20
> With PMC, the intended design was this was a full BMC-class device =
with
> a network interface.  This would run OpenBMC.
>=20
> With PMI, there is a MCU in place of the BMC and the PMI is connected =
to
> the top-of-rack switch using a modbus / RS-485 over RJ-45 =
implementation
> like was available in ORv2.  I think the PMI would speak the same =
exact
> protocol as the similar device in ORv2.
>=20
> You might find details on this modbus protocol in the above link, but
> there is a lot to dig through...
>=20
> --=20
> Patrick Williams

