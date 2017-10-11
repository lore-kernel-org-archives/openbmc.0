Return-Path: <xavinux@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c0d::232; helo=mail-qt0-x232.google.com;
 envelope-from=xavinux@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="E83JX3G2"; 
 dkim-atps=neutral
Received: from mail-qt0-x232.google.com (mail-qt0-x232.google.com
 [IPv6:2607:f8b0:400d:c0d::232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yC3Sl0w8TzDr5x
 for <openbmc@lists.ozlabs.org>; Thu, 12 Oct 2017 06:09:42 +1100 (AEDT)
Received: by mail-qt0-x232.google.com with SMTP id x54so8350237qth.12
 for <openbmc@lists.ozlabs.org>; Wed, 11 Oct 2017 12:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=2/agRRMs/wG7aYzPg0zNWLdCJkn/YYx8SHl8UWApO0o=;
 b=E83JX3G2xrLVSIi9xoJfsDkHzeIPxB4+3AMTJTO64SRNZiVEy1DZXR4bazVmHQNG/I
 4qI0wQmtyRBxnNSLN/ElfWfR++0j5rttXadqTRJENC4RVU0YviIhtIEkdcz20OJ6oyzt
 9saxwC4UdZBMWjF2STETs3a80TdyuZJUOOsHNtkKpYkdXRrweU8g8weyW2z6Ts1mM3iU
 ocgth6lxtBwVns4AZpmWbBx6nVtNJaQqMIUvNxYcfIWbZOGqpMTTA9TpZmPiH1LbnHri
 1QZG1AXofEnFXQU4zU6kiNVjFvrr3gXAlpxDphsDZOnZf2Thufxe1IoKRCvE7Xa+HGDT
 usxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=2/agRRMs/wG7aYzPg0zNWLdCJkn/YYx8SHl8UWApO0o=;
 b=oC0yOAtzlc9t0H70WssVFjGoE6Wx0oqV6Z6Ds4hdAR0sYZKuy7oOuhwN3yfMZ4ulbX
 jMCYH1T0tBGUR2Zf0HQtVRzlmqJhcm/0ztdFagk4IJoeOLjrABLN+0YWE4h/BGy7h2qu
 oEL2gsV9iHz1X4SixJWoF+5a8Dq1G9yMIpNrU+fqYS2awsVPiJ7YAHLnuBzdKmwb7C41
 uC1YZN5byzzH6yAOKG6V6C3brm5NDyRgwNFpXZvucEvhFaSsonV3iTGaUy38nqBzAVmQ
 cIUnpzV4LHFpA/p8g5YWH9J6RxnVb1dNd/4hLbmI2vT7SB1BCikjevJqkc9ixH+3RR2p
 xX5A==
X-Gm-Message-State: AMCzsaUjfK4X3Qz7J9WV8cEljbjfY1O3EYT5ynbVgENhshpYKkMU6cS9
 YTOlE9Lo9fta0LLm+mZ5/s4hbi+fcorfb85xfYw=
X-Google-Smtp-Source: ABhQp+QwK707IehWPFKs29/oe0NLtrTFSycuvK7BSobu29IeJ/JvtVqBiQXDvLvM/yWBg2y+SjX5T/CwIdaTg7PaSGs=
X-Received: by 10.55.113.70 with SMTP id m67mr20754qkc.187.1507748980421; Wed,
 11 Oct 2017 12:09:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.153.200 with HTTP; Wed, 11 Oct 2017 12:09:39 -0700 (PDT)
In-Reply-To: <1507691159.5452.168.camel@aj.id.au>
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
 <CAEX+82+j8xq5JikSPWi_ycwnoQLNUF1YVUVjxsSdtBfG3b2-Ug@mail.gmail.com>
 <1507691159.5452.168.camel@aj.id.au>
From: Javier Romero <xavinux@gmail.com>
Date: Wed, 11 Oct 2017 16:09:39 -0300
Message-ID: <CAEX+82KL+N5VCvo+LH20=1paTZvKo2M7PqdXk7=bFq7MdAGeSA@mail.gmail.com>
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
X-List-Received-Date: Wed, 11 Oct 2017 19:09:44 -0000

> Great! I look forward to you helping us improve our documentation and
> on-boarding of contributors. It might be rocky but it should help those
> coming along in the future.

A starting point to start my contribution, so, how can I help on this?



Javier Romero
E-mail: xavinux@gmail.com
Skype: xavinux



2017-10-11 0:05 GMT-03:00 Andrew Jeffery <andrew@aj.id.au>:
> On Tue, 2017-10-10 at 11:01 -0300, Javier Romero wrote:
>> > Ah - so I don't think you've outlined why you picked OpenBMC for the
>> > job. Can you give us a quick run-down?
>>
>> I'm an individual contributor on the Open Compute Project and follow
>> the Hardware Management Group, OpenBMC is on their project scope and
>> sounds very interesting for me, so decide to participate and see if I
>> can be useful.
>
> Ah, nice. Good to have some background :)
>
>> >
>> > There are going to be easier projects out there than OpenBMC to cut
>> > your teeth with, but if you are keen to learn to program, feel you have
>> > the drive to do so and Yi is happy to help out with your interest in
>> > the Raspberry Pi then by all means stick around :)
>>
>> Have bought the Raspberry PI a few days ago, to start contibuting to
>> the OpenBMC project and try to make it work on the RPI. I can learn
>> what is needed on the way, and that is why I'm here and decide to
>> participate, to contribute while learning new things.
>
> Great! I look forward to you helping us improve our documentation and
> on-boarding of contributors. It might be rocky but it should help those
> coming along in the future.
>
>>  But if more
>> programming advanced knowledge is requiered to participate on the
>> OpsnBMC project, maybe I'll have to cut my teeth with other project as
>> you said.
>
> Play it by ear - I just wasn't sure what your motivations were. But
> since you're coming from the OCP background with an interest in
> hardware management, it makes sense to stick around here. As long as
> you get in touch when you get stuck we'll find someone to help answer
> your questions.
>
> Cheers,
>
> Andrew
