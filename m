Return-Path: <SRS0=7bNB=KG=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A0EDC433B4
	for <openbmc@archiver.kernel.org>; Tue, 11 May 2021 21:56:19 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA15A616E9
	for <openbmc@archiver.kernel.org>; Tue, 11 May 2021 21:56:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BA15A616E9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FfsFF041Gz2ymF
	for <openbmc@archiver.kernel.org>; Wed, 12 May 2021 07:56:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=KJfWUgKl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::32a;
 helo=mail-ot1-x32a.google.com; envelope-from=proclivis@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=KJfWUgKl; dkim-atps=neutral
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FfsDk1bnYz2y8F
 for <openbmc@lists.ozlabs.org>; Wed, 12 May 2021 07:55:47 +1000 (AEST)
Received: by mail-ot1-x32a.google.com with SMTP id
 36-20020a9d0ba70000b02902e0a0a8fe36so12523728oth.8
 for <openbmc@lists.ozlabs.org>; Tue, 11 May 2021 14:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=content-transfer-encoding:from:mime-version:subject:date:message-id
 :references:cc:in-reply-to:to;
 bh=x1eAB9SSXMbJqAKFZ9xahi4ZkVDLQx9gq/YpkUAGFzI=;
 b=KJfWUgKlx51eX6naFYpeOuVeA75Oq1ZlVT5U0GnZb95HGuGIV+IDby6A4MjDLWkgwn
 UcvvcpR///uHonOAQXSnODOka0XefK2QvjvHkGiiZG8JWlsBy32Eglx/cEbw7JLKi0uV
 uNBIfTQwLS5F4KblgeWBEXD7+PFk5tZvv4VxOuhdoLNSl/+zi1ittUg3n/MoOyBnRWZq
 +A540BG4VHiC8Y5lKARsZLYsN10QDu5MN2HasHm+6QUerQtmw6dwNtkMFieEbts+0P2O
 k+aMz2pxjRzxOkpfpfvkWwBifKZBKTfz7SBy0Y1vW/RYyBg11gLw8YEYOwbbh+oTFRND
 S5VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:date:message-id:references:cc:in-reply-to:to;
 bh=x1eAB9SSXMbJqAKFZ9xahi4ZkVDLQx9gq/YpkUAGFzI=;
 b=Pha/izpOThnGwnctKgkpjmti8WqdA61KuVlFPYrIdceSfNZpOCpSQhOz6tUwSE1oOP
 YTBxvjLVZowo0IQVJeX34lowBEQOaoDvUdHO+eXZaiONeUNuaqB28t07oCFxpWiu4Aeh
 ALDRkgelXF4TzJDoDYm5ugOpz8QBpR0VNV1+5NRLubzv+0YZxxJBxsZyW/p3Wv02PEcN
 QVe0spmO3ZTDY1UkgovRQcQH+rSxLx0rqJqZy4ZJrIiljdsLu7sjEJlz/JlPLqwIoa0y
 K+g5s+No2+Orhl2eA0J1IHaWKvPWMub98kWZseBSUOHSRAVQp+RmvxrSHLxHg9ywBAsw
 w4Vg==
X-Gm-Message-State: AOAM531fU+QNAYLMjdeUSkfwVuMxXhVQ/Pk7XiAM0IEh2Bn4QtOdnr3s
 to6BT9YKwiO2KNaL6oszei0SXMGauNo=
X-Google-Smtp-Source: ABdhPJyJTEjpo18ggbPeEPoB5ScZWR9lMwg/p7/8GY86Nd7xFaaNJJoFHGVp2NAAIYoucwTvxXeT3Q==
X-Received: by 2002:a9d:600d:: with SMTP id h13mr1250317otj.259.1620770143630; 
 Tue, 11 May 2021 14:55:43 -0700 (PDT)
Received: from ?IPv6:2601:281:c001:2359:a4:25f:a323:2fbb?
 ([2601:281:c001:2359:a4:25f:a323:2fbb])
 by smtp.gmail.com with ESMTPSA id z9sm3542953oos.16.2021.05.11.14.55.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 May 2021 14:55:43 -0700 (PDT)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Mike <proclivis@gmail.com>
Mime-Version: 1.0 (1.0)
Subject: Re: mtools bitbake failure
Date: Tue, 11 May 2021 15:55:42 -0600
Message-Id: <517DD65A-6077-450B-8C14-29385D469AA8@gmail.com>
References: <YJr5+PsBEvGtJGfB@heinlein>
In-Reply-To: <YJr5+PsBEvGtJGfB@heinlein>
To: Patrick Williams <patrick@stwcx.xyz>
X-Mailer: iPhone Mail (18D70)
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>



Sent from my iPhone

> On May 11, 2021, at 3:41 PM, Patrick Williams <patrick@stwcx.xyz> wrote:
>=20
> =EF=BB=BFOn Tue, May 11, 2021 at 03:30:24PM -0600, Mike Jones wrote:
>> A solution is to use a newer version of the build tools, say 3.2.3, like t=
his:
>> So if openbmc moved to poky 3.3, it would solve this problem.
>=20
> I'm slightly confused by this question.  We started using the 3.3 branch
> of Yocto by at least ~Jan of this year.  We tend to track upstream's
> master branch, which now is the pre-3.4 development.
>=20
> What is it you'd be looking for?

Perhaps tags 2.8 and 2.9 are too old? Both had this problem, but I don=E2=80=
=99t know which version of poky they use. My description above worked for 2.=
8

>=20
> --=20
> Patrick Williams
