Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x241.google.com (mail-yw0-x241.google.com
 [IPv6:2607:f8b0:4002:c05::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3x37W16s22zDr3s
 for <openbmc@lists.ozlabs.org>; Thu,  6 Jul 2017 16:43:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="tob5vW5b"; 
 dkim-atps=neutral
Received: by mail-yw0-x241.google.com with SMTP id z21so601434ywz.2
 for <openbmc@lists.ozlabs.org>; Wed, 05 Jul 2017 23:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=CAxmhww7SbFLhTgWZ8g52uaFbr2TUCLb6qGp3wxl5sM=;
 b=tob5vW5b9RDtc0l0sdEalzsMyW75w0sOEfimC4PEVLN8mYaueRbQlbntVQOrd6wITY
 0IgDZG4i8P7eAnWlhSUuS3YRpgOZDoM4qU7Je67s42kHYNDQrXPM7sdXOZLLP2D7I2hH
 p95khKWgoLeeYc/Id9fwx0QCaqYf+vR3CDeoB7RB4oCvIwSRdjzVlhzMx/pw749BcFGS
 Aso9rtM88Kj+1xjTEWGee2PEJTirPBOyvivHgDWcfQoXh9513zcE18ya5z6M4V9EgQ58
 LplQJLt2R3/N2rs3mUuAOAupAx4MCSAGKeifSRystNGAfNT4GudeeNeDexOgW6uHHkoA
 fQXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=CAxmhww7SbFLhTgWZ8g52uaFbr2TUCLb6qGp3wxl5sM=;
 b=Lu+YIVLkdyPdye5wISAGyJZ76byXimzpe3Y38uMjFgFNDto9JHUrkwq8zmExIFk1Uu
 neP+mFsBwnFqdmoUWo4DaD+RU51nOQRdz3Drm5/xaiX0DMqG28YnXrbhyldc6OTgorhI
 yhIFzDtT889sziCe+jmSbCUmiKpryX+Odtagsxrn7muhDjjW/dBZt3VXxsCuTYF1YltG
 UrM6sH/RZoDbv6VxanrPs7oshvIDR7mEQKnr5E410mt6cNAbNAAlZ9Z82GP3ljim9hzC
 4KIlQx4hL8zdBh0P+CWY2h69bIpxgEzIccotwVPxoOIK+j2mP/js782OIpXZ63ZTN+9C
 GOPQ==
X-Gm-Message-State: AKS2vOzwfCkcDRBEwSbSrmb+RzRkWJ3P3pitUleOPwRmt6bB7gMnjHdX
 ki1/J4m/56Kfy1upM2XRdFSALvHCfA==
X-Received: by 10.13.225.5 with SMTP id k5mr36417476ywe.178.1499323434770;
 Wed, 05 Jul 2017 23:43:54 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.170.239 with HTTP; Wed, 5 Jul 2017 23:43:34 -0700 (PDT)
In-Reply-To: <1f42a4c7-0cac-9651-6d3e-60786bcb07ba@linux.vnet.ibm.com>
References: <1498754556-21020-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1498754556-21020-2-git-send-email-eajames@linux.vnet.ibm.com>
 <CACPK8XfAaTkp-dOf01q+=rW1=5ip-ndmnVSoO2Jh7EiAiQPTcw@mail.gmail.com>
 <1f42a4c7-0cac-9651-6d3e-60786bcb07ba@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 6 Jul 2017 16:13:34 +0930
X-Google-Sender-Auth: idpcOd0lpUJwrKm0E72M6dk5JSg
Message-ID: <CACPK8XehuWnGv-RAwA_EwZymT-w7uEMPd9ZH8z2UOcqvPGWR5A@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10 v2 1/2] arm/dts: Add I2C master and ports
 to FSI cfam
To: Eddie James <eajames@linux.vnet.ibm.com>
Cc: Stewart Smith <stewart@linux.vnet.ibm.com>,
 "Edward A. James" <eajames@us.ibm.com>, 
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
X-List-Received-Date: Thu, 06 Jul 2017 06:44:00 -0000

On Thu, Jul 6, 2017 at 3:40 AM, Eddie James <eajames@linux.vnet.ibm.com> wrote:
>
>
> On 07/03/2017 03:38 AM, Joel Stanley wrote:
>>
>> On Fri, Jun 30, 2017 at 2:12 AM, Eddie James <eajames@linux.vnet.ibm.com>
>> wrote:
>>>
>>> From: "Edward A. James" <eajames@us.ibm.com>
>>>
>>> FSI I2C master algorithm probes port devices based on dts.
>>>
>>> Signed-off-by: Edward A. James <eajames@us.ibm.com>
>>> ---
>>>   arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts     | 120
>>> +++++++++++++++++
>>>   arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 120
>>> +++++++++++++++++
>>>   arch/arm/boot/dts/ibm-power9-cfam.dtsi           | 164
>>> +++++++++++++++++++++++
>>>   3 files changed, 404 insertions(+)
>>>
>>> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
>>> b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
>>> index d53dc59..4a1a390 100644
>>> --- a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
>>> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
>>> @@ -72,6 +72,126 @@
>>>
>>>   #include "ibm-power9-cfam.dtsi"
>>>
>>> +&cfam0_i2c0 {
>>> +       status = "okay";
>>> +};
>>
>> The point of separating out the description and enabling of these i2c
>> nodes was so we could selectively enable the ones that are in use by
>> OpenBMC kernel drivers and userspace applications.
>>
>> With this change we enable 30 i2c character devices, and consume the
>> associated kernel memory.
>>
>> Did you make any progress with discovering the devices that are required?
>>
>> I can see from a bug report that the SBE EEPROM is one use case:
>>
>>   errorMessage  : ServerI2CInstruction::iic_open invalid device open
>> attempt /dev/i2c-100
>>
>> Could we enable just that one on each processor to unblock people
>> using it for this use case while you investigate other uses?
>
>
> I heard back from Cronus team, they said they want all the ports
> (/dev/i2c-100 - 114 and 200 - 214). Manufacturing guys deferred to Cronus
> team, so I think that's the best source for which ports we need for now.

According to the spec, we have the following:

 - 4x i2c seeprom
 - 8x i2c avagos
 - 1x dpss
 - 2x dimms

That accounts for all 15 devices on the CFAM i2cm.

Can you ask the Cronus team which port these devices are on, so we can
annotate the device tree? Put me on cc :)

From there we could look to using the kernel driver for e.g. the seeprom.

Cheers,

Joel


>
> Thanks,
> Eddie
>
>
>>
>> Cheers,
>>
>> Joel
>>>
>>> +
>>> +&cfam0_i2c1 {
>>> +       status = "okay";
>>> +};
>>> +
>>> +&cfam0_i2c2 {
>>> +       status = "okay";
>>> +};
>>> +
>>> +&cfam0_i2c3 {
>>> +       status = "okay";
>>> +};
>>> +
>>> +&cfam0_i2c4 {
>>> +       status = "okay";
>>> +};
>>> +
>>> +&cfam0_i2c5 {
>>> +       status = "okay";
>>> +};
>>> +
>>> +&cfam0_i2c6 {
>>> +       status = "okay";
>>> +};
>>> +
>>> +&cfam0_i2c7 {
>>> +       status = "okay";
>>> +};
>>> +
>>> +&cfam0_i2c8 {
>>> +       status = "okay";
>>> +};
>>> +
>>> +&cfam0_i2c9 {
>>> +       status = "okay";
>>> +};
>>> +
>>> +&cfam0_i2c10 {
>>> +       status = "okay";
>>> +};
>>> +
>>> +&cfam0_i2c11 {
>>> +       status = "okay";
>>> +};
>>> +
>>> +&cfam0_i2c12 {
>>> +       status = "okay";
>>> +};
>>> +
>>> +&cfam0_i2c13 {
>>> +       status = "okay";
>>> +};
>>> +
>>> +&cfam0_i2c14 {
>>> +       status = "okay";
>>> +};
>>> +
>>> +&cfam1_i2c0 {
>>> +       status = "okay";
>>> +};
>>> +
>>> +&cfam1_i2c1 {
>>> +       status = "okay";
>>> +};
>>> +
>>> +&cfam1_i2c2 {
>>> +       status = "okay";
>>> +};
>>> +
>>> +&cfam1_i2c3 {
>>> +       status = "okay";
>>> +};
>>> +
>>> +&cfam1_i2c4 {
>>> +       status = "okay";
>>> +};
>>> +
>>> +&cfam1_i2c5 {
>>> +       status = "okay";
>>> +};
>>> +
>>> +&cfam1_i2c6 {
>>> +       status = "okay";
>>> +};
>>> +
>>> +&cfam1_i2c7 {
>>> +       status = "okay";
>>> +};
>>> +
>>> +&cfam1_i2c8 {
>>> +       status = "okay";
>>> +};
>>> +
>>> +&cfam1_i2c9 {
>>> +       status = "okay";
>>> +};
>>> +
>>> +&cfam1_i2c10 {
>>> +       status = "okay";
>>> +};
>>> +
>>> +&cfam1_i2c11 {
>>> +       status = "okay";
>>> +};
>>> +
>>> +&cfam1_i2c12 {
>>> +       status = "okay";
>>> +};
>>> +
>>> +&cfam1_i2c13 {
>>> +       status = "okay";
>>> +};
>>> +
>>> +&cfam1_i2c14 {
>>> +       status = "okay";
>>> +};
>>> +
>>>   &fmc {
>>>          status = "okay";
>>>          flash@0 {
>>> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
>>> b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
>>> index 31315d0..4cc99e2 100644
>>> --- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
>>> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
>>> @@ -84,6 +84,126 @@
>>>
>>>   #include "ibm-power9-cfam.dtsi"
>>>
>>> +&cfam0_i2c0 {
>>> +       status = "okay";
>>> +};
>>> +
>>> +&cfam0_i2c1 {
>>> +       status = "okay";
>>> +};
>>> +
>>> +&cfam0_i2c2 {
>>> +       status = "okay";
>>> +};
>>> +
>>> +&cfam0_i2c3 {
>>> +       status = "okay";
>>> +};
>>> +
>>> +&cfam0_i2c4 {
>>> +       status = "okay";
>>> +};
>>> +
>>> +&cfam0_i2c5 {
>>> +       status = "okay";
>>> +};
>>> +
>>> +&cfam0_i2c6 {
>>> +       status = "okay";
>>> +};
>>> +
>>> +&cfam0_i2c7 {
>>> +       status = "okay";
>>> +};
>>> +
>>> +&cfam0_i2c8 {
>>> +       status = "okay";
>>> +};
>>> +
>>> +&cfam0_i2c9 {
>>> +       status = "okay";
>>> +};
>>> +
>>> +&cfam0_i2c10 {
>>> +       status = "okay";
>>> +};
>>> +
>>> +&cfam0_i2c11 {
>>> +       status = "okay";
>>> +};
>>> +
>>> +&cfam0_i2c12 {
>>> +       status = "okay";
>>> +};
>>> +
>>> +&cfam0_i2c13 {
>>> +       status = "okay";
>>> +};
>>> +
>>> +&cfam0_i2c14 {
>>> +       status = "okay";
>>> +};
>>> +
>>> +&cfam1_i2c0 {
>>> +       status = "okay";
>>> +};
>>> +
>>> +&cfam1_i2c1 {
>>> +       status = "okay";
>>> +};
>>> +
>>> +&cfam1_i2c2 {
>>> +       status = "okay";
>>> +};
>>> +
>>> +&cfam1_i2c3 {
>>> +       status = "okay";
>>> +};
>>> +
>>> +&cfam1_i2c4 {
>>> +       status = "okay";
>>> +};
>>> +
>>> +&cfam1_i2c5 {
>>> +       status = "okay";
>>> +};
>>> +
>>> +&cfam1_i2c6 {
>>> +       status = "okay";
>>> +};
>>> +
>>> +&cfam1_i2c7 {
>>> +       status = "okay";
>>> +};
>>> +
>>> +&cfam1_i2c8 {
>>> +       status = "okay";
>>> +};
>>> +
>>> +&cfam1_i2c9 {
>>> +       status = "okay";
>>> +};
>>> +
>>> +&cfam1_i2c10 {
>>> +       status = "okay";
>>> +};
>>> +
>>> +&cfam1_i2c11 {
>>> +       status = "okay";
>>> +};
>>> +
>>> +&cfam1_i2c12 {
>>> +       status = "okay";
>>> +};
>>> +
>>> +&cfam1_i2c13 {
>>> +       status = "okay";
>>> +};
>>> +
>>> +&cfam1_i2c14 {
>>> +       status = "okay";
>>> +};
>>> +
>>>   &fmc {
>>>          status = "okay";
>>>          flash@0 {
>>> diff --git a/arch/arm/boot/dts/ibm-power9-cfam.dtsi
>>> b/arch/arm/boot/dts/ibm-power9-cfam.dtsi
>>> index f29c6e3..ede778d 100644
>>> --- a/arch/arm/boot/dts/ibm-power9-cfam.dtsi
>>> +++ b/arch/arm/boot/dts/ibm-power9-cfam.dtsi
>>> @@ -4,6 +4,88 @@
>>>                  #address-cells = <1>;
>>>                  #size-cells = <1>;
>>>
>>> +               i2c@1800 {
>>> +                       compatible = "ibm,fsi-i2c-master";
>>> +                       reg = <0x1800 0x400>;
>>> +                       #address-cells = <1>;
>>> +                       #size-cells = <0>;
>>> +
>>> +                       cfam0_i2c0: i2c-bus@0 {
>>> +                               status = "disabled";
>>> +                               reg = <0>;
>>> +                       };
>>> +
>>> +                       cfam0_i2c1: i2c-bus@1 {
>>> +                               status = "disabled";
>>> +                               reg = <1>;
>>> +                       };
>>> +
>>> +                       cfam0_i2c2: i2c-bus@2 {
>>> +                               status = "disabled";
>>> +                               reg = <2>;
>>> +                       };
>>> +
>>> +                       cfam0_i2c3: i2c-bus@3 {
>>> +                               status = "disabled";
>>> +                               reg = <3>;
>>> +                       };
>>> +
>>> +                       cfam0_i2c4: i2c-bus@4 {
>>> +                               status = "disabled";
>>> +                               reg = <4>;
>>> +                       };
>>> +
>>> +                       cfam0_i2c5: i2c-bus@5 {
>>> +                               status = "disabled";
>>> +                               reg = <5>;
>>> +                       };
>>> +
>>> +                       cfam0_i2c6: i2c-bus@6 {
>>> +                               status = "disabled";
>>> +                               reg = <6>;
>>> +                       };
>>> +
>>> +                       cfam0_i2c7: i2c-bus@7 {
>>> +                               status = "disabled";
>>> +                               reg = <7>;
>>> +                       };
>>> +
>>> +                       cfam0_i2c8: i2c-bus@8 {
>>> +                               status = "disabled";
>>> +                               reg = <8>;
>>> +                       };
>>> +
>>> +                       cfam0_i2c9: i2c-bus@9 {
>>> +                               status = "disabled";
>>> +                               reg = <9>;
>>> +                       };
>>> +
>>> +                       cfam0_i2c10: i2c-bus@10 {
>>> +                               status = "disabled";
>>> +                               reg = <10>;
>>> +                       };
>>> +
>>> +                       cfam0_i2c11: i2c-bus@11 {
>>> +                               status = "disabled";
>>> +                               reg = <11>;
>>> +                       };
>>> +
>>> +                       cfam0_i2c12: i2c-bus@12 {
>>> +                               status = "disabled";
>>> +                               reg = <12>;
>>> +                       };
>>> +
>>> +                       cfam0_i2c13: i2c-bus@13 {
>>> +                               status = "disabled";
>>> +                               reg = <13>;
>>> +                       };
>>> +
>>> +                       cfam0_i2c14: i2c-bus@14 {
>>> +                               status = "disabled";
>>> +                               reg = <14>;
>>> +                       };
>>> +               };
>>> +
>>>                  sbefifo@2400 {
>>>                          compatible = "ibm,p9-sbefifo";
>>>                          reg = <0x2400 0x400>;
>>> @@ -31,6 +113,88 @@
>>>                                  #address-cells = <1>;
>>>                                  #size-cells = <1>;
>>>
>>> +                               i2c@1800 {
>>> +                                       compatible =
>>> "ibm,fsi-i2c-master";
>>> +                                       reg = <0x1800 0x400>;
>>> +                                       #address-cells = <1>;
>>> +                                       #size-cells = <0>;
>>> +
>>> +                                       cfam1_i2c0: i2c-bus@0 {
>>> +                                               status = "disabled";
>>> +                                               reg = <0>;
>>> +                                       };
>>> +
>>> +                                       cfam1_i2c1: i2c-bus@1 {
>>> +                                               status = "disabled";
>>> +                                               reg = <1>;
>>> +                                       };
>>> +
>>> +                                       cfam1_i2c2: i2c-bus@2 {
>>> +                                               status = "disabled";
>>> +                                               reg = <2>;
>>> +                                       };
>>> +
>>> +                                       cfam1_i2c3: i2c-bus@3 {
>>> +                                               status = "disabled";
>>> +                                               reg = <3>;
>>> +                                       };
>>> +
>>> +                                       cfam1_i2c4: i2c-bus@4 {
>>> +                                               status = "disabled";
>>> +                                               reg = <4>;
>>> +                                       };
>>> +
>>> +                                       cfam1_i2c5: i2c-bus@5 {
>>> +                                               status = "disabled";
>>> +                                               reg = <5>;
>>> +                                       };
>>> +
>>> +                                       cfam1_i2c6: i2c-bus@6 {
>>> +                                               status = "disabled";
>>> +                                               reg = <6>;
>>> +                                       };
>>> +
>>> +                                       cfam1_i2c7: i2c-bus@7 {
>>> +                                               status = "disabled";
>>> +                                               reg = <7>;
>>> +                                       };
>>> +
>>> +                                       cfam1_i2c8: i2c-bus@8 {
>>> +                                               status = "disabled";
>>> +                                               reg = <8>;
>>> +                                       };
>>> +
>>> +                                       cfam1_i2c9: i2c-bus@9 {
>>> +                                               status = "disabled";
>>> +                                               reg = <9>;
>>> +                                       };
>>> +
>>> +                                       cfam1_i2c10: i2c-bus@10 {
>>> +                                               status = "disabled";
>>> +                                               reg = <10>;
>>> +                                       };
>>> +
>>> +                                       cfam1_i2c11: i2c-bus@11 {
>>> +                                               status = "disabled";
>>> +                                               reg = <11>;
>>> +                                       };
>>> +
>>> +                                       cfam1_i2c12: i2c-bus@12 {
>>> +                                               status = "disabled";
>>> +                                               reg = <12>;
>>> +                                       };
>>> +
>>> +                                       cfam1_i2c13: i2c-bus@13 {
>>> +                                               status = "disabled";
>>> +                                               reg = <13>;
>>> +                                       };
>>> +
>>> +                                       cfam1_i2c14: i2c-bus@14 {
>>> +                                               status = "disabled";
>>> +                                               reg = <14>;
>>> +                                       };
>>> +                               };
>>> +
>>>                                  sbefifo@2400 {
>>>                                          compatible = "ibm,p9-sbefifo";
>>>                                          reg = <0x2400 0x400>;
>>> --
>>> 1.8.3.1
>>>
>
