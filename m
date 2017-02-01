Return-Path: <xow@google.com>
Received: from mail-qk0-x22f.google.com (mail-qk0-x22f.google.com
 [IPv6:2607:f8b0:400d:c09::22f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vClns1ThjzDq9B
 for <openbmc@lists.ozlabs.org>; Wed,  1 Feb 2017 12:26:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="m9Odcq5C"; 
 dkim-atps=neutral
Received: by mail-qk0-x22f.google.com with SMTP id s186so3003139qkb.1
 for <openbmc@lists.ozlabs.org>; Tue, 31 Jan 2017 17:26:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=3w/35MDsSOmNeq6mymlG1pxULSI6JVtO5RemqrHWriM=;
 b=m9Odcq5CRvpTqwII1+QHeEkIrrVbQjpgwhZnOVRdZAeqWSnsaDmho2TnW9Hh2BBu77
 oQJiwOL6QrarvJV+lDsgxfeCYahILXh/p624DYYGo8R8T/D6m66blt7XEgMquRmEI4/I
 OhFblOEDwV/xW1zc1ugqsdKsvtaFbVDrURqZniP+rBCxGLvzNbUiOiftmSlFH1MzGSd6
 kIbztTz0Oyb73f8+lFeGCUpIAlKH9BrhkiGxeAdMmsc7Rv5uH8IOoEcsNhtjxAmwHFi0
 hx3Yu79FjyOFQ4iqIDMv5bjwhgBkdI/x6mKqa2iP+LUEWg2ds5WVTq15z5ywaLJH4lat
 QbNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=3w/35MDsSOmNeq6mymlG1pxULSI6JVtO5RemqrHWriM=;
 b=rD8MYWOk5H526fid0OLSVLg6uv8YK/JvcEUh9p7WBURoVed14QFCm+nNeB4I8vyc2j
 GQQiwc4WrQL0OQJFUi/onLVnP+id76VK77QPEZTmKgVp22V20/Vgg157KZovdRBIClJr
 ZOIAHuz/qJXKbDvdHmQVyH0+EVusK1JtDRpNtuGRaZUQdik6tRKTusd9ZXTJFePsiMLb
 zj1oj6Y3Fj7xVP0ie1KaIHvIakBzyW9400RYHbeoCpuuHm/wCo052OLczfYMu0s6sVKC
 bX0Z7qcemhBEYcB3440z0Tq1G/wp/0TTyzl2aY952fkg54mfu8BC9UO/6+BTJuvQbMID
 uf4Q==
X-Gm-Message-State: AIkVDXKtNH9NdQaTImy41/DmEhmWC7rvVhU2uV2YHUlIsxp+/DV/VDoP+F1+EW44/l8nmE6g9GcaKYe/TbMdMI3+
X-Received: by 10.55.165.131 with SMTP id o125mr278821qke.254.1485912365329;
 Tue, 31 Jan 2017 17:26:05 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.21.116 with HTTP; Tue, 31 Jan 2017 17:26:04 -0800 (PST)
In-Reply-To: <CACPK8XeZeBhTMy4rtdXULuKbGYjYWtusaAfCoQuWx1qZoQMdEw@mail.gmail.com>
References: <1485740080.4137.21.camel@aj.id.au>
 <CACPK8XeOQPONhwQ4Q6bPUp7=-AoFArXwCmzDC-tors00i_u=tg@mail.gmail.com>
 <1485825312.4137.25.camel@aj.id.au>
 <CAPH-5w5BgnQTZ+BA1Wvhb3yuc0OsbaKba95nKgHPndpbMvFqSQ@mail.gmail.com>
 <CACPK8XeZeBhTMy4rtdXULuKbGYjYWtusaAfCoQuWx1qZoQMdEw@mail.gmail.com>
From: Xo Wang <xow@google.com>
Date: Tue, 31 Jan 2017 17:26:04 -0800
Message-ID: <CAPH-5w5E+n4DCGN0HnfC_y_tjtTUL+sud8fvnCs07EFMKByrhA@mail.gmail.com>
Subject: Re: GPIO offsets used by userspace
To: Joel Stanley <joel@jms.id.au>
Cc: Andrew Jeffery <andrew@aj.id.au>, OpenBMC <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
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
X-List-Received-Date: Wed, 01 Feb 2017 01:26:09 -0000

On Tue, Jan 31, 2017 at 3:25 PM, Joel Stanley <joel@jms.id.au> wrote:
> On Wed, Feb 1, 2017 at 8:45 AM, Xo Wang <xow@google.com> wrote:
>> However I don't actually see a /sys/class/gpio/gpiochipN directory on
>> the BMCs I touched. Any ideas?
>
> That's strange. On the machines I looked at we do have that. I double
> checked on a Zaius running the v1.99.1 tag:
>
> root@zaius5:~# ls /sys/class/gpio/gpiochip320/
> base       device     label      ngpio      subsystem  uevent
>

So it is! I checked again. Must be a gross malfunction on my part.

>> I mentioned this on GitHub, but in theory we should have at least one
>> /sys/class/gpio/gpiochipN directory, where N is the offset for GPIOs
>> provided by that GPIO device.
>>
>> On a BMC not attached to GPIO expanders this directory name could be
>> parsed by the Python currently in use. Not foolproof, but it could be
>> a working stopgap.
>
> You're right, we could find this one. This would break on Witherspoon
> though which will soon gain a driver for a GPIO expander.
>
> We could write some python to iterate through the gpiochipN
> directories, and match against the label:
>
> root@zaius5:~# cat /sys/class/gpio/gpiochip320/label
> 1e780000.gpio
>
> This would be a stopgap until we could get something saner, like sysfs
> files named after the net or function.
>

Makes sense.

xo
