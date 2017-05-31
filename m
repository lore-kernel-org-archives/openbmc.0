Return-Path: <joel.stan@gmail.com>
Received: from mail-yb0-x242.google.com (mail-yb0-x242.google.com
 [IPv6:2607:f8b0:4002:c09::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wdB1n4kGyzDq5W
 for <openbmc@lists.ozlabs.org>; Wed, 31 May 2017 23:21:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="GH8PB0jJ"; 
 dkim-atps=neutral
Received: by mail-yb0-x242.google.com with SMTP id o185so466904yba.1
 for <openbmc@lists.ozlabs.org>; Wed, 31 May 2017 06:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=f67VMONrpADKIOdH/3Ug0IEZEit7PsiszQ02Gz76p4c=;
 b=GH8PB0jJ7r+0JBToVwFzW//UAIamedNEedjPtXIkjx+o/7yKg3vCSun5iRytolYt8Q
 77TnGMh90m6oPq0a6Dcnfuk4XU6ALQFE46s36fzsg4HGb77JUa77lRy59iZybSt3DLyC
 Tkap9fXYqDtSwziy4znfiy6+uykEENQb4ZrzzmY67OMwKGAfTZzU7P8wa4fyTg2uTDVT
 sHjRdpIzA8zFIvfvFZRX539lKF5BuMAKn+7VZyUQ8TZG908OOrByr/IjZhBBrzuMUFC8
 0bU4iLusc+K+7Z+/urhzDflwqwctN6STbu+VlUk0VNtM3gcR2ygi2wy9XcXI/18oF534
 L6Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=f67VMONrpADKIOdH/3Ug0IEZEit7PsiszQ02Gz76p4c=;
 b=RMpW1iUSkARla6rhsigUOBaUJG6ZC1xavWsNnaRqL9Sw94lXAcmKpxMNydGtS07RrC
 hSNoE2wD6LaAlKRk7lW/QrrFJU8eEKgjkyCZUN9Xe7VtPCnzvyK7EzxCFkF5xZieyZA2
 witg5MNWDZY3X9evqwJhoOSkcX8uoeRWOn9r+XxhVC7iLt+DaxyBtMHlCWQQWt+VKyWL
 6O0c/dbAMEZu4cUd1LiTfJldsh2WD40iS/8agpC7QQMCbzBNuoh5tLhrIZ6VcqATYYEg
 EX+X5FSZO8HWxAC5VQPaCmfo2Qj9jHyMozeTu2XctWtOaNmg0906tcG+qco5kFmRH4Oh
 OqbQ==
X-Gm-Message-State: AODbwcB2Pfj9bUWyou16uQbqS7TGfU1Ib/rVQJk9aa0vCaz6ADYjCPq0
 VHilFzC49Q3RQAfcfjEr5Lwk5aut8SB1TLY=
X-Received: by 10.37.59.210 with SMTP id i201mr246223yba.25.1496236859690;
 Wed, 31 May 2017 06:20:59 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.183.7 with HTTP; Wed, 31 May 2017 06:20:39 -0700 (PDT)
In-Reply-To: <1496109312.8159.3.camel@aj.id.au>
References: <20170529091615.54310-1-c_mykolak@mellanox.com>
 <1496109312.8159.3.camel@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 31 May 2017 22:50:39 +0930
X-Google-Sender-Auth: uuPi7QkEtM4A0IJo4FBW9PhzOt4
Message-ID: <CACPK8XedEp1Mqte4b+Bg1m_KT+5e9iaEugxBK13qCc2LUF5KuA@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10 v3] ARM: aspeed: Add Mellanox MSN machine
 (defconfig)
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Mykola Kostenok <c_mykolak@mellanox.com>,
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
X-List-Received-Date: Wed, 31 May 2017 13:21:02 -0000

On Tue, May 30, 2017 at 11:25 AM, Andrew Jeffery <andrew@aj.id.au> wrote:
> On Mon, 2017-05-29 at 12:16 +0300, Mykola Kostenok wrote:
>> Initial introduction of Mellanox switches of MSNXXXX family equipped
>> with Aspeed 2520 BMC SoC. This adds defconfig changes.
>>
>> Signed-off-by: Mykola Kostenok <c_mykolak@mellanox.com>
>
> Acked-by: Andrew Jeffery <andrew@aj.id.au>

Applied to dev-4.10 with a small tweak to the commit message.

Cheers,

Joel

>
>> ---
>> v1->v2
>> Fixed issues pointed out by Joel:
>> - Make commit title shorter.
>> - Replace flash layout from separate dtsi to dts.
>> - Change compatible = "mellanox,msnxxxx-bmc" to "mellanox,msn-bmc".
>> - Remove no-hw-checksum from dts.
>> - Add comments.
>> - Remove WD2 disable from aspeed.c
>> - Add wdt2 to dts.
>>
>> v2->v3
>> - Split v2 patch into three separate.
>> ---
>>  arch/arm/configs/aspeed_g5_defconfig | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/arch/arm/configs/aspeed_g5_defconfig
>> b/arch/arm/configs/aspeed_g5_defconfig
>> index 25332b07d887..3fc3eb0e8867 100644
>> --- a/arch/arm/configs/aspeed_g5_defconfig
>> +++ b/arch/arm/configs/aspeed_g5_defconfig
>> @@ -141,6 +141,7 @@ CONFIG_SENSORS_ADM1275=y
>>  CONFIG_SENSORS_IR35221=y
>>  CONFIG_SENSORS_LM25066=y
>>  CONFIG_SENSORS_UCD9000=y
>> +CONFIG_SENSORS_UCD9200=y
>>  CONFIG_SENSORS_TMP421=y
>>  CONFIG_USB=y
>>  CONFIG_USB_ANNOUNCE_NEW_DEVICES=y
>> @@ -165,6 +166,7 @@ CONFIG_MAILBOX=y
>>  CONFIG_ASPEED_LPC_MBOX=y
>>  # CONFIG_IOMMU_SUPPORT is not set
>>  CONFIG_IIO=y
>> +CONFIG_MAX1363=y
>>  CONFIG_ASPEED_ADC=y
>>  CONFIG_BMP280=y
>>  CONFIG_FSI=y
