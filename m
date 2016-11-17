Return-Path: <xow@google.com>
Received: from mail-qk0-x236.google.com (mail-qk0-x236.google.com
 [IPv6:2607:f8b0:400d:c09::236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tKZdG0q6tzDvvY
 for <openbmc@lists.ozlabs.org>; Fri, 18 Nov 2016 08:53:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="C2WXtJB/"; 
 dkim-atps=neutral
Received: by mail-qk0-x236.google.com with SMTP id n204so240498116qke.2
 for <openbmc@lists.ozlabs.org>; Thu, 17 Nov 2016 13:53:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=jOm5Pm5DF373wSi8IDgCfC4gnWX9t4if9BJLzDTvtEo=;
 b=C2WXtJB/s2T80kR9Uq3of24cXUZ5w/A9P51sO37tL4+kF0BlR0zzRnOMKriX+IxjOv
 67XKy4FCHRUNqQPB0pHZZto0fu1pUWMzosncLhSgW0JR6ttc0j04SLwePQtTKjkV2Cxo
 R2PFHmqsx2QSnFdZjIhwdvDVAoL0oyJL3nmMOM6v765v6vuRQILhgdyk7ZjzQSriktd3
 /JyxX4/e/disTH5tyeDyS48C/4YOb1o1uwizPZnba1INAXSbt2erhNn2PomAI4BWSHnd
 /hiq6RP0SnfUTR3nR5+f5pwwUarnTI2Y9qNljmivjXOWihTAEAIXwo+PdWbwaxQW5IPQ
 Ad+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=jOm5Pm5DF373wSi8IDgCfC4gnWX9t4if9BJLzDTvtEo=;
 b=csjW1l8Wlc6EMvoK/rlXZBeV9zSafzfw1j7XbdLJvOjnUle2UT9z16i/fBzYbdZ5K1
 D+6VoeeVbcSet2AMqzkmxyEOXu1QhUNGfOm6K6K8CM48AaA1e3TbKJIXF55JqdPeEuLV
 7wsc7ZTu3T8tXaPKUKg28sR2eZe4DVtMSVBvpUbPfFYcdNfIbTxxQz6ZkSR7whovn5Nt
 SxmgVr8WL7UpNWy8VQgWfci5n0A+D/ZTR4aZbPqNWJOafaCG10i1WcGtwPZBulbEJFym
 0RoF3e1AewB49omFTO0nU7bk8kraerK4PGLVY3sG+7BTBltLTAjOIWQqHF3nTkqWGKoc
 0skA==
X-Gm-Message-State: AKaTC01ZqezF09+m/gmMO544hol50JKfVE5KlR1cnQ7tsfRS3I9oUkXesUdpNzjES1NOsSDYzhbxDmUrLOvlvQyq
X-Received: by 10.55.190.66 with SMTP id o63mr6280814qkf.254.1479419615036;
 Thu, 17 Nov 2016 13:53:35 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.36.228 with HTTP; Thu, 17 Nov 2016 13:53:34 -0800 (PST)
In-Reply-To: <CACPK8XeWnmGJBYSMrmoE5E0oFJqE9ivp-GG2iCcf7ZDw+qp_ZA@mail.gmail.com>
References: <1479338955-5248-1-git-send-email-xow@google.com>
 <1479338955-5248-2-git-send-email-xow@google.com>
 <CACPK8XeWnmGJBYSMrmoE5E0oFJqE9ivp-GG2iCcf7ZDw+qp_ZA@mail.gmail.com>
From: Xo Wang <xow@google.com>
Date: Thu, 17 Nov 2016 13:53:34 -0800
Message-ID: <CAPH-5w4+20PFy5F2uMbJHoDoZEZP4ykGdfkkb4iBmPkdP9Oa8Q@mail.gmail.com>
Subject: Re: [PATCH linux 2/2] ARM: dts: aspeed: zaius: Add I2C master
 selector and hotswap controller
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
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
X-List-Received-Date: Thu, 17 Nov 2016 21:53:38 -0000

Hi Joel,

On Wed, Nov 16, 2016 at 8:59 PM, Joel Stanley <joel@jms.id.au> wrote:
> Hi Xo,
>
> On Thu, Nov 17, 2016 at 9:59 AM, Xo Wang <xow@google.com> wrote:
>> Add device-tree bindings to instantiate the PCA9541A I2C master
>> selector. This driver allows mastering downstream devices after sending
>> an arbitration request to the PCA9541A. Downstream devices go into the
>> 'i2c-arb' child node.
>
> I took a look at the bindings document for i2c-mux[1] and it suggests
> something different.
>
> Is there a reason why you didn't follow what it says?
>
> [1] https://www.kernel.org/doc/Documentation/devicetree/bindings/i2c/i2c-mux.txt
>

I was following the I2C arbitration bus doc, which has its i2c slave
device nodes in an "i2c-arb" child node. I'm not sure why it was
written differently from "i2c-mux" bindings.

To be clear, I haven't 100% tested the LM5066I instantiation since the
motherboard I have actually has an ADI ADM1272 at address 0x10
downstream of the NXP PCA9541A.

https://www.kernel.org/doc/Documentation/devicetree/bindings/i2c/i2c-arb.txt

cheers
xo

> Cheers,
>
> Joel
>
>
>>
>> Instantiate the HWMON client driver for the TI LM5066I hotswap
>> controller present on Zaius EVT2 downstream of the master selector.
>>
>> Signed-off-by: Xo Wang <xow@google.com>
>> ---
>>  arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts | 19 +++++++++++++++++--
>>  1 file changed, 17 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
>> index 3d997d9..136eb1d 100644
>> --- a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
>> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
>> @@ -210,8 +210,23 @@
>>  &i2c7 {
>>         status = "okay";
>>
>> -       /* MUX PCA9541A (other master: CPU0 PCIe 1)
>> -        *   ADM1272 PMBUS @10h
>> +       pca9541a@70 {
>> +               compatible = "nxp,pca9541";
>> +               reg = <0x70>;
>> +
>> +               i2c-arb {
>> +                       #address-cells = <1>;
>> +                       #size-cells = <0>;
>> +
>> +                       hotswap@10 {
>> +                               compatible = "ti,lm5066";
>> +                               reg = <0x10>;
>> +                       };
>> +               };
>> +       };
>> +
>> +       /* Master selector PCA9541A @70h (other master: CPU0)
>> +        *   LM5066I PMBUS @10h
>>          */
>>         /* 12V SMPS Q54SH12050NNDH @61h */
>>         /* CPU0 VR ISL68137 0.7V, 0.96V PMBUS @64h */
>> --
>> 2.8.0.rc3.226.g39d4020
>>
>> _______________________________________________
>> openbmc mailing list
>> openbmc@lists.ozlabs.org
>> https://lists.ozlabs.org/listinfo/openbmc
