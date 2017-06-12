Return-Path: <geissonator@gmail.com>
Received: from mail-it0-x233.google.com (mail-it0-x233.google.com
 [IPv6:2607:f8b0:4001:c0b::233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wmGY66tn0zDqL2
 for <openbmc@lists.ozlabs.org>; Mon, 12 Jun 2017 12:09:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="vXjpt3SW"; 
 dkim-atps=neutral
Received: by mail-it0-x233.google.com with SMTP id l6so6938232iti.1
 for <openbmc@lists.ozlabs.org>; Sun, 11 Jun 2017 19:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=it68ixeTlRMwTWVQuA7FfHxDoDV4plHgjEggmYZkcM4=;
 b=vXjpt3SW1TyvV/07EAlnAMDYveWJxCO5Usk7GEs8SnxzCbbwJulTgvIy9uoT/J05iQ
 Y3F+4Ys7aX+87Vbqc+FO9ATdUyNoWSAPBBzCrfu+/VX90B8JrRM5zlA0oqPMy2F+ufVt
 INIaVFfrvQipTGe3Qgd7nFAouXfMXWmDdy6nBJAtiTXpNVM7QSmCSZIZK3d2mLY+RLAn
 hWyFmfuUqPFu0cA+dHDmXtatMgda7VihVbZDDtUd/jAF3+1U0T0rI8xy0p0dYg5VPsPy
 xq0Ays9LfMcrwJ/FYPbJEIReR+YIgq2IAztkwKwjvfCOA3ls+1pprW0k0p3ULzdHIDXx
 6uJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=it68ixeTlRMwTWVQuA7FfHxDoDV4plHgjEggmYZkcM4=;
 b=ny2i8D82uqDrTgFpCb20qpy7ER0bTHmX+jtdYK3tgZfEfdVa1eS4Lk5lnjrIbyHSDH
 7uhp5v07QfO/gUaAwNt5A9AprYmOY3gT0EytLn6UApbKnj5eFU86bqXeeofihcr8jtmH
 DrNJ9GxlnbG30w4JuF/e6wEDIiqS3eMjCeGZXPYTDrTEZXroDc8FYV43eZgXhos3kgso
 vW8qx3RTxVlIPf4PQ4754wUXnj+roSgWVMG+qKazuiIS4IjXWqDNgCebXhdOX9aR1BOC
 wkk/a3dKO5uX+EAxkX3VP1v8Ly4ssgph5vepwM1L9Vh77BrfUQ9T2dY1YW/WpmRBFID0
 JdEQ==
X-Gm-Message-State: AODbwcDmt0qSDiiQ9aR/YP2ADy6E7NimMJ8KJT0P1xA7xE84SGAftA+i
 r9mwbLSV8pjJC3IEGkKrmVT8QK0/lw==
X-Received: by 10.36.233.70 with SMTP id f67mr9843378ith.60.1497233352370;
 Sun, 11 Jun 2017 19:09:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.133.40 with HTTP; Sun, 11 Jun 2017 19:09:11 -0700 (PDT)
In-Reply-To: <ce283d8e-ba55-9476-8409-e5982a63034f@ozlabs.org>
References: <20170606200230.77482-1-cbostic@linux.vnet.ibm.com>
 <1ac7a650-9524-4c50-f449-b5fc89e8d988@ozlabs.org>
 <bdb441e5-5485-9a67-1749-029f684162f9@linux.vnet.ibm.com>
 <2986922.Yi4HN7lb1t@new-mexico>
 <ce283d8e-ba55-9476-8409-e5982a63034f@ozlabs.org>
From: Andrew Geissler <geissonator@gmail.com>
Date: Sun, 11 Jun 2017 21:09:11 -0500
Message-ID: <CALLMt=q8L8UwegNKy+D0uhyqi25sfpUW27FjwBbqmVme1OgP0g@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10] drivers/fsi: Break and set pin states on
 GPIO master remove
To: Jeremy Kerr <jk@ozlabs.org>
Cc: Alistair Popple <alistair@popple.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Christopher Bostic <cbostic@linux.vnet.ibm.com>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Mon, 12 Jun 2017 02:09:15 -0000

I think we had this same discussion last time Chris put this on the
mailing list for 4.7 :)   I think we can do better here but we also
(as usual) have a big time crunch.  Can we agree to put this in for
now since our main goal is to just get 4.10 merged and of equal (or
better) function to 4.7?  Chris can create an issue to come up with a
final solution?  Without this change, cronus via the FSP debug does
not work, which is a non-starter for picking this release up by IBM
(and a lot of partners).

I know, in theory, this is easy to fix, but it will require new
testing, potentially new documentation for our users, and is just
adding new function when we're mostly looking to just get a stable
base going.

Andrew

On Thu, Jun 8, 2017 at 5:00 AM, Jeremy Kerr <jk@ozlabs.org> wrote:
> Hi Alistair & Chris,
>
>>> The pins are set here mainly for the benefit of the Cronus debug
>>> tools.   Its common practice in test and bringup labs to switch back and
>>> forth between BMC and FSP-2 with Cronus to access the host processor
>>> CFAMs over FSI.  Without the remove pin state changes Cronus cannot access.
>>
>> As far as I know you have to run "systemctl start fsi-disable.service"
>> to switch over to Cronus mode. I think Jeremy's point is that it
>> should be that service which explicitly sets up the hardware in a
>> suitable mode rather than relying on side-effects from removing the
>> kernel driver.
>
> Yep, spot on.
>
> Also, those side-effects might not be how the GPIOs need to configured
> for the next usage of the FSI bus (which could be Cronus, but could also
> be any other tool). So, let those tools handle the init correctly,
> rather than the kernel making a guess at it.
>
> Cheers,
>
>
> Jeremy
