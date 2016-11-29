Return-Path: <joel.stan@gmail.com>
Received: from mail-ua0-x229.google.com (mail-ua0-x229.google.com
 [IPv6:2607:f8b0:400c:c08::229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tSQtb4c0kzDw5k
 for <openbmc@lists.ozlabs.org>; Tue, 29 Nov 2016 12:28:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="fwwnIlAt"; 
 dkim-atps=neutral
Received: by mail-ua0-x229.google.com with SMTP id 12so163059565uas.2
 for <openbmc@lists.ozlabs.org>; Mon, 28 Nov 2016 17:28:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=rJ/bavkg6wtklGlEvrTpE4yPH/eXCxlPWNdyZ9/c0eE=;
 b=fwwnIlAtLG6teBUDLrXbVrySCHbpYXADOMDXd3DitSQxoYMaz/z1rUBw7155B/jfer
 6rQ/vFzhvDnrqItyNMyWKTH2TB6hKgqc1LqPcbIFsPAgDA+hblAA44LdNjrQ7XTNJqWR
 fok/3PjkGBk7mbTK9PiZoU5gH5fE8Q+WF7bZyIRmVuicpCNBdJj+uhrmT4LIuhwfsTY4
 PuZSIPSvTK8eeNR+nX8Rd7okXpdfikrqOMq1TU0BmTBLxOUBLVJYmoe3k1yPY/oQgFOx
 KWeyazNIgUkRRE94kOuUcthxRO32lEmYL9fFeM9eZPYwTvPvuiyL6J3zE5C33lgXrKCS
 nZsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=rJ/bavkg6wtklGlEvrTpE4yPH/eXCxlPWNdyZ9/c0eE=;
 b=CdQN53TBQFhjzZbdNZuQYUmkuSRJv47rr7S2w48Mc72MOkY20A0pvj0q1dfy56K42I
 ueasp3oAtIAPeT2/QXzzJOHoBizLDxn21G4cgRFD4AL9o8c0C8zpi2diLUIUAnoKBpD1
 eE4qtqf2ys8oAZ6OFQrIsrqaY4Kb9Gcre9Ib69VJ3qT5GWH4yZhfjSMcpp8tWiU1rbfO
 zZ3NYFqWbcMCj26ctxaGO1QRjy9r0EeTLLkBDwjE5hIw2nMF2WfSgkkst9sPSfpu+y3H
 y2nRi3Fqm1FR/qWpN5a2pbzTWBBT9mKoybgcH6sxisHYwLxlbAAr46O4cgke1IfWnkJZ
 kFug==
X-Gm-Message-State: AKaTC01yDpDU8VjgzilCW1u7HjGtZHhe3qOA93zwPU3Hrglk7ptoYYAfVIoUjXPfUUvvjdTWwRX1qv4MzH/IxA==
X-Received: by 10.176.84.207 with SMTP id q15mr15336089uaa.177.1480382933090; 
 Mon, 28 Nov 2016 17:28:53 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.176.0.193 with HTTP; Mon, 28 Nov 2016 17:28:32 -0800 (PST)
In-Reply-To: <32e4f53c-5bab-55ba-50f2-25ba891d4127@linux.vnet.ibm.com>
References: <32e4f53c-5bab-55ba-50f2-25ba891d4127@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 29 Nov 2016 11:58:32 +1030
X-Google-Sender-Auth: 90b7n2mBbbL1IFLTChUUp0tF0QM
Message-ID: <CACPK8Xe9j1knVThhduju-OCipgX_UEZMe4bL+Hf9xJMSWVfq5A@mail.gmail.com>
Subject: Re: Starting the phosphor-hwmon service from udev rules
To: Matt Spinler <mspinler@linux.vnet.ibm.com>
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
X-List-Received-Date: Tue, 29 Nov 2016 01:28:56 -0000

On Tue, Nov 29, 2016 at 3:01 AM, Matt Spinler
<mspinler@linux.vnet.ibm.com> wrote:
> I am working on a story this sprint to start the phosphor-hwmon service from
> udev rules.  In addition to just starting the service based on a device
> path, I need to be able to communicate to it some threshold values, like
> critical high temps for example.

What are the functions of the 'phosphor-hwmon' service?

I would consider naming it phosphor-hardware-monitor or similar, in
case you decide it should monitor things other than Linux 'hwmon'
devices.

>
> I have a proposal for the rules at
> https://gerrit.openbmc-project.xyz/#/c/1243/.
>
> It has lines like:
>
> SUBSYSTEM=="hwmon", DEVPATH=="*i2c-3/3-0077/*", ACTION == "add",
> TAG+="systemd",
> ENV{SYSTEMD_WANTS}+="phosphor-hwmon@/sys/class/hwmon/%k.service",
> ENV{ENVFILE}+="/etc/hwmon.d/hwmon-bmp280-3-77.conf"

Do we need to match only on the path? Can it match on the device driver instead?

>
> where the .conf file will contain any threshold values, maybe like CRIT=50.
> The command line in the unit file would then somehow make a udevadm call to
> pull out the ENVFILE so it can get passed into the executable along with the
> device path.
>
> Is this the recommended way to go about doing this?  Or instead of having a
> separate udev rule for each device, but 1 service file, is it better to have
> 1 udev rule but separate service files?

It appears you plan on re-implementing the functionality of the
lm-sensors package. While the upstream project has dissappeared from
the net, the source code and documentation is still available. I would
consider firstly trying to re-use existing daemons and configuration
that we already have access to. If that does not work, then reading
and re-using the source code to adopt the same design would save you
time and effort.

https://web.archive.org/web/20150905145034/http://www.lm-sensors.org/

Cheers,

Joel
