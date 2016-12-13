Return-Path: <joel.stan@gmail.com>
Received: from mail-vk0-x241.google.com (mail-vk0-x241.google.com
 [IPv6:2607:f8b0:400c:c05::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3td6LD0jgtzDvjf
 for <openbmc@lists.ozlabs.org>; Tue, 13 Dec 2016 15:34:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="M+kY7AT0"; 
 dkim-atps=neutral
Received: by mail-vk0-x241.google.com with SMTP id p9so5496545vkd.1
 for <openbmc@lists.ozlabs.org>; Mon, 12 Dec 2016 20:34:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=y10GkEx4kfN3ZanWddGQ7xkezO+oTtJsEE2yyAUgjXk=;
 b=M+kY7AT0BN/yS7FmEKdCOw9nRXft20khY+kMPxNBgqyaXxrkRYBtTeTP73/v3ZzDjv
 DAu+D94zajrg6Ajhzl2q47/O3B628mhNqYwm/QQCqRS1WxD0xgFmuMUttjaxL553DbLD
 QHNo6qnKl49d+nwKLbamQhlASrH1RWzU20SEtJgviG4MZZw9+O6kO1zu2IAJWv1hiemh
 wKdpYO2/3T5jUeKG2lDTP4gMyXjdlsqWzlnl0bCKpDd0iKVVFrfHgQ/xd7jf1Jeb1MW1
 6C9DTndQvtVst4KogBmpM8lEMT02V96tMzoEgE4SLOnIUCCF7TS3GlTvojXWuszxkS4f
 1qQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=y10GkEx4kfN3ZanWddGQ7xkezO+oTtJsEE2yyAUgjXk=;
 b=VOhBi4nUtgZ2l3iSZXCoMEY/785px9EPmhi5Xk6cQryu7hPRYUDqfdIGIM53M9Mj9i
 Z7qPzNaAgv6ib2lwxA9lPskJwOeUnkf1A3Y/1dQHPXstbfB12d5L37wjxuDo77n/cvHj
 TqmRjs/SQXsjTPEi1ukXl5105A/8kimHaxw1nR9PcNz7RW0eZ1etYSQUb1NfYH4N2YQx
 eX0Yq3bpN0xtjlvdY5gRWOXTYWGzZL+wVjQ75LmUe6HjxawMKdpmPy0VYZUEsoEnfCh5
 UYInCr/eeNVK8R0cbZOog3xPKgTwfZIMqBkzksrmpHkUZrlB5JVMXJaCgxPeZ9nnHjeO
 iu3g==
X-Gm-Message-State: AKaTC03vKRfzTDStYm3AdF+l2xHr5CS+xUGLjK4ZCgDeJ9JzrOYtxw1u+mpugzcxNz8dAfobbqPk5hQDCVpUow==
X-Received: by 10.31.223.68 with SMTP id w65mr32673408vkg.124.1481603665484;
 Mon, 12 Dec 2016 20:34:25 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.159.48.91 with HTTP; Mon, 12 Dec 2016 20:34:05 -0800 (PST)
In-Reply-To: <1481600925.10426.5.camel@gmail.com>
References: <20161209054323.7320-1-cyrilbur@gmail.com>
 <20161209054323.7320-2-cyrilbur@gmail.com>
 <CACPK8Xc11u=ym0LrRGdN5YrzAiN0Knz68b4q9SdXPVn7+vOBtA@mail.gmail.com>
 <1481598705.10426.3.camel@gmail.com>
 <CACPK8XfoPV51WMHiXgFJ6gCyZDr5s+FGP3uDgKxvF6phimafyg@mail.gmail.com>
 <1481600925.10426.5.camel@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 13 Dec 2016 15:34:05 +1100
X-Google-Sender-Auth: wfkfg9-jmnLX6M7avk_-rGXRoKI
Message-ID: <CACPK8XeSA=wa79fe6ZLuj04ATiXOdQXsgOGunfJGrMxwBq151Q@mail.gmail.com>
Subject: Re: [PATCH linux 1/3] ARM: dts: aspeed: Update palmetto device tree
To: Cyril Bur <cyrilbur@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Tue, 13 Dec 2016 04:34:28 -0000

On Tue, Dec 13, 2016 at 2:48 PM, Cyril Bur <cyrilbur@gmail.com> wrote:
> Final question, I assume the same thing in a separate patch is good for
> the framebuffer, I'd forgotten that the size of VGA memory can be
> altered by a hardware strapping reg '0x1E6E2070 Hardware Strapping
> Table' bits 3:2 define it. The default is for 16MB, is it safe assume
> the platforms will come up with strapping reg in default state?

No. They will come up in the strapped state.

The strapped state depends on a bunch of GPIOs being pulled up or down
at boot time.

We will move to using u-boot to populate the memory information in the
device tree before passing it to the kernel. For now you can hardcode
the values.

Cheers,

Joel
