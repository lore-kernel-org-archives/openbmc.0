Return-Path: <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFD14C761A6
	for <openbmc@archiver.kernel.org>; Tue,  4 Apr 2023 16:03:07 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PrXbs6Kg9z3cjL
	for <openbmc@archiver.kernel.org>; Wed,  5 Apr 2023 02:03:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=J8GvzvTQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com; envelope-from=edtanous@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=J8GvzvTQ;
	dkim-atps=neutral
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PrXZs1Sftz3cKv
	for <openbmc@lists.ozlabs.org>; Wed,  5 Apr 2023 02:02:11 +1000 (AEST)
Received: by mail-wr1-x429.google.com with SMTP id d17so33337191wrb.11
        for <openbmc@lists.ozlabs.org>; Tue, 04 Apr 2023 09:02:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1680624128;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ANZka7zHFjAGs/slJwX57ogzOL20KblKwbAfbm3zUII=;
        b=J8GvzvTQ9zyCw97/+A3iE6+JwYo/suZSU/X6376BXVSjYOkK0VkAC15KUcmua1Zs53
         UcupqNEsq8K7lmBIaUkAp89AaRzciqSJBFsTpLxB8n8kCW1NWja3EU2CEUSY342x0/gN
         +fnvxgbO62gllAFPCwB1mXWT5KprNJuzSnZ/H3dxm64K12Ta+4n4m0ha3J8Bx0KaPDPC
         6OlWBWzFChYoSfmuNBJdOkyHqNOPQFPnJ/3LdnKjYus6jb3OVfNSqhrqLrthARcEr6p0
         5dA42gPAf8+Rwxp62Z3zTPdTvmf+ecxNtDUh2kqALFQLpQwige//chUdUn3oJO1XPTz2
         ukjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680624128;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ANZka7zHFjAGs/slJwX57ogzOL20KblKwbAfbm3zUII=;
        b=s4ycHyRysmGVEZpmR8QTYYUMoZ5/uU8gDrblmesaRhiu8fIsZ6rrWORtlcrbxZ4bqR
         d+zQbrVj7lETg4fQERms8jUO10cLorLmFH8xKW1oLYacGGAvGm74HJJd4Ib/AKYuYPg7
         6qFu3Wl0q35pzuyNq9IK/UV4ArN/bbDN93vkTs9AZ9ul6AfzMYD2onyQd2mYVoZxclvZ
         Tfoag5EXigydY2tWa2UZbJTvHvcknnuF8bWMJyum1l+F32xi++VLvMu8vgHWnORRcOC7
         3n2L9Z0Akz31CffQXRF1tJRS9fZnLvDRpWoxLHe8EVTmDt5niWrt6zipwKEFtQ0U2Xcw
         s8Yw==
X-Gm-Message-State: AAQBX9dpesG29U8QKzKL3PNhoUMIHlmnYOwoYk6pFlwKw5kwZR/3NR7B
	Tj2jPVx8Ygeff2kQ9dUrfKqS4xjgSArptCSKRW8xhA==
X-Google-Smtp-Source: AKy350YI1LkqVrzmmyPFUYzGTD/S4+ldM8LdoZzTHQaF6sMTZ99CGOIKb3upUXNbfuuHaTUpvX74zTFO28lCF7GG88g=
X-Received: by 2002:a5d:4603:0:b0:2e4:c9ac:c49e with SMTP id
 t3-20020a5d4603000000b002e4c9acc49emr614175wrq.9.1680624127725; Tue, 04 Apr
 2023 09:02:07 -0700 (PDT)
MIME-Version: 1.0
References: <CAGugOWsUK=2gE6iBiumKukO87b_cgAm2eT+Y=su1PPWow1-S8Q@mail.gmail.com>
 <20230328224413.GB18848@packtop> <CAGugOWvofh+f15KuMCkC97V-9Hn4QxuVTgw5aXkTM3bVNaeEDg@mail.gmail.com>
 <CAGugOWv=XF9UHLcgcr-W5_3DE5+w3EaP4i0eHe-nbSFVgJqsHg@mail.gmail.com>
 <ZCq82_K1gRdlM7Tg@heinlein.vulture-banana.ts.net> <CAGugOWtUdXVUN3p1oGSe=DS_g04YfxUoe98vfxOL6xYxM9=pjw@mail.gmail.com>
In-Reply-To: <CAGugOWtUdXVUN3p1oGSe=DS_g04YfxUoe98vfxOL6xYxM9=pjw@mail.gmail.com>
From: Ed Tanous <edtanous@google.com>
Date: Tue, 4 Apr 2023 09:01:56 -0700
Message-ID: <CAH2-KxDYzd1VLyNe0EEd1rT2_uCx=zspZwioECPdTeCj9z-Xng@mail.gmail.com>
Subject: Re: Containerization Enablement in OpenBMC firmware
To: Satish Yaduvanshi <satishroyal4u@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, Zev Weiss <zweiss@equinix.com>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

On Tue, Apr 4, 2023 at 7:25=E2=80=AFAM Satish Yaduvanshi
<satishroyal4u@gmail.com> wrote:
>
> Have gone through some documentation over  internet. Firmware can be cont=
ainerized to get the more benefits.  so is there any plans to containerize =
the OpenBMC firmware?

The best thing to do here is to elaborate what BMC-specific use cases
you're trying to fulfill, then work that backwards to a solution,
which _might_ include some form of container.  Containers have quite a
breadth of use cases, but without knowing what you're trying to
accomplish, it's very difficult to present you with a path forward on
how to proceed with your idea.  Once you've got your use cases,
there's quite a few people who would be happy to help evaluate the
technical merit of your idea.

>
> On Mon, Apr 3, 2023 at 5:17=E2=80=AFPM Patrick Williams <patrick@stwcx.xy=
z> wrote:
>>
>> On Fri, Mar 31, 2023 at 10:55:47PM +0530, Satish Yaduvanshi wrote:
>> > For containerizing firmware, I do believe architecture matters. could
>> > anyone of you  explain the OpenBMC firmware architecture briefly
>>
>> Have you read through any of the design information in the docs
>> repository or watched any of the background videos on the YouTube
>> channel?  Was there any specific questions you had?
>>
>> --
>> Patrick Williams
>
>
>
> --
>
> Satish  Kumar G
>
>
