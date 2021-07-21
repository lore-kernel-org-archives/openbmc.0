Return-Path: <SRS0=JShZ=MN=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1038AC07E9B
	for <openbmc@archiver.kernel.org>; Wed, 21 Jul 2021 08:35:04 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6159360D07
	for <openbmc@archiver.kernel.org>; Wed, 21 Jul 2021 08:35:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6159360D07
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GV85w2ZZSz3bSt
	for <openbmc@archiver.kernel.org>; Wed, 21 Jul 2021 18:35:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=jZuaEjTW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::929;
 helo=mail-ua1-x929.google.com; envelope-from=deepak.kodihalli.83@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=jZuaEjTW; dkim-atps=neutral
Received: from mail-ua1-x929.google.com (mail-ua1-x929.google.com
 [IPv6:2607:f8b0:4864:20::929])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GV85M2QGcz2yLK
 for <openbmc@lists.ozlabs.org>; Wed, 21 Jul 2021 18:34:30 +1000 (AEST)
Received: by mail-ua1-x929.google.com with SMTP id q20so582761uaa.3
 for <openbmc@lists.ozlabs.org>; Wed, 21 Jul 2021 01:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=HhruggTJ3zmTCsjRJjj3nx5lPnpAt/JCYoXR85LrOpU=;
 b=jZuaEjTWv+S+SiJP8bLoIRkzOXv0ddRIlOdghKGVG3r/PetsUYnUwZ7dTADETB3vsU
 RXHXDgJT95puCrW8II9MNyUoRq3AtITdOdsAWb24jc7LNAu84crbSDiv+Hv3chp6ISiz
 gNyXUy8Eqnu3JH+0h/fI4Z3Ved8WtRJDMUSz8V9APoPOpygJVv0Dt0gVHVpCxPgWkH2W
 iFilNL5WeKAH3xC5ZroubKvlGNhRa4ZJbfPbnIFYyheJFCfscWa0f5SXDjdnGX7Fe6sF
 AWZ/eXxnT460YRynFV3hqnfCWZy4uAlKrphNHQlT2UwuALWyjPAstAcNU5XdMQOUVeGJ
 7oFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=HhruggTJ3zmTCsjRJjj3nx5lPnpAt/JCYoXR85LrOpU=;
 b=jGbmIZvvirfrqUWERuDRybdavN096IXqaNw1Cl4nQ4DHk0L3gX7bBpIlluBIBae/FY
 PTulYyf9xemqyn9o5oe0ytX4U2tHag9Yor5TF2JoR83ilv5nJofoyw4xKkDR3SpJt7CX
 J/FKhs6RIkWvjIWIzchTHcXYLt3u17bLDHAQPmjJIGXbjB2DFxMHao+LVdhQony8k4Ag
 43gUasCpbKNEvHBN/Z3OM1ZulnQfbAm4HfzbCHruJl6kxhZ/hCBsMKyM71fKB+Wt9ORF
 3D7MnjFsO/DPPXcDQo+ONHVYYYxqBwfARsGcxskMmV4ibe5/7PJd5XtfLWNQrlpDZ3Yl
 jVlA==
X-Gm-Message-State: AOAM533xOGs8Mp+k5b7tKk6UTPZq5oWYHnsFNerlU/1pnsK67byHFWOF
 9XK8T8+BiBlMibelwDLe1c7xw1YwRRZDRfHVMlw=
X-Google-Smtp-Source: ABdhPJyfM9PlMw65YAHr1YZSVSzomvrjAldQkLW8FHpBgL8BnOsGVtmdgILYsYYCdY95KtO7OFkDhjpBNGkeOznOx+g=
X-Received: by 2002:ab0:59a3:: with SMTP id g32mr35415648uad.34.1626856465063; 
 Wed, 21 Jul 2021 01:34:25 -0700 (PDT)
MIME-Version: 1.0
References: <DF4PR8401MB0634B89E3FF275E28FB590CC8F359@DF4PR8401MB0634.NAMPRD84.PROD.OUTLOOK.COM>
 <CAH2-KxB5=VQ16c6Cabik6T3HRMNw-R+r8EStpLu-hpgqGtnO-g@mail.gmail.com>
In-Reply-To: <CAH2-KxB5=VQ16c6Cabik6T3HRMNw-R+r8EStpLu-hpgqGtnO-g@mail.gmail.com>
From: Deepak Kodihalli <deepak.kodihalli.83@gmail.com>
Date: Wed, 21 Jul 2021 14:04:14 +0530
Message-ID: <CAM=TmwWJ58RaUhjW9axXdyPDSsePG0zQsnxh-FKSj4C5nZG0Kg@mail.gmail.com>
Subject: Re: RDE Enablement
To: Ed Tanous <edtanous@google.com>
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
Cc: "Garrett, Mike \(HPE Server Firmware\)" <mike.garrett@hpe.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

Hi All,

On Fri, Jun 11, 2021 at 2:02 AM Ed Tanous <edtanous@google.com> wrote:
>
> On Thu, Jun 10, 2021 at 1:26 PM Garrett, Mike (HPE Server Firmware)
> <mike.garrett@hpe.com> wrote:
> >
> > Greetings,
> >
> > I'm am interested to know if there has been any organized discussion or=
 development on Redfish Device Enablement (RDE - DMTF DSP0218) for moving e=
ncoded Redfish data across PLDM/MCTP interfaces.  We are interested in prom=
oting this standard and are willing to lead a reference implementation for =
OpenBMC if there is not yet something in progress.  If there is something i=
n progress, can you point me at the work because I would love to see it.
>
> We are interested in this as well, although we are in the early stages
> of looking into it.  Ideally we'd like to have OpenBMC support add in
> cards (NICs, Accelerators, ect) that supported this functionality, and
> make that data available to the normal OpenBMC channels
> (Redfish/ipmi/ect).

I had a couple of questions on RDE, and I wonder if this has crossed
your mind as you started looking at RDE, or if this is
misunderstanding on my part:

1) I understand the problem RDE tries to solve in terms of avoiding
having device-specific knowledge/code on the BMC, but doesn't PLDM
also solve a similar problem? For example, if a device supported PLDM
Type 2 (and other PLDM specs such as the one for FRU, etc), the BMC
could convert PLDM to Redfish. I understand this may not be as
convenient as RDE but it still solves the device-specific code
problem, PLDM being a standard protocol as well. Am I missing
something here? Is it just that RDE is more convenient than PLDM to
Redfish conversion, or is there more to it - for example, PLDM
can't/isn't intended to be converted to Redfish, in an
effective/lossless way?

2) Is RDE specific to a class of devices? Some of the documents I see
stress on I/O adapters. Would be it odd to implement RDE on devices
like Accelerators, CPU, etc?

Thanks,
Deepak
