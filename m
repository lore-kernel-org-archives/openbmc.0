Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x242.google.com (mail-yw0-x242.google.com
 [IPv6:2607:f8b0:4002:c05::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wsBKG05GwzDq5W
 for <openbmc@lists.ozlabs.org>; Tue, 20 Jun 2017 12:16:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="u1Pf5P3X"; 
 dkim-atps=neutral
Received: by mail-yw0-x242.google.com with SMTP id w143so7468843yww.1
 for <openbmc@lists.ozlabs.org>; Mon, 19 Jun 2017 19:16:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=4JymlQoKZ+hWAGTALjEpre3Xsh2RIMjfH1idZT48DOU=;
 b=u1Pf5P3XR5OLw84yYzEaN/DwkSn+0ILFqIxRa8r13DSdGGZRtKzf+EK+TAWBhz2pMf
 dGz0iAwSG0inZYmidfo39RS8GSPjax1sSXMqYOPtPBWYJY7gQq+nnAn2VwukrTJezLRl
 rzw+18utd/kdL1/A8I7W3tLZI0WVBhu8vDidTZl8d5swXbYGbFBCo+xQwMYXVN7GmLBq
 1F/5ACE8+EsTufvic5y4npvDev9nxCFM/RsvVZJfHoyqEDi6XQD4dYIsAn5HchEapdIF
 n+qIs2dhmzfrE7VniQgxFu1y6oFy9sBdOgTfDDn7Q6pXxvgr6x5KHvdTAZVMFF8k/hQ5
 0xag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=4JymlQoKZ+hWAGTALjEpre3Xsh2RIMjfH1idZT48DOU=;
 b=Otzjo5RpLR8mvwCNYRpcGRFT/JrIv2YdsGwJQM9r5nifWr/Gn72sQM/LQ7V15O45h1
 P0JMMHsLltNoWYHgHLXQ3yQAGKI1L5aUSAx0lTVe7GsPJgoYwxS6XMxiKfFR+X7Gircf
 JKqEO1YOjlcob2w6Q03V1Pb6tOwXBl0bTzNpqUvhRUpaJjKSfZG0jxsNOaVDI018dm0f
 ufvqZWyRNgquNx6mqu2xSnUqeieY79Fy9/ZlsG9r9FRnLnZtDgp7fx5aXRuLJJJSEpxB
 F+xe2kEYuxV8h5lq9ZjcG8XUU/ahiwTJHchRvh9jE/udnDZEk3QZjoIv0wOiUWRi6NQV
 z3Vg==
X-Gm-Message-State: AKS2vOwERH5U7bgacz/idFLw+6wasgHIbD5P7pK+renOz38gC0aLyCcj
 JPGXZQrWik/mh+EVQeP3beUjefCYaA==
X-Received: by 10.13.208.67 with SMTP id s64mr21837436ywd.43.1497924959606;
 Mon, 19 Jun 2017 19:15:59 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.174.2 with HTTP; Mon, 19 Jun 2017 19:15:39 -0700 (PDT)
In-Reply-To: <CAO=notxv7eoNBv8=rdCYA+EoxJheKDFbWzycDSuh+f1KkXVgCg@mail.gmail.com>
References: <20170613221019.100175-1-venture@google.com>
 <CACPK8Xe_MT6Ssq3XPF1EO-pzS89Ja-_PHPOtne7vttn7TVzaHg@mail.gmail.com>
 <CAO=notxv7eoNBv8=rdCYA+EoxJheKDFbWzycDSuh+f1KkXVgCg@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 20 Jun 2017 11:45:39 +0930
X-Google-Sender-Auth: K1f0qnFhLN0KJHa9VzXHXJVUWXk
Message-ID: <CACPK8Xfv7r6FCADf+M1H+yNcGGkTLPQfS3ZPKa=wvU5DsxJ1EQ@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10 v2 4/4] ARM: dts: aspeed: quanta-q71l: PDB
 FRU and mux on the PDB in front of the PSUs.
To: Patrick Venture <venture@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Rick Altherr <raltherr@google.com>
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
X-List-Received-Date: Tue, 20 Jun 2017 02:16:02 -0000

On Sat, Jun 17, 2017 at 12:17 AM, Patrick Venture <venture@google.com> wrote:
> Joel;
>
> Thanks!  This was my first patch email series, so I appreciate your
> help.

No worries. You're doing a great job; keep the patches flowing.

> So I ran into something last night while reviewing something
> that jumped out at me.  I'll need to send a new patch for the quanta
> dts momentarily to address this.  In linux-4.7 the i2c-mux driver
> pca9546 had a different compatibility string from 4.10.  Since we
> don't own those devices on our BMC image in testing (we're mastering
> them from the host via i2c over IPMI),  So, let me submit a patch to
> fix that.

Cool. How are you going with the move to 4.10? Do you have a list of
drivers and tweaks that you need to get ticked off before you update?

One of my goals to help everyone stay on the latest kernel. Having
your changes in the tree sooner means the move to the next kernel tree
(probably 4.12?) will be easier.

Cheers,

Joel

>
> Patrick
>
> On Thu, Jun 15, 2017 at 9:51 PM, Joel Stanley <joel@jms.id.au> wrote:
>> Hi Patrick,
>>
>> On Wed, Jun 14, 2017 at 7:40 AM, Patrick Venture <venture@google.com> wrote:
>>> Signed-off-by: Patrick Venture <venture@google.com>
>>> ---
>>>  arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts | 20 +++++++++++++++++++-
>>
>> I had some issues with conflicts between the 4 patch series and the
>> two patches you'd sent before then. So merged all of your device tree
>> changes for the Q71L as one patch.
>>
>> Next time you're sending changes that may conflict, put them all in
>> the same series. It's okay to send a v2 of the series with additional
>> patches added.
>>
>> Also, in the case of your patch #4 where you needed to make a fix,
>> it's convention to re-send the entire series. No worries this time
>> though, I got it sorted in the end.
>>
>> I noticed we did not have the dts added to the Makefile, so it was not
>> building. I fixed that too. Please take a look a the tree and make
>> sure all of the device tree nodes are in there as you expect them to
>> be.
>>
>> Cheers,
>>
>> Joel
>>
>>>  1 file changed, 19 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts b/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
>>> index 4b5047b5d592..2b01c5bcc88b 100644
>>> --- a/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
>>> +++ b/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
>>> @@ -145,7 +145,7 @@
>>>          *    SSD 1,
>>>          *    SSD 2
>>>          */
>>> -       i2cswitch@77 {
>>> +       i2c-switch@77 {
>>>                 compatible = "pca9548";
>>>                 #address-cells = <1>;
>>>                 #size-cells = <0>;
>>> @@ -177,6 +177,24 @@
>>>
>>>  &i2c7 {
>>>         status = "okay";
>>> +
>>> +       /* 0: PSU4
>>> +        *    PSU1
>>> +        *    PSU3
>>> +        *    PSU2
>>> +        */
>>> +       i2c-switch@70 {
>>> +               compatible = "pca9546";
>>> +               reg = <0x70>;
>>> +               #address-cells = <1>;
>>> +               #size-cells = <0>;
>>> +       };
>>> +
>>> +       /* PDB FRU */
>>> +       eeprom@52 {
>>> +               compatible = "atmel,24c64";
>>> +               reg = <0x52>;
>>> +       };
>>>  };
>>>
>>>  &i2c8 {
>>> --
>>> 2.13.1.518.g3df882009-goog
>>>
