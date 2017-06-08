Return-Path: <joel.stan@gmail.com>
Received: from mail-yb0-x22d.google.com (mail-yb0-x22d.google.com
 [IPv6:2607:f8b0:4002:c09::22d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wjxQx6wh9zDqFH
 for <openbmc@lists.ozlabs.org>; Thu,  8 Jun 2017 17:10:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="sWT+bwca"; 
 dkim-atps=neutral
Received: by mail-yb0-x22d.google.com with SMTP id 202so7686726ybd.0
 for <openbmc@lists.ozlabs.org>; Thu, 08 Jun 2017 00:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=fP7PRxNs9dOLBB2b6nasd1J17mo6RMulTTOtuzWlAoo=;
 b=sWT+bwca651xxw7cxPsRYrgCmSVjj+lvQ4ng01s05u7UWo+MhKGNmDCywX4jnkad5s
 2X+q2Mjlhft66LG7ELxH9uO5BnCZXwB4IjKmSIKPsr2zeAVV1WxuVoRGX7xWF4DFLhFP
 /GKLdxbeuLYyk8nOaOc0HRIhz82+4Q3Zc14IU35elJCNYlkJYuSqSZNGteWVuUX+KOSz
 bLQBYfBoWbeuUYDklxVGcSC7cQGvERcOa9BuGgbv08sg1QamYJtxjkmU6WLkgvC5EgAW
 Gwcs+qiSVn0ZuV2Ahr/ZepFQPXbbyTknUErg9++5YmxG9K6ngMRqr4guaN9L+LKm2Z5G
 +i8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=fP7PRxNs9dOLBB2b6nasd1J17mo6RMulTTOtuzWlAoo=;
 b=dqEcMmeP7lhKscBjHmVIQ2Bk96NJux9smmqWV+tIdJmUDb6d4Wghi9u1faSeZy69u9
 v+4SedLI+6muvzQwRVK/Skq1C98UZVPKnyLw62BwV5KNMOiSiBiMy/HrU0X81WchDpi7
 HMb3SwGWx0e4ISWFuD1v9AqH/YbagPyl5QSIdN4KjHB4bi5Mo7jEe1Lbsz7Yu6Pu4mVD
 w/fYk1sW0SxOeCveA00w8I2hblHaarlm2IosTDJKQ5Dh0DX+egGxWIplwke1KlAGil6o
 Udb3B0vGYKrtYQ7iTyZ2pQGyLvaFao6w43IvwfmM7ColcG+zcbrlH0HADeO662P9B6G8
 xMiA==
X-Gm-Message-State: AODbwcBjKsw3oCtqTDojw6xQdzJzLqsMzDNdN0RIKgHe0Sao9NyeFCx4
 iUqdE0gFhlihtxDrb0zMwMmbBqT7XL6bLsw=
X-Received: by 10.37.113.4 with SMTP id m4mr9370867ybc.221.1496905847076; Thu,
 08 Jun 2017 00:10:47 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.174.2 with HTTP; Thu, 8 Jun 2017 00:10:26 -0700 (PDT)
In-Reply-To: <CAO=notyH_wpUBZELWGf5dBeCApB4+Zo-VrTa4vYJyHYjpxHvjQ@mail.gmail.com>
References: <CAO=notyH_wpUBZELWGf5dBeCApB4+Zo-VrTa4vYJyHYjpxHvjQ@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 8 Jun 2017 16:40:26 +0930
X-Google-Sender-Auth: Zbj-YExVKuVCTdY17hKwv4AbJ4o
Message-ID: <CACPK8XdMs6DQRk2DWAYwgtta3cGfpEm9mjZ7TqFCsADj4LW5oQ@mail.gmail.com>
Subject: Re: New Platform Guide
To: Patrick Venture <venture@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 08 Jun 2017 07:10:50 -0000

Hi Patrick,

On Thu, Jun 8, 2017 at 3:48 AM, Patrick Venture <venture@google.com> wrote:
> Where is the new platform guide?
>
> In trying to get the quanta board running with everything; I've often run
> into stumbling blocks when trying to define what packages are required and
> what need to be replaced with custom versions -- for things like sensors.
>
> Often I've been more or less reduced to checking the journal logs to see if
> something is saying why it's not running (settings.py was crashing which
> meant ipmid wouldn't start as an example).  It took some source searching to
> figure out that x really depended on some object existing.  Often those were
> in the service file, but not every time.  And especially as OpenBMC is a
> moving target, this has been somewhat discouraging.  Especially when the
> "supported" platforms all stem from the skeleton which still has its fingers
> in many places.

As an end-user of the userspace who does not grok the systemd part of
OpenBMC, I also find it hard to navigate. I look forward to
improvements in this area.

>
> That said, there are a lot of dependencies between packages, and things that
> you receive that maybe you don't want or need or aren't configured properly.
> For example, I don't know why or what the led-manager is doing but it's on
> my system running.  I don't believe I configured it.
>
> If there is a guide, then I didn't see it and I apologize.
>
> If there isn't a guide -- I can start one; however, I won't really have to
> do it properly until some time in July.  My approach would be, create a new
> platform that mimics Zaius but under a different name and see what it takes
> to output a similar image and what is really required -- although difficult
> for me to test.  So maybe a new Quanta image from scratch and see what's
> running, and why and what things need to be configured.

I would appreciate this too. Let me know if I can help out.

Cheers,

Joel
