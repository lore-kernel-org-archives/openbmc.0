Return-Path: <SRS0=LPz7=OA=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84955C433EF
	for <openbmc@archiver.kernel.org>; Fri, 10 Sep 2021 04:37:15 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE2EE61059
	for <openbmc@archiver.kernel.org>; Fri, 10 Sep 2021 04:37:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EE2EE61059
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H5NQ12ddqz2yfc
	for <openbmc@archiver.kernel.org>; Fri, 10 Sep 2021 14:37:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=SQe0spis;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::831;
 helo=mail-qt1-x831.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=SQe0spis; dkim-atps=neutral
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com
 [IPv6:2607:f8b0:4864:20::831])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H5NPF0VHtz2xfy
 for <openbmc@lists.ozlabs.org>; Fri, 10 Sep 2021 14:36:32 +1000 (AEST)
Received: by mail-qt1-x831.google.com with SMTP id s15so392694qta.10
 for <openbmc@lists.ozlabs.org>; Thu, 09 Sep 2021 21:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Xtd+PxeibnXAcTXb7Wa5QhaTTjtrVuwvHea6/mojKHI=;
 b=SQe0spisVJq/Pein9z+OhCFO6fXHsdNKtQw0pb8v8ewPX5Cgjzj9tKnC3F37h1NwzX
 XkT/A2yFjgdys7K6eaBd9vt0v/EX9oNqzCWxtwTWaixCvzOa96uZZ4Cu4VTtMC+vhMVH
 WlcNnAXyI+7PZwJbiuB/Sn80AVLvL28NKrH7qu20MFk4Z5hGSIu9jetY/rlQyOzq429W
 XLzAvUD/XPZWLHpqtl0ewxw6Zu27u8DStJ3mLsRZ4w1u31PVFHya9/KOfE+sxKuvhiCW
 wQakww/f0e8NgzL/lXGplsLB9PI9TstKgCNVg5Iy9bFo/+QXDhzLxCRvLp3GT3vogsVN
 f8PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Xtd+PxeibnXAcTXb7Wa5QhaTTjtrVuwvHea6/mojKHI=;
 b=1axqTJ/1uCRCQ0icW2UWxHHJXnT1sqLJ5mrwc3uyxzv0GHmfQaVO2sPjyTwJNZrdMh
 8oLJp481pmmv0aGzstjC9juRhJ0w51HiR/zC9H5JwRE/OgOr1MvMsOnG0ti/4+qPwU9Y
 WEQoxMGhJENwO+/xeq7s49ltOBxVrtyMPxC4i9fo3VX+80LyTvdlmCpjGJo/OfWbHGBy
 9t3v4YkoyLsWg0QIFaxtzLQV70RlYhYYjblnz5+cubpUveAYtX4ReFUu19C1NS3+X8Ry
 6pVj0/QNl0lifIioDEoee7tTpwgLWvBMwmmmiQRbDgwwSUIcBghrpIx59DF0ZvfiXgfV
 kIeA==
X-Gm-Message-State: AOAM5322r2jZWcN+igwX9JWPqmDKUgsO/sYEd+yNYAJnlO2jEe68rJsd
 i0e/G65XzPPzr9RhM9e7X6dPPTef4HcPQWDdLlk=
X-Google-Smtp-Source: ABdhPJwdqpJhOUe4doB97DiMe/J5BnMvgcBMzwfHVDLiGTlulY/zTIZgDO/p6NYcvcunawR1CJo2s41Z+hNWG3J+FYo=
X-Received: by 2002:ac8:7d07:: with SMTP id g7mr6302581qtb.238.1631248587416; 
 Thu, 09 Sep 2021 21:36:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210910022433.GD17315@packtop>
In-Reply-To: <20210910022433.GD17315@packtop>
From: "Oliver O'Halloran" <oohall@gmail.com>
Date: Fri, 10 Sep 2021 14:36:16 +1000
Message-ID: <CAOSf1CGx_r4B2nfR+G9fRBrspBHT+cM3tT8930F1c5T+0i7FKA@mail.gmail.com>
Subject: Re: [PATCH RFC] Specifying default-disabled devices
To: Zev Weiss <zweiss@equinix.com>
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Jeremy Kerr <jk@codeconstruct.com.au>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Eddie James <eajames@linux.ibm.com>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

On Fri, Sep 10, 2021 at 1:30 PM Zev Weiss <zweiss@equinix.com> wrote:
>
> The other alternative I've considered (though not actually implemented thus
> far) is to start using the "reserved" status value defined in the device-tree
> spec (section 2.3.4, [0]) to mean this -- from the wording in the spec it seems
> like a not-terribly-unreasonable interpretation, and the existing kernel &
> u-boot fdt code don't seem to make any use of it as far as I can see (though I
> don't know what might be out there in device-tree implementations floating
> around in other projects).

Nothing explicitly looks for status = "reserved" because Linux (and
u-boot apparently) ignore the device unless it's marked as okay. I
added the reserved state to the DTS spec since OpenPower platform
firmware was using it to mark devices that are owned by firmware
rather than the OS. I'd say the idea of having a bus device
instantiated for "reserved" devices is largely compatible with that
usage.

The one thing I'd be concerned about is what happens when the bus
itself can modify the device. For example, during PCI device probing
Linux will do some basic device configuration (enabling / disabling
various features in the PCIe caps) so you could have the OS modifying
a "reserved" device even if a driver is never attached to it. That's a
slightly academic problem for PCI since it doesn't even check the
status in the DT node, but it might be an issue for other busses.

Oliver
