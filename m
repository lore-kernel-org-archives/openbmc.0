Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c09::243; helo=mail-qk0-x243.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="cp7YeBgx"; 
 dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="bVG+yhBY"; 
 dkim-atps=neutral
Received: from mail-qk0-x243.google.com (mail-qk0-x243.google.com
 [IPv6:2607:f8b0:400d:c09::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zwz2X1PmNzF1Zk
 for <openbmc@lists.ozlabs.org>; Wed,  7 Mar 2018 14:02:10 +1100 (AEDT)
Received: by mail-qk0-x243.google.com with SMTP id v124so963246qkh.11
 for <openbmc@lists.ozlabs.org>; Tue, 06 Mar 2018 19:02:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=YLwuip6VQvrh/4E1ZUGYb3Z2/w4butMgZjxMxDPg92A=;
 b=cp7YeBgxCoQt9xXXkHW2P7qDKs4rYBxfzR4m8WNnqHBI+KKsHdSek4QjRJrnAlu6wg
 GJZA9o0Pfon92dgrN4TXA8IpR6H1mn+S8NciDl9YMGQVh8yWm+Cy4sOTYkiBHMeUCFZY
 ICZ94aJhyvBjN4IBBwnLuk18dqlzKi3I4uakUTklVPeAinrjITaU8Cg6h5im+gAHs8fB
 1AMgmGLneZtcbScZF9AVtlBSCTeYF37L35hKK9TXihqymwCI9xRDawCtOipHIsmEw+Aw
 M3ClCBpFG4C7GsrkqyzQ51J0FQAYGEwGy9C+pWBOBdjHnOTcdsE2WSw8QcOk1Htwr7fD
 dbGA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=YLwuip6VQvrh/4E1ZUGYb3Z2/w4butMgZjxMxDPg92A=;
 b=bVG+yhBY1KH1hgghkHR6cGSg12VlGLBuGnRqnFWmw3tFJr42n+2k72SOpjRmNgpkEz
 chd3LTAAELoeEUiQBlQVK4OfSo2RS0kvyjcX1DOpSekdjdB8A+PJGmVsEr/6B7BWbMyW
 Mhr0WZB3Wjt/GKq4ugpEXmWZC1j9vbxfNBuLA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=YLwuip6VQvrh/4E1ZUGYb3Z2/w4butMgZjxMxDPg92A=;
 b=hf0DBZMYzeqrjzhK6HskeVNr4Qz+PH8PdUrFxwxP/er/ktMV1nT+inIydc2qJOaW6K
 8Et5tLmVbEnZh4RocYVz0fpy5klZ0gPIqibLBzR1ZLOAS790TCINE+nyyeVsZ6LknP11
 HEB8VqS6mvYdplmlhxl9sCf5TClcYNEeKR116S7t+uS0WKcdRoWnQnK4SjAGEzNFqdns
 pl9rX3cEV5+5e2R0A0wEzki/3eSg8gZk9eCPOC2sB0p4LCLvJhr3QeNaCDpDDV/oJbKs
 MRHgkNM5fRGhn/Y8F0ogO7FL02V6aAWrcBEMU3db0BkDr7VqVHUj63LJl5tACJ1CRwpx
 +F2Q==
X-Gm-Message-State: AElRT7Hlk6F0bJq1wp1/kfr8PwufywGdp/KcJ+3LSeWfzPVKKpse6KaR
 G7W4U9pMApwmkh9Y+gQ8XF6ixWCDriJ1SNfevpI=
X-Google-Smtp-Source: AG47ELsHij7XopcGiX1i8iVpmaqjoQWj/ROJL2Zm9YA3akpY9o9VLvxmPDPtzHlWfkjlVEAOtKtaofdzmioM6BQMPE0=
X-Received: by 10.55.21.139 with SMTP id 11mr22169444qkv.127.1520391728243;
 Tue, 06 Mar 2018 19:02:08 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.200.50.69 with HTTP; Tue, 6 Mar 2018 19:01:47 -0800 (PST)
In-Reply-To: <CAARXrt=MV0eA0xb76Q+oDHPh2TkZjsFwd=wh-DtZC_FHJFFtpA@mail.gmail.com>
References: <1520367872-32101-1-git-send-email-eajames@linux.vnet.ibm.com>
 <CAARXrt=MV0eA0xb76Q+oDHPh2TkZjsFwd=wh-DtZC_FHJFFtpA@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 7 Mar 2018 13:31:47 +1030
X-Google-Sender-Auth: y9XYE34NmfSvvy2NeJyPND7cywM
Message-ID: <CACPK8Xcreuf977EWk6HiVgKkBoCSJdQebHY9=KOjNWQ6nufOpQ@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.13] clk: aspeed: Prevent reset and enable if
 clock is already enabled
To: Lei YU <mine260309@gmail.com>
Cc: Eddie James <eajames@linux.vnet.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 07 Mar 2018 03:02:13 -0000

Hi Eddie,

On Wed, Mar 7, 2018 at 1:03 PM, Lei YU <mine260309@gmail.com> wrote:
> With the patch, the hang issue in ISTEPS (openbmc/openbmc#2948) is gone, in both
> cold and warm boot.
>
> Tested-by: Lei YU <mine260309@gmail.com>

Please send this upstream after addressing Lei's concerns. Can you
also add a Fixes tag?

Cheers,

Joel
>
> On Wed, Mar 7, 2018 at 4:24 AM, Eddie James <eajames@linux.vnet.ibm.com> wrote:
>> Systems are seeing some issues where the LPC clock gets into a bad state
>> when the ASPEED clock driver resets and enables the clock during
>> startup. The LPC clock (according to AST2500 spec) is enabled by default,
>> so resetting and re-enabling is not desired. Add a simple check before the
>> enable procedure to see if the clock is already enabled.
>>
>> Signed-off-by: Eddie James <eajames@linux.vnet.ibm.com>
>> ---
>>  drivers/clk/clk-aspeed.c | 42 ++++++++++++++++++++++++------------------
>>  1 file changed, 24 insertions(+), 18 deletions(-)
>>
>> diff --git a/drivers/clk/clk-aspeed.c b/drivers/clk/clk-aspeed.c
>> index b67ba14..3d12f7a 100644
>> --- a/drivers/clk/clk-aspeed.c
>> +++ b/drivers/clk/clk-aspeed.c
>> @@ -221,27 +221,33 @@ static int aspeed_clk_enable(struct clk_hw *hw)
>>         u32 clk = BIT(gate->clock_idx);
>>         u32 rst = BIT(gate->reset_idx);
>>         u32 enval;
>> +       u32 reg;
>>
>
> I would prefer to call aspeed_clk_is_enabled() to check if it's
> enabled and return
> before spin_lock_irqsave().
>
>>         spin_lock_irqsave(gate->lock, flags);
>>
>> -       if (gate->reset_idx >= 0) {
>> -               /* Put IP in reset */
>> -               regmap_update_bits(gate->map, ASPEED_RESET_CTRL, rst, rst);
>> -
>> -               /* Delay 100us */
>> -               udelay(100);
>> -       }
>> -
>> -       /* Enable clock */
>> -       enval = (gate->flags & CLK_GATE_SET_TO_DISABLE) ? 0 : clk;
>> -       regmap_update_bits(gate->map, ASPEED_CLK_STOP_CTRL, clk, enval);
>> -
>> -       if (gate->reset_idx >= 0) {
>> -               /* A delay of 10ms is specified by the ASPEED docs */
>> -               mdelay(10);
>> -
>> -               /* Take IP out of reset */
>> -               regmap_update_bits(gate->map, ASPEED_RESET_CTRL, rst, 0);
>> +       /* Only reset/enable/unreset if clock isn't already enabled */
>> +       regmap_read(gate->map, ASPEED_CLK_STOP_CTRL, &reg);
>> +       if (reg & clk) {
>> +               if (gate->reset_idx >= 0) {
>> +                       /* Put IP in reset */
>> +                       regmap_update_bits(gate->map, ASPEED_RESET_CTRL, rst,
>> +                                          rst);
>> +
>> +                       /* Delay 100us */
>> +                       udelay(100);
>> +               }
>> +
>> +               /* Enable clock */
>> +               enval = (gate->flags & CLK_GATE_SET_TO_DISABLE) ? 0 : clk;
>> +               regmap_update_bits(gate->map, ASPEED_CLK_STOP_CTRL, clk, enval);
>> +
>> +               if (gate->reset_idx >= 0) {
>> +                       /* A delay of 10ms is specified by the ASPEED docs */
>> +                       mdelay(10);
>> +
>> +                       /* Take IP out of reset */
>> +                       regmap_update_bits(gate->map, ASPEED_RESET_CTRL, rst,                                              0);
>
> Remove the extra blanks or put it in next line.
>
>> +               }
>>         }
>>
>>         spin_unlock_irqrestore(gate->lock, flags);
>> --
>> 1.8.3.1
>>
