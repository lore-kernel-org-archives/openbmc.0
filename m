Return-Path: <joel.stan@gmail.com>
Received: from mail-it0-x244.google.com (mail-it0-x244.google.com
 [IPv6:2607:f8b0:4001:c0b::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tF1CJ4ZX3zDvjS
 for <openbmc@lists.ozlabs.org>; Thu, 10 Nov 2016 22:33:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="oT9vw4W4"; 
 dkim-atps=neutral
Received: by mail-it0-x244.google.com with SMTP id b123so2805609itb.2
 for <openbmc@lists.ozlabs.org>; Thu, 10 Nov 2016 03:33:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=fXZt75TYJW0y7aWmQZUUJkQzyf9rtHP7tqeTxYKb7nk=;
 b=oT9vw4W4hItncw+YMxPfa/b713900++wuK0fc+dTrugIWZGFlro1HEySsEe4SEBGrn
 jextPDzBcOO6rSnSwMs8JDdttXxJSpxA1DFxybRNZcavaB7aN//xwSDGbKMpEWo/n749
 tXX8/+996GBNhIFKxghV2Tvjf+dDW1hkTomW8Kva2WPn7cataObS9pfspz3hTZeNnK9w
 70bFHnN9bhLbXslN3hpbqF7t1jTyOKRLGixMQsB8JvanCzvMpsbDqIHIfuwcPynCv8r9
 iPOvEDXDBBOmquNykWIe06H9eFt0jpOPMIVIcqNjzWO0gPwTPllGpkqFBbk2Ghpw1tLW
 TlIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=fXZt75TYJW0y7aWmQZUUJkQzyf9rtHP7tqeTxYKb7nk=;
 b=bJTzFD4SgU6wH2Tj6FroT6lCN7jg3aAyuXwrc1L7GvyOlt6sp2rU7PkDLLNl8V8gmy
 y5ZS17OBTVUTYNuKMg8vxNNCNuYj+q3VG8RnUX3RDrooyz/Tb4Nho7xoL0+TPIY6k+8X
 /jBzK3xMm3kb41lBFALJVxDE26j8VAn4iGqqJ6f4W6eX6kPNnFputNfaQdK53uhb+t6w
 rY7qRzqUtD/SMbjqRYRMYXZRVGJ3122h+S5XH1Zclj2Bs5Fa1r/BNRYXGdcF1WIpln43
 /08KcnpvLk7+D+5UK6GtoHFLAZqmlW9a3WAWaAh+cncXzsqT/HmUZwRtDMWX3yfozQDK
 dnhQ==
X-Gm-Message-State: ABUngvfsa7xEe8jbzlRQDn5jU8AmjackUVudX/mI9zdBqNsYessb0zxvrkjszShYoN99G48VPpmeToU9y0N1oA==
X-Received: by 10.157.60.206 with SMTP id t14mr1836936otf.37.1478777626615;
 Thu, 10 Nov 2016 03:33:46 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.182.97.41 with HTTP; Thu, 10 Nov 2016 03:33:26 -0800 (PST)
In-Reply-To: <40804db4-242b-8e46-d435-ebae8a55ad7a@kaod.org>
References: <1477465067-19034-1-git-send-email-clg@kaod.org>
 <40804db4-242b-8e46-d435-ebae8a55ad7a@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 10 Nov 2016 22:03:26 +1030
X-Google-Sender-Auth: GYoRawjueP819Yf8Bf2kTBazqkA
Message-ID: <CACPK8Xdzo5ONSrD7BCnjNfdF5+zX2t3=1hR52uF7qO3JC-j7Jg@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.7 0/8] BT driver sync up
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
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
X-List-Received-Date: Thu, 10 Nov 2016 11:33:49 -0000

On Thu, Nov 10, 2016 at 7:43 PM, C=C3=A9dric Le Goater <clg@kaod.org> wrote=
:
> Joel,
>
> On 10/26/2016 08:57 AM, C=C3=A9dric Le Goater wrote:
>> Hello,
>>
>> Here is a serie syncing the OpenBMC kernel with the BT driver merged
>> in mainline linux. This kernel needs an updated version of btbridged :
>>
>>      https://github.com/legoater/btbridge/commits/master
>>
>> The last two patches add a request expiry list and some configuration
>> through sysfs. These are for review only as they need to be sent to
>> mainline first.
>
> So please drop these two patches. This is too early.
>
> I will send later an interesting fix from Corey which handles
> concurrent reads and writes a little better than we do today.
> But after this is all merged.

Okay, thanks for the clarification. I applied these patches to dev-v4.7:

 ARM: dts: aspeed: Enable BT IPMI BMC device
 ARM: aspeed: Add defconfigs for CONFIG_ASPEED_BT_IPMI_BMC
 ipmi: add an Aspeed BT IPMI BMC driver
 ARM: dts: aspeed: remove previous iBT definitions
 ARM: aspeed: remove previous definitions in default config
 Revert "misc: Add Aspeed BT IPMI host driver"

Cheers,

Joel
