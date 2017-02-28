Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x241.google.com (mail-yw0-x241.google.com
 [IPv6:2607:f8b0:4002:c05::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vXKLf5KbYzDq8M
 for <openbmc@lists.ozlabs.org>; Tue, 28 Feb 2017 11:33:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="UFIQlY7h"; 
 dkim-atps=neutral
Received: by mail-yw0-x241.google.com with SMTP id l16so7456609ywb.2
 for <openbmc@lists.ozlabs.org>; Mon, 27 Feb 2017 16:33:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=UumA+0SZJCkR99bOq7fe/uuAeUkOC+vLDGgE1zjxx/U=;
 b=UFIQlY7hORS+vORu++inuXviSPuBiOLt1xrZaaV+YUdK+AbuhRPQskfDkbEVIqfyID
 JD60gTm78Y+lQHuwDIJys2jyfqNdm7T4OafN5a0k7RghzEEPCkTn7bRJlVoB9VLGjG6r
 Hxsyru8457T1nZJQYWl1BfDb/MxUZbCSxALTYzDB4Ek+W4QtUX4EzCHbulizR/p5ew1O
 UOvrfTxevp5Awm4DhODzgLzc62kSI23xbWKm+Hyrx2/UelShygc61Pu1jlb+XvXnDWpq
 5m7AMdmCH0qWDQl07hJef6ZaViQps4F4RpwuPGgzCoa6C7ZopPx4ODVngJyaGQr3lnuZ
 Vflg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=UumA+0SZJCkR99bOq7fe/uuAeUkOC+vLDGgE1zjxx/U=;
 b=rp9hN7DGFXdoG7+o/OCNBKgZ9Wpb+zLzK0EFgvy7RivY1A8WK0Y6w4lJXfVWoxtUaO
 NlCpQCoZMbAHRe/gVCmy0UAQvVPmrCF7lYXEZkfT7RyVjOQVg65DwA6gU9QvOl9cDxOp
 rQKHvNvV63HFOQE2c1CPgW/Yqa/Hre/+4l0e4W3yN2pviQo6f68M84M1KrQlSuu57Vvi
 gIuSylYRm2I5KdeLSYEnyO5Vq2/ZVPEWPFVkEa4kBwrAdLCD1xEpIgwRKuY/4+xQLZJs
 ceQ6N5T36MZqn1mlC/Enc/c0A0sdDg4wFabMIoIlDL2lWJwAvzh02HBufdEOhc7b57IB
 SxOg==
X-Gm-Message-State: AMke39mV1RyjEVOcjaI2h1F+ptiMe2PgZW35rEnKTOywDu97o+KAIYZx7BYNxAlkgGD1DM6I20BbFN7VHFve/A==
X-Received: by 10.129.71.10 with SMTP id u10mr14063303ywa.174.1488242007179;
 Mon, 27 Feb 2017 16:33:27 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.27.133 with HTTP; Mon, 27 Feb 2017 16:33:06 -0800 (PST)
In-Reply-To: <OF0AB1CC1B.32E73912-ON002580D4.007C5341-002580D4.007D7856@notes.na.collabserv.com>
References: <OF0AB1CC1B.32E73912-ON002580D4.007C5341-002580D4.007D7856@notes.na.collabserv.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 28 Feb 2017 11:03:06 +1030
X-Google-Sender-Auth: zDUzdDA4YPPAAK4N8BVq_a18liE
Message-ID: <CACPK8XcrzLyjbxKv89WJyOwidfKb=9Y-+0GASkrgEseAwKXkng@mail.gmail.com>
Subject: Re: New GPIO API from upstream
To: Edward James <eajames@us.ibm.com>
Cc: Bradley W Bishop <bradleyb@us.ibm.com>, Matt Spinler <spinler@us.ibm.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Andrew Jeffery <andrew@aj.id.au>
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
X-List-Received-Date: Tue, 28 Feb 2017 00:33:31 -0000

Hey Eddie,

On Tue, Feb 28, 2017 at 9:20 AM, Edward James <eajames@us.ibm.com> wrote:
> I think we have some people interested in using the new GPIO chardev API
> (Matt? Not sure who else).

Great!

I did some experimentation with the chardev API a few months ago -
attempting to replace the GPIO utilities in skeleton that use sysfs
with a the chardev API. As you know sysfs is great for bash scripts,
but is clunky to use from C or C++. However I didn't find it much of a
win.

That said, I am happy to support anyone who wants to give it a go.

> The new API provides some useful stuff like
> triggering events when a gpio line changes, etc.

Triggering from GPIO line changes is also possible with the sysfs API
- you can poll() on the sysfs file as described in the documentation:

 https://www.kernel.org/doc/Documentation/gpio/sysfs.txt

When we're dealing with inputs, another useful interface we can use
from the kernel is input events. We use the device tree to bind the
gpio-keys driver to the GPIO, and this gives us an input device to
read from:

 https://www.kernel.org/doc/Documentation/devicetree/bindings/input/gpio-keys.txt

> Problem is these changes are new since we branched off for dev-4.7. I have a
> list of commits I think we'd need, it's non-trivial, and I think there are
> some later commits that do some additional ioctl input checking.

> What do you think we should do? Hold off on any work using the new API until
> you rebase us to a later kernel release? Or do you want to patch dev-4.7?

I intended to move us to a 4.10 based tree last week. Due to our push
to get OpenFSI working, and other urgent tasks, that hasn't happened
yet. I hope to publish the tree this week.

I recommend that you start writing against the 4.10 APIs now. By the
time you have code ready to go we should be fine.

This will require solving a long-standing issue with userspace kernel
headers in our Yocto build. We build the userspace against the 4.4
kernel that Yocto ships, so you will lack the headers required to use
this API. I recommend we move openbmc to building against the compiler
and therefore the userspace headers against the same version of the
kernel as we use to boot the system.

Cheers,

Joel
