Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x244.google.com (mail-yw0-x244.google.com
 [IPv6:2607:f8b0:4002:c05::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3whb1B6xZxzDqL1
 for <openbmc@lists.ozlabs.org>; Tue,  6 Jun 2017 12:17:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="d0QvS85W"; 
 dkim-atps=neutral
Received: by mail-yw0-x244.google.com with SMTP id h82so9115062ywb.3
 for <openbmc@lists.ozlabs.org>; Mon, 05 Jun 2017 19:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=Kr3On/XIuiUvPsJuZftFxMT8rvo8Z/WmlHZs/pQnyFs=;
 b=d0QvS85WLUfAd6XrRrERSePbyKPAdVX5rWPT+mm5ZUlVwGc52p6+lYMszZQPcXDkQt
 VhBoDdplYHGZwiR4xduHd2P63LAMa54TgTXiCPTWPcz+GNHgr0aDNnqMJBhHdw/HXO+J
 WlBR3gyWIXrM9DC6QtBmAkqIsf8Vragk9qhUPQar4CzHIWhyBA5JXX/SrJv6ivhZjSKF
 pcN5xemBLaYoQ3uM4pGFvhNUsGDZE98g3TBRNJk4YVS9j+LPNpgD9abVWXbzsU8fr3VQ
 43HgJCclEuUTn/KmVsAjnhfvVfkSXH3t7CRIU5X39yKEfoZrsehdRYk8SuQgcx/0FQjd
 Rc0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=Kr3On/XIuiUvPsJuZftFxMT8rvo8Z/WmlHZs/pQnyFs=;
 b=VYa9vLm15evP38A5LgS/B98VcLDgEtFB7BsKigJiQub94Q01KDO45vlu8G2MLV9pR8
 eKRRfqyqWJoeYqR268Schvs+t/bBofVl15Ft9pzBp5KtbE7Gl1O9NmnzjTVuHc7RoCY0
 am54qdLTbdiCJzlTG+EuG4KP7ewpNsYcdXxFO/fyua3tnyLJ81DlF4a/6iDAUCzaJtK0
 VKjzGVI8HsxAbcXXPi0+8KL4uGA1tVe5nD/TmXgCBFWqcy66qnAMWjwZCAj7KFZ8hx3b
 OmKMqMEWwtb2iIn9pT2ZZ8cLzHoYD8qFPOEjxVEM47sLXfWuxfP2pn+YHDk/fJUhMXnT
 FOAQ==
X-Gm-Message-State: AODbwcBNumcL15hz+32eXotGV6dge/ZNgA8ePqjmzmJ4iAqyvSYBOoBF
 pYNg0K0CBOO4hzrP+L65idz7RfrTEQ==
X-Received: by 10.13.225.196 with SMTP id k187mr1044952ywe.178.1496715436743; 
 Mon, 05 Jun 2017 19:17:16 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.174.2 with HTTP; Mon, 5 Jun 2017 19:16:56 -0700 (PDT)
In-Reply-To: <CAFRv3wxh-+KiaLfD7zc4+FeiUOn4AyvJtcRLshiPQfpNb8uk4g@mail.gmail.com>
References: <20170602215322.24376-1-rlippert@google.com>
 <CACPK8XfWySi5kDEASVpmDKAmBSByB6w0ocQxinazqTHbv+omcQ@mail.gmail.com>
 <CAFRv3wxh-+KiaLfD7zc4+FeiUOn4AyvJtcRLshiPQfpNb8uk4g@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 6 Jun 2017 11:46:56 +0930
X-Google-Sender-Auth: nP5uzccKPUXCiKkZuu5IxJSxruM
Message-ID: <CACPK8XfKmm9ZUesgNJsL=MeruOfLzi-j6Dfjb2Be1zfdYn7XcQ@mail.gmail.com>
Subject: Re: [PATCH] drivers/misc: add Aspeed LPC snoop driver
To: Rob Lippert <rlippert@google.com>
Cc: Robert Lippert <roblip@gmail.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Arnd Bergmann <arnd@arndb.de>, Greg KH <gregkh@linuxfoundation.org>
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
X-List-Received-Date: Tue, 06 Jun 2017 02:17:19 -0000

On Tue, Jun 6, 2017 at 5:16 AM, Rob Lippert <rlippert@google.com> wrote:
> On Sun, Jun 4, 2017 at 8:25 PM, Joel Stanley <joel@jms.id.au> wrote:
>> Hello Rob,
>>
>> On Sat, Jun 3, 2017 at 7:23 AM, Robert Lippert <roblip@gmail.com> wrote:
>>> This driver enables the LPC snoop hardware on the ASPEED BMC
>>> which generates an interrupt upon every write to an I/O port
>>> by the host.
>>>
>>> This is typically used to monitor BIOS boot progress by listening
>>> to well-known debug port 80h.
>>>
>>> The functionality in this commit just saves all snooped values
>>> to a circular 2K buffer in the kernel, subsequent commits can
>>> act on the values to do things with them.
>>
>> Reviewed-by: Joel Stanley <joel@jms.id.au>
>>
>> The driver looks okay to me. I can stage it in the OpenBMC kernel tree
>> while we get it reviewed upstream.
>>
>> Can you re-send to the upstream mailing lists so it gets reviewed
>> there. You will need to include a device tree binding document too
>> (something to put in Documentation/devicetree/bindings/).
>
> What is the proper upstream mailing list for this?  patman didn't list
> any mailing lists...

Yeah, get_maintainers.pl only suggested lkml. cc lkml I think.

I'm not sure if we want to put these drivers in misc, or if we want to
use something like drivers/soc/aspeed.

Arnd, Greg, do you have any suggestions here?

> The aspeed-lpc-ctrl that I used as a reference has no bindings in
> upstream, was that intentional or oversight?

That was an oversight.

Cheers,

Joel
