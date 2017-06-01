Return-Path: <joel.stan@gmail.com>
Received: from mail-yb0-x242.google.com (mail-yb0-x242.google.com
 [IPv6:2607:f8b0:4002:c09::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wdd563VSHzDq5x
 for <openbmc@lists.ozlabs.org>; Thu,  1 Jun 2017 16:40:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="pgErcs70"; 
 dkim-atps=neutral
Received: by mail-yb0-x242.google.com with SMTP id 202so1175791ybd.0
 for <openbmc@lists.ozlabs.org>; Wed, 31 May 2017 23:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=qSZ9knaftDiwV1cO1X1tm7ooPIWuL6xYBGUyMLNYvUs=;
 b=pgErcs70Xt4gA/Ll/+XnJS5FPPQTkzwmiNacl1gVCdJqCLGrbCYiDYB92ZO/dIve/S
 Tx7LCi12jrQ8R0j7KN/aJC9i18JPG2s1562yHGGGTZ1VmbphitXtaGQe7+ZIar2AUrnW
 4vgx3x3otpsPRsoGyf2SxttTzXYK2OGtYCnsFqJ+CvS+RC0cuOCGhL/EDdFTK8ooL8Ng
 eDGa3JHFdCpznZ72Zf7iIf4H1X4L8zSKdMT5EQnfyFwclB/Td2dom8swS/6QCELF9/Rq
 F25tAesj2eFegmUrmUkDe05KA7buqK5rbAP8bMtLu9dRnUfprNipx7x7oN37IdkEvIBM
 id8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=qSZ9knaftDiwV1cO1X1tm7ooPIWuL6xYBGUyMLNYvUs=;
 b=I2xkP34sNv3j6JShJfGyYv1HmqkPCgaX4eV1JwjkVA+1ViT+3kRte4JUboE57UvkiH
 Io/r7LhjtdKs/m0NbbKiZTYMIuLvW7nzgOHKoiG98sgzc6eqO7B+/43l4jG6Sexv8LK1
 f1uxPntBdtZHTle7jAu8hBOzq3DTL6Y9o8wOe2dXt0j6Rfjv49dbMJmdE0mZKYU32as9
 Ra3h2EDWlsF8uWgp8UnT5LvIkSHjy6Iq43dM6z6fYVDO04Xkn6ThbkSZP/NTqM2NbZPO
 OkOoZLpwWWFctRVa5uosuqxEvFDihqznrQ0enFMp8nVygpWkBJYRzHJBFji8OqhFQhan
 nkBg==
X-Gm-Message-State: AODbwcCWWRwE2RbfTYakDQfMqMLWpB0Q+otES4vMt3P143L5cXElQdCY
 0VBKgFAWcyjQbKR6/5c4fcep11ZHosgV
X-Received: by 10.37.108.212 with SMTP id h203mr58827447ybc.77.1496299224251; 
 Wed, 31 May 2017 23:40:24 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.183.7 with HTTP; Wed, 31 May 2017 23:40:03 -0700 (PDT)
In-Reply-To: <ab9921a6-72b7-289b-b1ab-65738052a1ff@linux.vnet.ibm.com>
References: <20170531135614.7170-1-joel@jms.id.au>
 <ab9921a6-72b7-289b-b1ab-65738052a1ff@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 1 Jun 2017 16:10:03 +0930
X-Google-Sender-Auth: wzapWP1r32GbJcbovn9raQPMHo8
Message-ID: <CACPK8Xd+bXUzVsXez1gF_S5Fgtp_c5ix8pWuUmZqj1r1yp=b4g@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10] arm: dts: aspeed: Update old style flash
 nodes
To: Eddie James <eajames@linux.vnet.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Andrew Jeffery <andrew@aj.id.au>, "Edward A. James" <eajames@us.ibm.com>,
 Mykola Kostenok <c_mykolak@mellanox.com>, 
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
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
X-List-Received-Date: Thu, 01 Jun 2017 06:40:26 -0000

On Thu, Jun 1, 2017 at 2:45 AM, Eddie James <eajames@linux.vnet.ibm.com> wrote:
>
>
> On 05/31/2017 08:56 AM, Joel Stanley wrote:
>>
>> From: "Edward A. James" <eajames@us.ibm.com>
>>
>> Reorganize flash controllers into the ast2400 device tree to match what
>> is used upstream. This moves the nodes from the machine dts to the
>> common dtsi.
>>
>> This also affected the newly added Mellanox MSN device tree, which is
>> also updated in this series.
>>
>> Barreleye wasn't booting with the new aspeed-smc driver.
>>
>> Signed-off-by: Edward A. James <eajames@us.ibm.com>
>> [joel:
>>    - rework commit message
>>    - add missing m25p,fast-read properties
>>    - add pinmux for pnor
>>    - use upstream node names
>>       * bmc_pnor becomes fmc
>>       * host_pnor becomes spi
>>    - fix the facebook machine
>> ]
>> Signed-off-by: Joel Stanley <joel@jms.id.au>
>> ---
>> Eddie, I reworked your patch for you. Please check it looks okay.
>
>
> Thanks Joel!
>
> Reviewed-by: Eddie James <eajames@linux.vnet.ibm.com>

Thanks for the review Cedric and Eddie.

I have applied to dev-4.10.

Cheers,

Joel
