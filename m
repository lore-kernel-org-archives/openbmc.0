Return-Path: <joel.stan@gmail.com>
Received: from mail-yb0-x241.google.com (mail-yb0-x241.google.com
 [IPv6:2607:f8b0:4002:c09::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wd9Jm5SPRzDq5j
 for <openbmc@lists.ozlabs.org>; Wed, 31 May 2017 22:48:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="mV3fyMP2"; 
 dkim-atps=neutral
Received: by mail-yb0-x241.google.com with SMTP id r66so434601yba.3
 for <openbmc@lists.ozlabs.org>; Wed, 31 May 2017 05:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=Zt/qq6/IZmY/Au0CJ0ACAYazN95YPIXiUbseKyCKRgU=;
 b=mV3fyMP28SnKdLVZnt3363Ttk+Y+JlafWaqVT8fk281C1r5GwaiEuJvb/z1EFsMRqR
 hZp1zLsTP8unGqX5gUH2EJjFw20+pNs7OM0eQhuJwTv7tFTfh/9hSOTCCGZV5pw2qkS0
 RPAs2SRww6T6FgxvPsxie0XrMTytosOmoFD3Gmkn5jdP26LSDGRtCuweEDvSFoFtzKBF
 d6VzwZ4wM8SEPRSR6R4ja3teMVg/q58XcjCevA12wrP610dLzCLzZOGa14t0DMta/jv4
 f4pMwMl2W4o7V7hFeqQttvavycwa1ntVivymsJFlfKx4qn+JFQ2J67ORNAV6l+NwukSS
 csAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=Zt/qq6/IZmY/Au0CJ0ACAYazN95YPIXiUbseKyCKRgU=;
 b=FDKI1LevWMIknSnNs1ms315QlxsAYxP5Uz73DsqAkOn7bWftBMC6Re9LZMvY6a/Kp+
 6jwhQahJB7iyoer3sW7V07X4Q2kB07ePn5oveSHA2g/i+qW2RbGqJeabPxZjFcSyI49S
 5mNWDodGyW7sAO2uGH5vcqnXYVLGa6wml7XpBAR1ZBEj9Ea6m43G62EFuqlvuGUg/gkQ
 PXFHzrvZcwuzgZJsXxx+8TCNMNYumQxd8DMcqhVJbdK1aMm9MBwtvSSM2kPdYARnT4mB
 u08UCALoPQvKsPjDWzSsIPgAEQ9V/JexjGw7q5PUjmT1gVQbb42Urer0UpdLgKPQZgk2
 otCQ==
X-Gm-Message-State: AODbwcAy0wStRDhZ0z9O0Su3RIUCVHBu3P/ymS6l+cEMCjIMe0iLr+vw
 fsM4ab7M4lvmEISiiff5AJ6bE5nIUA==
X-Received: by 10.37.58.131 with SMTP id h125mr55032707yba.152.1496234934185; 
 Wed, 31 May 2017 05:48:54 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.183.7 with HTTP; Wed, 31 May 2017 05:48:33 -0700 (PDT)
In-Reply-To: <14524f62-a369-b8bb-e71c-5c495772afb5@linux.vnet.ibm.com>
References: <1495815002-1808-1-git-send-email-eajames@linux.vnet.ibm.com>
 <6f8cb5f9-1b95-4caf-8257-163a36208045@kaod.org>
 <14524f62-a369-b8bb-e71c-5c495772afb5@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 31 May 2017 22:18:33 +0930
X-Google-Sender-Auth: HHFlDPsF8Cb8Ct_oy42wWb-4ppY
Message-ID: <CACPK8XcnK8CG_=Mr6x4YXz9MUZxz38veY3t48y5Fn8iVtYyY6g@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10 v4] arm: dts: aspeed: Add missing clock
 sources for barreleye
To: Eddie James <eajames@linux.vnet.ibm.com>
Cc: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 "Edward A. James" <eajames@us.ibm.com>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Wed, 31 May 2017 12:48:57 -0000

On Tue, May 30, 2017 at 11:05 PM, Eddie James
<eajames@linux.vnet.ibm.com> wrote:
>
> On 05/29/2017 05:56 AM, C=C3=A9dric Le Goater wrote:
>>
>> Hello Edward,
>>
>> On 05/26/2017 06:10 PM, Eddie James wrote:
>>>
>>> From: "Edward A. James" <eajames@us.ibm.com>
>>>
>>> Reorganize flash controllers into the ast2400 config and edit all the
>>> ast2400 machine configs.  Barreleye wasn't booting with the new
>>> aspeed-smc driver.
>>
>> There are a couple of "m25p,fast-read" properties missing below.
>> Is that on purpose ?
>
>
> Yes, I copied the properties (or lack thereof) exactly from the existing
> flash entries for each individual system. I'm not sure if it was the
> original intention to not have those properties...

Can you please re-spin with the properties added so Cedric can give it
one last check over before I merge it?

Cheers,

Joel
