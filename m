Return-Path: <SRS0=gkvK=PO=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F0CDC433EF
	for <openbmc@archiver.kernel.org>; Tue, 26 Oct 2021 02:39:06 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 921F260E8F
	for <openbmc@archiver.kernel.org>; Tue, 26 Oct 2021 02:39:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 921F260E8F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=bytedance.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HdbcS1kX5z2yg3
	for <openbmc@archiver.kernel.org>; Tue, 26 Oct 2021 13:39:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=JwATd5ml;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::22c;
 helo=mail-oi1-x22c.google.com; envelope-from=yulei.sh@bytedance.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bytedance-com.20210112.gappssmtp.com
 header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=JwATd5ml; dkim-atps=neutral
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hdbbf5N2Sz2xWt
 for <openbmc@lists.ozlabs.org>; Tue, 26 Oct 2021 13:38:20 +1100 (AEDT)
Received: by mail-oi1-x22c.google.com with SMTP id r6so18417729oiw.2
 for <openbmc@lists.ozlabs.org>; Mon, 25 Oct 2021 19:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=W+/FxFhgmWJh2Sn9mMbPaBweHU8zYQwFjSJkPebieR4=;
 b=JwATd5mldJ6S27eP3aghii7Kdv6A1RI7IK6f2zo1jjQJIbvTSPuXxLSRNktPKOEiBo
 QvLjHX/i5YnqKi6D/phelOdrZ4QrR77C0crU41jydhBUdjSxWz01KkPvR8asYgNKoKiO
 SE7COqfPRhF3o6j0N58q33B1PZGf8w+22Xyr3rusQoqLRKYZagGXqafQCobtWw5gLeTN
 /FA0SRKbio97AO/tBQZlsXrL30LsNM6UXzRh2395y3W3BqxOsdPmUdXuecaLEOEJAXR8
 WTKZM5PDXJobk7IgerlS7c2HL+yrzp0aKC33+/cOg6ahUuEuVJ4wjIvbFDgUv8/iwnUs
 ZtGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=W+/FxFhgmWJh2Sn9mMbPaBweHU8zYQwFjSJkPebieR4=;
 b=TB+bBL7CBTqq7DVjM6zVbHG6cwldbdPYgKym7lMvEEGxHWEn2MHE5egxbXAgMXArqh
 aH/iVGbVo/PccsAfQ5gxHrBGdlXPhNROlpDxXJuVttx9JXq6WgndMzN2mqMOQfxQ0Fld
 SJ4HE/RNje4gu+SlCLRuYEFEjplula3sR4TaFkrrEw/QUulmUkYv38TE7jXALeoBtszY
 6KyXG+hXS62lxhwe88UKIwZSua/meJokdaxO31t9T2Mn0Sjt2u4MHNQKiDK5v+otXJ3S
 BrPLRf2BD4n1CcwNGRDFsvYoGP6cmNb3SIcwEg1aWMlIx+BPUeNKinQwnBdBPDLy2Wq4
 gNDg==
X-Gm-Message-State: AOAM530KyheE/DChdbhKI1FJVLtqdDkwkfVZ3dV6zxzsOwgTWWOydVLE
 BPyf3cZEkc/Hk+JEglwq5Hp3akAV6y/qX3vpUOeX6XMJqwVpCYlD
X-Google-Smtp-Source: ABdhPJzyDPE1JMjHPS0d6KjjoSzwoFdGFXMcAbmkcoKmZMnVNZjaT1YfE0oJKm1qiBJKPd8jTCcshSxThMGMOSqw6og=
X-Received: by 2002:aca:60c1:: with SMTP id u184mr8321760oib.50.1635215895901; 
 Mon, 25 Oct 2021 19:38:15 -0700 (PDT)
MIME-Version: 1.0
References: <DM6PR08MB5514939D6512525765C3EE23DC839@DM6PR08MB5514.namprd08.prod.outlook.com>
 <a9ae1f74-e48e-f266-7e88-5b2ad27cf7fe@linux.intel.com>
In-Reply-To: <a9ae1f74-e48e-f266-7e88-5b2ad27cf7fe@linux.intel.com>
From: Lei Yu <yulei.sh@bytedance.com>
Date: Tue, 26 Oct 2021 10:38:05 +0800
Message-ID: <CAGm54UHh2CUhvRSD4fKzTgbqZENPVfzesvxcK0Gxd4QtGQ1nVw@mail.gmail.com>
Subject: Re: [Phishing Risk] [External] Re: [phosphor-sel-logger] How to add a
 journal entry manually
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

On Tue, Oct 26, 2021 at 5:09 AM Bills, Jason M
<jason.m.bills@linux.intel.com> wrote:
>
>
>
> On 10/25/2021 5:02 AM, Chris Chen (TPI) wrote:
> > Hi all,
> >
> > I for now have added rsyslog and phosphor-sel-logger packages to build
> > the image, then I could see the xyz.openbmc_project.Logging.IPMI through
> > the busctl command after the system runs up.
> >
> >  From this link,
> > https://lists.ozlabs.org/pipermail/openbmc/2019-October/018640.html
> > <https://lists.ozlabs.org/pipermail/openbmc/2019-October/018640.html>, I
> > understand that I should be able to add a journal entry that has the
> > IPMI SEL MESSAGE_ID: "b370836ccf2f4850ac5bee185b77893a" to test the
> > feature, but I don't know to give the correct parameters to the method
> > call, IpmiSelAdd, as below,
> >
> > ~# busctl call xyz.openbmc_project.Logging.IPMI
> > /xyz/openbmc_project/Logging/IPMI xyz.openbmc_project.Logging.IPMI
> > IpmiSelAdd xxx
> >
> > Could someone help me out on this? Thank you.
> You can find the implementation for IpmiSelAdd, here:
> https://github.com/openbmc/phosphor-sel-logger/blob/master/src/sel_logger.cpp#L270.
>
> "IpmiSelAdd", [](const std::string& message, const std::string& path,
>                      const std::vector<uint8_t>& selData,
>                      const bool& assert, const uint16_t& genId)
>
> Where
> message = the string to set as the MESSAGE in the journal
> path = the D-Bus path to the sensor that logged the event
> selData = the raw bytes of the IPMI SEL entry
> assert = the event direction of the SEL event
> genId = the Generator ID for the SEL event
>
> The busctl format is 'ssaybq', so a sample command is
> busctl call xyz.openbmc_project.Logging.IPMI
> /xyz/openbmc_project/Logging/IPMI xyz.openbmc_project.Logging.IPMI
> IpmiSelAdd ssaybq "helloworld" "/xyz/openbmc_project/Test" 3 16 32 64
> true 0x81
>
> This should add an IPMI message to the journal that is picked up by
> rsyslog and sent to /var/log/ipmi_sel like this:
>
> root@intel-obmc:~# cat /var/log/ipmi_sel
> 2021-08-20T01:16:48.747428+00:00 1,2,102040,81,/xyz/openbmc_project/Test,1
>

There is a configuration option send-to-logger[1] that changes the
behavior of `IpmiSelAdd`.
With the config enabled, `IpmiSelAdd()` sends the log to
phosphor-logging service and becomes an entry in
/xyz/openbmc_project/logging/entry/, instead of saving the message in
/var/log/ipmi_sel.
And ipmid will parse the entry into an SEL record.

[1]: https://github.com/openbmc/phosphor-sel-logger/blob/master/meson.build#L31


-- 
BRs,
Lei YU
