Return-Path: <openbmc+bounces-2704-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AA10CA5FDD
	for <openbmc@archiver.kernel.org>; Sun,  4 Oct 2026 02:36:27 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hy68h3HBXz30BJ;
	Sun, 04 Oct 2026 13:36:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2607:f8b0:4864:20::333" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1791004804;
	cv=pass; b=R4JAyclyJWTI9aeVy+De8G8iVRA1I4G4SLKVCkwBKBK6fyKKA3Xu4BmyIv79KzHhRIzDbAiug87u5uDOv2KW7UTkyqxer7SOx336qqWjTaM29VMRvDu2R/EAnW2CSLDaWfK7x4Maw58xpkKsfhbFaWrf/yIN7l/AvJoroNCM/f1d3C/F28cgsrNc3zkoJVeyqfVmYQFI4gSCmbyksXgM1hqP5Ir04tYrA44saOJlzfSwCnppXc+fRBsc0gV2XJ7COICw2e1Wv6upMukqbCJ/UhrX1afYXdjguFjnZV4WIec3bFehnTgRl0fgIjlSvYiG4VOGallzpPRDTXBOis9fYQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1791004804; c=relaxed/relaxed;
	bh=c2lqaYhqXg7tSgmnpwErAsuXii7+pNsRTFbZDO0U2Pw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oDjhT0WHhf0R4Qq3WqFo/zdNGJMHQqFiv+aZ3FsN/7S6VjyUWOmdANPFysaOn3ducXCMS87FSnHNFyrdJjLDMg1AvN9hn7APUK7v6x/QzkxcI08Sjtyq3qQO3oItpO0dE5rYDcri7UtRhRJSEbeB+iHZe+Top/x14hjTpUIHnGJzjTpRfSslt4N1DYK7yu1SUMr1MMqsDYNUJzVp5Pbypn0SPAdKIXxy0tRBsKnqP0nImqqP9c0tvF8Emv2+ZOGDKwwTL2Gk7W8AUD1KwM2ZVpvk4N0oiQUMRR6kySS81YewrkaxLFlSHCCz6Viugh6JWhBedJGvnnLqK2QTeTQXtQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EstzsDrC; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::333; helo=mail-ot1-x333.google.com; envelope-from=alan.tseng.cs@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EstzsDrC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::333; helo=mail-ot1-x333.google.com; envelope-from=alan.tseng.cs@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hxYr30QrQz2y1W
	for <openbmc@lists.ozlabs.org>; Sat, 03 Oct 2026 15:20:01 +1000 (AEST)
Received: by mail-ot1-x333.google.com with SMTP id 46e09a7af769-821a7bee9b2so418665a34.0
        for <openbmc@lists.ozlabs.org>; Fri, 02 Oct 2026 22:20:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791004794; cv=none;
        d=google.com; s=arc-20260327;
        b=SuLv1MWU6JuT+HIvG8hfIToirYEcVJ0As7iPXoQYlE9EEeVHmC/MIE6o+s65REUvAw
         6BK55l6EPuZNd/ZKGngfrtw0DXUwtSL8RWikU+rgA7B8Yr1JWJ2LbCKQuo6Tkyt07mYz
         DYgDs0dlGp8QAB5FUoukz/eC6VBtzZACauf2K8Z9RN+ynMW0F4xFhIspMg5UvRDNa8jo
         iizOA7dhXKXuN8YGGNs4PMp6DyRfcibazZKSwj74ipkgFkN15gHcvaULpG5mgzJ+QZRy
         s9qpbY+cSMat+bMxK0Qausghydq5jt/lrEFsqxjaRYSibu9RCJCPiJOHNt1ARUGTS+PH
         UA7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=c2lqaYhqXg7tSgmnpwErAsuXii7+pNsRTFbZDO0U2Pw=;
        fh=M8RSz7TzcQYmGekAGl8eephBG9g1e9PzJRmhweoTGQA=;
        b=EvkP2waUlIPk56e+5Yzh9VKvrEvR3H3sWbv97MWRNMDuhf4gKJ5TtYxpt59e9JkqPW
         lNa22X8utrZCoiG6sOAjDPBNo+bA9Bjb1SK3k39D4bwtmr/NgFH8EagJzIU1dds5qdTz
         minQNhlJq6WQsTNVzJm2XiDxw0/SP9xMK0DFbsDjxriTgBZORWgDthIZkilArRO36JH7
         gylP5Fh3021UKwl5tEDx6n+BcGssJ3OY9xFPBTzoLKM2Y0lNwV0QZZVRKoCzYAOSSoHT
         fLzDjtWjpNaxg2P4VdH2Lky9J6DrTxhP4m0L9QgKS5GIfnR/9jj3D0WXh9yZ6hmUdgIe
         E8bg==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791004794; x=1791609594; darn=lists.ozlabs.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=c2lqaYhqXg7tSgmnpwErAsuXii7+pNsRTFbZDO0U2Pw=;
        b=EstzsDrCAN2ZV4w/v52aazWEEiXFyLwrPEpvUDlS7UH1/wV2eNjQ2o1Ly3aRQaZJVh
         LnvR2hOys2kvAgH+PtE9swNzi/rNnXm5Nhg55V53j8lPz6q6VgNlpxITbLJGr6amEX+8
         PBda1UY4c7hjjZdFHqh7MYhPU1TzxMrCLfuPENC6qsFsZUPpSigS25DgSTRBqvgeJ7pP
         F+x0rWZZiYrQhG3hb5e2iEIZ3T6tu7kfVc8UdzW03aqmYFoBG3MT8bNr+lc8jBlcsmkV
         +gSaqBp1YuborILZrovKXxb8m0tNhHkh9+kYb9U1QUMZK6GsmCPRu1UDSnvopbivSVJH
         gR6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791004794; x=1791609594;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c2lqaYhqXg7tSgmnpwErAsuXii7+pNsRTFbZDO0U2Pw=;
        b=v/UwS7+aKggc06QP9nXhqZnGso/LjS5UBGdHEvpQch6wIhOJVZ/LHUIiJbQsAaKGFP
         cAjCXKmooME2LWQWN0mnTSel84vbGdCQDTabDdK881OjwTzBaW9nxeZ7sksDA3cgGMg6
         y9Yp5YN8EJg7oy5kHVfhE6j0oeRPitI+awaeQ5+v0w7omAqSpT9ccrQ7UI9hYKeA2hpx
         gbmCHlhgyVq9Hth8IQZdgUhrHuS3uf3uI31QELTsjc0Fi4qLmQKv+T2U1BXbrzoeCTtb
         +B6ICk4h2QZTq1kt1DlAuiujfU0K24m0f3MsZ5CUKt/ei+8oA3A025BIDofv5ZqYbimQ
         MH+g==
X-Forwarded-Encrypted: i=1; AKwUvBzPaUkIxz0fYaj45bPj0LWPG115Plurjqe/BtGK9aj3DX78lsEGUwWYYv2t2L8zBrYbupoYY9VE@lists.ozlabs.org
X-Gm-Message-State: AFuF++mWxpIUmJF2XYHyAyPtEVL4JMD5xzHwIp+Rbbvr9BXoGeDGXvGj
	LK3pEVXB+30Jelyc5pV1z7uIaa6XO8JQAOppVwlDze3J0/ALOzZOddOYgU5Vv1MmNt+y0oPRH4z
	EWkB2m/cGiW4wIRFief0nwQSGAJLF9OI=
X-Gm-Gg: AYBFou069zzpYGzprIIxwXZwCaAZwwsuU5kd87pJp98WVUsn7cSkIE0Ix7s+nsj41mW
	vN/AUKjc42qtCnQLnpGM6Fv36AC+9el8ZN6XZHSRxa6Rkqp1zM7Mu9b4GaqGT/3xbH1SIomHeeO
	GZpNw3pgekDpMfKisxHGbZazvfNLj6/E+w5klkeXGfHdeZmj3hW50jhQsXcMrgURnbIpH3w49kg
	fY/nY4o4tdr9ecMqM6y8vc382OvMqNed9T1yxAV0dfsuL+Kj+TfuhGE2A/i24tLAtsBdP6vOxpJ
	fRGiw9W38RnoKXtYnIf3lxzTYaksGKjH4Lt/2zPui+StbWRbktyYL59+9P1+z4POz74TPSYKPBa
	TDlGJ/wOLz+vqVoeVpK0a9rZ3Mb7Uxu5mRUBXlp9d7XeF3HkYOA==
X-Received: by 2002:a9d:4f02:0:b0:81d:338f:fb44 with SMTP id
 46e09a7af769-8211f92a809mr4780902a34.25.1791004794111; Fri, 02 Oct 2026
 22:19:54 -0700 (PDT)
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
References: <CACwt7EbP_LJ1070N9xyPK2YHe8uwEZ2Wn_Jpqf26JMqbN+wOhA@mail.gmail.com>
 <CACwt7EYM8zS2xZJyCNSDek2EMsWwY9LJ9qn7Zde-EJ=czAwkCA@mail.gmail.com>
 <CACwt7Ebr8Vng6WHK9Pd+R=M-hfMtwNSfU1gQwCRPAV3AuFfSdQ@mail.gmail.com> <CALLMt=o4dtC34DHbRjCML0z-1wXkkWpMdMsbXmB3oR5SEXUxqA@mail.gmail.com>
In-Reply-To: <CALLMt=o4dtC34DHbRjCML0z-1wXkkWpMdMsbXmB3oR5SEXUxqA@mail.gmail.com>
From: alan <alan.tseng.cs@gmail.com>
Date: Sat, 3 Oct 2026 13:19:42 +0800
X-Gm-Features: AclHuK94Ikl3aQf7Z3GWcW8WdAAmOBErv-ITLJSimFrJnxMg1L1ICApfwiZftR8
Message-ID: <CACwt7EbTtDs=Mt9gyPBHV-hw6fok=sFA1jw3B0wVt3_Sm_mVNQ@mail.gmail.com>
Subject: Re: Signed Individual CLA - OpenBMC Project - Hung-Chun Tseng
To: Andrew Geissler <geissonator@gmail.com>
Cc: "manager@lfprojects.org" <manager@lfprojects.org>, openbmc@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

Thanks for the reply and for pointing me to the updated CONTRIBUTING
rules. Understood: given MediaTek's category, an individual CLA won't
work.

I've started asking internally about getting a Corporate CLA executed
for OpenBMC. As far as I can tell MediaTek hasn't signed one before, so
this will go through our legal team and may take a while.

One question in case that process stalls: would a signed statement from
MediaTek (e.g. an employer disclaimer stating the company claims no
rights in my OpenBMC contributions) be acceptable in place of a CCLA,
or is the CCLA the only option?

In the meantime I'll leave 93691-93694 as they are.

Thanks,
Hung-Chun Tseng

Andrew Geissler <geissonator@gmail.com> =E6=96=BC 2026=E5=B9=B49=E6=9C=8829=
=E6=97=A5=E9=80=B1=E4=BA=8C =E4=B8=8A=E5=8D=8812:44=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
>
>
> On Fri, Sep 25, 2026 at 11:25=E2=80=AFAM alan <alan.tseng.cs@gmail.com> w=
rote:
>>
>> Hi Mike,
>>
>> Looping in the OpenBMC list and Andrew Geissler, since I haven't had a
>> response to the two messages below.
>>
>> I sent my signed Individual CLA on 2026-08-20 and followed up on
>> 2026-08-25. It does not appear in the Individuals folder of the
>> OpenBMC Executed CLAs yet, and my libpldm changes (93691-93694) are
>> still held with "User not approved, see admin, no CI".
>>
>> On employment: I work at MediaTek, which is not involved in OpenBMC.
>> These changes were written on my own time and equipment and are
>> unrelated to my job. If you need a statement from my employer
>> confirming that, please let me know and I will arrange it.
>>
>
> Hi Hung-Chun, I've been struggling with processing individual CLA's becau=
se there are a lot of gray areas in accepting them. I also need to do due d=
iligence to verify an individual contributor is actually who they say they =
are which is another whole pain point. I tried to make some more consistent=
 rules up in https://gerrit.openbmc.org/c/openbmc/docs/+/93905. Your place =
of employment, Mediatek, falls under these rules so I will not be able to a=
ccept your individual CLA. Please work with your company to get a corporate=
 CLA in place for the OpenBMC project.
>
> Andrew
>
>>
>> Name: Hung-Chun Tseng
>> E-mail: alan.tseng.cs@gmail.com
>> GitHub / Gerrit username: alanhc
>>
>> Thanks,
>> Hung-Chun Tseng
>>
>> alan <alan.tseng.cs@gmail.com> =E6=96=BC 2026=E5=B9=B48=E6=9C=8825=E6=97=
=A5=E9=80=B1=E4=BA=8C =E4=B8=8A=E5=8D=882:48=E5=AF=AB=E9=81=93=EF=BC=9A
>> >
>> > Hello,
>> >
>> > Following up on the signed Individual CLA I sent on 2026-08-20 for the=
 OpenBMC Project.
>> >
>> > Could you confirm receipt and let me know the expected processing time=
? OpenBMC CI is currently blocked for my account pending the CLA, so my pat=
ches cannot be verified or merged.
>> >
>> > To answer the question I understand usually follows: I am employed by =
Mediatek, which is not a member of, nor otherwise involved in, the OpenBMC =
project. This contribution was made entirely on my own time and with my own=
 equipment, and is unrelated to my employment. That is why I am submitting =
an Individual rather than a Corporate CLA.
>> >
>> > Name: Hung-Chun Tseng
>> > E-mail: alan.tseng.cs@gmail.com
>> > GitHub / Gerrit username: alanhc
>> > Changes: 93691-93694 on openbmc/libpldm
>> >
>> > Thank you,
>> > Hung-Chun Tseng
>> >
>> > alan <alan.tseng.cs@gmail.com> =E6=96=BC 2026=E5=B9=B48=E6=9C=8820=E6=
=97=A5=E9=80=B1=E5=9B=9B =E4=B8=8A=E5=8D=8812:15=E5=AF=AB=E9=81=93=EF=BC=9A
>> >>
>> >> Hello,
>> >> Please find attached my signed Individual Contributor License Agreeme=
nt (v1.0) for the OpenBMC Project.
>> >> Name: Hung-Chun Tseng
>> >> E-mail: alan.tseng.cs@gmail.com
>> >> GitHub / Gerrit username: alanhc
>> >> Thank you,
>> >> Hung-Chun Tseng

