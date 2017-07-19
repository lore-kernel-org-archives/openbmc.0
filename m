Return-Path: <joel.stan@gmail.com>
Received: from mail-yb0-x229.google.com (mail-yb0-x229.google.com
 [IPv6:2607:f8b0:4002:c09::229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xCBBw4pShzDrVp
 for <openbmc@lists.ozlabs.org>; Wed, 19 Jul 2017 19:12:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="i/nve76S"; 
 dkim-atps=neutral
Received: by mail-yb0-x229.google.com with SMTP id 70so14232483ybn.2
 for <openbmc@lists.ozlabs.org>; Wed, 19 Jul 2017 02:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=JQneK5pzPllwO+yTtyj0/dpdhFnyHDW4aYFUZK1/Qz8=;
 b=i/nve76StKDnKvO7Tv3eeyMNiTtzJJxzqD+HIGI+q1hAA8SmpKLOJ8PmnAX7Ra9By8
 OjO58KnvyaoP9Bu/wQxo4/4gcR8AMVFPXXeJYgJ//QbsogDanYW7wuTI0oK4eQw0v8e0
 PZLCZVAIAoJ6oyxvZIvb4Z3lc52cmCgbPdLCWdo8CFRNi8OIQsJ3YfMexayzLpHvRCLo
 +4sBxc2Hk2NuTHMkq8Q5U9wk/lvAEgoKkiqdYGavPfSIga8Srlm3m2I/tKBjnUA01TIn
 6h5pNS2Op+MGkAqvjb9o9WtGDcS2vBFmoWYPC2zo/cFUQXqU1DA4jZkJbIfTpHgc4rTX
 S/2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=JQneK5pzPllwO+yTtyj0/dpdhFnyHDW4aYFUZK1/Qz8=;
 b=AbxXphBkujNYemyx9PkzZerHpYV90TGta32X1eKMav1ZoYqrNlqCFv542J554NryeA
 2Vl+0zc905LVnOCjL1Psc6syN65WuuXTirHiCrw4i506D/bGXPIr05SRjoBSZP04FhTh
 w5Z2U4gxjM8wjODiDMoAO8rKw3ziDjtZ+UTmhTdN09PFB3UGqXPQyPcSw8Xs39BzScml
 QT6Epx0xXWhWVg4S9rpCq+4Se6wPTDSXMEWm/Q5UI46rOiATZpO10p4BbaxBCRLv9mqn
 mK+7t24Hbl4j/0nv5EnUrs9TTjbA6bvVDcomUkcEdLik1rQrHhPGI23TLj6WYh5ovQTr
 LvFQ==
X-Gm-Message-State: AIVw111ngxXNDNLuBud54BtpMs7DwBJhh4x7lP2vStiGnSqP3F6Emzn3
 W6Jdb76rOHaQPmIfh/YjIfdnWfwG+37k
X-Received: by 10.37.170.101 with SMTP id s92mr1291434ybi.169.1500455574274;
 Wed, 19 Jul 2017 02:12:54 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.170.177 with HTTP; Wed, 19 Jul 2017 02:12:33 -0700 (PDT)
In-Reply-To: <9085e08c-e2cf-16d8-ada8-2b1a3e0025e1@linux.vnet.ibm.com>
References: <1500053800-3923-1-git-send-email-eajames@linux.vnet.ibm.com>
 <9085e08c-e2cf-16d8-ada8-2b1a3e0025e1@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 19 Jul 2017 18:42:33 +0930
X-Google-Sender-Auth: cJ2ZGXMLMTKDPypSiqfY5T9poNQ
Message-ID: <CACPK8XdHHxFj8fojxS_cBSoGAogfOqWz=jpsZoWv=QxTtb-_Vw@mail.gmail.com>
Subject: Re: [PATCH u-boot] configs/ast: Add redundnant env
To: Eddie James <eajames@linux.vnet.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 "Edward A. James" <eajames@us.ibm.com>
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
X-List-Received-Date: Wed, 19 Jul 2017 09:12:57 -0000

On Wed, Jul 19, 2017 at 3:36 AM, Eddie James <eajames@linux.vnet.ibm.com> wrote:
>
>
> On 07/14/2017 12:36 PM, Eddie James wrote:
>>
>> From: "Edward A. James" <eajames@us.ibm.com>
>>
>> Configure ast chips to run redundant u-boot environments.
>
>
> This will need some userspace changes to work properly. The BMC will still
> boot if this is merged by itself, but there might be trouble updating
> environment variables without a serial connection (of particular concern
> would be the MAC address...). fw_setenv may update the flash without the
> correct "valid" byte that exists for redundant environments, and so u-boot
> will probably consider the updated flash invalid and switch to the other
> copy every time you reboot.

Thanks. I will hold off until the userspace change is ready to go.

Cheers,

Joel
