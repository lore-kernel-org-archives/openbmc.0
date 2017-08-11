Return-Path: <sdliyong@gmail.com>
Received: from mail-pg0-x231.google.com (mail-pg0-x231.google.com
 [IPv6:2607:f8b0:400e:c05::231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xTCCF5RlZzDr1g
 for <openbmc@lists.ozlabs.org>; Fri, 11 Aug 2017 14:46:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="gZtasX6+"; 
 dkim-atps=neutral
Received: by mail-pg0-x231.google.com with SMTP id u5so11284522pgn.0
 for <openbmc@lists.ozlabs.org>; Thu, 10 Aug 2017 21:46:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=Qm2SIlLU0dQMWufB2QBenINuUiPOnp0xDZLw9JdZBgM=;
 b=gZtasX6+T40H8iPpKGZ0EDBYHxtdabLDooqr7gZBubAipz2dee3WvGcvZMHvHBBDqD
 TQqDJfiohK/gSjrKN3wGtHvCTDSwIymZ9h5sZcFAr9WkpmqKIMMlbeVmBPHyf92dri5P
 zk1couQF91EqnoYGvGVequbNNgKod1+FzEtbK6BWJy0JDdP2UnomezHxSIJSrmYmfeTD
 lWjh5i9ejvsEiO+jvtfo4tjlELOcW8s/iJo9RxxJISowK0p1osIbhlKmPKQcFqE+XGfm
 DbXVCuj2RSqBS9SGbgJGx4u3jnS30v/ZVfZxARfo5khoc/43CiQmneZsHqLD1DtA2+2G
 3fiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=Qm2SIlLU0dQMWufB2QBenINuUiPOnp0xDZLw9JdZBgM=;
 b=YCY0lTJ9yOiFE6wJ74o5NHVYvlRQO8gQmsQnjc/to8kfgf+NXB6B8g4AEyghAugyU7
 o0c93lc1lxnP+e5VZHFjvJXzw9TfasMy0utIfGkiTNsjD34EhHz0E9DduQtipLFKRNC4
 IyaawzYC5wyqcJ88ZdSVPQxoOFSNO1Lj0f0nAU78OnN06jGfrW9+eLcNQ1bZEa3YJdBL
 GIKZ6mGiz7cBGTOncHhcFZEtajvgAjXdG2SEBinmDK+lhCHu7VpQobRtI27+dlINl3Uz
 S91JIbCmln9aYKSPeoh8sg3dshD4taLPsrvpGJ2ogb/c7oVRiUmGEOGgErr/GSOxLFof
 y06Q==
X-Gm-Message-State: AHYfb5gwHpDn3ITCE2wilABjdEZjUQLgvZ1s76Sg+0Eou5OhR137rYTI
 TIDCMgBWXAUJprI+hXbyyO10wqu3fCU3zZo=
X-Received: by 10.99.176.4 with SMTP id h4mr13897757pgf.300.1502426807756;
 Thu, 10 Aug 2017 21:46:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.170.77 with HTTP; Thu, 10 Aug 2017 21:46:27 -0700 (PDT)
In-Reply-To: <1502408722.7946.21.camel@aj.id.au>
References: <CADO9-pd_r73SxL8eHCYwzK_jhdyfrhFYLrJ0nXif3--Tj1Jc9w@mail.gmail.com>
 <1502353590.7946.15.camel@aj.id.au>
 <B48C8FC6-CC36-4EC0-841D-D6267A7DC63C@gmail.com>
 <1502359910.7946.17.camel@aj.id.au>
 <CAPLgG==GHvy__Lq7su=J6i=Uqi6VmuL5_2oL8iwVCepEk6_M0Q@mail.gmail.com>
 <1502408722.7946.21.camel@aj.id.au>
From: Yong Li <sdliyong@gmail.com>
Date: Fri, 11 Aug 2017 12:46:27 +0800
Message-ID: <CADO9-pfMwusWGTfu4q7BNoqRGng7xqYoev-AELeVVfp0EwSPow@mail.gmail.com>
Subject: Re: AST SOC gpio pass-through support
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Rick Altherr <raltherr@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Fri, 11 Aug 2017 04:46:50 -0000

Hi Andrew & Rick, what I want is I can change the gpio pass-trough
dynamically after kernel boots. For example:
The pass-through is disabled after I export gpioe2, I can control
these pins by writing value in /sys/class/gpio.

I still can enable the pass-through function later. As Rick mentioned,
the pass-through is disabled after export gpio, I would like to know
if the will be enable after I unexport it? Or I can use "runtime
pinmuxing" to change it? Let me study on them.

Thanks,
Yong

2017-08-11 7:45 GMT+08:00 Andrew Jeffery <andrew@aj.id.au>:
> On Thu, 2017-08-10 at 09:11 -0700, Rick Altherr wrote:
>>
>>
>> On Aug 10, 2017 3:12 AM, "Andrew Jeffery" <andrew@aj.id.au> wrote:
>> On Thu, 2017-08-10 at 17:01 +0800, Yong Li wrote:
>> > thanks for your quick response Andrew!
>>
>> No worries!
>>
>> > i will read these info deeply. just a quick question, is it
>> possible
>> > to enable/disable the pass through dynamically after kernel
>> boots?  how?
>>
>> So there is the concept of runtime pinmuxing[1]: It's possible for a
>> device to have several pinmux states that can be configured/selected
>> from process context.
>>
>>
>> On Quanta Q71L, the hardware strap is used to enable pass through so
>> the power button works even if the BMC fails to boot. The BMC
>> firmware is expected to disable the pass through once it is ready to
>> take over. I believe I sent the patch upstream to allow pinmux to
>> modify the strap register for this case. That is, pass through is
>> disabled when the user exports a GPIO to userspace.
>
> Ah yes, I forgot we added an exception there. It does require that the
> strapping is used for the configuration and not the alternative SCU
> bits that are set by the GPIE{0,2,4,6} functions, which were enabled by
> the devicetree snippet I sent previously. If the mux is requested with
> the GPIE{0,2,4,6} functions then the runtime pinmuxing is really the
> only choice.
>
> Yong: What is your use case? If it's similar to the Q71L as Rick has
> outlined, then please ensure the strapping is set correctly in hardware
> - setting it in U-Boot doesn't really gain you much unless you fail to
> load/boot the kernel.
>
> Cheers,
>
> Andrew
