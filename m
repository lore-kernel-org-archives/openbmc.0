Return-Path: <SRS0=mhbt=K5=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52A4FC47082
	for <openbmc@archiver.kernel.org>; Thu,  3 Jun 2021 09:38:49 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B2B99613DE
	for <openbmc@archiver.kernel.org>; Thu,  3 Jun 2021 09:38:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B2B99613DE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=bytedance.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fwgng6G6Pz2yyK
	for <openbmc@archiver.kernel.org>; Thu,  3 Jun 2021 19:38:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance-com.20150623.gappssmtp.com header.i=@bytedance-com.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=dd/OHsTN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::329;
 helo=mail-ot1-x329.google.com; envelope-from=yulei.sh@bytedance.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bytedance-com.20150623.gappssmtp.com
 header.i=@bytedance-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=dd/OHsTN; dkim-atps=neutral
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [IPv6:2607:f8b0:4864:20::329])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FwgnD2Xy6z2ysw
 for <openbmc@lists.ozlabs.org>; Thu,  3 Jun 2021 19:38:20 +1000 (AEST)
Received: by mail-ot1-x329.google.com with SMTP id
 v19-20020a0568301413b0290304f00e3d88so5179349otp.4
 for <openbmc@lists.ozlabs.org>; Thu, 03 Jun 2021 02:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=24AbiQwygyCy6o78Z+/qdbTSn7dF7N3thPSlQ2yhKt0=;
 b=dd/OHsTN2+fRJ1Mo36t63LJ0pK91Gzh7KptxUV30M6wMF2suv+5/Kz7eLDlQei0Pt7
 DUZyrJNGtqlTXmA+2jGyFuf60/m/2LGDID13wp+hZz7X4mYASe4klJFSVVQUcVW6kJx5
 t/aTahuLHSbg2SRgsPpN15OILSRoXNDK34HSZ/sDLq/RAw157q4SrdJ5EmOWTlanRJZP
 B1FeODTv6dDOcXdayVGA8icHWJHtqsybTv+UTgndkQBMMUOlFkPBraEzLPeqTAV7/dBl
 8JWEEbSmITkXWgCE9N5T8qkl1tra1pIvv2IHydDAAjEuMqtaWcsWb+e/QshbAxm8ZI0z
 1ppw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=24AbiQwygyCy6o78Z+/qdbTSn7dF7N3thPSlQ2yhKt0=;
 b=MVrBocVQCW1AKbys4XPr/Lhx3CQUSqyQ5jQIGxuiD2ZU1MLvqqadTf6Skqx8jXJU7b
 v2mhNbkvIqFwTx/CWCtq3+J463hTNDnVmsdzQiHq+nBpLMjMUFLF+VervwVNyZggQBCn
 3T9/UbhHnGIQGbkOc9EKtPxQhlriio1jI96ZS1Xtf61c8ZMgF8XeRqisYKHSkQ35daVn
 jp9Y5oIjgMurBHv6ktTS2PYUgWfBdvJns6dGTO7uKu/aufpf1+NG9BruuL+mrBPcW5qg
 hqaKzCwQAEEI6dOywmLi1ePOdaORITEGyLnS7DOjcfUekEIDWBRJyjkB+Ua8rl0XAzK+
 ByRA==
X-Gm-Message-State: AOAM5309KXykwesHO1YS/Xdggj9Z+MHbRM3cPPI7MTAeeep2p+cobZ+9
 ZGTWAMU23HDeLrW/W016eMsUB0dfsmTD1IrdSVAQ+w==
X-Google-Smtp-Source: ABdhPJz6UeyL+hRj5/I/UdRlrjTTKudpaSvaOPw4X6Y07V+aBxQrskmaWPDdAqt8ecmFt2zr2EEgO/5hY0LWz62lgSg=
X-Received: by 2002:a05:6830:1544:: with SMTP id
 l4mr14368566otp.361.1622713096815; 
 Thu, 03 Jun 2021 02:38:16 -0700 (PDT)
MIME-Version: 1.0
References: <SG2PR04MB30931F4EAC5DC1D4E968631EE1229@SG2PR04MB3093.apcprd04.prod.outlook.com>
 <85157600-4832-42bd-8f4d-87757153b732@linux.intel.com>
 <CAGm54UFm59ApCAV7DKdgfUGfjdok8dVs8ng6Brj0VXxMsrj=AQ@mail.gmail.com>
 <e37ada9e-3a83-dff8-06d5-6013d5572415@linux.intel.com>
In-Reply-To: <e37ada9e-3a83-dff8-06d5-6013d5572415@linux.intel.com>
From: Lei Yu <yulei.sh@bytedance.com>
Date: Thu, 3 Jun 2021 17:38:05 +0800
Message-ID: <CAGm54UGYOTErO2h183KWrwpVXFVmF3CvyRjLomWvM-_JWQtB_g@mail.gmail.com>
Subject: Re: SEL Event logs in Redfish
To: "Bills, Jason M" <jason.m.bills@linux.intel.com>
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
Cc: openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

On Thu, Jun 3, 2021 at 1:01 AM Bills, Jason M
<jason.m.bills@linux.intel.com> wrote:
> >
> > There is a limitation about the way to log SEL event to
> > /var/log/redfish, that it only appears in redfish event logs, but not
> > in ipmi sel.
> When using journal-based logging, the IPMI sel events are in
> '/var/log/ipmi_sel'.

Yup, so if one need to log an event and make it appear on both SEL and
redfish event, the same event will have to be written into both files.

> >
> > On g220a it still uses the logging service to represent the event log
> > (see [1]), and ipmid is updated to consume the logging entries to get
> > the SEL entries.
> I would expect that the same logging approach would be used for both
> IPMI SEL and Redfish.  So, either both will use journal-based logging or
> both will use D-Bus logging. I don't know if it would work to mix them.

I don't think it will work to mix them, so the BMC build will need to
select at compile time by a config.

>
> > The missing part is in bmcweb that it does not support the event log
> > entries from DBus. We could probably add some new code to make it
> > support consuming data from logging service, and it could be
> > implemented under a config, so that the user could config which data
> > source to get event log at compile time.
> I believe that bmcweb supports Redfish event logs from D-Bus log entries
> with this option:
> https://github.com/openbmc/bmcweb/blob/master/meson_options.txt#L21.

Good to know!

-- 
BRs,
Lei YU
