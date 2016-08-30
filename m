Return-Path: <joel.stan@gmail.com>
Received: from mail-ua0-x243.google.com (mail-ua0-x243.google.com
 [IPv6:2607:f8b0:400c:c08::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sP3Mm4yC0zDrhs
 for <openbmc@lists.ozlabs.org>; Wed, 31 Aug 2016 08:38:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=n32JLyhx; 
 dkim-atps=neutral
Received: by mail-ua0-x243.google.com with SMTP id 2so2451852uax.2
 for <openbmc@lists.ozlabs.org>; Tue, 30 Aug 2016 15:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=+4as4UJxcnq0DqvqMSOmUTqHd54ffNww9z9Qr26Z05o=;
 b=n32JLyhxIw6zxlGqMPOjQZNDxVcvYxmJPUzsX28qYwV5X6ulU+VkmQnGQt40vpM/fO
 u78YhxAnN89SL0m4ZxsL34tXArIDdgM6KLSkRxnwHpl3NoZ8XSbiROqR5L3FcQ8gUVJJ
 rV59V61aCBXv82C64fibLJzhoAhSTIOh6M1TGtVsizhL/FwR4T6YmHDi7uTJqOe9IC9q
 fXv7Zb0mKY4L2fGDEGjfdqshN/4DhgbwyaP2+tkQVU7CfzHJxuKF52gixGDL+S74eg/M
 sUxh5GqCQImAHRdLVQht0yCHo61kTbM4GWrzHa+dD38M+8n4DAmRuY9aNIWkgRcprVMh
 Knrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=+4as4UJxcnq0DqvqMSOmUTqHd54ffNww9z9Qr26Z05o=;
 b=BqV4eisTT0xPUZOHGWl7i0OqNfme5DjaoVBJdoXl1zpZoVR8kq7TSWeRYm+nex4Lbb
 3GZ8AfZFxZrn2ogZc4MjK+pUEG7VslPm7RscK0nKOzZ0OCG2ryCTshzNP00t0CB6BdzK
 Kh2tjPt/laO/b2Y8iB7WXynFt2chuCu+7I+6txSaWgHr7o1rRjwKnHEHKOCuXT4PhTyB
 VoZhzKAxXEVboPKQP8xldEKOOGEvMWyttGgS/jTn2RVzoucWsBmOSzCblKBgO2oVMhhp
 VwofffHnN7MR6iL8gDX0m3d7cTfL9dD0Kp500zbc+CZ2ox7WjZcxJofCiy9P4GgZOAsZ
 SkyA==
X-Gm-Message-State: AE9vXwP8bB6g4N/uSP46JypgaWGdGpfYJ4TYlsI1g2pZ2vDoYsCQ0bu8YDtM+fsui6TCka8CgVyjwu3MclKCGw==
X-Received: by 10.176.80.120 with SMTP id z53mr2213589uaz.38.1472596722077;
 Tue, 30 Aug 2016 15:38:42 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.159.38.76 with HTTP; Tue, 30 Aug 2016 15:38:21 -0700 (PDT)
In-Reply-To: <CAFd5g46=3VF+kyyRFttLi=Ru62eypsXeA2NGPAu8b0R3-xpFUQ@mail.gmail.com>
References: <1471743258-7179-1-git-send-email-brendanhiggins@google.com>
 <1471743258-7179-3-git-send-email-brendanhiggins@google.com>
 <CACPK8XfAfiuas_D3UGMf6Hf922oFH9dcHg_9QUP7xvmuTkmabg@mail.gmail.com>
 <CAFd5g45iZBEAPQtkHRUuT6aB5zTYxjW50sFMTYEw=h0u7mUJrA@mail.gmail.com>
 <CAFd5g45-aOGnpAb4gWjz7Zz-_+3gLux61+kzZT4Wni9VZCmpLg@mail.gmail.com>
 <CACPK8XdJJE7chox01OevHObvU0ENuGhMJ_FzYzDJdQ3uD_sqBA@mail.gmail.com>
 <CAFd5g46=3VF+kyyRFttLi=Ru62eypsXeA2NGPAu8b0R3-xpFUQ@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 31 Aug 2016 08:08:21 +0930
X-Google-Sender-Auth: -QQXH4IA7JuG9mpxp0QIdHJ5Rbs
Message-ID: <CACPK8Xd7n-64r1cBmVapQrBdgu=dWh6fQCo6FiV10y78t6BdSg@mail.gmail.com>
Subject: Re: [PATCH 2/2] i2c: aspeed: cleanup driver
To: Brendan Higgins <brendanhiggins@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Andrew Jeffery <andrew@aj.id.au>, Jeremy Kerr <jk@ozlabs.org>
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
X-List-Received-Date: Tue, 30 Aug 2016 22:38:45 -0000

On Wed, Aug 31, 2016 at 7:54 AM, Brendan Higgins
<brendanhiggins@google.com> wrote:
>>> Did you send a new version?
>
> Yeah, the subject is: [PATCH v2] i2c: aspeed: added driver for Aspeed I2C
> I sent it --in-reply-to=<your previous message ID>, does it not show as a
> child of the thread in your email client?

I can see it in the list archives, but it never arrived in my inbox.
I'm a little surprised given that I'm using Gmail.

> Sorry if changing the commit message title screwed things up for you, but I
> felt that the clean up title was no longer fitting.

Nope, that's fine.

When you send it next with the bindings document, feel free to reset
the clock and drop the v2 or whatever and send it as a fresh patch.

Cheers,

Joel

>
> On Tue, Aug 30, 2016 at 3:15 PM Joel Stanley <joel@jms.id.au> wrote:
>>
>> On Wed, Aug 31, 2016 at 7:14 AM, Brendan Higgins
>> <brendanhiggins@google.com> wrote:
>> > Oh, and one more note: I moved out the eeprom quirk patch from this
>> > patch
>> > set because I think it makes sense as a different submission upstream.
>>
>> That makes sense to me.
>>
>> >
>> > On Tue, Aug 30, 2016 at 11:59 AM Brendan Higgins
>> > <brendanhiggins@google.com>
>> > wrote:
>> >>
>> >> checkpatch seems to be upset about my device tree identifiers being
>> >> undocumented; do we have a coordinated effort for this? I did not even
>> >> see a
>> >> directory for aspeed under arm.
>>
>> As this is a driver, the binding should be added in
>> Documentation/devicetree/bindings/i2c/. Use one of the recently added
>> existing drivers as a template. Add the binding in a separate commit,
>> coming before the addition of the driver. When you send it upstream
>> you will cc the device tree maintainers, who will ack your bindings.
>> The driver maintainer will then merge the two patches into their tree.
>>
>> >>
>> >> checkpatch is also asked about updating MAINTAINERS, but looks like it
>> >> should be covered under existing line:
>> >> F: drivers/*/*aspeed*
>> >> Does it just ask this every time you add a file?
>>
>> Yeah, I think it just complains for the sake of it.
>>
>> >>
>> >> changelog:
>> >>  - Squashed driver commits as suggested by Joel
>> >>  - Renamed a couple functions for consistency
>> >>  - Fixed a couple style errors
>>
>> Did you send a new version?
>>
>> Cheers,
>>
>> Joel
