Return-Path: <openbmc+bounces-2650-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D944BC98318
	for <openbmc@archiver.kernel.org>; Sat, 26 Sep 2026 09:01:36 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hsM4m4xG5z30Vn;
	Sat, 26 Sep 2026 19:01:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2607:f8b0:4864:30::26" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1790353530;
	cv=pass; b=SPlADT7GftF5+4s23nIBe01/K43d7F6/7lfArbEWt3/4MQ/L45ebkuRVEQI+P8S/eqCRm4XEm9b8hi5EM6tJxyPE4TkAhCpL+F7bOdS2JW/cYpFtvTH/lusk9JrrZNtCiZUwhMsg+8pw2mFV5EOSSRUCtwQTJIt7q9eVLCPUBsyXasRW0CDwWWw5piaU3z9WDKiYDtpX6TLgLBCiEjTKbOIoANHd2Kpvzo58L/6IwcO3PVs0l2BkHZYtUCEud2s/M+g9UkVSzBmbcHwPPVjq7C+pTHHkQu358T/2Wf/7S+lU/OytQY0grOPyuhU/kyJ8/L27obPQp9NR/uQZ/NIj/g==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1790353530; c=relaxed/relaxed;
	bh=YbucETQ+FldZIZ6L16X7pxEyk2FZ/N51PQoR0GVNl8s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hSQD4DAVFNGu0LL6DO8rXGP1N2UlyBQ51R8gJOTx/OeZMH5E/k11/p8lbregWZ0fYmGbasgqoc4r+dppJjS0AJuEpl7759u2+Ni3k2+DiP1yFNHcMMRHS9nMud3g+sV4B/osSOlo8A7rxyAEZRSvnb0JqyZ/c/GWmVEAGBYz/a7ic5kyAETR1Uu9fkliNsm99vt/L4WwnXMj2rQ5X1DsSA3Q7+tkh1h1UvbVoifmOatyNd/xF2eVY3vTt+p/SWy+B6gs6pl8VtVIgXfGWtYtRh1EdeFPE4sS8oCGcItGkVj1wyBtj+dCpYi5cjS39XseFbDTMQY4tO1i388iLipu+w==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CdCqzFUe; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:30::26; helo=mail-oa2-x26.google.com; envelope-from=alan.tseng.cs@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CdCqzFUe;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:30::26; helo=mail-oa2-x26.google.com; envelope-from=alan.tseng.cs@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oa2-x26.google.com (mail-oa2-x26.google.com [IPv6:2607:f8b0:4864:30::26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hrwzY07Mfz2xBK
	for <openbmc@lists.ozlabs.org>; Sat, 26 Sep 2026 02:25:28 +1000 (AEST)
Received: by mail-oa2-x26.google.com with SMTP id 586e51a60fabf-466cc88a9b9so820548fac.2
        for <openbmc@lists.ozlabs.org>; Fri, 25 Sep 2026 09:25:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790353525; cv=none;
        d=google.com; s=arc-20260327;
        b=ZLvEU6JNeIF5rQo8wnmjOsJDqwYzSM4pwYtAONs9zcgD5KwQaMGVkSmid5rK0ra0Po
         sdUrzz0RQpL/Q57spqh5OULmvy1RuPJ936xPWGSaNKvy3RmGNhKe2VBxIFlBC4v4nwft
         MveooRBL7TMonaEYEf5MNgm7l3WRZ81iW4lfuWnnAf28HkUgbz1TNv2YME5fZ2kYK+9W
         0iSzaNvF1WJzsDiR3oVRcQBI+EHvCjB6IWbNeJkcP0qPlcKvVaQqYPZ1Mwc21JGEOjA/
         HVaAUHUIjXOy3ZT56/r3U7mdTia7VEJ/Bh3AZ8N54D+M3c7zcqN+OvGE2fwgfUoI+gOD
         fQJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YbucETQ+FldZIZ6L16X7pxEyk2FZ/N51PQoR0GVNl8s=;
        fh=nK7MsTSd9T+NTtkau+VyggdIrDzrTUZLvtwRUIMJNb8=;
        b=K0bKCdtXi20QinDtehwjrvaw0ClyVoggRPQvfjGTKzFiggYn1N0oYWcRR9Q6QNT+Wg
         3LqRqjhbMm3ny02bgRZGdqjgPFOt6m2PW5vnXI2fCvE8fq49kj52kBW/W0v240B9GJrT
         iJRV/9fES2ahZNJDlWNinxGxn09UF9deP7G2wqgeyh/49Z8nOMbS5p5dfbgsdbsLPlID
         ApHby41BvUqjBc51LkmPuMwgBiKies3EqkaplvZs2tBG+LZWnIWlmXSwF2mHyzrtSCQp
         KezScECm6kpAOMgWu0Btaekgh5QGfP7gylTluYAqa4qJUZ+p2NwSIVPOjIHbLr2c1/SM
         N6Jg==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790353525; x=1790958325; darn=lists.ozlabs.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YbucETQ+FldZIZ6L16X7pxEyk2FZ/N51PQoR0GVNl8s=;
        b=CdCqzFUel6QKqTAQ2EWO40WDYeeTRgbc6dqfk9dsh/s6V4TmKm19GZzt2KcLceY8s6
         qIuFE7HESrw2nK53+NxELcJO7ZoNpURRQTxXUkR/xQWkCIDEGnnfOTyCRJasOF5LzmQt
         s7S3va618aJcUXqrJJz8fcRn9RdNYVvl3BJqPoA8vuWgHlxDDLKpKklBE6l7SNJV/dF4
         gVCwyQGok8YaRdbcyYG1+S26bsEVN/jNeGR05XRu0+pUK7n97a8SKOcp/u0rGmkShHiH
         Jp7A1H/nG0sBGuG4NsQ//H7ZkWd31IOx2coEKPwbNTEqxCyrfofFm6iPM2s8bMJNFxxK
         TMIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790353525; x=1790958325;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YbucETQ+FldZIZ6L16X7pxEyk2FZ/N51PQoR0GVNl8s=;
        b=CXe1RfnFm7bpy4c2Ud2IqAFUSfNzYnYWV2/nZNHH9+a1oVph6Nsjc+vrQxhDzLvi4a
         0w8eRgd+OdPpVCOiiAxfU5CW+7rdHOpiJrG1pX3FXBu8m0nuYhV8ABlvOsaAWSm5/k3p
         X40wDe+rcuYLJIvRBHif8RWIWahuV/8B9ZxYgcJ3o91qUbbswaYCrSOcuM6VkeVPWztq
         Via8iiqrGNqwG8CR2gtp2ezwnF41R42Dqee4xl8iHz/dpsIoZwGYY1TqGgE7st2nwRlP
         jeD6LLWfFx2v+cm2eRfUk0xcsi3ZNuXtoUEpF4IOxMofSKb/dDSgTq1WSyaGVkEdt7/g
         twnw==
X-Gm-Message-State: AFuF++kQQDjkg93I51NoSb6SxMUK5wEbgCF7jD5FfiEHFYQzqWYlNSL8
	GZcm4MXj4uLtiaM1i4xbtZoetn5pESR8Aj9oNLg3C5N9h1oM8zL0n1n90kwTvvAdV/afeHF1f+L
	RH6ZgyRHP/z0qwBcpWybtl3ZHaY2KQbY=
X-Gm-Gg: AYBFou1XZx8iayfttuW+vY2OTAteqfTRVn3EXh6LgoJthqU8MJjBO4ukzna8B9tA2n1
	TxjLRX84dZePy6P3YY5enH2m3PniG3V+G63U+aePwvGHtRoQmQ2ZGWELiAbJqvB8yh0LGxN01dc
	uu0sJPSUYcGr1172r0t7y4Ee+UKa6DSqO+KN7T99hdFZi6VsqsNK8jKRsCEbdHFyFD5v4nNawQa
	HpSc5A1Y8KFRu6U4F+BI+cifAeHoHDXUqN7yRnwBBUxDnEa2rWQgPQ3K0Xi2mXfq0oePBadXAKb
	c6xENy4+5eqeZrCqsjsFK5epGGd2Fn6KQG2AoV5uksKJtqSIyMEtR/xSMb51kbR+RFqQh4Vdw3F
	8S1lVxm0RZ0XYSnSXHPvzVv8vz4btsH0MZ5xhavKjlWjLctZjZ/5p6DHTSYiqznW359Gp8dI=
X-Received: by 2002:a05:6871:384e:b0:47a:7564:9478 with SMTP id
 586e51a60fabf-491e539d728mr6523388fac.16.1790353524653; Fri, 25 Sep 2026
 09:25:24 -0700 (PDT)
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
In-Reply-To: <CACwt7EYM8zS2xZJyCNSDek2EMsWwY9LJ9qn7Zde-EJ=czAwkCA@mail.gmail.com>
From: alan <alan.tseng.cs@gmail.com>
Date: Sat, 26 Sep 2026 00:25:12 +0800
X-Gm-Features: AclHuK_KRNIurqF4xcA_m1gHFVfFMCoZwha9zZwHH8gNsu5wqWk6Zld0E2yrh4U
Message-ID: <CACwt7Ebr8Vng6WHK9Pd+R=M-hfMtwNSfU1gQwCRPAV3AuFfSdQ@mail.gmail.com>
Subject: Re: Signed Individual CLA - OpenBMC Project - Hung-Chun Tseng
To: "manager@lfprojects.org" <manager@lfprojects.org>
Cc: openbmc@lists.ozlabs.org, geissonator@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mike,

Looping in the OpenBMC list and Andrew Geissler, since I haven't had a
response to the two messages below.

I sent my signed Individual CLA on 2026-08-20 and followed up on
2026-08-25. It does not appear in the Individuals folder of the
OpenBMC Executed CLAs yet, and my libpldm changes (93691-93694) are
still held with "User not approved, see admin, no CI".

On employment: I work at MediaTek, which is not involved in OpenBMC.
These changes were written on my own time and equipment and are
unrelated to my job. If you need a statement from my employer
confirming that, please let me know and I will arrange it.

Name: Hung-Chun Tseng
E-mail: alan.tseng.cs@gmail.com
GitHub / Gerrit username: alanhc

Thanks,
Hung-Chun Tseng

alan <alan.tseng.cs@gmail.com> =E6=96=BC 2026=E5=B9=B48=E6=9C=8825=E6=97=A5=
=E9=80=B1=E4=BA=8C =E4=B8=8A=E5=8D=882:48=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Hello,
>
> Following up on the signed Individual CLA I sent on 2026-08-20 for the Op=
enBMC Project.
>
> Could you confirm receipt and let me know the expected processing time? O=
penBMC CI is currently blocked for my account pending the CLA, so my patche=
s cannot be verified or merged.
>
> To answer the question I understand usually follows: I am employed by Med=
iatek, which is not a member of, nor otherwise involved in, the OpenBMC pro=
ject. This contribution was made entirely on my own time and with my own eq=
uipment, and is unrelated to my employment. That is why I am submitting an =
Individual rather than a Corporate CLA.
>
> Name: Hung-Chun Tseng
> E-mail: alan.tseng.cs@gmail.com
> GitHub / Gerrit username: alanhc
> Changes: 93691-93694 on openbmc/libpldm
>
> Thank you,
> Hung-Chun Tseng
>
> alan <alan.tseng.cs@gmail.com> =E6=96=BC 2026=E5=B9=B48=E6=9C=8820=E6=97=
=A5=E9=80=B1=E5=9B=9B =E4=B8=8A=E5=8D=8812:15=E5=AF=AB=E9=81=93=EF=BC=9A
>>
>> Hello,
>> Please find attached my signed Individual Contributor License Agreement =
(v1.0) for the OpenBMC Project.
>> Name: Hung-Chun Tseng
>> E-mail: alan.tseng.cs@gmail.com
>> GitHub / Gerrit username: alanhc
>> Thank you,
>> Hung-Chun Tseng

