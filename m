Return-Path: <mine260309@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4001:c0b::243; helo=mail-it0-x243.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="fMKEXgBT"; 
 dkim-atps=neutral
Received: from mail-it0-x243.google.com (mail-it0-x243.google.com
 [IPv6:2607:f8b0:4001:c0b::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40lL8t53pFzF2vj
 for <openbmc@lists.ozlabs.org>; Tue, 15 May 2018 11:49:34 +1000 (AEST)
Received: by mail-it0-x243.google.com with SMTP id p3-v6so15316723itc.0
 for <openbmc@lists.ozlabs.org>; Mon, 14 May 2018 18:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=EQ5n98vcaava30DCvlqt0+0iqEh6pBsLjiZv74TD3tk=;
 b=fMKEXgBTCjR/wbc4w6Nun2KX3zwzFEBjOOHq/HEsGd7isBc8Vj0CjE9/TgsWtZsnEM
 EiSg0FEUGln1Imia75eV+Qr4aeEoWnot+nUbsXHxFdqw5yUaPQc9VOlP8ZdfoJr3lwQ+
 LREGU8atmyHa17NUFNuJRHKPVBx/sMfElzwRRnlFmsdyPbCKNivULqF/hHNtzjWjMhQ2
 Z1/DzFYrHlpFei0Ciu0u8qt3ZV0ygQbWL7R6KGKpKoUl0/AssvETaLaA3Uo+T2hFwnRT
 JxGSqSu/yzR/BiK7XUiX8OztWfMrqkuop5P+trCQBUq7lrcDs2/503cPfDqH7lAlMYfU
 8F4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=EQ5n98vcaava30DCvlqt0+0iqEh6pBsLjiZv74TD3tk=;
 b=UjplVCgy6eRPun0+vKIMPtFP+y8i760YvG9WyQR9GGXMLbF6SqsZz90CXGhpCkwDe8
 iNErUfkXGzAf/xpy5I5r6YoatzVMYCArL2hLKNWMXlPA3LleD7oq92Pugv2pV2koxzzv
 XSXBbCRSLyg1AdN/NNYV9Ob2jy6BEWuHZOzDRZSDomR0d+lTv6J2JnAFr3gFnZcmNrla
 8yTLD4yg69fbUeplucajx26y+oN7tksXK4/I2h66Ot7M/f/+mn6H7DlyoZXJya0MMXar
 ZwXSNFNiPIcoir4wW59DTU3jwpicvHUeFD2OJOme0fqVzDJencF8XCVKpoACXZt0w7E3
 NfZQ==
X-Gm-Message-State: ALKqPwf+v/HCvO+82RfHWeXkZ67u3tyqUR58Fasd/LNj3sjxxchdRnLF
 3AiCyqKUlPUXLcXEr6zwJGfQ+OukqtUZb3zioLI=
X-Google-Smtp-Source: AB8JxZoCMEAbaI7EUnLJlAY5If4ZAVu2MjjwjhrhwAmpHImTRTZjHC5QUlSXQ2RVIMKzgS2VmlRvogPeV1TKpUMD/BE=
X-Received: by 2002:a24:f102:: with SMTP id
 c2-v6mr11497213iti.121.1526348972375; 
 Mon, 14 May 2018 18:49:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4f:558a:0:0:0:0:0 with HTTP; Mon, 14 May 2018 18:49:31
 -0700 (PDT)
In-Reply-To: <CAD5O4R3f1u9Ptk0_rz12teQgmqNkucGpOWmU9EKNBmxdSYAMrg@mail.gmail.com>
References: <CAD5O4R24451=iRYh5M_Bokhj8wMAzPdGfj5XSzhU6CJ6cOqotA@mail.gmail.com>
 <1526339800.3484892.1372056960.17AECCFA@webmail.messagingengine.com>
 <CAD5O4R3f1u9Ptk0_rz12teQgmqNkucGpOWmU9EKNBmxdSYAMrg@mail.gmail.com>
From: Lei YU <mine260309@gmail.com>
Date: Tue, 15 May 2018 09:49:31 +0800
Message-ID: <CAARXrt=Pkddt03EVfwjZN9Qpp8No5LA5X6dqJ+MfU6_K+k-00Q@mail.gmail.com>
Subject: Re: Question on States monitoring
To: Andres Oportus <andresoportus@google.com>
Cc: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 15 May 2018 01:49:35 -0000

Hi Andres,

The existing [phosphor-gpio-monitor][1] contains two services, one is for
monitor gpio interrupts, the other is "phosphor-gpio-presence" that checks a
gpio output and let it be some state on DBus.

I guess the "presence" service is what you are looking for, that maps a
gpio output to a Dbus object.

The existing use case is:
1. Witherspoon checks if power supply is connected and create dbus object
   /inventory/system/chassis/motherboard/powersupplyX, it also is able to
   bind the kernel driver when it is attached.
2. Zaius checks if a PCIE card is connected on E2B and create dbus object
   /inventory/system/chassis/pcie_card_e2b

You can see a little detailed explanation at
https://github.com/mine260309/openbmc-intro/blob/master/Porting_Guide.md#gpio-presence

[1]: https://github.com/openbmc/phosphor-gpio-monitor

On Tue, May 15, 2018 at 7:26 AM, Andres Oportus
<andresoportus@google.com> wrote:
> Thanks Andrew, yeah I see the design philosophy of not exposing low level
> stuff like GPIOs unless they mean something more high level (hence the
> "State" reference) that could be exposed/monitored/changed/etc.  I'm just
> checking to see if we have anything already being thought of or implemented
> as to not come up with a custom solution.  The problem is managing "States"
> at least initially backed by GPIOs, and it does not have to be on the DBUS
> although from what I've seen for instance on IPMI we use DBUS extensively
> for things that get exported.
>
> On Mon, May 14, 2018 at 4:16 PM Andrew Jeffery <andrew@aj.id.au> wrote:
>>
>> Hi Andres,
>>
>> On Tue, 15 May 2018, at 01:16, Andres Oportus wrote:
>> > Are there any ongoing efforts on expanding States (say provided by
>> > GPIOs)
>> > monitoring/management?  I see that phosphor-state-manager has
>> > Chassis/Host/BMC states that are placed onto DBUS but not a more generic
>> > mechanism.  On the GPIO specific side, I see that phosphor-gpio-monitor
>> > allows for interrupt driven GPIO monitoring (seemly only used under a
>> > gpio-keys driver with /dev/input for Power's checkstop monitoring?), but
>> > no
>> > generic GPIO setting/getting for those not allowing interrupt type
>> > monitoring (say output GPIOs).
>>
>> It's not clear to me what you're looking for here. Are you hoping for
>> something to expose the GPIOs on DBus? I don't think we have anything like
>> that, which is more of a design philosophy thing (we should probably provide
>> a higher-level capability on DBus, not just directly expose GPIOs).
>>
>> Alternatively if you're looking to handle GPIOs from your application, I
>> would recommend libgpiod:
>>
>> https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/
>>
>> Cheers,
>>
>> Andrew
