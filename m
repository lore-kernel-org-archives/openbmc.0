Return-Path: <venture@google.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400c:c05::22b; helo=mail-vk0-x22b.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="JnJPyAzx"; 
 dkim-atps=neutral
Received: from mail-vk0-x22b.google.com (mail-vk0-x22b.google.com
 [IPv6:2607:f8b0:400c:c05::22b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ys0d35kDvzF061
 for <openbmc@lists.ozlabs.org>; Wed,  6 Dec 2017 11:59:35 +1100 (AEDT)
Received: by mail-vk0-x22b.google.com with SMTP id j126so1606395vke.1
 for <openbmc@lists.ozlabs.org>; Tue, 05 Dec 2017 16:59:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=9MtStyo8qkyuRz7qFNGDfLHn/gQngFNtcAFgMt/I6OQ=;
 b=JnJPyAzxB6tcNTouhNrMIBRHq/xKfDPpKsEY3lsywqzAF5bpBwySavLDxTAX2E1EkY
 XDrAwq/IfBtFsf8LQLiw+uL1z6LXBuD0Dl0hW32F/B5N7dhmC3Bp88ZGGePLt4YnufjN
 YcKjFGxT3dz2u3Fx/2kLDyXBTGUctXVELo9ThySaCulsRXsc866u/BimvMCfL+WXRp+5
 xTEcLcpzxBVdcH/pTaiaINfJBPaZM8pkHERGsJ8Kqoo8hzjhnEveE3e+9lchjny1UIQZ
 1nHiNtWASIyX3GVoOdKOY7tEZUDQTPFvfs7DeTKyOv/kAhrKprpP1AfuYdrUKzwYVzH4
 gQ9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=9MtStyo8qkyuRz7qFNGDfLHn/gQngFNtcAFgMt/I6OQ=;
 b=r+k4TwVCB0s9bdW/mKlLCZADcOHTgSxC0hQ9AFsl3Q28xb0V51ZVFm7oTrgckg4q9y
 7lIkTSU5Pvw5gzF//pCfY5n95q3Fz0C+oWad4wZQjIW2nHDY97oaUrXSXWHXwkri2xCa
 lZUeDljPISkIArsQmNJa8ALTCQ1fVgbwcmNx/Yf/0ps7V/4sKbOQ2HDeSJmCMCg3tbeb
 nYu/zAGTIIGjRkArPOeBna5ZBay91s5Ti4TcOS/yeS6Tnw9vWH0IMkx3qIMBFR8RCqv6
 h/E1ae+vbpYAPQTc88CMNrAQ7vToCitkK7VIKKH26vzb4oepC9XiDmBdhMPR87/315dq
 MN2w==
X-Gm-Message-State: AKGB3mI1usUKcutwWqsR0T0bnFY1qZMv1yRAQZ/UN4htMmV8xObiifzS
 BgHvEqfhpfn1pGNGnJOWDnyICN/OIpcsecoqYxCFzw==
X-Google-Smtp-Source: AGs4zMbRPK8yhloEth5mwtMRb38brqR9gfXQxAbWCk4OGFYOcmLfXULdwA0TeR6akStm3UNpv/spjCXaXEmdyusXbg0=
X-Received: by 10.31.226.71 with SMTP id z68mr7351849vkg.195.1512521972408;
 Tue, 05 Dec 2017 16:59:32 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.94.150 with HTTP; Tue, 5 Dec 2017 16:59:11 -0800 (PST)
In-Reply-To: <CACPK8XfsHM9496pMv-s+CvrTYx80iS0049WBNyJNxHR14Yv6xw@mail.gmail.com>
References: <20171205213900.165038-1-venture@google.com>
 <CACPK8XfsHM9496pMv-s+CvrTYx80iS0049WBNyJNxHR14Yv6xw@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Tue, 5 Dec 2017 16:59:11 -0800
Message-ID: <CAO=notyNE6dW7sW42LGHYfPQzyGbSUu1H7OzNkHZSz7O+J16nw@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10] ARM: dts: aspeed: quanta-q71l: move coin
 battery sensor
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 06 Dec 2017 00:59:37 -0000

That's not a bad suggestion -- I could at least add comments listing
what they are.  Another CL to follow.

On Tue, Dec 5, 2017 at 3:56 PM, Joel Stanley <joel@jms.id.au> wrote:
> On Wed, Dec 6, 2017 at 8:09 AM, Patrick Venture <venture@google.com> wrote:
>> Moved the coin battery sensor into a separate iio-hwmon
>> instance to facilitate reading it as a separate hwmon instance.
>
> Have you considered adding some some #defines for the ADC channel
> numbers, to document what they do? It doesn't appear to be a common
> thing in other dts files, but it makes sense to me.
>
> I've applied this to dev-4.10.
>
> Cheers,
>
> Joel
