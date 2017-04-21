Return-Path: <joel.stan@gmail.com>
Received: from mail-yb0-x244.google.com (mail-yb0-x244.google.com
 [IPv6:2607:f8b0:4002:c09::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3w8M8l51BHzDqL2
 for <openbmc@lists.ozlabs.org>; Fri, 21 Apr 2017 13:45:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="AlA21Ana"; 
 dkim-atps=neutral
Received: by mail-yb0-x244.google.com with SMTP id b2so5258374yba.3
 for <openbmc@lists.ozlabs.org>; Thu, 20 Apr 2017 20:45:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=oM+h6S5HWi6JA1veD/FhV7zvB8jzq5YS1si8GOt63ns=;
 b=AlA21AnajAR8gYuWZHaGQHWvHBja4S19UntgwoHQrcbi4r1mKBqO7hrG33sspvStfg
 71g2Mm4Sb/rczLvJkqL0PzNzbyC5My3pPTI1JVH4hTryX5sjeiCcgiBpM7RpAOxZmFZQ
 2VgxR+x2VHAOhWULQk1mNRN3UBPW6dOy17suUw06PFQNuraYOR9tJL/wSgCpOR5bzGbD
 74sKw0c75LqNOO3hdQNI/AAotmFwFVtd4+9y+J1cV0d3VL0Jv9WhVIRa5GmxoLpwpTfS
 2rQ0YIbFy5SiI7Jr00WM1ROLYPJJou/B9uh8I5/8OKaBBfzpF1HbizMZ35YovGeo7bkK
 w01A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=oM+h6S5HWi6JA1veD/FhV7zvB8jzq5YS1si8GOt63ns=;
 b=ak713Ganza3PQdu+A9Tw4bNxoBgsD0ZyEjCoFt2GyXCgfIj6r6Kas8P8FmuKMQ/+Tz
 4Kz1qoOcc71S5o3X6yila4FVl+pn2b6M+FgI1S1/tiyw/cg2Uz9yQFyyzcJiYfPA1KQ4
 mbhPVC+IR3o7luZZwk8+9ExOCLrEMtfS2SjnBjzqpdTppsxustyre8SS0VJwPvnwSO6k
 +2AxsXv5D5m+jcVX9h4G2uW/w4FeJhxQqAkWFIc0FPD/5oMCffk7qSr2WjvOOI8jEqtj
 nmqbH2lf140s+KVrrY/sF+2raYuB6zpKLAC+rSWn1bQb1VKS5eOuu9XInB78aUTmxk9+
 m3JQ==
X-Gm-Message-State: AN3rC/41bJvV7hwFCH+3JAArGJR6w3v+LFjoYhJ1tvn8d3QuPiiEPGX+
 C0SYTxXK9NDaHGXqcDmhFo968FXmOQ==
X-Received: by 10.37.8.195 with SMTP id 186mr6967994ybi.17.1492746357242; Thu,
 20 Apr 2017 20:45:57 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.8.202 with HTTP; Thu, 20 Apr 2017 20:45:36 -0700 (PDT)
In-Reply-To: <1492746038.4069.1.camel@aj.id.au>
References: <1492744763-29872-1-git-send-email-bradleyb@fuzziesquirrel.com>
 <1492744763-29872-2-git-send-email-bradleyb@fuzziesquirrel.com>
 <1492746038.4069.1.camel@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 21 Apr 2017 13:15:36 +0930
X-Google-Sender-Auth: rRh17tfrcDyvnBKtIKGKyB6rfvs
Message-ID: <CACPK8Xc6FXft7FREFC=GPA31KGhAZ+f1sC7Ja+i0nep_3DZyQA@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.7 v5 1/2] ARM: configs: aspeed: Enable
 keyboard-gpio
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>, 
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
X-List-Received-Date: Fri, 21 Apr 2017 03:46:00 -0000

On Fri, Apr 21, 2017 at 1:10 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
> On Thu, 2017-04-20 at 23:19 -0400, Brad Bishop wrote:
>> Some OpenBMC systems will be using keyboard-gpio so enable it
>> in our configs.
>>
>> Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
>
> Acked-by: Andrew Jeffery <andrew@aj.id.au>

Merged to dev-4.7.

Cheers,

Joel

>
> In the future please add the tags given for previous patch revisions if
> there hasn't been significant change :)
>
>> ---
>>  arch/arm/configs/aspeed_g4_defconfig | 8 +++++++-
>>  arch/arm/configs/aspeed_g5_defconfig | 8 +++++++-
>>  2 files changed, 14 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm/configs/aspeed_g4_defconfig b/arch/arm/configs/aspeed_g4_defconfig
>> index 552297b..4350f67 100644
>> --- a/arch/arm/configs/aspeed_g4_defconfig
>> +++ b/arch/arm/configs/aspeed_g4_defconfig
>> @@ -103,7 +103,12 @@ CONFIG_FTGMAC100=y
>>  CONFIG_BROADCOM_PHY=y
>>  CONFIG_REALTEK_PHY=y
>>  # CONFIG_WLAN is not set
>> -# CONFIG_INPUT is not set
>> +# CONFIG_INPUT_LEDS is not set
>> +# CONFIG_INPUT_MOUSEDEV is not set
>> +CONFIG_INPUT_EVDEV=y
>> +# CONFIG_KEYBOARD_ATKBD is not set
>> +CONFIG_KEYBOARD_GPIO=y
>> +# CONFIG_INPUT_MOUSE is not set
>>  # CONFIG_SERIO is not set
>>  # CONFIG_VT is not set
>>  # CONFIG_LEGACY_PTYS is not set
>> @@ -138,6 +143,7 @@ CONFIG_SENSORS_ADM1275=y
>>  CONFIG_SENSORS_LM25066=y
>>  CONFIG_SENSORS_UCD9000=y
>>  CONFIG_SENSORS_TMP421=y
>> +# CONFIG_HID is not set
>>  # CONFIG_USB_SUPPORT is not set
>>  CONFIG_NEW_LEDS=y
>>  CONFIG_LEDS_CLASS=y
>> diff --git a/arch/arm/configs/aspeed_g5_defconfig b/arch/arm/configs/aspeed_g5_defconfig
>> index c5e7295..b6b3ca0 100644
>> --- a/arch/arm/configs/aspeed_g5_defconfig
>> +++ b/arch/arm/configs/aspeed_g5_defconfig
>> @@ -102,7 +102,12 @@ CONFIG_FTGMAC100=y
>>  CONFIG_BROADCOM_PHY=y
>>  CONFIG_REALTEK_PHY=y
>>  # CONFIG_WLAN is not set
>> -# CONFIG_INPUT is not set
>> +# CONFIG_INPUT_LEDS is not set
>> +# CONFIG_INPUT_MOUSEDEV is not set
>> +CONFIG_INPUT_EVDEV=y
>> +# CONFIG_KEYBOARD_ATKBD is not set
>> +CONFIG_KEYBOARD_GPIO=y
>> +# CONFIG_INPUT_MOUSE is not set
>>  # CONFIG_SERIO is not set
>>  # CONFIG_VT is not set
>>  # CONFIG_LEGACY_PTYS is not set
>> @@ -135,6 +140,7 @@ CONFIG_PMBUS=y
>>  CONFIG_SENSORS_LM25066=y
>>  CONFIG_SENSORS_UCD9000=y
>>  CONFIG_SENSORS_TMP421=y
>> +# CONFIG_HID is not set
>>  # CONFIG_USB_SUPPORT is not set
>>  CONFIG_NEW_LEDS=y
>>  CONFIG_LEDS_CLASS=y
