Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c0d::243; helo=mail-qt0-x243.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="QVca9pBj"; 
 dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="ckG0iVfz"; 
 dkim-atps=neutral
Received: from mail-qt0-x243.google.com (mail-qt0-x243.google.com
 [IPv6:2607:f8b0:400d:c0d::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40j6Nl6qP7zF2FT
 for <openbmc@lists.ozlabs.org>; Fri, 11 May 2018 20:52:07 +1000 (AEST)
Received: by mail-qt0-x243.google.com with SMTP id d3-v6so6422695qtp.11
 for <openbmc@lists.ozlabs.org>; Fri, 11 May 2018 03:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=YpizrVJXrrexFJoVPFV88cWFaeWllW75kTd9Brn9ieg=;
 b=QVca9pBj6FctE0MRGYt/KHAAGO4+Z6TLkNXQ5CGPXedIESnrozbQbx2akq/5rSI2ut
 WxOlvGWwJv80VcqRl3n/o1X5H5qjwdE6oSU8jCAC3FHokhSqfw61ypNVfwyUmpa+aSDC
 MiVeA5CWZAzacsgERNr9Nv2DFk1Nxv2D7tiE6QoDMOp1lzPpOzJyNJPvSstlJyyFpo1r
 ++Gtw4b3D2EEmYZrYySifi/r1vm7UJDlwikxz6k8bbnCq7ITfu6YCYMvkcOWs/WqWylY
 4woqBAqXHvI2kF9rlGeIoQbHll/psI+Wb816ps+CIPJ1sJK4/Sfw+HiyIev2aMBcrtfy
 NNkA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=YpizrVJXrrexFJoVPFV88cWFaeWllW75kTd9Brn9ieg=;
 b=ckG0iVfzRFgvNSscfEKEL17A+uJrMt0KefRGNFBBGV8qwSVCZ5fxhXrayhB7YgeFTW
 e0MFXlKthbuwRW6SyQJsWqT7uI1vQu35UXt2t+E+1ErWzKRESsOkLkQ5CGwUz0miTC+/
 mP2Qm6S+PWazYA74h3QkKaihhopBGHhXVmPV0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=YpizrVJXrrexFJoVPFV88cWFaeWllW75kTd9Brn9ieg=;
 b=jUBkSeqCU4zuhDvxF2rqY+gdksqs7HSNb/MkTJT9aDJA19FLz4DLuyywufYm2J1Ow5
 Uuk/FclMf9F7EdXqQkDWsX7wx3r1kBLqNBLoVu1FxW62LuX/cvnlrX1dvRBdiYaD6fgT
 5k3Y0+tmwUsi+sD7YfdBi1xJQUJ9pGQavkgmjUg2uF0HrKGtR0x76yUZc6vmxWflw7YG
 WVOm5J46Ag6+75E+kJq/QoFbg6Cj1pSsUyQh+2IhaO8RwfoGTwebEW+O6clSBMvpMv78
 CcyRKZmR5HFfjYOxaa5l+6FxbFTJEt84C2XqSorNOxSMSKHCkytwwts/8za9HvAQ2uF/
 v9fQ==
X-Gm-Message-State: ALKqPwcxd3hUHkv+rRJPwug58c7mL0d9DJEZV2aLFhlOw/kS7Je9SC/b
 kyhDIqhc+eS0y+MpoWDI0bJZN/NTcZYhfbE4POk=
X-Google-Smtp-Source: AB8JxZq4JkdmQqP+9sznf6mta5SeuK5t3I0qtW5Sq32DxSmxpi9ubQbTfk5bSH42mlBbQ6HSAmWEzEkiZVTlRfXEFWA=
X-Received: by 2002:a0c:9b8a:: with SMTP id
 o10-v6mr4599254qve.89.1526035924177; 
 Fri, 11 May 2018 03:52:04 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.200.24.79 with HTTP; Fri, 11 May 2018 03:51:43 -0700 (PDT)
In-Reply-To: <1525920616.2432221.1366964432.1752B0F8@webmail.messagingengine.com>
References: <20180508010640.14113-1-benh@kernel.crashing.org>
 <b81ceb27-73b3-3060-54fa-7a703c422136@linux.vnet.ibm.com>
 <1525920616.2432221.1366964432.1752B0F8@webmail.messagingengine.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 11 May 2018 20:21:43 +0930
X-Google-Sender-Auth: 2ktXn1KkXOxr66EMer4cmDoPa6s
Message-ID: <CACPK8XdE=Vx7M6F4Hmyw_sYAAWPQQ2_bz6PcOvNchgG-Yrk4Qw@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.13 1/6] gpio/aspeed: Set output latch before
 changing direction
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Christopher Bostic <cbostic@linux.vnet.ibm.com>, 
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Fri, 11 May 2018 10:52:09 -0000

On 10 May 2018 at 12:20, Andrew Jeffery <andrew@aj.id.au> wrote:
> On Wed, 9 May 2018, at 01:43, Christopher Bostic wrote:
>> Reviewed-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
>>
>>
>> On 5/7/18 8:06 PM, Benjamin Herrenschmidt wrote:
>> > In aspeed_gpio_dir_out(), we need to establish the new output
>> > value in the output latch *before* we change the direction
>> > to output in order to avoid a glitch on the output line if
>> > the previous value of the latch was different.
>> >
>
> I think Milton mentioned this in a review way back when I was upstreaming the driver, but looks like I forgot to address it.
>
>> > Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
>
> Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

I've applied this series to dev-4.13. Thanks for the patches, and
thanks to everyone who reviewed.

Cheers,

Joel
