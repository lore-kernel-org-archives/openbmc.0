Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x232.google.com (mail-yw0-x232.google.com
 [IPv6:2607:f8b0:4002:c05::232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vscq35pfmzDqY6
 for <openbmc@lists.ozlabs.org>; Tue, 28 Mar 2017 15:09:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="OVfoRJGN"; 
 dkim-atps=neutral
Received: by mail-yw0-x232.google.com with SMTP id p77so45427379ywg.1
 for <openbmc@lists.ozlabs.org>; Mon, 27 Mar 2017 21:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=nCxODGeyGr5x4/h4BKX+h4maPfZ7a+7ohhCqTTIAEJM=;
 b=OVfoRJGNwF2Ebh8E6x+jI98p0+h15r1gcLNnAY8/ZvOKqPTNjX03uInRnlXfoBrVGn
 +RMq/pewsOlP9QcdkYGbbGrCzkj31a15WN07VDXD0c1iDEL1/oBzMz+4blptKgd/GNcl
 SC1jS0CZAgosQF4D0YqHU8FS3eMN+mniju0gCK5in2f6QSoShqh1FZGb/j1vdX+cquaw
 dG08k0Ardz1fY5hbSgZfgnxyCdmrw+j0jg+T1rML1QUvYRvHzxvVRsXXuqMcT/Sy3Qzj
 I2fpuxW8i6Ogd4BiUiD8nF/2MaKpuQlMM1nlVdGLWtYCPlyCt72IP1zT16vnBA9z9ygO
 6Oew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=nCxODGeyGr5x4/h4BKX+h4maPfZ7a+7ohhCqTTIAEJM=;
 b=OqdSjcEAb6kd+aBk/v1tspDjdPLl49fj8RBBxEC83MQKaIyOGYIvbIgJH+5tBn2XeS
 vf1FmgvWO1GpsJUtO4Um6TuOzAFUKx4sOSxL7TE2wnTQ7vNPLAmF/DQnm1JLrVsOFYEk
 hEio5mlM/oPL0rbse1a8K5dbPxfqi3Z2Tmnim+7yaKO8lPngJcEoXqiZOzMkhlphWc7y
 uC8JhCaczsIXXhCbS0KxpK1PEHAYjdTBe73HDjEei0KojlbSANlr7V6Qafmwz4Q68Vk2
 CfkaUjGgYdE59hRzSy0+OIEooBlwH/pRkm1h52hpz+r5FOfhO/J+LMZ/XXeGuklnZPNY
 Ce0g==
X-Gm-Message-State: AFeK/H0GUUqm/oXMRWBwY+bOuQkTBc8n01UGrLPJJrCimuTFZEzKre4Ij1GKK+MZ0/Z8iTT1NU8+0VnH5L+5NA==
X-Received: by 10.13.237.5 with SMTP id w5mr22529583ywe.56.1490674173591; Mon,
 27 Mar 2017 21:09:33 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.59.17 with HTTP; Mon, 27 Mar 2017 21:09:13 -0700 (PDT)
In-Reply-To: <1490611143.3177.76.camel@kernel.crashing.org>
References: <OF3D2CC421.3C763A88-ON862580EB.006DE8D6-862580EB.0078D20E@notes.na.collabserv.com>
 <1490611143.3177.76.camel@kernel.crashing.org>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 28 Mar 2017 14:39:13 +1030
X-Google-Sender-Auth: jGN7Febb9x91ca8e5a8SUkZ6rrI
Message-ID: <CACPK8XfedDuBHRcxAF130-5ahHwrV6==2pbpZb0gf-bQiddUcw@mail.gmail.com>
Subject: Re: possible hackathon
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Chris Austen <austenc@us.ibm.com>,
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
X-List-Received-Date: Tue, 28 Mar 2017 04:09:36 -0000

On Mon, Mar 27, 2017 at 9:09 PM, Benjamin Herrenschmidt
<benh@kernel.crashing.org> wrote:
> On Wed, 2017-03-22 at 15:59 -0600, Chris Austen wrote:
>> I'm not saying there is, but if there was a possibility for a
>> hackathon are there any ideas out there that would be of interest?
>> Some things off the top of my head would be...
>>
>> Updated simulation model
>> remote python scripts to collect thermal data from the host
>> Redfish dbus discovery
>> bmc swarm... talk dbus over multiple BMCs
>> System XML builder
>> OpenStack Ironic pluggin
>
> Missing kernel drivers:
>
>  - USB slave (UDC)
>  - USB Host (OHCI/EHCI)
>  - Video compression engine
>  - Video capture
>  - Framebuffer via drmfb
>  - etc...

Thanks. I added your suggestions to the list here:

 https://github.com/openbmc/linux/wiki/UpstreamHistory

Cheers,

Joel

>
>> Ideas wouldn't need to be limited to the BMC ofcourse any
>> interactions with the host firmware would also be candidate
>>
>>
>>
>>
>> Chris Austen
>>
>>
