Return-Path: <joel.stan@gmail.com>
Received: from mail-lf0-x233.google.com (mail-lf0-x233.google.com
 [IPv6:2a00:1450:4010:c07::233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xcZ7k26JfzDqYy
 for <openbmc@lists.ozlabs.org>; Wed, 23 Aug 2017 14:24:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="sWhzZ1+n"; 
 dkim-atps=neutral
Received: by mail-lf0-x233.google.com with SMTP id g77so2390365lfg.1
 for <openbmc@lists.ozlabs.org>; Tue, 22 Aug 2017 21:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=uCxhmy6Pw01PjvFOyVGmMaN72Bh7HWQ3yH76NIf6ilU=;
 b=sWhzZ1+nehGG5PN4Xr4q5GRIB9/1UxR3ddRpHlWJVOGtJ2xA4R261zD4bPgOLcIaNd
 Bw9CLlsjTWxSthQTeceoj3Dd24T6Zd3CyCS3nD6VxJFVRIZ2bX6+FX6AEd/4OH/GoBQm
 /z1GAyTZ6dQAN5opH1lunfRQh/BdXDmS+vjHzV2d3FyK9fFF8fIW/5lzeXSV8zKge6pi
 73pm3KWWjaXm2+zuEakIeeyjdGTXg1+wzLLXUJ6xhbNGLUuBb6/r7GE4mIv9gqEjBCea
 iaoLCdJ9BIVo47N/SuB5jyWVOwTQRhctMN29D4yVtl6pZqSVQUObUlrTTJ1n9HLx3TpI
 vW/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=uCxhmy6Pw01PjvFOyVGmMaN72Bh7HWQ3yH76NIf6ilU=;
 b=hncLf75LcTpmTlBLPZZ45N+KYy9k9vBDGzkB/q3KGfcKzejP/PKuSbmdcBuGwTlBsJ
 UwY7wfVM6KWHv4/HA6pfhoWzAkmFMh5Dt3TqqRnloV3DAXS06FHVbUjMWEmmXLzfKPxk
 y7R7C3aymsp5YSap7dudk9TDnYmDqdjZr9H2jB0GZJiz6vNrbuj8eAfsvKQfRnQ6igcV
 l0sQ6wuTZ0ySSNZuk6fw2Dtl9ono5uETMfHIirtL+GRUfUH0Sl5+W+c/zMAeJpixr0dg
 Bu6Trrdywxovl+0yzapBpWBv71RdaqAJxYlGsR/mRJVs56VEo1fJgnpEHud9gdX2nu7r
 /TYA==
X-Gm-Message-State: AHYfb5hWvgB1ho/zfA/vbuR3vRdQqtf0SvWuYpBSI9J8jvL8FAz004lb
 s6PzN+7QSkLjyHtjI/3+5W9mGu0U4A==
X-Received: by 10.46.83.25 with SMTP id h25mr591603ljb.46.1503462254374; Tue,
 22 Aug 2017 21:24:14 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.25.72.77 with HTTP; Tue, 22 Aug 2017 21:23:53 -0700 (PDT)
In-Reply-To: <OFBCEEB1DF.062FDE5A-ON86258184.004F4953-86258184.0054E20B@notes.na.collabserv.com>
References: <OFBCEEB1DF.062FDE5A-ON86258184.004F4953-86258184.0054E20B@notes.na.collabserv.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 23 Aug 2017 13:53:53 +0930
X-Google-Sender-Auth: QDAoFpk77yGrbqJfT8IDLA3DMaw
Message-ID: <CACPK8Xd3X6-ew2oDSvFwRibUWBBGWVWk9jY_M7nqnL9Kk80=1Q@mail.gmail.com>
Subject: Re: What does it take for OpenBMC to merge code
To: Chris Austen <austenc@us.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Wed, 23 Aug 2017 04:24:19 -0000

Hi Chris,

On Wed, Aug 23, 2017 at 12:57 AM, Chris Austen <austenc@us.ibm.com> wrote:
> For a some time now a question keeps popping up. I ask others for an answer
> and get I different responses. It's time I bring this to the mailing list
> for further discussion... what will the OpenBMC project merge? If I add my
> own meta layer will it be accepted? What if I wrote a device driver that
> satisfies my own hardware needs? What if I wrote a dbus telemetry monitor
> with the capability to download results in python? The
> https://github.com/openbmc/docs/blob/master/contributing.md file goes in to
> some detail but is pretty blank on the practice of what kind of code will go
> in.
>
> So, what should the policy be?
>
> Should the OpenBMC project be a collection of random software or a
> structured framework or somewhere in between? Some pieces may need to be
> hosted independently... hosting non-comformant parts implies a level of
> support and maintenance which is something we should not be doing.

I'd like to see an inclusive policy to start with. We've seen several
approaches to an open source BMC stack over the past year, with
Facebook's initial Yocto-based OpenBMC, the OpenWRT based design,
IBM's 'phosphor' yocto layer, and Mellanox's OpenIPMI based variant.
They are all interesting in their own way, and bring their own
strengths to the project.

Having this list be a central place to collaborate would be my initial
goal. From there we can refine the direction for the project, and
introduce some guidelines that direct future development. Things like
the use of D-Bus, and Redfish REST APIs, are areas that we appear to
have common ground.

Cheers,

Joel

>
> What about code with existing modeled concepts. IPC is done via dbus, LEDs
> and Sensors too have established meta-phosphor implementations. Changing
> those idea would break down the fundamentals of what OpenBMC is. For models
> that have not been established yet perhaps the developer should be active on
> the mailing list describing the issue so that we can provide guidance?
>
> Is there a place for staging? The Linux kernel uses them for less stable
> code. Using a staging area does at least two things...
> 1) Recognizes anyone coming to the table brings their own companies history
> and business requirements
> 2) Allows developers to share ideas that could build in to an approved model
>
>
> There are groups that want to get involved and are at various stages of
> OpenBMC understanding. We owe it to them to be very upfront about what the
> community will and will not accept.
>
> Thoughts?
>
> Chris Austen
>
