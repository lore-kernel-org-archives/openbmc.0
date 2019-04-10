Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::535; helo=mail-pg1-x535.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="iUtNj9+0"; 
 dkim-atps=neutral
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44fW2T6WcGzDqPB
 for <openbmc@lists.ozlabs.org>; Thu, 11 Apr 2019 03:13:21 +1000 (AEST)
Received: by mail-pg1-x535.google.com with SMTP id j26so1938989pgl.5
 for <openbmc@lists.ozlabs.org>; Wed, 10 Apr 2019 10:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=iQiB8C9w64AKc7b1yzccecy6Fq48pwYmWRcvqgmu7Ys=;
 b=iUtNj9+0SQsandiqoTtLvhKgLHHWAh57SSKQdrar4TOF4sTN9N2lR17tF5boqZnxY3
 hOyd8xWwAMq89dc1XajTgBiculfWRiB1yyEkipYsodpWMmBzm0iN632oA7KzsRPxg6ZV
 k3zEohl7M7Ojt/Y8k0zMVor0M2BRpKsIIY1NdecHN/yJ+6JbYIo1sS7x55If3i5Xm3bZ
 Ojik9RWY7JQuCcNhEJDBd8JGK50YA+XyF8QSYG9VF44lvwk2XcVkqHGevPBbqrX9XQEG
 PYb6QTRZEHGdkvFuVUiaNshalz8FprfX0gdNmhZuZTTjCYTb0xpQ08A7oceWkDKdc7Yk
 +dow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=iQiB8C9w64AKc7b1yzccecy6Fq48pwYmWRcvqgmu7Ys=;
 b=DynRkt5c/iAOxbOLtevAIiFzxAeeOnd61N2O5OTp6yPoVJeerITW1mAyfDqX3ZPZc1
 iMxKTkQwx2t2kIQYy8A0mC592a2EYuokeTq2JXWT+xQ7c2mRbz/9oVoVGMsenor1F+HJ
 v8R+r7Qp6xJU2c3TUCbr/J8OACt7d/fSHHO0Hn8ZnE6z32MhrcXW5n4BWVC1MMeeHJPv
 lbi1SsqtTQ7c39j9HGCwPZSqXXN/ng7MSEIf6SStjPjcfE6msEw8QKp5wCTbG+GoTpah
 t81CkephQjIrE5CHh1xTvSmIpUBGFPydawmDmSQJMsh/ajMMDinAQZzEaPNWWKLuLjoh
 Cidw==
X-Gm-Message-State: APjAAAX20JgCikjtNCmfq4ejfJ6GuPO/JW99XHhHCdP+R2bQcVTyunL7
 XzwFY5aEhod+TY4blG75bwOzL8hh4hG9G6VZUUPECg==
X-Google-Smtp-Source: APXvYqzbbxsoBmIjjD6Jzcpm2qX+QNu+iWztCeN02Dmp0MBf3lvZWHHY2DDbhXl0flUPr76hJ79/dEIGab0GFYUDH2s=
X-Received: by 2002:a65:5682:: with SMTP id v2mr42823914pgs.100.1554916398061; 
 Wed, 10 Apr 2019 10:13:18 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notxhe24e8-1dTcspD_H7xTy49yEnnn-gJbUciekirzKC_w@mail.gmail.com>
 <CACPK8XfwP_DwqthSwgFGMjqRepGkC1XdziZ+eEds=6ND_Ov71Q@mail.gmail.com>
 <CAO=notwAcxqFTN31Ecfd50rkjKm9X7PQsTFAP4Rc_xvN0wALUQ@mail.gmail.com>
 <e44834c9-2755-1d05-1df1-d0fa930d48bd@kaod.org>
In-Reply-To: <e44834c9-2755-1d05-1df1-d0fa930d48bd@kaod.org>
From: Patrick Venture <venture@google.com>
Date: Wed, 10 Apr 2019 10:13:06 -0700
Message-ID: <CAO=notxCM7hR7bXXOi3Z86PikHxAj7CXSDWda-KV9wWxKSwBdg@mail.gmail.com>
Subject: Re: transitioning from 4.17.18 to 5.0.6
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Wed, 10 Apr 2019 17:13:22 -0000

On Wed, Apr 10, 2019 at 9:02 AM C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> On 4/10/19 4:39 PM, Patrick Venture wrote:
> > On Tue, Apr 9, 2019 at 7:17 PM Joel Stanley <joel@jms.id.au> wrote:
> >>
> >> On Tue, 9 Apr 2019 at 16:35, Patrick Venture <venture@google.com> wrot=
e:
> >>>
> >>> HI, I ran into some weirdness when transitioning from 4.17.18 to 5.0.=
6
> >>> with the quanta-q71l board.  More specifically now my host can't talk
> >>> to the BMC via ipmi-bt.  All it returns is 0xd5.  on the BMC itself, =
I
> >>> can talk to ipmid file via dbus, and btbridge is running.
> >>>
> >>> Has anyone else run into weirdness?
> >>
> >> I've not seen that.
> >>
> >> My only guess is there is an issue with clocking. Can you try booting
> >> the machine with clk_ignore_unused in your kernel command line?
> >
> > I'll give it a shot, although IPMI not working is odd since the
> > LPC_CLK is enabled.  But yeah, I'll try that today and reply back,
> > thanks.

root@localhost:~# cat /proc/cmdline
console=3DttyS4,115200n8 root=3D/dev/ram rw clk_ignore_unused

./gbmctool -command firmware -action get -field version
Get Device ID command failed: 0xd5 Command not supported in present state
E0410 10:12:01.640883  456408 real_main.cc:53] Unable to send code:
Command not supported in present state

So that didn't fix it unless I need to reboot the host as well.

>
> I don't see this issue on a palmetto, BMC running with 5.0.5.
>
> C.
>
>
> >
> >>
> >>>
> >>> I am seeing:
> >>>
> >>> [    4.645814] ipmi-bt-host 1e789140.ibt: Found bt bmc device
> >>> [    4.650341] ipmi-bt-host 1e789140.ibt: Using IRQ 32
> >>>
> >>> The dts file I'm using is basically identical to the upstream one, an=
d
> >>> my defconfig is also nearly identical to what's in meta-aspeed for th=
e
> >>> ast2400.
> >>>
> >>> Patrick
>
