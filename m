Return-Path: <xavinux@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c0d::231; helo=mail-qt0-x231.google.com;
 envelope-from=xavinux@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="JFs9LESH"; 
 dkim-atps=neutral
Received: from mail-qt0-x231.google.com (mail-qt0-x231.google.com
 [IPv6:2607:f8b0:400d:c0d::231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yBJgk5TDZzDqlv
 for <openbmc@lists.ozlabs.org>; Wed, 11 Oct 2017 01:01:37 +1100 (AEDT)
Received: by mail-qt0-x231.google.com with SMTP id k31so16067717qta.6
 for <openbmc@lists.ozlabs.org>; Tue, 10 Oct 2017 07:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=Zz7xyMd/ZnV553r2iLEOM6pHroD5p54krzgjHugzBEw=;
 b=JFs9LESHgtN2P2QNNzF8CmAxOsBmiTu12i+YQXaJcw/Ce1U4V+QwMN200qdCNQdxjN
 4iM+bACYmSVnsKyOCrjdV41A+CiMGkhljvbXiuc/5rEWIeNtVeZvuJ0vDQ44hCTGlX4R
 xzo5XnlKRaBLqUzjqVpNvxhzDBgYqxN1cB5zdmT2dlpKE80VcLGxa1R/8kvbGMWjCUUI
 xok1Lg3PZHoNWRlwDPUvl4nzinGqFbHd+3jOZoL2GATaVWdpxp0vGWQwi5qYleedhq/s
 p/wq1B91Fr4qEGaNpE4+udaQ76Tkt0Zz38ndA2TqkBWaw/RDYnE4SMRb6fq2ZgIQaVJ2
 6Erw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=Zz7xyMd/ZnV553r2iLEOM6pHroD5p54krzgjHugzBEw=;
 b=GqzysHWtmQsOsqfskK8HhQKsXgGob0UcPMMgD/yUDDnmpsp7wPWa+7pYfFo8gTl6pg
 FbaZnJoxhhlT6eDA/idhnm81PmOaORlrzGUpq7oVwONVhrTxd682qC0WJpdAl9dSlhQC
 3bI9kpAxEv5ER+ZBG9uiBiWHOMuVeu14spZAZZ61Oikm+34Fw5w65Ot64UQYOs+mWyZA
 MbTikjIvnAzTfTmeRi+RtPZmoCfyzgwL+XqcP8kDHxLdKeS8OIZWLyPKIARuk92oa/60
 br0BLj4NShVyrqNEXjAGEF7ji74c+NuGjNrfuAog9qNER/sdpD4YkDC2KSgsifXoIiNR
 HLXA==
X-Gm-Message-State: AMCzsaUZnKESdiCnPDeQcUR+NEiB0SsyeyRtX51WcM9Arw930LUZ44Ib
 uXK59NjVeO7bdAytBjKP0D1RxqhXVBG+INVqZIzf12Bo
X-Google-Smtp-Source: AOwi7QC3sgzuGq5buPA5EczWHrwEg6bblCYSN1kBIScq/B5r9VFT7JqsBpJNDamjSe7bUKBZkp2/nZZyPEocWwgEGmI=
X-Received: by 10.200.27.221 with SMTP id m29mr8129819qtk.152.1507644094863;
 Tue, 10 Oct 2017 07:01:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.153.200 with HTTP; Tue, 10 Oct 2017 07:01:34 -0700 (PDT)
In-Reply-To: <1507594463.5452.156.camel@aj.id.au>
References: <CAEX+82Lr=pJEvRqfi9MA=ZBW=DR+mY2VYVUhhTBgrPFA3c239g@mail.gmail.com>
 <CAPLgG=nHvmVzBW2CDxvgaeYAHoNL53W3An-p9fK3D4HfsU=Bbw@mail.gmail.com>
 <1507325323.1545468.1130544088.6FEEF44B@webmail.messagingengine.com>
 <CAEX+82KLmByCXqVg1Hzi7r5-cH2=Cx-0OE_hLwx-Jr_XXfe1Wg@mail.gmail.com>
 <CAEX+82Ls_e7EdupoUUbWEOL5gngd5BdxAY6YptHqAVp7HuJvjA@mail.gmail.com>
 <1507466681.5452.143.camel@aj.id.au>
 <CAEX+82+KQAV5WMuWh1VZCL+zb7TXXnxeUS_=8nQk1tC=8jrtqg@mail.gmail.com>
 <1507531274.5452.154.camel@aj.id.au>
 <OF72E5748D.A94F82AF-ON482581B4.0033C44D-482581B4.003504C9@notes.na.collabserv.com>
 <CAEX+82LFjvc4=Ai6p4k66EBfE-45jrYUwvmPFGdgSb4OdzQVFA@mail.gmail.com>
 <1507594463.5452.156.camel@aj.id.au>
From: Javier Romero <xavinux@gmail.com>
Date: Tue, 10 Oct 2017 11:01:34 -0300
Message-ID: <CAEX+82+j8xq5JikSPWi_ycwnoQLNUF1YVUVjxsSdtBfG3b2-Ug@mail.gmail.com>
Subject: Re: OpenBMC on Raspberry PI 3.
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Yi TZ Li <shliyi@cn.ibm.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 10 Oct 2017 14:01:39 -0000

Hi Andrew,
Thank you very much for your suggestions, I'll follow them.


>
> Ah - so I don't think you've outlined why you picked OpenBMC for the
> job. Can you give us a quick run-down?

I'm an individual contributor on the Open Compute Project and follow
the Hardware Management Group, OpenBMC is on their project scope and
sounds very interesting for me, so decide to participate and see if I
can be useful.


>
> Without further information and assuming you just want to get an image
> you've built with Yocto onto a Raspberry Pi, there appears to be a good
> unofficial how-to here

I've built an image of Yocto to learn more about it, as see that is
what OepBMC use.


>
> There are going to be easier projects out there than OpenBMC to cut
> your teeth with, but if you are keen to learn to program, feel you have
> the drive to do so and Yi is happy to help out with your interest in
> the Raspberry Pi then by all means stick around :)

Have bought the Raspberry PI a few days ago, to start contibuting to
the OpenBMC project and try to make it work on the RPI. I can learn
what is needed on the way, and that is why I'm here and decide to
participate, to contribute while learning new things. But if more
programming advanced knowledge is requiered to participate on the
OpsnBMC project, maybe I'll have to cut my teeth with other project as
you said.

Thanks again for your kind attention.

Regards,

Javier Romero
E-mail: xavinux@gmail.com
Skype: xavinux



2017-10-09 21:14 GMT-03:00 Andrew Jeffery <andrew@aj.id.au>:
> Hi Javier,
>
> A few notes on how to make best use of the mailing list:
>
> First, mail to the list is best sent plain-text. I see you use gmail -
> if you're using the web interface there's a drop-down menu at the
> bottom right of the composer where you can select the plain-text
> option.
>
> Secondly, I notice you quote both Yi and I below in your reply, and
> appear to have constructed the reply yourself: the best way to deal
> with multiple people in a conversation is to reply to their emails
> individually and directly, rather than consolidating your thoughts in
> one reply. This keeps the threads of conversation easy to follow
> (though gmail's conversation interface is linear rather than tree view,
> so this might not be obvious but it does affect others reading the
> list).
>
> Third: You have the knack of replying to quotes from the sender, but
> this is best served by making use of the reply-indentation that your
> composer should already provide (e.g. '> some quoted text'). For
> example what I'm doing below:
>
> On Mon, 2017-10-09 at 13:09 -0300, Javier Romero wrote:
>> Andrew,
>>
>> "More generally, knowledge of Python (Yocto/bitbake, some OpenBMC
>> userspace), C (u-boot, kernel, qemu, also requires a some comfort
>> with assembler) and C++ (most of the phosphor reference userspace
>> applications) is useful."
>>
>> I see, but I'm not a programmer, have start by building an image of
>> Yocto for the Raspberry PI to learn more about Yocto, Poky and
>> bitbake. Links you provided are very welcome and useful!
>
> Ah - so I don't think you've outlined why you picked OpenBMC for the
> job. Can you give us a quick run-down?
>
> Without further information and assuming you just want to get an image
> you've built with Yocto onto a Raspberry Pi, there appears to be a good
> unofficial how-to here:
>
> http://www.jumpnowtek.com/rpi/Raspberry-Pi-Systems-with-Yocto.html
>
> This should get you something that works without having to deal with
> any of the broken assumptions currently baked into the OpenBMC code-
> base with respect to the Raspberry Pi.
>
>>
>>
>> Yi,
>>
>> "The original target was to build an OpenBMC image for RaspberryPi,
>> but I never tested on a real hardware.
>>
>> I've the Raspberry PI 3 at disposal for testing on a real hardware.
>>
>> More work is required to run OpenBMC on a Raspberry Pi. The "meta-
>> phosphor" layer has been changed since that time, we need to update
>> RaspberryPi configurations accordingly."
>>
>> Something I can help and with this although Im not a programmer?
>
> Not already having programming experience is going to make it harder,
> and I wouldn't necessarily take queues from how we use Yocto (I'm no
> expert but I feel that we don't do some things quite by the book).
>
> Yocto borrows lots of ideas from shell scripting and is implemented in
> python. Further, it allows you to pretty freely mix the two in recipes
> thus it would be helpful to get a grasp of these environments (and
> Yocto itself). Without some experience it leaves us with high latency
> interactions between you and Yi if Yi is to continue developing the
> Raspberry Pi support. I expect this will end up frustrating both of
> you, but it's up to you both to decide.
>
> There are going to be easier projects out there than OpenBMC to cut
> your teeth with, but if you are keen to learn to program, feel you have
> the drive to do so and Yi is happy to help out with your interest in
> the Raspberry Pi then by all means stick around :)
>
> Andrew
