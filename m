Return-Path: <joel.stan@gmail.com>
Received: from mail-yb0-x242.google.com (mail-yb0-x242.google.com
 [IPv6:2607:f8b0:4002:c09::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wdfcy0WdPzDqBQ
 for <openbmc@lists.ozlabs.org>; Thu,  1 Jun 2017 17:49:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Oe2KlHkC"; 
 dkim-atps=neutral
Received: by mail-yb0-x242.google.com with SMTP id r66so1212987yba.3
 for <openbmc@lists.ozlabs.org>; Thu, 01 Jun 2017 00:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=9wpH+QD+M2P94jydTW13H/F0YiPP2UOQt3EoDJIlLrM=;
 b=Oe2KlHkCjn8awcqqS0pj4i0QP8malEwf/UuIDnbCmDnYII+YWyTY0uqrDFWC4+ZcaX
 hWqZPOekwXYfJzM+JCwQ4Sug4ZYo1kSBIOMU4sUuc4mwZIkx6YcQtifJYagCq4YVyLOi
 ZTNZ/1oiELEHVAN0LvlTL62yF1ZKS2BiSSHyS27IEzYUD/MiO/y2doJO58cJwFmdhvwq
 rQDq+RCC0hEQ5r2ypkJLkpGrnDKZ3oqPKiIiCat7pgLJZZ4OR6MPNEv5xonOBYwNYeXE
 22aPk2iz3VuH/yybgK2NJqWVWTNiOnoWFO4NGlcjFXBmsN56fgIFvov9LVJl3fh5DJwJ
 zL+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=9wpH+QD+M2P94jydTW13H/F0YiPP2UOQt3EoDJIlLrM=;
 b=lM9Y9e1MEz17gAFHTrUGb6ltMOQ3j6Chg//aU4xBX7e9ROgIFchnIprXS1+13p+btH
 a+otsuoiml9WXnfhJIq47nvtdTGZOxQKwoux+wXjTFPcCc8PY7ROKshwbjJ1WAEQ4iXw
 zRJn/FE4k8PPR2EjPyi8U1uVN9upYucaTB2MCHE4GpVy98Of3P4gJSiN0lm3GFNwf9tS
 6vwAR73W3nHLkoTdYGDDssiUgXMhjGiTd+MeBH4rCH3AiuZndQd1LjOIX4P9V8qSyNOZ
 iQvejBq+MR4YzvCtkyUPIDI6SshpGGtBvLOOsBjFWLTnvViw9qi4n52ZjrKMfKPZ5U3/
 2WFQ==
X-Gm-Message-State: AODbwcA8T3CptZdBGOCnwbwYTEhdiUL4BHn/wupEALq3Ci+/2UskIlWR
 tyCzth/BZvP+G0ilg3J492b+A1KK3CzAy04=
X-Received: by 10.37.59.210 with SMTP id i201mr3620656yba.25.1496303375871;
 Thu, 01 Jun 2017 00:49:35 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.183.7 with HTTP; Thu, 1 Jun 2017 00:49:15 -0700 (PDT)
In-Reply-To: <17737bf1-ea87-a116-b362-e059e2fe82cc@kaod.org>
References: <20170531135614.7170-1-joel@jms.id.au>
 <ab9921a6-72b7-289b-b1ab-65738052a1ff@linux.vnet.ibm.com>
 <CACPK8Xd+bXUzVsXez1gF_S5Fgtp_c5ix8pWuUmZqj1r1yp=b4g@mail.gmail.com>
 <17737bf1-ea87-a116-b362-e059e2fe82cc@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 1 Jun 2017 17:19:15 +0930
X-Google-Sender-Auth: y87iUFDzWmXdzbk9zJn44wYqosU
Message-ID: <CACPK8XdbtAvHZrLn4rrvuE3zbVTDVEuhnG0-y1pyVYEHobbVvw@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10] arm: dts: aspeed: Update old style flash
 nodes
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: Eddie James <eajames@linux.vnet.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Andrew Jeffery <andrew@aj.id.au>, "Edward A. James" <eajames@us.ibm.com>, 
 Mykola Kostenok <c_mykolak@mellanox.com>
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
X-List-Received-Date: Thu, 01 Jun 2017 07:49:38 -0000

On Thu, Jun 1, 2017 at 4:15 PM, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> On 06/01/2017 08:40 AM, Joel Stanley wrote:
>> On Thu, Jun 1, 2017 at 2:45 AM, Eddie James <eajames@linux.vnet.ibm.com>=
 wrote:
>>>
>>>
>>> On 05/31/2017 08:56 AM, Joel Stanley wrote:
>>>>
>>>> From: "Edward A. James" <eajames@us.ibm.com>
>>>>
>>>> Reorganize flash controllers into the ast2400 device tree to match wha=
t
>>>> is used upstream. This moves the nodes from the machine dts to the
>>>> common dtsi.
>>>>
>>>> This also affected the newly added Mellanox MSN device tree, which is
>>>> also updated in this series.
>>>>
>>>> Barreleye wasn't booting with the new aspeed-smc driver.
>>>>
>>>> Signed-off-by: Edward A. James <eajames@us.ibm.com>
>>>> [joel:
>>>>    - rework commit message
>>>>    - add missing m25p,fast-read properties
>>>>    - add pinmux for pnor
>>>>    - use upstream node names
>>>>       * bmc_pnor becomes fmc
>>>>       * host_pnor becomes spi
>>>>    - fix the facebook machine
>>>> ]
>>>> Signed-off-by: Joel Stanley <joel@jms.id.au>
>>>> ---
>>>> Eddie, I reworked your patch for you. Please check it looks okay.
>>>
>>>
>>> Thanks Joel!
>>>
>>> Reviewed-by: Eddie James <eajames@linux.vnet.ibm.com>
>>
>> Thanks for the review Cedric and Eddie.
>>
>> I have applied to dev-4.10.
>
> I suppose that this patch applies now ?
>
>         http://patchwork.ozlabs.org/patch/752285/

Yup! I've applied that one.

We need to chase up a pinmux issue:

 https://github.com/openbmc/openbmc/issues/1701

Cheers,

Joel
