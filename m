Return-Path: <joel.stan@gmail.com>
Received: from mail-yb0-x242.google.com (mail-yb0-x242.google.com
 [IPv6:2607:f8b0:4002:c09::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wdDRx0XGWzDq5j
 for <openbmc@lists.ozlabs.org>; Thu,  1 Jun 2017 01:10:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="l0/RQn5Y"; 
 dkim-atps=neutral
Received: by mail-yb0-x242.google.com with SMTP id 130so568593ybl.2
 for <openbmc@lists.ozlabs.org>; Wed, 31 May 2017 08:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=Mio0hRVgdZ24AKSay9DYue+E+5KZ6hoaqY7jPvRSQlE=;
 b=l0/RQn5Y/Wn3tOVKSguXrKsN364rw1dqXwxvW8bEXJHEmYLqAxqk6rfdHxzEAf1Ftc
 P1zTrTZ3mtpdd6gUBBv7xEPolU7bny59fYI7VTxFa+GCwjCmSfoJU/h/H/R+qjJnU9yO
 w5qGPf5MEBbZP/33VvZDHjyUgRNy8ZLYEGLNMpwNvumkR8mEBqOP4ahlr2OY3EmHY5RJ
 tbzTMuXdaBMEJaIAL1xoybntndtbGIHPjKrDlFnE61E6Y9bPA6Wcr3zOtPSs0m6BgJQ/
 QOUF93fUN18ZWjVCSYlHMNi9ty/nWl5rrcCEW8kGoilNIjyzZ6IP1dByyB+T589cSa/I
 ZHHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=Mio0hRVgdZ24AKSay9DYue+E+5KZ6hoaqY7jPvRSQlE=;
 b=J2KUGAysk5LsOAHcpfT2Od1yihuUTU+tVgjsXBhu0zxy/7xuObN1RqvMqP10/Sd2y+
 6XLIdSgS3miVDUehqtNmEGNRrgxgmyeM4yiIf5BqkB1yf8CWMZw5evuQyLodVfrwMLtS
 Q+EplK5NoYTXWdMfejjSB6PzJE4V+AclyopZ++vPYPthAHYD73mMR7SaCwce8tGOXgK9
 39jyZ4Xk1DoHbpSoT8Oz3nuqq0zkH9WroxCsy7ajGbIZzmh4bQiTFgVO7PjXkLGuqQYA
 DvrOuuXMhUnVNSgdygeZYPNLxu5OLQoc5LJmQRs3U1tbZw+3VsLbuez2e795XlJ8CxnM
 ybMg==
X-Gm-Message-State: AODbwcAOm49PW7ELj4i447YxkMiqXr3sAisewT2RkjF14XD86GS1TAO0
 QlOJ+18TEHwbgA6/R9mssOPboBVpFg==
X-Received: by 10.37.58.131 with SMTP id h125mr55631645yba.152.1496243418745; 
 Wed, 31 May 2017 08:10:18 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.12.6 with HTTP; Wed, 31 May 2017 08:09:57 -0700 (PDT)
In-Reply-To: <86554E4C-0D25-4446-B59B-3FCB84638ACD@fuzziesquirrel.com>
References: <20170519173412.68053-1-cbostic@linux.vnet.ibm.com>
 <20170519173412.68053-2-cbostic@linux.vnet.ibm.com>
 <CACPK8Xdq2J0XE9bkezBDOTQ=xCUGdYo=TLdjyOkwpp=3JFATgg@mail.gmail.com>
 <CACPK8Xe_5V_c30A+h_5+ZVbZ2YEcfSbF5od-qfQgp+aGggFmJg@mail.gmail.com>
 <8ED27577-DDFA-49E1-ADFC-EAC12A98D655@fuzziesquirrel.com>
 <CACPK8XeZN5ALj3ry-G8QkOneCLWT=_6yBF4NuMP1h+MEO8NPmQ@mail.gmail.com>
 <86554E4C-0D25-4446-B59B-3FCB84638ACD@fuzziesquirrel.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 1 Jun 2017 00:39:57 +0930
X-Google-Sender-Auth: t3xZluibyJ5elvzmWGV6a2PxZIo
Message-ID: <CACPK8Xft92TUg+US7x53VWYg27oMMndwzXj8qN2XGOwnRmjPFA@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10 v2] arm: dts: aspeed: Add IR35221 instances
 to dev tree
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: Christopher Bostic <cbostic@linux.vnet.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Wed, 31 May 2017 15:10:21 -0000

On Thu, May 25, 2017 at 10:54 AM, Brad Bishop
<bradleyb@fuzziesquirrel.com> wrote:

>>>> This breaks userspace, as userspace assumes it can access the i2c
>>>> devices through /dev/i2c-x.
>>>>
>>>
>>> Joel, or anyone able to answer=E2=80=A6
>>>
>>> Do you know which application?  I wasn=E2=80=99t aware of any applicati=
ons using i2c-dev...
>>
>> The one I noticed was vrm-control.sh.

> I=E2=80=99m not sure how to handle this.  We obviously still need to run =
these workarounds,
> but we also need the regulator temperatures.
>
> The only thing I can think of is exposing what these scripts need via sys=
fs attributes.
>
> Is there any alternative?

There are two options:

Write from userspace

We could unbind the driver, make the relevant configuration changes in
userspace, and then re-bind the driver. This has the benefit of being
sure that the driver will still work, and does not require any kernel
work.

A sub-option of this is to do the same without unbinding the driver.
Userspace can specify a "force" flag in the ioctl, which allows it to
write to the i2c device even when a kernel driver is bound. The upside
here is less messing around with unbinding, but the drawback is
userspace may change the hardware state that the driver depends on,
leading to instability. We could audit the drivers to make sure the
state we're changing from userspace does not affect the driver, and/or
fix the driver so it still behaves.

Add functionality to the driver

Look at adding the required configuration to the driver. Either
through device tree properties, or sysfs files. This is would require
looking at the writes we need to do, and working out how they can be
integrated.

As discussed today, we will go with writing from userspace after
unbinding the driver.

As I've already merged the ir35221 patch into the kernel, completing
the unbinding work is blocking an update of the kernel. Do we have a
ticket opened for this work?

Cheers,

Joel
