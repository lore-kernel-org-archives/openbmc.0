Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4001:c0b::22c; helo=mail-it0-x22c.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="Cq2gG4A/"; 
 dkim-atps=neutral
Received: from mail-it0-x22c.google.com (mail-it0-x22c.google.com
 [IPv6:2607:f8b0:4001:c0b::22c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41kk990lvQzF3HK
 for <openbmc@lists.ozlabs.org>; Tue,  7 Aug 2018 02:47:56 +1000 (AEST)
Received: by mail-it0-x22c.google.com with SMTP id s7-v6so18291968itb.4
 for <openbmc@lists.ozlabs.org>; Mon, 06 Aug 2018 09:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=YCTcjSs+CToWsq9hcONqk6TwRLqfyF+CEOxqiM2iQbs=;
 b=Cq2gG4A/d2+qCx/s6Ap+Q9nD3gCCeqyUWWMt9WTYfg0YFgxUnAIXDgz/7oZcjNlMLW
 EKLx/nV559O060RKeTcOlvI81LfGu2sEccdhZZnNWmnjdfLoUUUEgKqmsG5naXTXgdEk
 4PYBDeTCM40M83nD2D96pBjuatkmf42BFMslpxNO47ORuL/j7bitLWynKcZy6VrqkAJ/
 QVuqY5RGTZZogXU0sv10bfzdZsPp+5tTE71bW9VmSoUCJ6N12yVRuPcAIivyaboHHNwg
 YTBAfHgnbyV5WZm7gPK/9bUNnkarjknyXP+vAQdTqCebLB5gvv3QeOHHjuqdAq2e4kYl
 leEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=YCTcjSs+CToWsq9hcONqk6TwRLqfyF+CEOxqiM2iQbs=;
 b=iyjYhEyPz/AJuCqkOXxiyalcUEfmLrQwWnwIabet8hPntrF9+VmsmIz/ZrocqFTJ0e
 8V5SmqaOdsSPPvx0FWRhnA7ucWiB2RkW2JvBwG3ZPYymi9WvmcH4oLgO68pbYUtZ5Isk
 tSTM1KBgTLHnWiegNsR7vK2gsQAz5dKIbCJaJtq9lFUx2ysIVuiWYLC8dM6ZXnPXxQ4P
 qAcWWdC4O6CSNFtbA1glY9aEO4VpBbccquGykI3BAEyL3VhrZBxxOxBoNb73srfk/vaW
 uXJkO8hCpQL9QWSMZZUKbQ54wmCJMrQngUhwxFyGGA4w8ozfEEuLfhHOyFyz6Ell9NWe
 GQaA==
X-Gm-Message-State: AOUpUlE1at+zJASROgQOcV3c+8NRbPFCfI9n6vhQ+5ptpVNA8kksu29T
 c3WTadJOzgg4493dlkJ5S7p6wictmDbWKJPbH99vSw==
X-Google-Smtp-Source: AAOMgpeV5KkqDfkxFpKmQZXO5cgAbCM7ojm0AEXZIGB7ERtm14fY+YIzJyZ3azpcg2BdeYT9X2snxiZYayAyVWkQBRU=
X-Received: by 2002:a02:9b54:: with SMTP id
 g20-v6mr13771742jal.33.1533574074284; 
 Mon, 06 Aug 2018 09:47:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a6b:5c07:0:0:0:0:0 with HTTP;
 Mon, 6 Aug 2018 09:47:33 -0700 (PDT)
In-Reply-To: <1533333813.4174910.1462882280.737C2773@webmail.messagingengine.com>
References: <CAG9c7cAwMWMXQ=SOJ0Vjxzx0jUv3M8KLF8_fXam-z_4CuMJcvg@mail.gmail.com>
 <CAO=notxVZowBBB4DSVYZv5MdC+H1CZ01r+DCPbZeYAJdqjAcug@mail.gmail.com>
 <CABoTLcRjsOonjmPMMiijX8CvJ_jM9KJcz12AxntdzW8vCxpSFg@mail.gmail.com>
 <CAG9c7cBXxc-81YVWjVspUDAPt6Xt+5OqVE4A7EzXuegwdxx8tg@mail.gmail.com>
 <CABoTLcS0M_TbGBb8XB99sBe_S7tqfrm8vE=Eb_94UGMeGW3gAQ@mail.gmail.com>
 <1533172735.788524.1460630440.2817ADF0@webmail.messagingengine.com>
 <CABoTLcTR3YFFPTJAeAecWqZxcZQEBO-TgfCjJ1Xb1sCJVfojbQ@mail.gmail.com>
 <CAARXrtm1NMpzHOuKB45nWimT6m18EY7sWYWu9FoGJaDW+ZyD7A@mail.gmail.com>
 <CABoTLcQn6s6TCV=Zf==-Mm_VSAuN8nD3caT7Z5UPoW46LthxqQ@mail.gmail.com>
 <1533180811.827947.1460716960.2A06961A@webmail.messagingengine.com>
 <CAO=noty1A+n+u8JsQyc0iDDze-D5aDMcweBQFvd3qONOg21Hxw@mail.gmail.com>
 <1533333813.4174910.1462882280.737C2773@webmail.messagingengine.com>
From: Patrick Venture <venture@google.com>
Date: Mon, 6 Aug 2018 09:47:33 -0700
Message-ID: <CAO=notw8Nb0LqqhYt29YYckNdzWC6AcaNtkxP3tq+jz=DzgaUQ@mail.gmail.com>
Subject: Re: UART Route setting
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Oskar Senft <osk@google.com>, Lei YU <mine260309@gmail.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 =?UTF-8?B?5by15ryi5b2s?= <henbinchang@gmail.com>, kunyi731@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 06 Aug 2018 16:47:58 -0000

+kunyi@

PTAL - I know we're looking for a way to move the hacks forward
properly, a driver or driver(s) is apparently already in the works,
albeit with upstream resistance.

Patrick

On Fri, Aug 3, 2018 at 3:03 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
>
>
> On Sat, 4 Aug 2018, at 00:29, Patrick Venture wrote:
>> On Wed, Aug 1, 2018 at 8:33 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
>> > On Thu, 2 Aug 2018, at 12:50, Oskar Senft wrote:
>> >> Interesting suggestion, that looks promising, thank you?
>> >>
>> >> What's the state of that driver? I.e. where do we expect it to land?
>> >
>> > If you think the bmc-misc-ctrl series is useful, please reply to the
>> > upstream thread to outline all of your use-cases. There's a lot of push-
>> > back on using the devicetree to describe these features, and I haven't
>> > had a lot of feedback on the acceptability of the rest (driver itself,
>> > userspace ABI).
>> >
>> > The more evidence we have of this being necessary/useful the better.
>>
>> I just skimmed that message, and we're looking for a mechanism to set
>> in the kernel some bits in the hwstrapping and other hardware
>> registers to do things like restrict P2A ranges, disable lpc2ahb
>> stuff, etc.  Things we had hacked into the mach-aspeed.c (iirc), and I
>> wasn't sure it made sense to write a half dozen small drivers to
>> control these individual things -- would these kind of use cases fall
>> under this misc driver?
>
> Yes, everything you listed there was a strong motivation for the series.
>
> Cheers
>
> Andrew
