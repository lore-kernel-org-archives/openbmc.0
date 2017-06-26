Return-Path: <bjwyman@gmail.com>
Received: from mail-qt0-x243.google.com (mail-qt0-x243.google.com
 [IPv6:2607:f8b0:400d:c0d::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wxFXx1h14zDr26
 for <openbmc@lists.ozlabs.org>; Tue, 27 Jun 2017 02:55:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="rMuXjQGt"; 
 dkim-atps=neutral
Received: by mail-qt0-x243.google.com with SMTP id w12so873379qta.2
 for <openbmc@lists.ozlabs.org>; Mon, 26 Jun 2017 09:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=wNeK5FSYNjlQ2prxg6tGwa7h7ejdooa1AUsRbS07sig=;
 b=rMuXjQGttOHY/hb8Jkpz3CDLR8uakZWK6GSMy+XAVuWK1ypMxx8TI48SWyk/4GJwcJ
 xtJkzYNAOeYoOEVxB5ceb3CEGauHaiFKdzPkDKNnqZ9+PRGVTDnUmJVm2aOT7dspKu1O
 yl/NTP1Qib1C3AEskD3OyxfGG4ypFP/VIGv2u/pDrU7Uq7Axz7LxjkVtPT1gO1tLOzGe
 dxmcl0pxl8fVbtEWPIQ8ZljrPKzoQZPyuDHVXRGF1UkxGy/NS8YkJpfiYL8twFiIw071
 RiWS7lO5Letcn2qX2RgD1R2ZFFu7uTkanRSvbVqyMfXUVacvHa/t6QfYhdvZydX/uKMw
 mjtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=wNeK5FSYNjlQ2prxg6tGwa7h7ejdooa1AUsRbS07sig=;
 b=C+7SgCA9HIB3Ia6LwOg37Ti+FknBY2buGsfQ9ryq55yHdq4ifvreQWr8cqFhLtJaM+
 fJdPMqo0+IzenoxkNANi0d2fN/7eW30kyKOLqtTIlmIGWsKmxVAmahkyA94Nq1lzwMkz
 9ojnX7cqej+UVboVD7L3/CPX3ltHJFCJT6axB3YCBpSqoVmb0oqq5iB3fQjm67sl1t3p
 ZZzxi7qFhOhDHuTo5/Pt4vEwA99JFBFacQX/5bPYlFQx6O7unrsvQFxEAi/NCcRg4f8z
 cQmqWbcO0HNy3ejui2JJ5QGSsKR02t7nV35LsIxAYPgeWcZrRfc9wUzt8LD2E5Guk1aa
 NOfw==
X-Gm-Message-State: AKS2vOwCJ8CZaEAMczHHgic97g/mOVbFuGpxM7Aqzyjq/XzSTR8OC5cz
 DXY+Fw0PHQNbhdEKAWMf35lOR2ufnlr0
X-Received: by 10.200.62.17 with SMTP id z17mr1591989qtf.162.1498496110745;
 Mon, 26 Jun 2017 09:55:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.97.4 with HTTP; Mon, 26 Jun 2017 09:55:10 -0700 (PDT)
In-Reply-To: <abbf4242-d44d-246c-c7b9-b1497fd4b160@linux.vnet.ibm.com>
References: <1498262178-27820-1-git-send-email-bjwyman@gmail.com>
 <abbf4242-d44d-246c-c7b9-b1497fd4b160@linux.vnet.ibm.com>
From: Brandon Wyman <bjwyman@gmail.com>
Date: Mon, 26 Jun 2017 11:55:10 -0500
Message-ID: <CAK_vbW2Bp1k_pEFNR8rQSC1nE41gouaYW8tAcscrZOjv-a=W_Q@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10] Add fan card PCA9552 to Witherspoon
 devicetree
To: Matt Spinler <mspinler@linux.vnet.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Mon, 26 Jun 2017 16:55:13 -0000

On Mon, Jun 26, 2017 at 9:15 AM, Matt Spinler
<mspinler@linux.vnet.ibm.com> wrote:
> A few comments on naming below.  The names here have to match up with the
> MRW XML so code can find them, and we already took a shot at naming them in
> the XML.
>
> On 6/23/2017 6:56 PM, Brandon Wyman wrote:
>>
>> The Witherspoon OpenBMC system has a PCA9552 chip on the fan card that
>> is used for fan fault and identify LED control. Adding this chip and the
>> LED lines to the device tree.
>>
>> Signed-off-by: Brandon Wyman <bjwyman@gmail.com>
>> ---
>>   arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 47
>> ++++++++++++++++++++++++
>>   1 file changed, 47 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
>> b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
>> index 31315d0..e5e3b37 100644
>> --- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
>> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
>> @@ -203,6 +203,53 @@
>>                 compatible = "infineon,dps310";
>>                 reg = <0x76>;
>>         };
>> +
>> +       pca0: pca9552@60 {
>> +               compatible = "nxp,pca9552";
>> +               reg = <0x60>;
>> +               fan0: led@0 {
>> +                       label = "fan0:yellow";
>
> These are all fan fault LEDs.  The MRW just calls them fan0, fan1, etc.  I
> suppose fan0-fault would be OK here too and we could update the MRW.
Okay. So the alias and the label should be fan0-fault, fan1-fault, etc.?
>>
>> +                       default-state = "keep";
>> +                       reg = <0>;
>> +                       type = <PCA955X_TYPE_LED>;
>> +               };
>> +               fan1: led@1 {
>> +                       label = "fan1:yellow";
>> +                       default-state = "keep";
>> +                       reg = <1>;
>> +                       type = <PCA955X_TYPE_LED>;
>> +               };
>> +               fan2: led@2 {
>> +                       label = "fan2:yellow";
>> +                       default-state = "keep";
>> +                       reg = <2>;
>> +                       type = <PCA955X_TYPE_LED>;
>> +               };
>> +               fan3: led@3 {
>> +                       label = "fan3:yellow";
>> +                       default-state = "keep";
>> +                       reg = <3>;
>> +                       type = <PCA955X_TYPE_LED>;
>> +               };
>> +               led@13 {
>> +                       label = "yellow";
>
> The fault LED in the back of the system is already called rear-fault, so
> this should probably be front-fault.
Alias and label front-fault?
>>
>> +                       default-state = "keep";
>> +                       reg = <13>;
>> +                       type = <PCA955X_TYPE_LED>;
>> +               };
>> +               led@14 {
>> +                       label = "green";
>
> front-power
Okay.
>>
>> +                       default-state = "keep";
>> +                       reg = <14>;
>> +                       type = <PCA955X_TYPE_LED>;
>> +               };
>> +               led@15 {
>> +                       label = "blue";
>
> front-id
Okay, that makes more sense than "blue".
>
>> +                       default-state = "keep";
>> +                       reg = <15>;
>> +                       type = <PCA955X_TYPE_LED>;
>> +               };
>> +       };
>>   };
>>
>>   &i2c4 {
>
>
