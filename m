Return-Path: <joel.stan@gmail.com>
Received: from mail-vk0-x244.google.com (mail-vk0-x244.google.com
 [IPv6:2607:f8b0:400c:c05::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ssrT03X2KzDrL1
 for <openbmc@lists.ozlabs.org>; Mon, 10 Oct 2016 17:54:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=veyw/sal; 
 dkim-atps=neutral
Received: by mail-vk0-x244.google.com with SMTP id b186so3748209vkb.3
 for <openbmc@lists.ozlabs.org>; Sun, 09 Oct 2016 23:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=/YAT+aU75ZDhjpUYrTqTrvufrOH7RNiN8D3fIyCQ/Wk=;
 b=veyw/salrqOeLGUpNOiYnAPBu8+fyOkLrrZJfYjVgL07BbI94/10N+O0t5PKv5oNUm
 tAOKjpugudeudujN/M0wCcqjXN1qardJMWVDGeEJqdbSFUJXRTHkJ8Yvl/MfF9yQmFDS
 7tlpxYTD/+IudWIKqPiiRZE4wRsOhDFmQ6VPbJiYtrbGMnfEf04686zaKxofPQxkhf+h
 0GlCELvqB5hDjBlk5HYTfwzrBOLKgl/BGMBoxW6mO9K8Gp/yEr5qbYM8n7RkAGfYoOqP
 UXslHXVpV+6QoF9+bKDpxBnlcuxN4tvEmNnOVegmoIqERWy4wApUeqPZpmDeiCUXItnJ
 279g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=/YAT+aU75ZDhjpUYrTqTrvufrOH7RNiN8D3fIyCQ/Wk=;
 b=jqZvBj8hs2tLGDBkgIt8Q5J+XWaHXN7/Tq/mHe2hxvsOLWGi0Xni/spd6W/6tVBfyr
 l/xrUS2r8EERtVs9da4TtR5bsE9TnCQsamIhytXD5CpDFQZp3IogQ7VO8OH9PI92lJd9
 SSiQTJw/2LYHyf2J/4tcr+YBwYW7D5KdFrcBaeYsvREXLFdSOyaMHj32B3iPlxgyW9SI
 LDkGL2j5ll+FTkjB3F7UMCULH5OpnhVXzZPoWaWSDmnkJpjWNiFo/X1JBhzw6U1LOR4e
 sN0jMH4c+ppy5P6+e6N/dSNIFMVV+bful5M1/IcqNW/6pla8Q1CMmFYTvkGa+G+16umO
 CwvA==
X-Gm-Message-State: AA6/9Rm5pJFkFL8sujippE2x5ZW12b1EA6Iy3CYipr3d12oP1vYM5sX3oGr5avWGe7XtenZaOC4TqX7zIo8Fgg==
X-Received: by 10.31.115.8 with SMTP id o8mr6928997vkc.2.1476082449863; Sun,
 09 Oct 2016 23:54:09 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.176.7.8 with HTTP; Sun, 9 Oct 2016 23:53:49 -0700 (PDT)
In-Reply-To: <1474246806.13249.48.camel@aj.id.au>
References: <1474058133-27363-1-git-send-email-tpearson@raptorengineering.com>
 <1474058133-27363-15-git-send-email-tpearson@raptorengineering.com>
 <1474246806.13249.48.camel@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 10 Oct 2016 17:53:49 +1100
X-Google-Sender-Auth: ajpFAQtbbpsYu9qlyROD13bbLz4
Message-ID: <CACPK8Xe_RuQLxnyEPiGN0_mHqr+HKWsDtg101jFv0CjVX0jBgg@mail.gmail.com>
Subject: Re: [PATCH 14/17] Enable RGMII pin functions in Firestone DT
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Timothy Pearson <tpearson@raptorengineering.com>, 
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
X-List-Received-Date: Mon, 10 Oct 2016 06:54:13 -0000

On Mon, Sep 19, 2016 at 11:00 AM, Andrew Jeffery <andrew@aj.id.au> wrote:
> On Fri, 2016-09-16 at 15:35 -0500, Timothy Pearson wrote:
>> This is required for BMC networking to function.
>>
>> Signed-off-by: Timothy Pearson <tpearson@raptorengineering.com>
>
> Acked-by: Andrew Jeffery <andrew@aj.id.au>

This is now applied to the dev-4.7 tree.

Cheers,

Joel

>
>> ---
>>  arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts |    3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts b/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
>> index 053fafe..36c95a0 100644
>> --- a/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
>> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
>> @@ -72,6 +72,9 @@
>>  &mac0 {
>>       status = "okay";
>>
>> +     pinctrl-names = "default";
>> +     pinctrl-0 = <&pinctrl_rgmii1_default &pinctrl_mdio1_default>;
>> +
>>       no-hw-checksum;
>>  };
>>
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
>
