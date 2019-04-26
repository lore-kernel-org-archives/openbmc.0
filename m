Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::442; helo=mail-pf1-x442.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="hFk30Izj"; 
 dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44rJKt2z97zDqBH
 for <openbmc@lists.ozlabs.org>; Sat, 27 Apr 2019 01:45:38 +1000 (AEST)
Received: by mail-pf1-x442.google.com with SMTP id g3so1924509pfi.4
 for <openbmc@lists.ozlabs.org>; Fri, 26 Apr 2019 08:45:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=dGd4wgpeM3Z/QjiC5QN6d1DVNtrH6ltETGgpaGRDjXk=;
 b=hFk30IzjQhyryYLP+UNQPPsl17H3Y0TC/pLWCz/iTW+TwZdzR0Dcvx2rbnvypTvgNj
 Awcv4qoO799tZtEPiSg8mRQH3KHRg0cIw7kdZolRHbiE69VgIy4Bq4rb/8fnmGspJKV0
 qsYrbS5vIhpI57ky0tJnHUC0gR78pH27ll+9+l+a4rOFZxlro9Q+BKK/1OHRCqiwyWBU
 uDb07jJILwzGKUJDCbmB/THmr3EmGoHbfXUMAqjzL2guUQANYwejjaoL1z0QycWgQ5Co
 cTkYUUCyXfWcEK6UdWECYQ1wlvKBjm5a0DDQ2gZzOfxfodFUUkouKXAZCeKn6D20KKIV
 /5qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=dGd4wgpeM3Z/QjiC5QN6d1DVNtrH6ltETGgpaGRDjXk=;
 b=ouYG+GvMq1IHV2FjQGsqAyVTrC7Y+CKUVbTngOCrVFVRx4ybUXe7ZsqOLijBs3Ys9K
 jZsGt2nRUPu3bLCQC3PiDmfVn1bybE4Bl6YcbXwsDWvYivgtVXPVAwHxpitab6M2MREm
 FgQwLmwWI0JM5GjmYYu/Ufg6kHbnyGrBTjje7LKEluVmlBIZUPT08hUXj4joNtu/UpcJ
 KHSlISXcrhOdc+0eHCzmP8/BJmdyV8CPV9EwE4MEXCVA5MKL3M+k7EXy1Aathn7TeRB1
 OGhHVrgxNRjiO9m6LJGYXELIobekwPsXE90swOWB4G2uT1IRzrlKX0ZUzKHxvx7XWwJ/
 Hu3g==
X-Gm-Message-State: APjAAAXexc6bemUx7Mb4FsMKjOIfvJgO9e7/ebX5GJNZ8YbPxwZhpCL2
 scDwIYCb3q+DyYT9ACJ4JM+/yNiqcgyI81vmVsZ2kQ==
X-Google-Smtp-Source: APXvYqx7WjskC/chSemD+lhD48RogvrjbqwH5QPN11WSjzwwQz/KavrVAzEsVBqwmst96SaN/Voo6q0GmIJWmy8nmIQ=
X-Received: by 2002:a62:2541:: with SMTP id l62mr25350343pfl.243.1556293534268; 
 Fri, 26 Apr 2019 08:45:34 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notxyVAx=LY+5tCUWaezZP67JKy7z3NT3SAUcKR64W8Pk_w@mail.gmail.com>
 <d4abbc06-a4ea-4cd0-95f7-b32cd388293e@www.fastmail.com>
 <CABoTLcSi0DvcqAdrd7QumCotZDAE6VvF+SGu-gtKz_ZRWvsoWg@mail.gmail.com>
In-Reply-To: <CABoTLcSi0DvcqAdrd7QumCotZDAE6VvF+SGu-gtKz_ZRWvsoWg@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Fri, 26 Apr 2019 08:45:22 -0700
Message-ID: <CAO=notw+eP=xNWMk=LjB-HhsqjjEp3cpS-SjA4EsCN1g-S4GTw@mail.gmail.com>
Subject: Re: linux kernel compiler warnings ignored
To: Oskar Senft <osk@google.com>
Cc: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Joel Stanley <joel@jms.id.au>
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
X-List-Received-Date: Fri, 26 Apr 2019 15:45:39 -0000

On Fri, Apr 26, 2019 at 8:25 AM Oskar Senft <osk@google.com> wrote:
>
> Thank you!
>
> Is there an "easy" way to bake the resulting kernel image into an image f=
or the SPI flash chip?
>
> I often make kernel-only changes and usually run through the whole proces=
s of committing to a local repo, then running bit bake and waiting for all =
the other stuff it also does. If there was a way to just build the kernel a=
nd replace the one in the SPI flash image with the new one, that would be a=
wesome.

Oskar, if you're using static-images still, there's an image-kernel
file output from the build process.  this is supported if you drop it
into /run/initramfs/ and reboot similarly to image-bmc.

>
> Oskar.
>
> On Fri, Apr 26, 2019 at 10:15 AM Andrew Jeffery <andrew@aj.id.au> wrote:
>>
>>
>>
>> On Fri, 26 Apr 2019, at 08:01, Patrick Venture wrote:
>> > I'm getting feedback from a patchset I sent upstream that there are
>> > compiler warnings.  Which surprised me because my OpenBMC builds with
>> > those patches don't complain.  I imagine therefore we have them
>> > silenced and was curious where we silence them.
>>
>> How are you building the kernel?
>>
>> I strongly recommend you build kernels directly from the kernel source t=
ree rather than using bitbake, if that's what you're doing.
>>
>> In the kernel source tree, do:
>>
>> $ export ARCH=3Darm
>> $ export CROSS_COMPILE=3Darm-linux-gnueabi-
>> $ make aspeed_g5_defconfig
>> $ make W=3D1 -j$(nproc)
>>
>> This exports are from memory, ymmv.
>>
>> In addition to giving you more output than Greg is after, it has a much =
lower write/compile/test latency.
>>
>> Hope that helps,
>>
>> Andrew
>>
>> >
>> > Patrick
>> >
