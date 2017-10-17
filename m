Return-Path: <venture@google.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400c:c05::22d; helo=mail-vk0-x22d.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="CSIx+32g"; 
 dkim-atps=neutral
Received: from mail-vk0-x22d.google.com (mail-vk0-x22d.google.com
 [IPv6:2607:f8b0:400c:c05::22d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yGcyj1FwGzDqlv
 for <openbmc@lists.ozlabs.org>; Wed, 18 Oct 2017 01:29:31 +1100 (AEDT)
Received: by mail-vk0-x22d.google.com with SMTP id t203so1228330vke.0
 for <openbmc@lists.ozlabs.org>; Tue, 17 Oct 2017 07:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=nLFAo6T5lwaKwSTB+GbjmRKiPWtN1UdZtt9BsRBzhVE=;
 b=CSIx+32gcbE40QGGMnbTXzj0awf1kdXAR8ChLZwLKBClvyBlkvxx0CyOQ2a0KqYf6z
 ZDNX2/3I03eMzLTpUK4ID1LqtwPqwpT1ca12AQOTzf86btYz9tl5QH/nYjBY7ANh/IUu
 a5GnmpgnHLiZgDtXe7ZPli9EgIgnGcznG88dfLtJCuxQwHhL88sa2UzQ8Gs0oUXpT4f6
 nfQV3gaT5PRKT3pRrA6FFkL9QxW68wlHvVLBxA/zwH8WjytFqYwMS/iJdD4Kzn5tbmkB
 GZnEe3Xg/JoIe8KE0jhzgcziRth5llSTWh2xCsPawD/qUSEzPqJzPOMQudWyh/mfk7CA
 c6TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=nLFAo6T5lwaKwSTB+GbjmRKiPWtN1UdZtt9BsRBzhVE=;
 b=UZHSWcAL4zaswNy/IRhePq3ask9KgW7ny5YQNznZI/mE/vec3cip5rIG0wjSFyfcnE
 vAiSWlpjtP3iltyVPIFyjv0yq9nXwBaNRQ5/IveCA4clyPmlR478wrwS0u8Rl0LsENKW
 mIl+9OJ+hqpTEYqOtCKKD5Of2LqIKwqCGbrk6JDRCvIUjsfWIajWcdkZh8WpkTzH4wIG
 m+mc3VoIEUvjyO1CXWlPiqEGJVla4NS8sXbKX9YrnkIlC0cTyKrRXivlNBJImaitM3i0
 7sVBeI/3ytD2DTofB/DSyaVB7dmqusIk/6Mc+Lre5t8rCGpNSHXdrD3RxOXrxF/EusPD
 OFRw==
X-Gm-Message-State: AMCzsaUY/5ZjjnH05rCM/0lnlkJa0L37dDIATfWd8hqqDjzTfHvi3eXb
 QsBqQww9H2b7o9noRHpiEwUkba1E4lnJ9Of9wxMQ/Q==
X-Google-Smtp-Source: ABhQp+RpUb9+46KnnEA9AVCsRdLK7gMLgl4jnHQTy2W9Al8dumOQbg+NJWn+p5QLgtiWiaj0Xm4/PIRL659sldQDU0s=
X-Received: by 10.31.6.130 with SMTP id 124mr3106891vkg.195.1508250569273;
 Tue, 17 Oct 2017 07:29:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.163.73 with HTTP; Tue, 17 Oct 2017 07:29:08 -0700 (PDT)
In-Reply-To: <1508210694.24322.13.camel@aj.id.au>
References: <20171016194353.171692-1-venture@google.com>
 <1508210694.24322.13.camel@aj.id.au>
From: Patrick Venture <venture@google.com>
Date: Tue, 17 Oct 2017 07:29:08 -0700
Message-ID: <CAO=notyfmFKy9-3WzzGN_1Gx+O7y_vSTdUu==BY8-WQTu8bySA@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10] ARM: dts: aspeed: g4 & bmc-quanta-q71l:
 Add aspeed-lpc-snoop
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Joel Stanley <joel@jms.id.au>, Rick Altherr <raltherr@google.com>, 
 OpenBMC <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Tue, 17 Oct 2017 14:29:34 -0000

Thanks, I realized that last night and was going to +cc it this
morning.  I'll be double-checking in the future!

On Mon, Oct 16, 2017 at 8:24 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
> On Mon, 2017-10-16 at 12:43 -0700, Patrick Venture wrote:
>> Signed-off-by: Patrick Venture <venture@google.com>
>
> Thanks, applied to dev-4.10. As a note you forgot to Cc the list
> initially, so I've added it here.
>
> Andrew
>
>> ---
>>  arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts | 5 +++++
>>  arch/arm/boot/dts/aspeed-g4.dtsi             | 7 +++++++
>>  2 files changed, 12 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
>> b/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
>> index 0ff3af7ed871..7ed3a773b2d5 100644
>> --- a/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
>> +++ b/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
>> @@ -129,6 +129,11 @@
>>                       &pinctrl_ddcclk_default
>> &pinctrl_ddcdat_default>;
>>  };
>>
>> +&lpc_snoop {
>> +     status = "okay";
>> +     snoop-ports = <0x80>;
>> +};
>> +
>>  &mac0 {
>>       status = "okay";
>>
>> diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi
>> b/arch/arm/boot/dts/aspeed-g4.dtsi
>> index 6151704aa87e..6505062ac6c7 100644
>> --- a/arch/arm/boot/dts/aspeed-g4.dtsi
>> +++ b/arch/arm/boot/dts/aspeed-g4.dtsi
>> @@ -117,6 +117,13 @@
>>                                       status = "disabled";
>>                               };
>>
>> +                             lpc_snoop: lpc-snoop@0 {
>> +                                     compatible =
>> "aspeed,ast2400-lpc-snoop";
>> +                                     reg = <0x0 0x80>;
>> +                                     interrupts = <8>;
>> +                                     status = "disabled";
>> +                             };
>> +
>>                               mbox: mbox@180 {
>>                                       compatible =
>> "aspeed,ast2400-mbox";
>>                                       reg = <0x180 0x5c>;
