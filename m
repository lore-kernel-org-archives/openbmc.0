Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x241.google.com (mail-yw0-x241.google.com
 [IPv6:2607:f8b0:4002:c05::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vM88K65k8zDqBW
 for <openbmc@lists.ozlabs.org>; Mon, 13 Feb 2017 13:07:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="VkuwHXQx"; 
 dkim-atps=neutral
Received: by mail-yw0-x241.google.com with SMTP id q71so6282024ywg.3
 for <openbmc@lists.ozlabs.org>; Sun, 12 Feb 2017 18:07:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=MzvHJ4LjibD7B98VSbEpJaYuoiWHRYwguAf2BTP9ARg=;
 b=VkuwHXQxiHa6oFRVaiLXSZLTVrQxhWchMiB4Za51ylyC91gs39VoYN+fDF4O03rYdB
 8uBKO1SeXcKgfgcXNlw9NeED5UNj6LpSr4gC9GRmF1b7DtOmcqa9tJ3MCiSNCVB9f9XC
 KCPStS1zWHho/yNzaMXeWZja5X9415TiXyx7LVk4Rv1nuiX/tNYVfihIqH9pFCGLujbE
 ACk3zR0fFSIF3lVgWxkJTf2v4ZeMyzVNKNjDuzLvI1eM+f0S81O6JQLcAgTuFQRXcfCd
 3v/4F9+TBoMc5Beu0ej2dbeK4MggU+Py/CTiAHKiigYoPd1BbbbFXagtTCzmL82gLH1r
 hEyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=MzvHJ4LjibD7B98VSbEpJaYuoiWHRYwguAf2BTP9ARg=;
 b=AOW9PHxC6y3Iauvh8/X1Z6CPRli2r08bJTMGRpsRzDWEZslm/dKcRUUHVXFe8N2KNc
 sSbkBNdOMRxvFmFgLXA3szMxZRJN+LaAtP6CBg26UqS6mbxRilbLsuZsWnzQfcgsw0WA
 NNW9jdCHJjZ6C8fP3EOuhFOVHEjuFSCJjxr9mETf1esuPsL5xfQGQwItGmGiok8FxBse
 piwIhRnFNCcA+sgiOAKUaQJGKW3iRfFPY8GKxJTypue17oKlTnNhOsAkWyst/Ximk2H1
 T9d99fi4bqBwcqFP/MgpGD7QW4RX7VBrTnMgbWgjbPh/45rOWJIxz1PkTyTAS7a+b2IY
 yurw==
X-Gm-Message-State: AMke39mTeo6oOVatxTv7dvBZ6Z/czkCxA5PZY3jxmImUcQzaJP4B2Hm6rG8gRvhMX9Xftnhrj9yJYVzKjumfAQ==
X-Received: by 10.129.73.65 with SMTP id w62mr14573307ywa.288.1486951663515;
 Sun, 12 Feb 2017 18:07:43 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.170.41 with HTTP; Sun, 12 Feb 2017 18:07:23 -0800 (PST)
In-Reply-To: <CAPH-5w45qp_r6nDHPOQXURpUuP2dwDKhTT=wrb6t0uPgyq2Dnw@mail.gmail.com>
References: <20170207023737.26936-1-joel@jms.id.au>
 <CAPH-5w6ckMjyxn=J2deBycOexc9cCdsMXxLYq44GPQM-xG9S7g@mail.gmail.com>
 <CACPK8Xd_G-a5ih+WU16pqOM+_gX-ik-eaUsOu_qdMETzqwk+uQ@mail.gmail.com>
 <CAPH-5w45qp_r6nDHPOQXURpUuP2dwDKhTT=wrb6t0uPgyq2Dnw@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 13 Feb 2017 12:37:23 +1030
X-Google-Sender-Auth: AM_YRgP0TfEswh9R7hwHVS97-ls
Message-ID: <CACPK8XdquAeGD+k_wBQYS9Vafoc3f3xs22N8UVBVzP3MhyOupw@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: aspeed: Add FSI pins to Zaius device tree
To: Xo Wang <xow@google.com>
Cc: Rick Altherr <raltherr@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Mon, 13 Feb 2017 02:07:46 -0000

On Fri, Feb 10, 2017 at 6:12 AM, Xo Wang <xow@google.com> wrote:
> On Wed, Feb 8, 2017 at 6:18 PM, Joel Stanley <joel@jms.id.au> wrote:
>> On Wed, Feb 8, 2017 at 6:29 AM, Xo Wang <xow@google.com> wrote:
>>> Hi Joel,
>>>
>>> Thanks for keeping us up to date.
>>>
>>> On Mon, Feb 6, 2017 at 6:37 PM, Joel Stanley <joel@jms.id.au> wrote:
>>>> Pin assignments for the EVT-2 board as described in pdbg. The status is disabled
>>>> so this does not enable the in-kernel FSI driver yet.
>>>>
>>>> Signed-off-by: Joel Stanley <joel@jms.id.au>
>>>> ---
>>>>
>>>> Tested on zaius5 with the driver enabled and it worked.
>>>>
>>>>  arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts | 12 ++++++++++++
>>>>  1 file changed, 12 insertions(+)
>>>>
>>>> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
>>>> index e2195a641414..e1c9b3f4fe44 100644
>>>> --- a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
>>>> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
>>>> @@ -74,6 +74,18 @@
>>>>                         gpios = <&gpio ASPEED_GPIO(AA, 2) GPIO_ACTIVE_LOW>;
>>>>                 };
>>>>         };
>>>> +
>>>> +       fsi-master {
>>>> +               compatible = "ibm,fsi-master", "ibm,fsi-master-gpio";
>>>
>>> Andrew's comment for Witherspoon applies here as well
>>> ("ibm,fsi-master-gpio" makes sense as the "definitive" name).
>>
>> I agree. I had an offline chat with Andrew about it, suggesting that
>> he review the bindings that Chris Bostic has sent upstream. There's
>> already a few issues identified with them that we will have to clean
>> up.
>>
>> I suggest leave this matching the other systems for now, and when we
>> settle on the new binding I will migrated all machines to use that.
>>
>
> Reviewed-by: Xo Wang <xow@google.com>

Applied to dev-4.7.

>>>
>>> FYI, we'll return to the Norm-recommended assignments for these at the
>>> next board spin to keep FSI pins on their own GPIO port. Not sure how
>>> helpful that is in the context of the FSI kernel driver since it's not
>>> poking the registers directly.
>>
>> I assume there are electrical reasons for doing that.
>>
>
> Not that I know of. Somebody was thinking that moving all the FSI pins
> to their own GPIO port(s) would allow a single byte or word write to
> the output data register to set pin states without read-modify-write.
>
> I don't think that's an optimization we can apply through gpiolib for
> the kernel FSI driver. Hence my skepticism about helpfulness.

Doing that in the kernel would be quite tricky.

>> How do you suggest we handle the old and new device tree?
>>
>> We could detect the board revision and then fix up the device tree in u-boot.
>>
>
> Yeah, sounds good. Having board revision detection and device tree
> fixups in U-boot seems useful in general.

Great. It would be good to move some of the rev-specific code you have
in arch/arm/mach-aspeed/aspeed.c into the kernel. We are inching
closer to being able to boot a host without any of those workarounds.

Cheers,

Joel
