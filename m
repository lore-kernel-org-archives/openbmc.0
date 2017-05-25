Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x244.google.com (mail-yw0-x244.google.com
 [IPv6:2607:f8b0:4002:c05::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wYBFC4xDmzDqdl
 for <openbmc@lists.ozlabs.org>; Thu, 25 May 2017 11:17:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Oe94c0jZ"; 
 dkim-atps=neutral
Received: by mail-yw0-x244.google.com with SMTP id 17so13853676ywk.1
 for <openbmc@lists.ozlabs.org>; Wed, 24 May 2017 18:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=zb2itkf0v/pOOgwxnJ4ucpp3+A7J6yLmWDBHalhkMBM=;
 b=Oe94c0jZWAEbIAah4j8V5r12IzXtk0vk7Adu/wpCcXWm6CTLZwvjuZ9gs4mSg93Nxj
 fmd3Jd2b05P+26BvDdikiw4ym1z5Wv4bb+fLQfPQRCBZKwql9+nQSUTerjR9AUFkC28K
 IF9YSuZot9zHq2uHOscphnefk8S2bZtdMxRsOp3rioSfwwFqU+iFnoERDX+t2UrIZgLO
 9PsGsWcGDtql4m5wgB9ahw7AtJHB9spNqCnRcZzglwQi9SE9FQbYVa6mbIrAaxCIv8U9
 HW985Rs3N2ic7pSnipIDSg3+co/e8pf+JOwUHDdqyZ95q06MQb3bZvvtRLg3c6rP56/y
 NxCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=zb2itkf0v/pOOgwxnJ4ucpp3+A7J6yLmWDBHalhkMBM=;
 b=ehReY8S52PNAPvDNQn1xqZ1nBbKbe2Q+Q5x9mwezUOe+x9HR5o8G11MKIa4aPcR3KF
 hEK15gfRpF/8l2IvsTN79/IJU3AmK0x7QYpCivIsOCAXWj93fwdUMIzzoJTdxNJt6WAU
 28TeOTEqfpWnaa3RVbwOeM9ikm7M9SpVzhRzuP6cWumpFByOiu0kYmQIGW55n2CFeGlt
 lMUJmB2PU6zrg/sZsNQ4z7NL266+4BT/BVdSMO9D2gKOabp1QxJ6TYrKuHHzc6TvFYqW
 a8z1obHTjaDmvjPJQm2yYBJ/pvQ/yDnrt8xzuK0E3fB/Wqke7bN+XPuq83N2ARyl1boT
 DeUQ==
X-Gm-Message-State: AODbwcAJkZdXAgBchqrf/uylTlEhLSxLh6s8sm+dXOa8IwqGrypiQQQe
 JX3G4RkQp8uxqgJtsFwMI+HR8sHemw==
X-Received: by 10.13.243.133 with SMTP id c127mr31422368ywf.43.1495675021290; 
 Wed, 24 May 2017 18:17:01 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.171.70 with HTTP; Wed, 24 May 2017 18:16:40 -0700 (PDT)
In-Reply-To: <8ED27577-DDFA-49E1-ADFC-EAC12A98D655@fuzziesquirrel.com>
References: <20170519173412.68053-1-cbostic@linux.vnet.ibm.com>
 <20170519173412.68053-2-cbostic@linux.vnet.ibm.com>
 <CACPK8Xdq2J0XE9bkezBDOTQ=xCUGdYo=TLdjyOkwpp=3JFATgg@mail.gmail.com>
 <CACPK8Xe_5V_c30A+h_5+ZVbZ2YEcfSbF5od-qfQgp+aGggFmJg@mail.gmail.com>
 <8ED27577-DDFA-49E1-ADFC-EAC12A98D655@fuzziesquirrel.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 25 May 2017 11:16:40 +1000
X-Google-Sender-Auth: F_qBx9bXFjlBLsM8tYNOPVs_Bts
Message-ID: <CACPK8XeZN5ALj3ry-G8QkOneCLWT=_6yBF4NuMP1h+MEO8NPmQ@mail.gmail.com>
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
X-List-Received-Date: Thu, 25 May 2017 01:17:04 -0000

On Thu, May 25, 2017 at 4:32 AM, Brad Bishop
<bradleyb@fuzziesquirrel.com> wrote:
>
>> On May 24, 2017, at 2:20 AM, Joel Stanley <joel@jms.id.au> wrote:
>>
>> On Wed, May 24, 2017 at 10:58 AM, Joel Stanley <joel@jms.id.au> wrote:
>>> On Sat, May 20, 2017 at 3:34 AM, Christopher Bostic
>>> <cbostic@linux.vnet.ibm.com> wrote:
>>>> Add IR35221 to i2c4 and i2c5 buses.
>>>
>>> This is similar to the patch that I sent on the 2nd.
>>>
>>> I took your patch as it adds the device at 0x71 which I did not know ab=
out.
>>>
>>
>> This breaks userspace, as userspace assumes it can access the i2c
>> devices through /dev/i2c-x.
>>
>
> Joel, or anyone able to answer=E2=80=A6
>
> Do you know which application?  I wasn=E2=80=99t aware of any application=
s using i2c-dev...

The one I noticed was vrm-control.sh.

> Can we simply remove i2c-dev from the config?

We could, but that would break other bits of the p9 userspace.

Taking a look a the root filesystem, we have the following
applications that use the /dev/i2c interfaces:

$ grep -rl i2cset *
usr/sbin/i2cset
usr/bin/avsbus-disable.sh
usr/bin/avsbus-workaround.sh
usr/bin/avsbus-enable.sh
usr/bin/vrm-control.sh
usr/bin/vcs_on.sh
usr/bin/ucd_disable_vcs.sh
usr/bin/vcs_off.sh

grep -rl i2cget *
usr/sbin/i2cget
usr/bin/vrm-control.sh

Cheers,

Joel
