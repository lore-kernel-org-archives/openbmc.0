Return-Path: <SRS0=OOTZ=LF=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6378C4743D
	for <openbmc@archiver.kernel.org>; Fri, 11 Jun 2021 06:54:34 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A7EC60698
	for <openbmc@archiver.kernel.org>; Fri, 11 Jun 2021 06:54:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4A7EC60698
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G1WmT3B0Cz3bwh
	for <openbmc@archiver.kernel.org>; Fri, 11 Jun 2021 16:54:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=fXODzQMc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::932;
 helo=mail-ua1-x932.google.com; envelope-from=deepak.kodihalli.83@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=fXODzQMc; dkim-atps=neutral
Received: from mail-ua1-x932.google.com (mail-ua1-x932.google.com
 [IPv6:2607:f8b0:4864:20::932])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G1Wlj2Fk0z3079
 for <openbmc@lists.ozlabs.org>; Fri, 11 Jun 2021 16:53:52 +1000 (AEST)
Received: by mail-ua1-x932.google.com with SMTP id g34so2214929uah.8
 for <openbmc@lists.ozlabs.org>; Thu, 10 Jun 2021 23:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=3gcs8+Xxgc9j9HurrLIFaRuxwPbX7POrcOQlC5Q7J5g=;
 b=fXODzQMcvZ3qRNo4pVdpVFj2mip/LNqTkwEfyVTJkFBUHQj7tO+RxZpz9IMMIBCA9c
 YX5eLK5zcQdTmVg1BElXa2tBe5ztlY8/ViBV6hrkgxfwL19vLOXk/er377pw6calnECy
 YHPHZRaRWNr+oFWhvZMR03sAKn5bk4JsRecmtEfsyOPiu/20JnR1LF3G8NZAgafeqHd8
 yORub1L5iObGGZlQ8Ex5KWeZ0HDDUC791wE7iLC+inNZb2PplBJcUjAx3O7c6I8MWDVv
 lOPsJIIA35bxptnwBf0lr/rUZUYm6/VBH1bso05TtTzfDy2GGFra61sERg5Flq48JeGU
 t8Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=3gcs8+Xxgc9j9HurrLIFaRuxwPbX7POrcOQlC5Q7J5g=;
 b=dzEiRDAM8kaUHSbw9GemuQdu5BlETR6TQ2mE4Ta1yOh7pZqa8PMdAVoC4s/IePg+TB
 GtKgxwVvxcwx6A4XrezkA0TsgXAYg1TDFKRrhWhZfEPUwVJXodk09Z3ScnDtHYgn6dVz
 Uf88mx0If9koQoL7o4n0P7aTGUhlbNM4WWELFE+lfydca6lJaF4pnoeOaBJ4XvoHSPhW
 ycrZ47YbvAEDno7whjsfigBBHzfx4eiDRHGiciFh9/QW+JpDXZ5ZRQDHSfDZ21ufgvP9
 XUU4OOOC6eNNp0OjqHEvxOCT0DQ34hwNLfHJTypdCXfqwObY1mZkNGjtw3z+G2k/lQ/b
 r5yA==
X-Gm-Message-State: AOAM531CeTLv3+BzBWG+dUqwD4Ym/7IoiFdQ+B3tmyV3SEQwXCx01YYM
 3c+HOJmQp7vFPGRyqtyahsH85pWHfZb/JeCFPNA=
X-Google-Smtp-Source: ABdhPJxjf68KCE0tkzcD+mTI3gAXTVmzJE8fCX6czYewaoqqsqpoczRHZbLddQXKFPeInZrPJagYAWDxwmkjeS4Gyi0=
X-Received: by 2002:ab0:20ad:: with SMTP id y13mr1668526ual.78.1623394427895; 
 Thu, 10 Jun 2021 23:53:47 -0700 (PDT)
MIME-Version: 1.0
References: <DF4PR8401MB0634B89E3FF275E28FB590CC8F359@DF4PR8401MB0634.NAMPRD84.PROD.OUTLOOK.COM>
 <CAH2-KxB5=VQ16c6Cabik6T3HRMNw-R+r8EStpLu-hpgqGtnO-g@mail.gmail.com>
 <DF4PR8401MB063429AA13146432E80B43DB8F359@DF4PR8401MB0634.NAMPRD84.PROD.OUTLOOK.COM>
In-Reply-To: <DF4PR8401MB063429AA13146432E80B43DB8F359@DF4PR8401MB0634.NAMPRD84.PROD.OUTLOOK.COM>
From: Deepak Kodihalli <deepak.kodihalli.83@gmail.com>
Date: Fri, 11 Jun 2021 12:23:36 +0530
Message-ID: <CAM=TmwVTAfesxeUodQwGr=3RSvR-7sXQAmF6j5_8Wa3S8fyq3Q@mail.gmail.com>
Subject: Re: RDE Enablement
To: "Garrett, Mike (HPE Server Firmware)" <mike.garrett@hpe.com>
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
Cc: Ed Tanous <edtanous@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

Hi Mike,

On Fri, Jun 11, 2021 at 2:29 AM Garrett, Mike (HPE Server Firmware)
<mike.garrett@hpe.com> wrote:
>
> Great!  We are interested in RDE becoming ubiquitous on adapter cards so =
that Redfish configuration of storage and networking doesn't have to includ=
e adapter specific code.  A good success metric would be the ability to cre=
ate a storage logical volume using nothing but standard Redfish operations.=
  In pursuit of this, a solid open source OpenBMC implementation seems like=
 a good way to put RDE on the right footing.
>
> My initial thoughts would be to build an RDE systemd service on top of th=
e existing pldmd service and have an upper interface into the standard dbus=
 interfaces for inventory, status, and configuration.  However, I suspect t=
here's some additional dbus work needed to join RDE to bmcweb because there=
 will be a need to dynamically change the Redfish model and support things =
like Actions.  A requirement for this to work would be the ability to disco=
ver PLDM devices and assign IDs (MCTP EID) in order to interrogate them for=
 RDE capabilities.  It is unclear to me that the current PLDM and MCTP code=
 handles discovery or if it assumes devices.

The current PLDM stack upstream is mostly for the BMC as a PLDM
responder, but there is work underway to make the BMC act as a PLDM
requester, discover devices, etc. You should start seeing patches for
these shortly (there's already
https://gerrit.openbmc-project.xyz/c/openbmc/pldm/+/43465).

What is the reasoning behind having RDE as a separate service as
opposed to being part of the PLDM service? I think one of the key
aspects would be the Redfish to RDE bridge (and vice versa). We're
also interested in RDE. I'd be happy to discuss/review further on the
ML or on Gerrit (if you're planning to put up a design doc).

Thanks,
Deepak
