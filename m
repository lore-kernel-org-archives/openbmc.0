Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x243.google.com (mail-yw0-x243.google.com
 [IPv6:2607:f8b0:4002:c05::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vMgtP6PZkzDq8t
 for <openbmc@lists.ozlabs.org>; Tue, 14 Feb 2017 09:57:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="rowROGOV"; 
 dkim-atps=neutral
Received: by mail-yw0-x243.google.com with SMTP id l16so8413869ywb.2
 for <openbmc@lists.ozlabs.org>; Mon, 13 Feb 2017 14:57:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=cAsQlD/OqDf/Sakvv+hmTywBj8KM5FsHiKUXaFdQ7as=;
 b=rowROGOVndVW82ouk4nA9sTA39xPfqJtJcCjkRXWLTCbMAsDcbzLWAa/sxFUIaB0AB
 pCM0iQ7ZCt1BKh6aNBUK/9WtSBgPR5xhPwjahWYJL195KUTaJIuA4foMPbK4UBYHsTIL
 x0EHStaI+ci6mEZq3vqwIHUxZVyqq1tIL7Nd0duCkeIBi8GRDmDGjJllSHym41bG+INk
 0T1jDo3I/jwzoudLj5IGswP1MmXPT8sxCSNxvrF1R3ZTEeQtEvkkICC6DPOINraEjalP
 H5gCPn4YV79+7+of5fmG2m77eeEc2sEPvgtRb3ESS9RqoqEfHR8J+ZQB9AZ+BT/qOpM/
 R0nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=cAsQlD/OqDf/Sakvv+hmTywBj8KM5FsHiKUXaFdQ7as=;
 b=jJqReeQ1y/loyIEsr9QuzR6CSB0hAuWgNrhvO8bUpfU8RANfd8TdMRdPXA5l1VycEN
 CeEhxl8L6rHOrtfIVM+/H4yCGFVoy8e+ToDNLTN4HMa9hJTDoK5pkq14RmRs1OhXNOcI
 yb1ZhtZeBpWfF4Dtc1cmLMjDk4f9fI7JvpwJctlyaYvpc0KCSaXcw3vS6NBG5QUpS2eu
 llq2Hs3Rd3M3XrlVDEUSS5hSJ6ktb8rmSTK26MyLU0nv4s+W06WLcoAhpJMdTGFrgjAn
 vBCMwVSmoTeeglxoU6XfVLrsgJWugOgn4Xr4N4F7V9pcA9qFGYYPOhvddoFEe7QoJ+80
 miFA==
X-Gm-Message-State: AMke39lsUqj8ikmSubKJahf7PTB2HQBisI8ukblJtdSVdPWyhqLpnX62PtVw8TxbVmxknhdL/eDUUhL039CYXQ==
X-Received: by 10.129.91.194 with SMTP id p185mr18309063ywb.50.1487026651388; 
 Mon, 13 Feb 2017 14:57:31 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.170.41 with HTTP; Mon, 13 Feb 2017 14:57:10 -0800 (PST)
In-Reply-To: <20170213172440.lrqaf5v7jk66denq@asimov>
References: <20170213025851.6051-1-andrew@aj.id.au>
 <20170213025851.6051-2-andrew@aj.id.au>
 <20170213172440.lrqaf5v7jk66denq@asimov>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 14 Feb 2017 09:27:10 +1030
X-Google-Sender-Auth: 5WY3eweQG6ocPlF5a6cbt4wC1u0
Message-ID: <CACPK8XetG6q3OLLMVOAhJVyL5jrm0JnOO1d8JwFAtJg+MicKxA@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.7 1/3] ARM: dts: aspeed-g5: Add SoC Display
 Controller node
To: Patrick Williams <patrick@stwcx.xyz>
Cc: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Xo Wang <xow@google.com>
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
X-List-Received-Date: Mon, 13 Feb 2017 22:57:34 -0000

On Tue, Feb 14, 2017 at 3:54 AM, Patrick Williams <patrick@stwcx.xyz> wrote:
> On Mon, Feb 13, 2017 at 01:28:49PM +1030, Andrew Jeffery wrote:
>> diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
>> index e1994c9e38c3..5ce0a7a65e77 100644
>> --- a/arch/arm/boot/dts/aspeed-g5.dtsi
>> +++ b/arch/arm/boot/dts/aspeed-g5.dtsi
>> @@ -1005,6 +1005,12 @@
>>                               reg = <0x1e6e202c 0x4>;
>>                       };
>>
>> +                     gfx: display@1e6e6000 {
>> +                             compatible = "aspeed,ast2500-gfx", "syscon";
>> +                             reg = <0x1e6e6000 0x1000>;
>> +                             reg-io-width = <4>;
>> +                     };
>> +
>
> Is this valid to add on all G5 chips?  I believe Zaius is using a
> variant of the 2500 that does not have the graphics engine.

Andrew, do we need to fix this now? If so, can you please re-spin with
this set to disabled, and enabling it in the .dts?

How does this affect your pinmux driver? Can we still mux all of the
pins on the 2510?

Cheers,

Joel
