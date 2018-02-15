Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c0d::235; helo=mail-qt0-x235.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="PSCjtCJh"; 
 dkim-atps=neutral
Received: from mail-qt0-x235.google.com (mail-qt0-x235.google.com
 [IPv6:2607:f8b0:400d:c0d::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zhdnH4p8bzF1Km
 for <openbmc@lists.ozlabs.org>; Thu, 15 Feb 2018 12:22:59 +1100 (AEDT)
Received: by mail-qt0-x235.google.com with SMTP id k13so10116959qtg.5
 for <openbmc@lists.ozlabs.org>; Wed, 14 Feb 2018 17:22:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=4hArDZ/sx+B1yScbgiSUA9/f4bkVjPuVJkMbEBacaeE=;
 b=PSCjtCJhMeKflTuBp6swobTam3S7GKlpY0/0vREIvA/ibYGPW8O5/+CLQ9lpewyEva
 bhy6jmh5zBj/LynPwcf4lmyIyLywrcaAsMMIxr8zGNCZUNjTYuhTJDkjFLGMCqcPnyAz
 L3CE+8ydqkrfZ+i7jGe5C8Qw1iTmgwYwGXSlDsWZHuQDchJZDkSV0f0K8cOwF90QC0OB
 loTsm+sKd92GBASKNJuMXUWcNScbFxE9iURB0YVaRodtXpHBfIyMdv1c4zNi7Vl1fasl
 wVq9E9TUntD0MKh39lBKwSv/6SyKk1A3EVKFiKlCpH6pRks4FSM+3BL669ZpuXFg8b9U
 YGlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=4hArDZ/sx+B1yScbgiSUA9/f4bkVjPuVJkMbEBacaeE=;
 b=YErcbESqN8jLRB30kL/i7Q4RttOX/ZoQjnETF9z/DvmUF7GBmWrltyLmgJTJ0A3/cA
 uqtMYmdZ0ECMLd/AjO9VShT7SpOTl5SyPHoI6o4UasWxT20P/dra0U7Oezr+rHytCmaz
 sd5CDw1Jm+TfSEO7BHErapf9HABKf57ULAQU4CgzeAYDKwTwUExZWP0gYgz4hsJjnXtD
 ajxp1reVfz56QkMCvovl5yw0a16DFR4Lm+LQgeI1OZyTmr39iZ/AJh9LV+4iH+qskY+u
 5G0cfgCXTNavTBQZXEZYeEXM7n2a+S0ZjPCRVSVB/6Z01hUv/l3gAooNfDSbbHHAEAfX
 YkGA==
X-Gm-Message-State: APf1xPBDwkS6IFsmHCegMjhvA/I2j0vz36ctqlXRLEbGZzJXJA1XMxgi
 SyZgjUIdPVwBfO2hdp16loxCI4T+RUMp/+/CvL8=
X-Google-Smtp-Source: AH8x225HXpFJYirPwQQRTWkQ9xElRV5Hriy9kaIfanJbmhIZuWt4uDG22fNnFYjL5Ux9//1i/Z4LxTH7MAgoShUEAaM=
X-Received: by 10.200.36.199 with SMTP id t7mr1691037qtt.141.1518657776198;
 Wed, 14 Feb 2018 17:22:56 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.200.50.69 with HTTP; Wed, 14 Feb 2018 17:22:35 -0800 (PST)
In-Reply-To: <20180214171707.GF113334@mauery>
References: <CAEOv9APgYZ=Yzs4tjYad+tg0CupqyTx5M1cpzN3LcnBPBwj_LA@mail.gmail.com>
 <20180214171707.GF113334@mauery>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 15 Feb 2018 11:52:35 +1030
X-Google-Sender-Auth: zpYgkrL1cbkQ9mL6Iy0bHjYd5Es
Message-ID: <CACPK8Xc1TeFAPSBuZqdy5ECdfGEpk6Yp59o06O+dt=Dzw2+X-w@mail.gmail.com>
Subject: Re: sdbusplus port for host-ipmid
To: Liz Kammer <eakammer@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Vernon Mauery <vernon.mauery@linux.intel.com>, wak@google.com
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
X-List-Received-Date: Thu, 15 Feb 2018 01:23:00 -0000

Hi Liz,

On Thu, Feb 15, 2018 at 3:47 AM, Vernon Mauery
<vernon.mauery@linux.intel.com> wrote:
> On 12-Feb-2018 11:01 PM, Liz Kammer wrote:
>>
>> Hi Everyone,
>>
>> Is anyone working on the sd_bus.h -> sdbusplus port for host-ipmid? I am
>> hoping to work on this issue
>> https://github.com/openbmc/phosphor-host-ipmid/issues/109, but I don't
>> want
>> to step on toes.

I was searching through gerrit for something else and came across this
patch from William:

 https://gerrit.openbmc-project.xyz/#/c/8938/

I won't assume that because you have the same domain name in your
email address that you're aware of each other's work. But perhaps you
are! Either way perhaps you and William can let us know which parts
you're working on and keep everyone on the list updated.

> I am happy to hear you are working on this. I don't know if anyone else is
> working on it or not, but I do know that host-ipmid is under very active
> development. You will have fewer collisions with others if you make and push
> incremental changes (like for one file at a time). If you push one big
> patchset, it will likely conflict with every other commit in review.

That's good advice.

Cheers,

Joel
