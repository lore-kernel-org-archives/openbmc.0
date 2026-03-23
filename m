Return-Path: <openbmc+bounces-1682-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FE3DF483CC
	for <openbmc@archiver.kernel.org>; Mon, 23 Mar 2026 16:57:48 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fffVZ4tzNz2yWK;
	Tue, 24 Mar 2026 03:57:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a00:1450:4864:20::42c" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1774285062;
	cv=pass; b=dVx34bPORxssGJltD2IaxG16hhMRrgM/SytOFkh7sC2DxcwqB7wRnkci0nVlu1xkyIBLaAKqmqSCwE5IZjaMllmoXRzGgTsylyZuON4NYfPPDm7m5n2whFNC14z1GQyOnaEJHSST/UfBha9fGahPoaF0j5wgqEp+KO29SdoOZGM9U+5A3Nrv14UYT/9xAJyjt0H7E95LIQquELCHFXOSg+pr1/dZ8psHeOSK/P8liBhZ8GOaiNdHf9bdtlYukLuBFrLFmQY/TT1s2fB9ukVY4iDYgbfV9aLsQgWro2F10lNVD/wEG/tWzB8sUPDLiX+xJ5UJJ4opurUUNP7fS2xN8w==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1774285062; c=relaxed/relaxed;
	bh=Mx0f4ROa+1cSn3V6hawK+DDtO7DzeZH00OelAiCMI88=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OL8sVCiZmvth5MWlU/21pg164qK6jRuPlkNQn8aclSaGPc3XVpbaOAYF/nTNJWIBOuitFt4CalgTBcJFHlA536zHnwlOViUtjlC375J1ht8I0B7+xmN4iaE6CwJgKWSA/SbOEwijAByeo/6XbCgir4CiFKl2K/ezi4VcGHFX/Y7TLDkZSyrusSsdkAPmV+doSVgtWzbgljrcFePhk/KhF9OUjeZf1cbtjPXg1wXBrZEOIVomBdN3w7K3bR0C7NrkK9pPp/W6zuHlWyum7vAFTha+uiI8nfqq7uuzi2YpmH02T/Jd8OlUrab8UsqpGDX0sZnJrpfdVpDnR+h8T9z9Bw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=naOFDOQI; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com; envelope-from=deepak.kodihalli.83@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=naOFDOQI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com; envelope-from=deepak.kodihalli.83@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fffVX6PCKz2xs4
	for <openbmc@lists.ozlabs.org>; Tue, 24 Mar 2026 03:57:40 +1100 (AEDT)
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-439d8df7620so2878898f8f.0
        for <openbmc@lists.ozlabs.org>; Mon, 23 Mar 2026 09:57:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774285052; cv=none;
        d=google.com; s=arc-20240605;
        b=O8FZvuHFcgh4qf5TPPr/h5KykAlUAPZ9ZFA2eH2klhr2NKRB9xr40sVXqTCPFWRRzJ
         0utzbty5nRQuWIkS9d0JEJDMzMLlhlpIQrnC2m0Ofmzj4Nsh2cOpVcvC7QdVGXxTG0bG
         p25y1lq98J940K+eaVWoGbuNCSIxNPS/dfSTYThyA5JUfIBF/hODNItTyOK30bldztVY
         wsKa6tYeYt3PiI0T8ThYOfQyZso13yNngdvTQMOfGGjBGQVQx06fw8N/z3YiBm4eKvHB
         3OXsj7SrDOsSZmkJL0t1ptvGsotVG7BZBVTAovZ9AkOGWhTe7tWTI3WamPUB3TqEegqG
         1eqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Mx0f4ROa+1cSn3V6hawK+DDtO7DzeZH00OelAiCMI88=;
        fh=FD0vqnDumQ9DSr/xVRIdO7ly46uZxiceyiQs2zsUQTU=;
        b=OIV/yelthT72BTbUPYqszKqs2uRxJjpfL8W9MGzCmlZYAJ+dPoYA7GqVQ/V3JHeXHn
         p3oLzFR3REuDvrNN6hkuj7nF0SM9YvAS3vD1M2DcqtPlif+N3z0/z0G/rCsQn90PXaxS
         6jokQ9CMvkW39rhT7K5IqAe9puufHan1YzYYoA8+4h8TuoZjRIxdjcz79xku5NaEh+jw
         4ASB98fbxx5u4Lp/lo/EYbTpiDgzwIg1t7aWExu7swcqYUE0z7Mj3YLtyNZU5MHIHQsd
         0WhS25bLXo8S5QCS9iT1dKpZj4Nac1auAD/kT8GbDXz3zTPYaQeEXXnBZBzsdvPhRqea
         Nl0A==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774285052; x=1774889852; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Mx0f4ROa+1cSn3V6hawK+DDtO7DzeZH00OelAiCMI88=;
        b=naOFDOQIVJrJMowwZXRRKqH/jjN1R+4Nnk11JPzB00gwDNFwYwbsXKuvP55U4yky+I
         FrbMg/7zZ4RaFe1VLqM3cStRgZQqhGgAAOz6MK8rj7AtdMHYubFbwGmWhmmU12mGarhk
         lWmfhw7vu2ujP1tPXrceW8CdpIn9DTjFdeXlTIHL7AE/654SmAD5sJ73ka0c2CjNUKCl
         LO7QURUUu0QtkW1QNQTJE5lO8hsM0tgT10pMLWck+w99H6Y1ns1zNr7YiM0RWvaTTcSV
         g4kDMDok1iD6JXeTQYeOccQlY3EP5iS3mQ0cGA/00uniQx3sDvdbSGNe9WAq8gt7H5Yz
         jVeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774285052; x=1774889852;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mx0f4ROa+1cSn3V6hawK+DDtO7DzeZH00OelAiCMI88=;
        b=mCal7vN7NAJ5Ropm9GRe1IYcPIcv6mWyJaOQmo5YUgQcnSa1rjIn05pdGpTXmhPKY3
         q06fZ/WlHwoAVw9QwZ9TOC0rbV/r++p/mkrb9gLZiulIUuXYnQJKF9EkoceII7QVNC/6
         /jSZ6VmITsVdLtkXocPz4Am0D7Fh2Zrlu7Opws5mZKZwMEaPJotT2LdhDBNVCUNz4QrY
         bNG5wFUFAVrYgepkJopcU75i7/T7P4uWJUjIzA5UMpF2JiISXCue+S6MaxplyDOzfpiL
         +V/0uAnXBIKnDqHaqTlO1K/vkNt00560V/wUlcLhIue1jupDdawzd4ej6R2vIAcqByI3
         UXUg==
X-Gm-Message-State: AOJu0YyQu7q4+Qg5GaD+x7eqnenzfdkEraN4+dUzdQFi7Fht7H8V+f7P
	hfX0fnIQKhJXQw9VjYTBJWMogbdkQe7KfFqPmbEibwNHIWzj+hDBlyYwkPILTHpO2AV6w5mka2s
	ouyXAn4OdkccG6nmqx/Nhv4JLt15/+wRIM1np
X-Gm-Gg: ATEYQzwx/tSjKnL6O30oJ7Krn9jgYjA3NZVtaRaH4aNJRP96tDAleS30e5K/lc0VfOI
	giz2EHwTFRrTm/9YzT/H25CiK4NTvxXWHEFu+k2JyBzLypqD8W2ylP1tavVInbDik/AQiNfGAYq
	2+9Ubgh5tgaVMIkvUOy6wUjH+qkBxP/GGysXfRsY6IuSezzgfAKOtbbAuegzQIV/HX8zanOqaY5
	G2f+vCGyLzk0GVzmCsCkU5eMCUK9F42rjL0m+PUvKbGDjwjk/fmBT52MgP6V38mRpIo6Es9rOvf
	LrFBAA==
X-Received: by 2002:a05:6000:25c7:b0:439:df25:b707 with SMTP id
 ffacd0b85a97d-43b6428ab94mr20120987f8f.55.1774285051863; Mon, 23 Mar 2026
 09:57:31 -0700 (PDT)
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
References: <aXDmS4BmR6AGXKGW@heinlein> <absG_8pQilMHGMnO@heinlein>
In-Reply-To: <absG_8pQilMHGMnO@heinlein>
From: Deepak Kodihalli <deepak.kodihalli.83@gmail.com>
Date: Mon, 23 Mar 2026 22:27:19 +0530
X-Gm-Features: AQROBzBGtCik1CGp4En0D64BXj_GqNSmYGnJHVQPUkUvGaRHCP8-ShzmF5V2Rak
Message-ID: <CAM=TmwUOe-_YKTjmMJwSLLSUv75vYScC7WUfX4y8R52JmGNGHg@mail.gmail.com>
Subject: Re: TOF elections for 2026H1
To: Patrick Williams <patrick@stwcx.xyz>
Cc: OpenBMC List <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"

> With this being the most nominated-for election in TOF history, I would
> strongly encourage candidates to reply to this email with a [brief]
> campaign: who are you, what work have you done for the community, why do
> you want to be on the TOF, etc.

Hi,

I'm Deepak Kodihalli. I work as a BMC engineer at Nvidia, focused on OpenBMC.
I've been associated with the OpenBMC project for 8+ years (hiatus during
2022-2024), and have a broad range of contributions to the project [1]. I
implemented the initial PLDM stack. I co-maintain pldm, phosphor-logging and
phosphor-settingsd. I'm a contributing author for some of the standard
PLDM specs.

My recent contributions are in the areas of phosphor-dbus-interfaces,
pldm reviews
and the Nvidia GPU dbus-sensors app. I'm also working on getting MCTP over USB
patches merged across a few repos.

I would like to be on the TOF to provide input on/contribute to the areas of:
- Anything related to PLDM
- DBus Interfaces guidelines
- Ideas to improve rework/review times
- Improving code coverage

[1] https://gerrit.openbmc.org/q/owner:deepak.kodihalli.83@gmail.com

Thanks,
Deepak

