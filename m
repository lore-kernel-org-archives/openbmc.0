Return-Path: <joel.stan@gmail.com>
Received: from mail-ua0-x242.google.com (mail-ua0-x242.google.com
 [IPv6:2607:f8b0:400c:c08::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3s8Qcv5Yx1zDqRs
 for <openbmc@lists.ozlabs.org>; Wed, 10 Aug 2016 19:21:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=MHdYa0iR; 
 dkim-atps=neutral
Received: by mail-ua0-x242.google.com with SMTP id d97so3113097uad.1
 for <openbmc@lists.ozlabs.org>; Wed, 10 Aug 2016 02:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=FHw+4xrNGb6UfbmNDc6RBrwbzcpcfyMR8qNiC7RIwd0=;
 b=MHdYa0iRwoWlBIWUnPhueG8WkHL9uX2OK5fddxGAdMhOwUdvT7VttmMzd9eTJHepKG
 rNvyqnx4BnHRle3T1qOFOcdUFFp5f+A2aD4YHz2ClFK9JQfKJI8kbEWW8qHyp3PANnx+
 zHtBL5ouIivcUdWr3b08/DwyZPB3Hx32PHQX8qHfHLIE4cD+3FCpNShBUNB33PszwtAf
 1iW9KsBXry6zhycm/NuzuHk2IoUfYQCyYrLDkkNVVL8icvi/Edqo48aK9laF6JukNO69
 G4BHSU4w1V2bVp8bDBK/uzfkeHxZRXnIlejcwPyjqNOlvRGTqf6HclsG9sA91jtfdLng
 qkYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=FHw+4xrNGb6UfbmNDc6RBrwbzcpcfyMR8qNiC7RIwd0=;
 b=i+XGv2r3t2FMs8UlP3kREnrOWv1Xir6ZfYpyfALx/o4AXDkWFzOYzSQX/p43TEbX5j
 hgjyirPVDu93vEMEJiUj03xVEzdOPSZJBn7RzMMC2gvtrJKE3Upn6T6Pl0hJrpFJ8ag8
 daW7oDslvSKgobltNo5UuaToqr59JmspCrUE8MDsCDxAEBrLvzAEog+X48XSr4KpC17S
 9EhDRG4KHTo458fW7UKvzyaVM+oN73Y5iFtRawE76rrhhW20UOiPqeKy9/2kiiLL7wT+
 yhKJLi02whzzy25Qjash8eKIXRnLPYD3y0yLeQxgbRhHAH+7DI7FBOPn1LaL//GWJNce
 IAhw==
X-Gm-Message-State: AEkoous7fyZG1s2O6je6N+JXAyRchGXm2f0LDdpmu0BCdDUP4DgsXx25ib0GM4ecDha23Sn9mn1mv2oNZ7Fg5A==
X-Received: by 10.31.78.6 with SMTP id c6mr1369462vkb.41.1470820876806; Wed,
 10 Aug 2016 02:21:16 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.159.38.76 with HTTP; Wed, 10 Aug 2016 02:20:56 -0700 (PDT)
In-Reply-To: <20160810011632.qtpu2b5hy5kfou5t@asimov>
References: <CACPK8Xd1M2x5rrPUNwvhg4Yes85hPHxPbnysiC-jNii8W3KBHA@mail.gmail.com>
 <20160810011632.qtpu2b5hy5kfou5t@asimov>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 10 Aug 2016 18:50:56 +0930
X-Google-Sender-Auth: AlBzSCiaQleKcionkGARG2FmckM
Message-ID: <CACPK8XckyWBdN+B+ieudY8FmgOXR7N4RMGaSt2yuOyZ8tCmodg@mail.gmail.com>
Subject: Re: Linux dev-4.7 tree: Request for testing
To: Patrick Williams <patrick@stwcx.xyz>, Jeremy Kerr <jk@ozlabs.org>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 10 Aug 2016 09:21:20 -0000

(+cc jeremy, I'm after some advice on how we should discover which tty
is the vuart. See below)

On Wed, Aug 10, 2016 at 10:46 AM, Patrick Williams <patrick@stwcx.xyz> wrote:
> On Wed, Aug 10, 2016 at 12:43:14AM +0930, Joel Stanley wrote:
>> Hello OpenBMCers,
>>
>> I've pushed a new Linux tree to https://github.com/openbmc/linux as
>> dev-4.7. I intend this to become the new tree used for openbmc's
>> master branch.
>
> Joel,
>
> I tried to pull this into the greater OpenBMC build at:
>     https://gerrit.openbmc-project.xyz/#/c/159/
>
> Good news: it compiles fine and gets to userspace with network!  Bad
> news: lots of other things are broken.

I booted it on my Palmetto today. To my surprise it attempted to turn
the host on; the fans started spinning. However I did not see anything
come out of the vuart.

>
> My first observations:
>
> * The host tty has changed from S5 to S4?
>     Aug 09 21:52:37 barreleye systemd[1]: Found device /dev/ttyS4.

No intentional change. I'm not sure what the userspace is trying to do
here. ttyS4 is the Linux console device.

>     Aug 09 21:52:41 barreleye obmc-console-server[588]: obmc-console-server:
>         Can't access attribute sirq on device ttyS5: Permission denied
>     Aug 09 21:52:41 barreleye obmc-console-server[588]: obmc-console-server:
>         Can't access attribute lpc_address on device ttyS5: Permission denied
>     Aug 09 21:52:41 barreleye obmc-console-server[588]: obmc-console-server:
>         Can't read tty termios: Input/output error

We need to use a mechanism to tell userspace which device is the
vuart. udev? systemd?

$ ls /sys/devices/platform/ahb/ahb:apb/1e787000.vuart/tty
ttyS0

We could also set an alias in the device tree?

>
> * There might be some 'startup_hacks' to remove in skeleton:

>     Aug 09 21:53:27 barreleye system_manager.py[606]:
>         /usr/sbin/startup_hacks.sh: line 9:
>         /sys/devices/platform/ahb/ahb:apb/1e787000.vuart/enabled: Permission
>         denied

This would have stopped working in January, when we changed the
behaviour of the vuart to enable on bind:

 https://lists.ozlabs.org/pipermail/openbmc/2016-February/001883.html

The startup_hacks script should be fixed to not touch 'enabled'.

>
> * i2c and LEDs seems to be broken in general.
>     Aug 09 21:53:33 barreleye system_manager.py[606]: sh:
>         /sys/class/i2c-adapter/i2c-3/3-0050/online: No such file or directory
>     Aug 09 21:53:33 barreleye system_manager.py[606]: sh:
>         /sys/class/i2c-adapter/i2c-3/3-0050/online: No such file or directory
>     Aug 09 21:53:37 barreleye system_manager.py[606]: No LEDs present in the
>         system
>
>     Also, no /sys/class/i2c-adapter at all and no dmesg about i2c.
>     Maybe missing in kernel config somehow?  /sys/class/leds and
>     /sys/class/hwmon are both empty.

Yes, the kernel config was out of date. It needed to be updated for
the new tree.

>
> * pinctrl problems when we try to set up GPIOs
>     aspeed-g4-pinctrl 1e6e2000.syscon:pinctrl@1e6e2000: request() failed for
>     pin 138
>     aspeed-g4-pinctrl 1e6e2000.syscon:pinctrl@1e6e2000: pin-138
>     (1e780000.gpio:458) status -22

GPIOR was not present in pinmux. I have added it.

>     aspeed-g4-pinctrl 1e6e2000.syscon:pinctrl@1e6e2000: request() failed for
>     pin 34
>     aspeed-g4-pinctrl 1e6e2000.syscon:pinctrl@1e6e2000: pin-34
>     (1e780000.gpio:354) status -22

GPIOE was not present in pinmux either. I've added it.

Cheers,

Joel
