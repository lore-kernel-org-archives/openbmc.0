Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x244.google.com (mail-yw0-x244.google.com
 [IPv6:2607:f8b0:4002:c05::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vPcKr0ZsqzDqBm
 for <openbmc@lists.ozlabs.org>; Fri, 17 Feb 2017 13:24:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="W3p0tlvX"; 
 dkim-atps=neutral
Received: by mail-yw0-x244.google.com with SMTP id q71so2457975ywg.3
 for <openbmc@lists.ozlabs.org>; Thu, 16 Feb 2017 18:24:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=OoxIUxlO9pjZ5l39h2bjyKRD2z0KWbkkeExstRsitZY=;
 b=W3p0tlvXcNjzLKKwHLSsTGon3uk57I0sGhRDsLoigAK5723pjX2OnFuMW+7ZqX2UwI
 suWmYnj3FxReXOC+w78T4tj1t6qOz4Qu92UXpA3r6v4GFtMDDJzO9I0furdUsz4U5z4Q
 IBwhSE+OG8KwZbOIkGu62gsCySKCsCvkc9CwIIsrrO+h/0Ni506kjtAWFJHUhxVZqo3O
 5KlU8cpZ7VNRHnFQfGLRYAwGOgdP3sTrPptOl+3ltqFFENGd5QJ88WRnPyqHZuNCxrAE
 HSgKPUFOM5HVO4DfmxIwAL191HdBjOKdR0RBPYf7YeLSd+Otnz3v/GXbTFf+QX4IVVFE
 bJNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=OoxIUxlO9pjZ5l39h2bjyKRD2z0KWbkkeExstRsitZY=;
 b=mOv+33nXnfOOVxxAp1e0yItJ2YTtNiFW/SXKqlYXrIqLRhWNOcsx6rPjfynHh/ESCQ
 BWzh0dK2uwPEo633PCMvDm8d9x4BV241o6tCS5ynruMtdrP54NCxNqBWG2FPuVy0hzjJ
 60oujjoBm92SJ3gpeCjMmSRQgnLlNMKEnwedYXxCQRMUxfh5DsKnN0tOIH981bxxQyg8
 5a9ZmjJ8tajA+QOC247lvgHVevlKnEN9z6rvh2rc1od3hcDcfScGvRdZtMAVxfFsQahc
 DtZgRN3GMsxhtagW61k+MIWykuEkjEAJN57rRBfyJWpaohpQxH/+ogo2nGcX09MDTmqr
 uSFg==
X-Gm-Message-State: AMke39n9N5YMpe2Ttk4g74NhUzfqnv5N1T8suADtqHYVw4cdyz/AYePrFrK3aEmrYMLzwBQkorHr9voVwKljcg==
X-Received: by 10.129.116.4 with SMTP id p4mr4654244ywc.268.1487298269961;
 Thu, 16 Feb 2017 18:24:29 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.170.41 with HTTP; Thu, 16 Feb 2017 18:24:09 -0800 (PST)
In-Reply-To: <1487208750.3661.34.camel@aj.id.au>
References: <20170215065514.16673-1-raltherr@google.com>
 <1487208750.3661.34.camel@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 17 Feb 2017 12:54:09 +1030
X-Google-Sender-Auth: WiY_85vISOtBRXiWNsNlGIH61mM
Message-ID: <CACPK8Xd7woFRqhMYb=hJvYEqMY-sx8NkN+m-O2TKE_ky9L7wXQ@mail.gmail.com>
Subject: Re: [RESEND PATCH linux] aspeed: pinctrl: Allow disabling Port D and
 Port E loopback mode
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Rick Altherr <raltherr@google.com>,
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
X-List-Received-Date: Fri, 17 Feb 2017 02:24:32 -0000

[removing upstream cc]

On Thu, Feb 16, 2017 at 12:02 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
> On Tue, 2017-02-14 at 22:55 -0800, Rick Altherr wrote:
>> Port D and port E GPIO loopback modes are commonly enabled via hardware
>> straps for use with front-panel buttons.  When the BMC is powered
>> off or fails to boot, the front-panel buttons are directly connected to
>> the host chipset via the loopback to allow direct power-on and reset
>> control. Once the BMC has booted, the loopback mode must be disabled for
>> the BMC to take over control of host power-on and reset.
>>
>> Disabling these loopback modes requires writing to the hardware strap
>> register which violates the current design of assuming the system
>> designer chose the strap settings for a specific reason and they should
>> be treated as read-only. Only the two bits of the strap register related
>> to these loopback modes are allowed to be written and comments have been
>> added to explain why.
>>
>> Signed-off-by: Rick Altherr <raltherr@google.com>
>
> For the record this is one of at least two awkward cases. The other is
> runtime switching between the using the SoC as an SPI master, and
> simply performing SPI pass-through for an external controller (e.g. to
> allow either the BMC or the host to reprogram the host BIOS image).
>
> If the list of exceptions continues to grow we should pull the tests
> out to a separate function so we can keep the condition readable.
>
> Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

I have applied this to dev-4.7.

Cheers,

Joel

>
>> ---
>>  drivers/pinctrl/aspeed/pinctrl-aspeed.c | 14 ++++++++++++--
>>  1 file changed, 12 insertions(+), 2 deletions(-)
