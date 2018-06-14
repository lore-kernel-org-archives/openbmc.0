Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400c:c08::235; helo=mail-ua0-x235.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="gzTAyuia"; 
 dkim-atps=neutral
Received: from mail-ua0-x235.google.com (mail-ua0-x235.google.com
 [IPv6:2607:f8b0:400c:c08::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4168Xx6PnLzDrpC
 for <openbmc@lists.ozlabs.org>; Fri, 15 Jun 2018 02:42:09 +1000 (AEST)
Received: by mail-ua0-x235.google.com with SMTP id l14-v6so1139240uao.4
 for <openbmc@lists.ozlabs.org>; Thu, 14 Jun 2018 09:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=PmcrapcXAxanAKY3IyXwOjRBvoeYTrRQ7qD5ab6HVTc=;
 b=gzTAyuiae5L4q7caw4o0gjgvvYUYKd7kGwxQCOU/Q6UcE5UTd0MGSRMJFztSGP0OP0
 6Oc5uRhXPMS2oFPfPOe0MzgtVC8OJycsm60vGk2qlDJXgj+ZJsqjQ9ud93bQM8Cy8icM
 MylToabqisBy1NvXxK1GLtnMEV+1jE61QymAWXIBBHb16QIzcyyf9czLBRk62KDVJFVi
 Hc9KHZ1hfsq6SIApTc+IzjTBCikCBNwDhSZ7IFi5yW0csd3IqpIHhekQUHYotnLOaoHm
 PLSsyrm33yHEmKi7DiUZ7Btwb10XnTFUlzADrJYwNabUfT6rG8FaZMBQ5icOQqwuAV35
 WGzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=PmcrapcXAxanAKY3IyXwOjRBvoeYTrRQ7qD5ab6HVTc=;
 b=TasJV5ScdNNIug5lRnsqSgbwlQKjEgQAkxq/qJ/TkrHoPJm/6Q0HfmOPS3nSS3kfik
 ZBIA7n9PI084XwtlHe7KI7if3G0OklWWi3gMPsE5n8t+//0CUJAd28PGMGLs+k0nxjXd
 4PWIkXJ3Q1wlhzovUH7I4aksOInj063GSLPM6krDQqhnplJTsNe9obVt+cmZgdfH/U12
 JghtvIwV2bSo9julIW6KgL89424p0PhU+UTmZciaGScBSQbgFGoY5/UQupUeM+bQUcMt
 EmBeRL6JhT6ADnVm2dD+VVHN66nklJEbwfad+vPuRCaXR3oy9Uo4nLkv8uV2GbM53UEe
 sBxQ==
X-Gm-Message-State: APt69E2jy6qcbW6XbX6qx/bVVJeRgdFllzsj5eZgsysjrjUFkDv/JfIH
 ZO6nQjHf1veWm9UUjdIYdBVZBG7MhLUDqbBJuV613g==
X-Google-Smtp-Source: ADUXVKI+3zHEb0aV2UfwwbZTunv3cLevP4Q6xt/GRoR+0aYnNQgiayoNvzZXENUKgPf3CGBCtozo0TSnuWoZzO2BUDc=
X-Received: by 2002:ab0:1251:: with SMTP id
 s17-v6mr2078275uac.37.1528994526425; 
 Thu, 14 Jun 2018 09:42:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a1f:bd94:0:0:0:0:0 with HTTP; Thu, 14 Jun 2018 09:41:45
 -0700 (PDT)
In-Reply-To: <CAARXrt=XaO=t=UuSDjcgZ=Nkh9J7vTQJPEAMG5=_Ca7ukRVekA@mail.gmail.com>
References: <CAARXrt=XaO=t=UuSDjcgZ=Nkh9J7vTQJPEAMG5=_Ca7ukRVekA@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Thu, 14 Jun 2018 09:41:45 -0700
Message-ID: <CAO=notxjAAF0w70yrmFffNQchEmdcexWjAt9xftiwaRw6-aM7Q@mail.gmail.com>
Subject: Re: Feature request in phosphor-pid-control
To: Lei YU <mine260309@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Thu, 14 Jun 2018 16:42:11 -0000

It follows a similar downstream feature where a sensor being
"unavailable" because the mapper is swamped shouldn't except the
program.  The only difference here is that this is a sensor which also
needs to be unable to throw the system into failsafe mode.  The system
starts in failsafe mode until it's heard from all the sensors it's
expecting.  This would need to check to see if that sensor supports
the notion of a failsafe timeout -- which is already supported.

A sensor triggers failsafe IFF the value is older than the timeout
value and the timeout value is non-zero.  So, in theory, the
initialization loop could check that the timeout value for a sensor is
non-zero before adding it to the fail-safe check-in list.

So, this change really is just, "don't fail if you can't find the
sensor during start-up, and keep trying until it shows up"

Does that follow?

Patrick

On Thu, Jun 14, 2018 at 12:24 AM, Lei YU <mine260309@gmail.com> wrote:
> This email is about a feature request in phosphor-pid-control, that to
> support
> optional sensors.
> It is mentioned in comment of https://gerrit.openbmc-project.xyz/#/c/11003/
>
> Background:
> Current phosphor-pid-control checks the temperature sensors and calculate
> the
> expected fan speed.
> It assumes the temperature sensors are always available. And if the sensor
> is
> not there, the service throws exceptions.
>
> The feature request:
> I would like phosphor-pid-control to support "optional" sensors, that it may
> be unavailable when system is running.
> Such sensor is counted when it is available, and is ignored when it is
> missing.
>
> An use case:
> I want to adjust fan speed based on cpu core or dimm temperature.
> For a typical OpenPOWER P9 system, there could be at most 48 cores, but they
> can be missing depending on the CPU, e.g. if a system is plugged CPUs with
> 22
> cores, 4 cores temperature will be missing. And in run time, a core may be
> garded if it has problem it will be missing as well.
> The same for dimms, for a system with at most 16 dimms, it depends on how
> many
> dimms are attached.
> In such case, the config will specify all the temperatures for cpu cores and
> dimms, and phosphor-pid-control shall ignore the missing temperatures.
>
> Patrick, what do you think about such case?
>
> Thanks!
