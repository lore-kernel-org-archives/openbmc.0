Return-Path: <joel.stan@gmail.com>
Received: from mail-ot0-x241.google.com (mail-ot0-x241.google.com
 [IPv6:2607:f8b0:4003:c0f::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vCj7K4p5MzDqBh
 for <openbmc@lists.ozlabs.org>; Wed,  1 Feb 2017 10:26:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="rSGsnF39"; 
 dkim-atps=neutral
Received: by mail-ot0-x241.google.com with SMTP id 73so43550825otj.1
 for <openbmc@lists.ozlabs.org>; Tue, 31 Jan 2017 15:26:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=jUDeezkFYrZ1bjTnF/RxaXUQLvMOMfe0dCvCFcH4Vjs=;
 b=rSGsnF39bgNFVzrV2SGVObMbcVJKE2X65X9JUpIDEYPVZGM7GIe6q6soA1eXZElud5
 wEuQVL0SPx216NMWb2NZ0G1iW/eelCudYFS8K/z3G7f4wnfaGlHKQHRQW8ILfpf3L8km
 +NyyCzVRWoKnsZA1JPLMHLgPq/HI0xS2Wf2yr0eQNRyWGP57qVnd61r+tyPorL4VfFAB
 vHmXPPX35OVqMtUiNOi+NFgLTPZHibbj8Mj//AK+5F6yxIoWL3HXJAqNd5WZc1yKSURC
 8TbjeyQUwmtArpvDEDaz5U6xkgp24XtJrLrrP8WHCbvb8O7o64hLYnxyHhbcYyo7id4l
 4OrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=jUDeezkFYrZ1bjTnF/RxaXUQLvMOMfe0dCvCFcH4Vjs=;
 b=F7Obio8Sw0DAA6PA0JfQkSiKVW2cwvD8o+XmecZofg44dJVmdtnAere793OIZZQBJT
 6Ub65b4iyB+MpuLRBSvC7LYXs5ABC571aIbz6Tkc7N5RJ+B17RsRK9f0v97XoJl7B+c9
 /jIHJ+Spoow0rgrZkmzde9Ull24n6yMGxU18G7pJ0EGjpRxJ0lf+b49vpID3TYezF8j1
 KP+YAy4FDQNq4xWitaSNdJIp/9RY7vxhNsOod5J58/2IW+J+VmsKlmt68XZBwCIJEwIW
 0A2u1ZnMO4i8cSMlvQ3EqI6oVVDs4OBh2Is3kH3n9CyDlw1WoyCesKjbJ+1B0WaS6hNt
 vdYw==
X-Gm-Message-State: AIkVDXJIYOlqq6yoadu8Z5BhWaveL52OnxRSUqFff+xEKvu4nRM9UI6nkdncCvnMz/SJxFpCCeFUsJPxqJwmHQ==
X-Received: by 10.157.8.75 with SMTP id 69mr15137497oty.275.1485905163736;
 Tue, 31 Jan 2017 15:26:03 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.182.245.201 with HTTP; Tue, 31 Jan 2017 15:25:43 -0800 (PST)
In-Reply-To: <CAPH-5w5BgnQTZ+BA1Wvhb3yuc0OsbaKba95nKgHPndpbMvFqSQ@mail.gmail.com>
References: <1485740080.4137.21.camel@aj.id.au>
 <CACPK8XeOQPONhwQ4Q6bPUp7=-AoFArXwCmzDC-tors00i_u=tg@mail.gmail.com>
 <1485825312.4137.25.camel@aj.id.au>
 <CAPH-5w5BgnQTZ+BA1Wvhb3yuc0OsbaKba95nKgHPndpbMvFqSQ@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 1 Feb 2017 09:55:43 +1030
X-Google-Sender-Auth: P4RpCbfPkGgZ8NbMo5vsygHNJRY
Message-ID: <CACPK8XeZeBhTMy4rtdXULuKbGYjYWtusaAfCoQuWx1qZoQMdEw@mail.gmail.com>
Subject: Re: GPIO offsets used by userspace
To: Xo Wang <xow@google.com>
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
X-List-Received-Date: Tue, 31 Jan 2017 23:26:06 -0000

On Wed, Feb 1, 2017 at 8:45 AM, Xo Wang <xow@google.com> wrote:
> However I don't actually see a /sys/class/gpio/gpiochipN directory on
> the BMCs I touched. Any ideas?

That's strange. On the machines I looked at we do have that. I double
checked on a Zaius running the v1.99.1 tag:

root@zaius5:~# ls /sys/class/gpio/gpiochip320/
base       device     label      ngpio      subsystem  uevent

> I mentioned this on GitHub, but in theory we should have at least one
> /sys/class/gpio/gpiochipN directory, where N is the offset for GPIOs
> provided by that GPIO device.
>
> On a BMC not attached to GPIO expanders this directory name could be
> parsed by the Python currently in use. Not foolproof, but it could be
> a working stopgap.

You're right, we could find this one. This would break on Witherspoon
though which will soon gain a driver for a GPIO expander.

We could write some python to iterate through the gpiochipN
directories, and match against the label:

root@zaius5:~# cat /sys/class/gpio/gpiochip320/label
1e780000.gpio

This would be a stopgap until we could get something saner, like sysfs
files named after the net or function.

Cheers,

Joel
