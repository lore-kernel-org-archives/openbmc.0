Return-Path: <mine260309@gmail.com>
Received: from mail-it0-x243.google.com (mail-it0-x243.google.com
 [IPv6:2607:f8b0:4001:c0b::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wLm18493FzDqCL
 for <openbmc@lists.ozlabs.org>; Mon,  8 May 2017 12:00:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="oKuWYAor"; 
 dkim-atps=neutral
Received: by mail-it0-x243.google.com with SMTP id v135so6083134itv.0
 for <openbmc@lists.ozlabs.org>; Sun, 07 May 2017 19:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=i9HrSJg0Sae8Z+jD0RYSU3U9+I2K/94ihBKbuAXWDWs=;
 b=oKuWYAorJincjKIssx7R3c6erWH30CUZI5NwI2NcGWiVFhR037ck1o+CsFxDMgbwl/
 qKA4Am2zCMWx3TmKA51+QNDIEWgQj79hAtStRlc/IeXHH/jexMyXExQVAI8yyPKMVbbE
 X0chz1+VPWna+0A+duaGk3mAQf9EO8ViWs9ZDJql4QHAYHHU2ewTStQRr1dyok76PvBn
 Y1amDVdiKfpnrGF+euISvduFAJtencrr4ZSqDmBvRMoehx0r7O+t5U1nXfqWvrhRqpus
 udyUOlbrig6xq2Z+AvGI68EHAxPRtoFkYiXclD18Ng06YTq3ApLo0Mtj44ALqSOJQE1j
 1z+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=i9HrSJg0Sae8Z+jD0RYSU3U9+I2K/94ihBKbuAXWDWs=;
 b=YmQySZmcQ6X0ZS6ihEdC8ytjfPnUmSWlNIBizBjxtiSxcq4X/kY3g77oGvZdo5+Eqf
 N75b5eJ/DQ9rvrSUz7MXvQQu1y5JPePgIXoANXbVrPGKhYkY01Zn6nVvmFjP8ojP0ci2
 ynVUsfssLwxq5umedIi/qXcPWo5vIezVtZSqI5+dHu/mjDU9a3JXgYeh+oEDNeNMSHG2
 BUw0ivufYrgxKAboOvlpHYLsNdR24lmizGWEj2tb9FxiN59RqasCnORetsAf1/zl8T4o
 n4jCGOpli6BgW+PvhIrJ9HR2WJtH9TCTJEq+L1HBDH96tvqbZVFnqqhpsrKCdtiAXIWG
 iSnQ==
X-Gm-Message-State: AN3rC/4DNlaL0Xv8DQ9aa7+WKB9JDxsnu7mfPVy9vbzruLwpWngoYBNE
 EprsAlr555ajkp9RWqV0WosayDzfxILA
X-Received: by 10.36.83.144 with SMTP id n138mr17630969itb.71.1494208825870;
 Sun, 07 May 2017 19:00:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.79.150.10 with HTTP; Sun, 7 May 2017 19:00:25 -0700 (PDT)
In-Reply-To: <20170505163509.GC25937@heinlein.lan>
References: <1493800430-5662-1-git-send-email-mine260309@gmail.com>
 <20170505163509.GC25937@heinlein.lan>
From: Lei YU <mine260309@gmail.com>
Date: Mon, 8 May 2017 10:00:25 +0800
Message-ID: <CAARXrtnBhc93=aNKZPwvFiLFpHHTg119g5enN5D3dyujg7d3Gw@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.7] arm: dts: aspeed: garrison: Enable wdt2
To: Patrick Williams <patrick@stwcx.xyz>
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
X-List-Received-Date: Mon, 08 May 2017 02:00:29 -0000

Patrick,

Yup, I already talked about this with Joel, this patch will wait for 4.10

--
BRs,
Lei YU

On Sat, May 6, 2017 at 12:35 AM, Patrick Williams <patrick@stwcx.xyz> wrote:
> Lei,
>
> Please make sure these patches are sent for 4.10 as well.  I don't see a
> pressing need to pick this up for 4.7, so we will just wait for the move
> to 4.10 to get this fix.
>
> On Wed, May 03, 2017 at 04:33:50PM +0800, Lei YU wrote:
>> Garrison enabled WDT2 by pulling up GPIOAA7.
>> Enable wdt2 in dts, otherwise it hangs after WDT2 times out.
>>
>> Signed-off-by: Lei YU <mine260309@gmail.com>
>> ---
>>  arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts b/arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts
>> index 3921bb3..b24d1d1 100644
>> --- a/arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts
>> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts
>> @@ -116,3 +116,7 @@
>>  &vuart {
>>       status = "okay";
>>  };
>> +
>> +&wdt2 {
>> +     status = "okay";
>> +};
>> --
>> 1.9.1
>>
>
> --
> Patrick Williams
