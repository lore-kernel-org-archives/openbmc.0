Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x244.google.com (mail-yw0-x244.google.com
 [IPv6:2607:f8b0:4002:c05::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vrtNK56bfzDq7N
 for <openbmc@lists.ozlabs.org>; Mon, 27 Mar 2017 10:17:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="oRvN053R"; 
 dkim-atps=neutral
Received: by mail-yw0-x244.google.com with SMTP id i203so4313526ywc.3
 for <openbmc@lists.ozlabs.org>; Sun, 26 Mar 2017 16:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=ac5SjqwTP9R7UkpT2K6coR3hbkm3hltynwcXXJX7aFs=;
 b=oRvN053RUzhFvkDwYiI6O97oBYw7Mp12dKDdzygPvFkP6icwPXROU8phTkYr4aFic3
 QsvY0e6zu9vnRm2sfwhB14FxPlZdxd1NytsdtURJfSGfoL09aAKLh4gZnFaNk7B7gx+b
 A7lJAy0VYYYTGHI3RqworPp457m0ConXvbqvAh/A9e1JpDEIzQbgNYFKPnlnvwdVerhn
 ZNYAu1FzGZqh1EZQxpNHELlL5xd3+EU+Rer+7sExE1ZDP7ZoN10T1KEwcWBsPOdEwBZX
 +st+z6H0EUv+qmrCbNJh/Sn+LVwJv6c0uLO+elqiGn68cZ4IWbzpaJJXqoG29OSHXar3
 C2LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=ac5SjqwTP9R7UkpT2K6coR3hbkm3hltynwcXXJX7aFs=;
 b=T17omB2+L6WaQRmeHpjPoqFnSiVmD/aeLgzyU57GEVmMAWeI9TNOSCWAaV3jvNUXmU
 iJUuaGwqy7f0+CQDvROrMIGOXVQYgQ51NtLTvtXmg5tTgfvV4nMWez+QLvOpkG/P1aZO
 3ciZ3W57X7t8ZVaqHGm2CAk6dsjYus9lbuXyKvRBaLeB1GMI/2es8RdgAsfuw1/+c0gK
 X3SZ5hBHNr0muhaN2hnOLf7xRjdpgImnMuMnlDEFMOEHW3/HGpjVtnpOMVRdtlwMPMfi
 elX5YzjzNB2VRlZa08fC+g3UaeZvFXVaBMfBhuSsCdud7W1A662jcuOXYFOgw/xIF25u
 3TOQ==
X-Gm-Message-State: AFeK/H1KWE2DO0OfRCwKs+O2s+QsIsYoUpKYOIocIzm2m7Ikt0xqkcLI0l3Njtflo8sHglmekc8VKDpSeQ/YTw==
X-Received: by 10.37.2.4 with SMTP id 4mr7246437ybc.167.1490570239259; Sun, 26
 Mar 2017 16:17:19 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.59.17 with HTTP; Sun, 26 Mar 2017 16:16:58 -0700 (PDT)
In-Reply-To: <1c07a4ca-a135-862e-fdde-98f72f93e4d6@kaod.org>
References: <1490357844-30007-1-git-send-email-clg@kaod.org>
 <1c07a4ca-a135-862e-fdde-98f72f93e4d6@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 27 Mar 2017 09:46:58 +1030
X-Google-Sender-Auth: T8GncIup7nKrmUYmfzLIgA48ZOY
Message-ID: <CACPK8Xe+cGxdZ-kwJqSbZUGLMZMZC_Ez-t8Jyi-Fu1z90Tg9+w@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10] clk: aspeed: fix APB and AHB clock rates
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
X-List-Received-Date: Sun, 26 Mar 2017 23:17:22 -0000

On Fri, Mar 24, 2017 at 11:26 PM, C=C3=A9dric Le Goater <clg@kaod.org> wrot=
e:
> I forgot to add a subject prefix : that is for 'linux dev-4.10'
>
> Thanks,
>
> C.
>
> for On 03/24/2017 01:17 PM, C=C3=A9dric Le Goater wrote:
>> The masking is one bit too generous which generates really low clock
>> rates.

Thanks. I've gotten this wrong about four times now. I tried to make
it clearer with the GENMASK macro, but grabbed too many bits.

Applied to dev-4.10.

Cheers,

Joel

>>
>> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
>> ---
>>  drivers/clk/aspeed/clk-g4.c | 2 +-
>>  drivers/clk/aspeed/clk-g5.c | 4 ++--
>>  2 files changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/clk/aspeed/clk-g4.c b/drivers/clk/aspeed/clk-g4.c
>> index bf61919ead52..50117ec16909 100644
>> --- a/drivers/clk/aspeed/clk-g4.c
>> +++ b/drivers/clk/aspeed/clk-g4.c
>> @@ -94,7 +94,7 @@ static unsigned long aspeed_clk_apb_recalc_rate(struct=
 clk_hw *hw,
>>               return ret;
>>       }
>>
>> -     reg =3D (reg >> 23) & GENMASK(2, 0);
>> +     reg =3D (reg >> 23) & 0x3;
>>
>>       return hpll_rate / (2 + 2 * reg);
>>  }
>> diff --git a/drivers/clk/aspeed/clk-g5.c b/drivers/clk/aspeed/clk-g5.c
>> index 6eb0004f894d..8f8f7f796cee 100644
>> --- a/drivers/clk/aspeed/clk-g5.c
>> +++ b/drivers/clk/aspeed/clk-g5.c
>> @@ -84,7 +84,7 @@ static unsigned long aspeed_clk_ahb_recalc_rate(struct=
 clk_hw *hw,
>>       }
>>
>>       /* Bits 11:9 define the AXI/AHB clock frequency ratio */
>> -     reg =3D (reg >> 9) & GENMASK(3, 0);
>> +     reg =3D (reg >> 9) & 0x7;
>>
>>       /* A value of zero is undefined */
>>       WARN_ON(reg =3D=3D 0);
>> @@ -108,7 +108,7 @@ static unsigned long aspeed_clk_apb_recalc_rate(stru=
ct clk_hw *hw,
>>               return ret;
>>       }
>>
>> -     reg =3D (reg >> 23) & GENMASK(3, 0);
>> +     reg =3D (reg >> 23) & 0x7;
>>
>>       rate =3D hpll_rate / (4 * (reg + 1));
>>
>>
>
