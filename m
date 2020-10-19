Return-Path: <SRS0=JxwQ=D2=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2887C433E7
	for <openbmc@archiver.kernel.org>; Mon, 19 Oct 2020 17:33:30 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C573D222EA
	for <openbmc@archiver.kernel.org>; Mon, 19 Oct 2020 17:33:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=tanous-net.20150623.gappssmtp.com header.i=@tanous-net.20150623.gappssmtp.com header.b="rrZACeKL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C573D222EA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=tanous.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CFP475hCqzDqdl
	for <openbmc@archiver.kernel.org>; Tue, 20 Oct 2020 04:33:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b30; helo=mail-yb1-xb30.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=tanous.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=rrZACeKL; dkim-atps=neutral
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com
 [IPv6:2607:f8b0:4864:20::b30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CFP2S29VFzDqdG
 for <openbmc@lists.ozlabs.org>; Tue, 20 Oct 2020 04:31:59 +1100 (AEDT)
Received: by mail-yb1-xb30.google.com with SMTP id b138so218264yba.5
 for <openbmc@lists.ozlabs.org>; Mon, 19 Oct 2020 10:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4V12Dz9a8TgUdpGHzS4ZgQuhgyyMr0qAmkf0OSo5584=;
 b=rrZACeKL0xJXlVF96LFh5sg2wuQUkizv0trl/5BSkubCTZK/ECJeVHGHLVeuBON1j/
 kk5YKzIVga+wAWBuCrdxJiM2t8ku0+xDF3WAbUMQJBZmv0IYMNQvXjsDpT5JuQFZqTXI
 YEXbX4xApzUo4qRm+RMLRPKmWoGkpJojxIVC94G31FmMhKuG31GghTftcNXpDsg3yBZw
 SQI7YsvjTFr596L4JSBxxtuYi4iTI0/LCrzWnzlSfT+/LbMt05xG0Vod6oExMBXBYTaF
 uLWVKR28j6G9XeAVoUDdQj0M82YNgvxXsVW+80fayxa5e9Sv0YA48MomAAytJWTl/lBH
 jETw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4V12Dz9a8TgUdpGHzS4ZgQuhgyyMr0qAmkf0OSo5584=;
 b=Z0Te/TkFbZGpPPLdtXlxQ/FilHbBkTKjdePvb46bWxybT5Q51V4q2waQ34NtUjqiDq
 qNwkGDRqpMCKwAuBkAgSHr6BXMkxi3GX3oLpUxG8xSDULAcG016nB6bBsCdV5XliHLG3
 Gh0CHE1u+TXbrHoRtUb6Nsz0NixnH2W4EW7uMCOhCKx4p0lb7lbL9E7xqLkunPqAiCRR
 ochXNAh8EW5fpcTPvLeSauPAVlLOBD0Dv8mymtsaW/TonN6JGMhWKhXHRra7hgIEdJNv
 NKwNZLLLW4y73VPn2XeALzjEoMbldRDF/S3t370TSTzRWjskGOP7QojF2vbS8u9WzzPF
 rPyQ==
X-Gm-Message-State: AOAM532IKriu8sqZHWFEBQA92QyGdHPOgTlAQojXKQ2yCWZbp8O1z9pv
 eTIRPNiFHUc2oTmssFA9fqa097g/5b2clXh9RQYftJCFNxKwc9wr
X-Google-Smtp-Source: ABdhPJziuUJs0gYLm7Z78nIN6Yra0Xcm7hxOVF3kWB5TuPTVVTyu2myIIdufUa18atjztqoXfmkFH45Of6jceP4jTlM=
X-Received: by 2002:a25:e755:: with SMTP id e82mr381216ybh.417.1603128715260; 
 Mon, 19 Oct 2020 10:31:55 -0700 (PDT)
MIME-Version: 1.0
References: <CALioo35zJdqL7uAhvxAuqa7c16wAdtfc+JVSz6Tg5UG5Yp8L3w@mail.gmail.com>
In-Reply-To: <CALioo35zJdqL7uAhvxAuqa7c16wAdtfc+JVSz6Tg5UG5Yp8L3w@mail.gmail.com>
From: Ed Tanous <ed@tanous.net>
Date: Mon, 19 Oct 2020 10:31:44 -0700
Message-ID: <CACWQX833j+remiYr8qOdrZZ4z3L3D_GX0q6z4MPJDu8J4Nv+Pg@mail.gmail.com>
Subject: Re: Enable/Disable some sensors when Host On/Off
To: Thu Ba Nguyen <tbnguyen1985@gmail.com>
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

On Sun, Oct 18, 2020 at 7:00 AM Thu Ba Nguyen <tbnguyen1985@gmail.com> wrote:
>
> Do we have any options/solution to Enable/Disable some sensors when Host On/Off?

I believe this is already supported in the entity-manager/dbus-sensors
stack, with the "PowerState" parameter in the EM configuration;

example:
https://github.com/openbmc/entity-manager/blob/def29274907ef77187b02ae19d55bb9888413892/configurations/WFT%20Baseboard.json#L6

There's also mitigations for the common thresholding issues, like a
power state change coming in during the sensor read.
