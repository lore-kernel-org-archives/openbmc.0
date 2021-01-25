Return-Path: <SRS0=9MSI=G4=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07332C433DB
	for <openbmc@archiver.kernel.org>; Mon, 25 Jan 2021 21:30:45 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 091132083E
	for <openbmc@archiver.kernel.org>; Mon, 25 Jan 2021 21:30:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 091132083E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=tanous.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DPjhd6Cp6zDqCZ
	for <openbmc@archiver.kernel.org>; Tue, 26 Jan 2021 08:30:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b34; helo=mail-yb1-xb34.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=vDeBBpYU; dkim-atps=neutral
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com
 [IPv6:2607:f8b0:4864:20::b34])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DPjdj4Y3yzDqvv
 for <openbmc@lists.ozlabs.org>; Tue, 26 Jan 2021 08:28:09 +1100 (AEDT)
Received: by mail-yb1-xb34.google.com with SMTP id v200so372560ybe.1
 for <openbmc@lists.ozlabs.org>; Mon, 25 Jan 2021 13:28:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QvbUhibJ+JOjDkcAPOh/L7kxpE5I5ozdSOnisYWQU9g=;
 b=vDeBBpYUaHJDWJkHW2265EWjspM1wr0XqIM/LVDci19lVYQ/2wnu/nEbFSWvYj50Tr
 WDQWBk/FS6VGxmOQNUpQAoLLsGXS3aFezIDp+Y7veSzhCP0uczoO3Xst3MkYZthbxnrL
 YLsvmVtP+Q3RUTz5Bkv5q+KbvHi4UWnBdoYNg3fPs2yxU5vFYZsCk5CGG9yZoaolBsAX
 M4q6aWsfnIR1SX3kHMS1JLEpCBajnZoiNex26MUKP0DTxlMwlGQ++M04JfzlnNEx/tSQ
 T3CMDDaFDk1hod/LYKtMDVtx/CCE2KZOxQ7KIKx8IrmkvOJLx6+V8ixRQ8YWQ6b9lIw3
 cFcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QvbUhibJ+JOjDkcAPOh/L7kxpE5I5ozdSOnisYWQU9g=;
 b=PtS3GMfSkTdaknfYLb3R0lSJ325MeqsGXPWm2MDx1vbRP3xaQYp4oHUpVGSwiGVW+9
 oC3M9awzG30jKRuQL6IzYcvC3URUSewgbUwWrTTpFeYP73Q0lNXD7bwnBvz90tavKkqU
 HxgHnECxbckor+Q6yrUe591ISatQcfP+6L7cNyByG576ALq9OUufxHJDcnYdOQILMazG
 I2q4EDgPpxj3A4qC+s3SJBAcf9FCFoj65AtSoLqeJ/1/4DYXTx0I7JzkGYq5srbM7tLb
 McUIkADElfsSwnJtIOGzUkmryQ4hMJtfi6kq5jzxG4vlzAmtefwN4bubfEzpUIptG3at
 q8HA==
X-Gm-Message-State: AOAM530S+TVdF7LxbTGKjMy9QNvrIbGznDDpR/XzKArKJeFG6hyX94X8
 9VHEXNswDs6xisvZpmfG9XBVN2ftcorZCuzm9BqRO/S0RZYPEw==
X-Google-Smtp-Source: ABdhPJxSzPcMLqHquumW6PeoGyFuXO67EBpgRBbGDSA6lzr0R4M4SXt5G9705jLeAgEzvfyV3f/JIym3cH+zEaDmOw4=
X-Received: by 2002:a25:6646:: with SMTP id z6mr4012904ybm.148.1611610084853; 
 Mon, 25 Jan 2021 13:28:04 -0800 (PST)
MIME-Version: 1.0
References: <CACWQX821ADQCrekLj_bGAu=1SSLCv5pTee7jaoVo2Zs6havgnA@mail.gmail.com>
 <ce3304ff-b402-1d82-7ef8-0c0cc8d3b36a@linux.vnet.ibm.com>
In-Reply-To: <ce3304ff-b402-1d82-7ef8-0c0cc8d3b36a@linux.vnet.ibm.com>
From: Ed Tanous <ed@tanous.net>
Date: Mon, 25 Jan 2021 13:27:53 -0800
Message-ID: <CACWQX83JGcTcB4WOaUDmCHqWwyPF94i85Z0e-9R=mZGXfvpCaw@mail.gmail.com>
Subject: Re: Gerrit owners plugin coming
To: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
Content-Type: text/plain; charset="UTF-8"
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

On Mon, Jan 25, 2021 at 10:04 AM Klaus Heinrich Kiwi
<klaus@linux.vnet.ibm.com> wrote:
>
>
>
> On 1/20/2021 4:23 PM, Ed Tanous wrote:
> > The final review to add the OWNERS file to the root of the repo is here:
> > https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/39379
> > And has already had some discussion and looks to be good to go.
> > Assuming there's no other objections, I'd like to get this change made
> > on this coming Sunday.
>
> Thanks for this!
>
> Is this process live now? I have a few patches that I already moved from
> openbmc to meta-*, need to know if I need to revert them back ;-)
>

At the time you sent your message, no, the changes were not live.
With that said, they are live now, so your changes destined for
openbmc/openbmc should be ok where they're at.

> Thanks,
>
>   -Klaus
>
>
> --
> Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
