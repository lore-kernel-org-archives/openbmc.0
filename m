Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400c:c08::241; helo=mail-ua0-x241.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="ELoC8YLD"; 
 dkim-atps=neutral
Received: from mail-ua0-x241.google.com (mail-ua0-x241.google.com
 [IPv6:2607:f8b0:400c:c08::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41hqvQ4xhRzF1P8
 for <openbmc@lists.ozlabs.org>; Sat,  4 Aug 2018 00:59:29 +1000 (AEST)
Received: by mail-ua0-x241.google.com with SMTP id q12-v6so4676676ual.2
 for <openbmc@lists.ozlabs.org>; Fri, 03 Aug 2018 07:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=jcCiNeFGM2Hok1+WQnTMWCDtAdcDY5H9uYxZqBg51IY=;
 b=ELoC8YLDH14g/qJAuBw+PxpZQ5K1oBdA6DYbvll9TEYE+grQIo44cLKJUZ655ZyKLb
 2HaneSvnqnw994xRaPP9VoXXYP9AXZRQEytQTEMnGU+GDeDt0RjbQiqzL5WYAD50q6GR
 xDorR87SUWqMcCnWTEGV3B71IQawsUXBknmeh/lDU1tK5tCAFy8tOnl8bqQGMVAIZgMA
 giAIXBdKB6d3TkAMgOR2s46aCc93sGdQ/JWf/xXPUkj+kcklgxT97+QpsutP94Tb3wr8
 acfp1+/vrkde6D1FfMQeufLaFoqmZIZ/TR/JH8UofUHTXqq0mCYzG2zYuiGRaoQfoakv
 OP2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=jcCiNeFGM2Hok1+WQnTMWCDtAdcDY5H9uYxZqBg51IY=;
 b=XBqMZjhTGd8/KBSP5EjaCUAAXQyNcwIysuOGB8x8InR6L2FuVvFF+KWHzBMJVwXhyJ
 ScDwujAYWTPQcOk8KTGtn4mj7BMVzmKSQnfWitTyO1YQiXEpzDaSrp+ZzaU/xijl2fdx
 IVHESz2sgD6nEFv/fJ2lPbqoXe9Wu3uN3NTBgaSq07rmXUCtSObrGa83PIeFwOfX/9O6
 0uE7cLLVloV8D/rT4qZljOJ/ifm6OuFwenckwltvly+QNFJLxafOn58NX5yYeEJVfsFt
 mXTGuAKYGsyqUn0DsRmTPXaavTJnGZoPxrCVWr0McudYCwZOwGJJOywrVV0gT8ngQauJ
 y0kA==
X-Gm-Message-State: AOUpUlEXIZehyZeohHHOaR3j1M9e/26fK0u0s5laajimDvVKXCRIKDa8
 F32gIKTH8XgyeTHLcsApmDhZk5UnW2gZhoicf9+TwQ==
X-Google-Smtp-Source: AAOMgpeDhtyuvQbswi7vadAeo/hXS4uGkTggTh+5twc9cKqHfnV5SZx1K2fzLKrF+m0xpe1gDzjdw/Z47GaIt/pFbg8=
X-Received: by 2002:ab0:644f:: with SMTP id
 j15-v6mr3067057uap.70.1533308366396; 
 Fri, 03 Aug 2018 07:59:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a1f:9752:0:0:0:0:0 with HTTP;
 Fri, 3 Aug 2018 07:59:05 -0700 (PDT)
In-Reply-To: <1533180811.827947.1460716960.2A06961A@webmail.messagingengine.com>
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
From: Patrick Venture <venture@google.com>
Date: Fri, 3 Aug 2018 07:59:05 -0700
Message-ID: <CAO=noty1A+n+u8JsQyc0iDDze-D5aDMcweBQFvd3qONOg21Hxw@mail.gmail.com>
Subject: Re: UART Route setting
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Oskar Senft <osk@google.com>, Lei YU <mine260309@gmail.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 =?UTF-8?B?5by15ryi5b2s?= <henbinchang@gmail.com>
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
X-List-Received-Date: Fri, 03 Aug 2018 14:59:31 -0000

On Wed, Aug 1, 2018 at 8:33 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
> On Thu, 2 Aug 2018, at 12:50, Oskar Senft wrote:
>> Interesting suggestion, that looks promising, thank you?
>>
>> What's the state of that driver? I.e. where do we expect it to land?
>
> If you think the bmc-misc-ctrl series is useful, please reply to the
> upstream thread to outline all of your use-cases. There's a lot of push-
> back on using the devicetree to describe these features, and I haven't
> had a lot of feedback on the acceptability of the rest (driver itself,
> userspace ABI).
>
> The more evidence we have of this being necessary/useful the better.

I just skimmed that message, and we're looking for a mechanism to set
in the kernel some bits in the hwstrapping and other hardware
registers to do things like restrict P2A ranges, disable lpc2ahb
stuff, etc.  Things we had hacked into the mach-aspeed.c (iirc), and I
wasn't sure it made sense to write a half dozen small drivers to
control these individual things -- would these kind of use cases fall
under this misc driver?

>
> Cheers,
>
> Andrew
>
>>
>> Thanks
>> Oskar.
>>
>> On Wed, Aug 1, 2018, 10:12 PM Lei YU <mine260309@gmail.com> wrote:
>>
>> > On Thu, Aug 2, 2018 at 9:55 AM Oskar Senft <osk@google.com> wrote:
>> > >
>> > > Hi Andrew
>> > >
>> > > Thanks for the suggestion. I see that the register would map quite
>> > nicely to pinmux. However, the ability to change the configuration from
>> > user space is critical. How could that be done via pinmux?
>> >
>> > I believe Andrew Jeffery's [bmc-misc-ctr][1] driver is perfect for this
>> > requirement:
>> > 1. You can define related registers in dts and expose as sysfs attributes
>> > 2. User space is able to read/write the sysfs attributes to do what you
>> > need
>> >    to configure.
>> >
>> > [1]: https://patchwork.ozlabs.org/cover/942322/
>> >
