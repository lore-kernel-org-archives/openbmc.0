Return-Path: <joel.stan@gmail.com>
Received: from mail-yb0-x236.google.com (mail-yb0-x236.google.com
 [IPv6:2607:f8b0:4002:c09::236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xCftr1s5hzDrCy
 for <openbmc@lists.ozlabs.org>; Thu, 20 Jul 2017 13:45:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="bsErVdJS"; 
 dkim-atps=neutral
Received: by mail-yb0-x236.google.com with SMTP id 70so4137712ybn.2
 for <openbmc@lists.ozlabs.org>; Wed, 19 Jul 2017 20:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=ixtj/sg1STaBNXdl2uxEAqxKjWG+mFojtR3R3Yp34hc=;
 b=bsErVdJS54wrg4v8tjrQziFDKsngj1opVBr4cUigsn6h+liAL8VBsnrJeHR92MyZ/v
 DVSVcCk5LrEwp64CIpG5ZBaQ9Anws50PV8hg/ocMuSAbZ+PXmjFOlINaPRIugNjDvBoi
 AI5Te9rY0Ejsptz4qxS0vzPwCu9/KEhzfERQRIv9sbAvg3vlKnMBZVs1kuCWQmyH32Xz
 1Cy3/tkYA0ylJ2ZEPyJP7dq+KhcrMRmfwLefYKLCp2mX6n9xu3AOYUfigeK8bDpBmZS4
 5sWS1CDY+E/J9tDppdYJf5hFq5NqLkCmT5uYPFHqo7EhFuUsrzcVN2vowaUSyVrUsv4i
 Le8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=ixtj/sg1STaBNXdl2uxEAqxKjWG+mFojtR3R3Yp34hc=;
 b=ETcZ5CGottgOEqo1PfBkfwCLR4iezPuW8qRWtMpZs0tT9gut6MtyQLtYhx2VJpn0yd
 cUN/JGFyv2CBBeyB+w6G8GqnDqGS4Q7O7zJ2viqFmn7icriVAjaR88NlpyEi+usABWE4
 C4qMExfocTfib0dSAs06+TfCfnKKgkdGxq2xOvw3WgORQe4cU9mfZzp7cr7kFAG392Qz
 DdDqomE0nApSpSjgyYovw1jQ8VaLyCkUztaqgjfH22qDZGyKPRlJliPoX+nLe5txPSbP
 eeYnmuTsSmpMrxmSIsM/iP3cCqUJVMw1t4oxpN0tndaEyaA73TNtu/H3ErASux4RZfP4
 ihhA==
X-Gm-Message-State: AIVw1127f2M7gcDM+cUKJ3a2RJ4/aAo/MGSyWSTTi7NlkY5vgq0eMLh5
 lkIyc5bkKo0vAwhzr0qyU99Z1yqtmA==
X-Received: by 10.37.114.198 with SMTP id n189mr1962852ybc.21.1500522337908;
 Wed, 19 Jul 2017 20:45:37 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.170.177 with HTTP; Wed, 19 Jul 2017 20:45:17 -0700 (PDT)
In-Reply-To: <1500516109.500.13.camel@aj.id.au>
References: <20170713193606.56374-1-cbostic@linux.vnet.ibm.com>
 <CACPK8XfbX3VqQcvtMpmiDeJhyPBx5rqh3L5grep5gL+SmS+PDQ@mail.gmail.com>
 <1500516109.500.13.camel@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 20 Jul 2017 13:15:17 +0930
X-Google-Sender-Auth: lob40g3PjnnUqbFOum5IYQBCTPw
Message-ID: <CACPK8XfnqqrzxSs8Nzr9yiytg_nK1bZ39HAAE3hwdmGA8SbQ7w@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10] ARM: dts: aspeed: Add gpio keys for power
 supply presence, ucd alert
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Christopher Bostic <cbostic@linux.vnet.ibm.com>,
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
X-List-Received-Date: Thu, 20 Jul 2017 03:45:41 -0000

On Thu, Jul 20, 2017 at 11:31 AM, Andrew Jeffery <andrew@aj.id.au> wrote:
>> > +
>> > +               ucd-alert {
>> > +                       label = "ucd-alert";
>> > +                       gpios = <&gpio ASPEED_GPIO(I, 2) GPIO_ACTIVE_LOW>;
>> > +                       linux,code = <ASPEED_GPIO(I, 2)>;
>> > +               };
>>
>> Andrew, are we sure this should be exposed to userspace? Is it
>> something that should be hooked up to the SMBus driver instead?
>
> I've looked at the relevant schematics and datasheets, and the GPIO of
> interest (I2) appears to be correct for the UCD alert. However, GPIOI2
> is *not* capable of being muxed as an SMBus Alert (SALT) line and
> therefore the alert will not be propagated to the I2C master. It
> appears we must handle it in userspace. Configuring it as GPIO key will
> give us an interrupt.

We discussed this today, and decided that we would look in to hooking
the GPIO up to the ucd driver. From there it will initiate the reading
of the fault registers, and allow the implementation of a poll()
response on the fault files in sysfs.

Cheers,

Joel
