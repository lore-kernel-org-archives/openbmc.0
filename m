Return-Path: <geissonator@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::32f; helo=mail-ot1-x32f.google.com;
 envelope-from=geissonator@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="gb7eqt/T"; 
 dkim-atps=neutral
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44VSTD2PCqzDqKt
 for <openbmc@lists.ozlabs.org>; Fri, 29 Mar 2019 01:50:08 +1100 (AEDT)
Received: by mail-ot1-x32f.google.com with SMTP id k21so17208400otf.1
 for <openbmc@lists.ozlabs.org>; Thu, 28 Mar 2019 07:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ycMGeObr8AJifn9UYg17rIj8hyzutJROObhERSwqDZ4=;
 b=gb7eqt/TQEprXFCc6+s38od5CgyS+OMqC2hoVoB+lBQESpMZ7aFjmLutZKJ3A1NLjE
 kSOAi7KoXDFssJenv2/Cv7iHEckRZYhXWMcEzRH/4ghDBzdyAw96RHgyEOZ301HXsxxa
 MEXUm40CLglsZ/w2zuH/F9hxmQ0JgPEDOmuTSuSWcUYktuQudaK2tFBwiMbP5lesMLQ4
 OXiskiPljLgTe+TTwyr8IjlJyBCi13SwExrjnKSOQ2HmO8ZqbPqmcNQ0aLKd+39GnYDw
 7Dx4SR7Hktb9H+L7lq+f55LQYlODSl4kena7tFVWu8w6jdXyLzYk32298hOH2NyU0hwR
 ouNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ycMGeObr8AJifn9UYg17rIj8hyzutJROObhERSwqDZ4=;
 b=AqNFCVXRQcdQprEAl0a5CsOhNaDQ+vJQJ2XMR4z82MgIFLyI1EryF1uRXmTA4FhC0N
 9cRWrosMtCVWzrBqif5vQsqBBD40kLWeh8bVkoeUNzba28DHA9yMFoWIrHjP4xou6szJ
 6OUGn+Byh6ee+0hqLa6kRdefolS8+NFMrFHL0gh9Rt5pyKjU8ZDgmatkh7gTLvqF+lYU
 XRS9lf7U7yJmJaH+HslF9mtHpn7dKw9BACyg8Lx02GVrsnbFDzLEijXUNqv1peiPcyvw
 VVR2vEQ1vHk1PKsq9+xEWI5gdhqNaUVbKM5mQNYwkthUdWyxslP+68WmFsG5MfD4oMwS
 NTzg==
X-Gm-Message-State: APjAAAVQjGNPC2AUS1nrFREQLMhMQxHsI/NANpjKMJOkk6w/eDTbD18D
 q4YhzYMxDqRhcJdibACYZ0IV4MItQyVmhvQWlB89I9NAcWM=
X-Google-Smtp-Source: APXvYqyCl8qGKRYPisXpYFaVjHWUHS7yFMQ7MqWTHuXzgV4Dhgd6Xqd3FlUXCt+Dfh6KS+nUtR7dpccSePchxkIpQXs=
X-Received: by 2002:a9d:5c89:: with SMTP id a9mr22898773oti.12.1553784604421; 
 Thu, 28 Mar 2019 07:50:04 -0700 (PDT)
MIME-Version: 1.0
References: <CAHkHK09mDPscFDRG=_z3biKchg0pNv9urSWacjyYmq2W9Rt0pQ@mail.gmail.com>
In-Reply-To: <CAHkHK09mDPscFDRG=_z3biKchg0pNv9urSWacjyYmq2W9Rt0pQ@mail.gmail.com>
From: Andrew Geissler <geissonator@gmail.com>
Date: Thu, 28 Mar 2019 09:49:48 -0500
Message-ID: <CALLMt=pkvSuQjaQiTP7gj34gavMGBa0ujmNt0u65UCBJKMg13Q@mail.gmail.com>
Subject: Re: questions about host-state-manager on x86 platform
To: John Wang <wangzqbj@inspur.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Thu, 28 Mar 2019 14:50:09 -0000

On Thu, Mar 28, 2019 at 8:02 AM John Wang <wangzqbj@inspur.com> wrote:
>
> I found that on my machine (x86), phosphor-state-manager(host) doesn't work as expected.
> I have a problem when debugging. I hope someone can help me.
>
> When `obmcutil poweroff` is executed, it calls `obmc-host-shutdown@0.target`
> and  will change the CurrentHostState by judging whether obmc-host-stop@0.target is executed or not.

obmc-host-shutdown.target will call
xyz.openbmc_project.Ipmi.Internal.SoftPowerOff.service
This service calls phosphor-softpoweroff
(https://github.com/openbmc/phosphor-host-ipmid/tree/master/softoff)
This sends a message to the host, asking it to power down.
If the host does not ack the message within 30 seconds, then the
obmc-host-stop@0.target will be started.
If the host acks the message, then they get 45 minutes to power down.

The good path is that the host will quiesce itself and send an inband
IPMI message to
ipmid indicating it can continue with the power down. ipmid will tell
the phosphor-softpoweroff
that it can exit, which will start the obmc-host-stop@0.target

You should be able to verify the target dependencies in your
filesystem by looking at this:
ls -1 /lib/systemd/system/obmc-host-shutdown\@0.target.requires/
obmc-chassis-poweroff@0.target
xyz.openbmc_project.Ipmi.Internal.SoftPowerOff.service

The obmc-chassis-poweroff@0.target then requires the obmc-host-stop@0.target
and some other services.
ls -1 /lib/systemd/system/obmc-chassis-poweroff\@0.target.requires/
obmc-host-stop@0.target
op-power-stop@0.service
op-powered-off@0.service
op-wait-power-off@0.service


> However,On my machine, obmc-host-stop@0.target has never been executed.
>
> $systemctl status obmc-host-shutdown@0.target
> obmc-host-shutdown@0.target - Power0 Host Off
>    Loaded: loaded (/lib/systemd/system/obmc-host-shutdown@.target; static; vendor preset: enabled)
>    Active: active
>
> on5263m5 systemd[1]: Reached target Power0 Host Off.
>
> $systemctl status obmc-host-stop@0.target
> Obmc-host-stop@0.target - Stop Host0
>    Loaded: loaded (/lib/systemd/system/obmc-host-stop@.target; static; vendor preset: enabled)
>    Active: inactive (dead)
>
> There is such a comment in the code
>
> host-shutdown notifies host of shutdown and that leads to host-stop being
> called so initiate a host shutdown with the -shutdown target and consider the
> host shut down when the -stop target is complete
>
> But I have not figured out how -stop target is called.

My guess is either some targets/services are missing in your filesystem or
the host ack'd the power down command but did not send the power down
when it was done. You could verify this second part by waiting 45 minutes
to see if your system eventually powers down.

>
> In addition, if the shutdown is performed on the host operating system,
> is it impossible for host-state-manager to know that it is currently shut down?
> In this case, how is openbmc handled? Which module should I refer to?

The host sends down a command inband to indicate it's done with
the shutdown, which causes the BMC to continue with the shutdown.

>
> Thanks
>
> John
