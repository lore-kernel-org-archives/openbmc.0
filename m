Return-Path: <joel.stan@gmail.com>
Received: from mail-yb0-x244.google.com (mail-yb0-x244.google.com
 [IPv6:2607:f8b0:4002:c09::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vtmL01mFSzDqK1
 for <openbmc@lists.ozlabs.org>; Thu, 30 Mar 2017 11:51:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="sGoRe9Qf"; 
 dkim-atps=neutral
Received: by mail-yb0-x244.google.com with SMTP id m133so137250ybb.1
 for <openbmc@lists.ozlabs.org>; Wed, 29 Mar 2017 17:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=p8Y3yvrIE3M2OZSc3h5NO0N8p2eHX0UOARtaTDGgJ8U=;
 b=sGoRe9QfiS+MA3aDufsCxgbogusNy60PjxzirVfH+3lhCrxRROzuZSTI73Xiap2/v8
 9FVEggMQz/fhoHtqYSaGGxEclTZwQys7ZbyCs2pYrzWf7oYwYkfQirK1liEnwtCPx1iC
 d5rA1AGdhjKpcvko5dAC8nwbgoun0gAnvh8OlKsH730Yo3wNB9wiLi52xbNBWe0Z5F1J
 48SPV96VATlHqRjt9RBqAORXrdwVnCpHOU1N8N9Pti0FhezLTvH3jPFZ3p8DkQ9xO/9F
 JXeMugNW7aA+ScXeDjT+Vb5aPEIQskZ6exi6Sq5b2yCb/Y06+HcjFk3qnmaFjhrOljxw
 Lu3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=p8Y3yvrIE3M2OZSc3h5NO0N8p2eHX0UOARtaTDGgJ8U=;
 b=WL6gj+RT8eXLWuGOvQH+/wByBrq+e69a5+WUzQlvrOmlCXk3qcwfQbfKsBB8ibMrZ+
 isfHvISHUN95+LGP7ssNXHaX9pg9X9E/zvbJENtJg2LxxKKW8+hNJaZZnfp0+438TlM8
 ct7XcrZNitb1AQiAK97tvqqr8OnGcCHcpjrs0+kJy2GrRiSqEcggZDtFByGHiT/eIpKU
 fqBo5Hp9tpIiALZ3tH5BN4OBfWKNiOZpWaf1VxjEJif9XR57x1IRrb+vb+yBDLEN0q3m
 TiaZTnUUoP73lXubCB+wBlaf7XgEDkv0BEgcAdXkhrU0rkeXW09sFBheiwM3Te28Cu1G
 i0Lw==
X-Gm-Message-State: AFeK/H2vYFG5LTjmnORr7FRvDLztcbFKwzn+c6hkoIYjGTXz66CD2syq3R1v+N7mjux0UxU1b4O4f1k+T9MRCQ==
X-Received: by 10.37.70.66 with SMTP id t63mr4131377yba.196.1490835109628;
 Wed, 29 Mar 2017 17:51:49 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.59.17 with HTTP; Wed, 29 Mar 2017 17:51:29 -0700 (PDT)
In-Reply-To: <OF335A2B9B.4D6D21D6-ON002580F2.005A0F2E-002580F2.005A570E@notes.na.collabserv.com>
References: <20170329044953.25308-1-joel@jms.id.au>
 <CAARXrtmHQUQPLfQKXZLvh+hmnf8YJsx+7u2DvHczzL1dZnFYsQ@mail.gmail.com>
 <CACPK8XfwZ_1pYEbEmNkE-e2AENUTM4kHoaObf2MFtMWV02BhAg@mail.gmail.com>
 <OF335A2B9B.4D6D21D6-ON002580F2.005A0F2E-002580F2.005A570E@notes.na.collabserv.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 30 Mar 2017 11:21:29 +1030
X-Google-Sender-Auth: K5gBBJXVuvsJOnGxrD5QDTqfBq0
Message-ID: <CACPK8Xd-reK0COw23d+r8es3zYV90qD52q4y=EC8pWWd+Zx50g@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.7] ARM: dts: aspeed: Add Langyang BMC device
 tree
To: Milton Miller II <miltonm@us.ibm.com>
Cc: Lei YU <mine260309@gmail.com>, Ken Chen <chen.kenyy@inventec.com>, 
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
X-List-Received-Date: Thu, 30 Mar 2017 00:51:52 -0000

On Thu, Mar 30, 2017 at 2:56 AM, Milton Miller II <miltonm@us.ibm.com> wrote:
> Joel Stanley wrote:
>
>>Subject: Re: [PATCH linux dev-4.7] ARM: dts: aspeed: Add Langyang BMC
>>device tree
>>
>>On Wed, Mar 29, 2017 at 4:32 PM, Lei YU <mine260309@gmail.com> wrote:
>>> Reviewed-by: Lei YU <mine260309@gmail.com>
>>>
>>> On Wed, Mar 29, 2017 at 12:49 PM, Joel Stanley <joel@jms.id.au>
>>wrote:
>>>> From: Ken Chen <chen.kenyy@inventec.com>
>>>>
>>>> Langyang is an OpenPower Power9 system made by Inventec.
>
>
> The subject and change log say Langyang (with 2 'g's).
>
> The file name, compatible, and model say Lanyang (with 1 'g').
>
> I realize it has been merged into openbmc, but maybe we can catch
> the upstream changelog.  Unless the files are wrong.

Thanks for pointing out my mistake. The correct spelling (as far as I
know) is the filename and device tree. I will make sure to correct
that in future.

Cheers,

Joel
