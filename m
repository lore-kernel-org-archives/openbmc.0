Return-Path: <joel.stan@gmail.com>
Received: from mail-vk0-x242.google.com (mail-vk0-x242.google.com
 [IPv6:2607:f8b0:400c:c05::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sZYsP3sglzDqXr
 for <openbmc@lists.ozlabs.org>; Thu, 15 Sep 2016 20:03:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=V52g0K4G; 
 dkim-atps=neutral
Received: by mail-vk0-x242.google.com with SMTP id c124so858175vka.3
 for <openbmc@lists.ozlabs.org>; Thu, 15 Sep 2016 03:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=JsdR90Zgwq+YGg7G2BwliSSpngnUkIgwGQP2wdjtEd8=;
 b=V52g0K4Gti8tBv4eD7ADxpiKgGGF38l82XXRhGrPKal8HK6MX9KLTn1XZgi/XzuERz
 DSzXYfHslfhmQMg6N0aRiBsoSzItlWAcc0Z9DjvaI19n6B9BKuK7hFUVm+b5L+UFmGVn
 4OerzTHmQuFuYL6J73pJA07KF8WbPkIJMpLJV5Pgmnyr+dEZymRVRIOPgoircF9ZHIjO
 /gmb3S48ietm1/wWQlyoB4FKYuyb0IgLxaTGVJhmnkYjyt8Qs+9LCWmDM3RDue7SfhIA
 t3khH1hwi3EWFGo0UCzb1hKo3xwjgsnNUJNXnaDyDJI1tLo8OUaNihURF4zblB5f2KYv
 Vvug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=JsdR90Zgwq+YGg7G2BwliSSpngnUkIgwGQP2wdjtEd8=;
 b=HIJm2DqiJaIc9HnaGTetSbs6YL912sXrq9csHiKY5L1pzNhZZlJIfAV/LDayCKHckI
 dxQPGnyUq/gNTk6PJ/bj+8UwcFFtHGoiOOgyXsIg7xami+ad3JMKrb+8xupvCLQ7F2Sm
 2lVFVITE8zOYVn89UKo/p/BJyCbLZtmA8VDQwywcVGsPTsK5vnYwaBtCq/QP+jTkYQ93
 rlLnv09hxT+r/YTDz5tzJ04rL6/oiYvyVPV9nTZ0HXcYZgLdgMSHAga7vnzNjGVZE9t2
 oPSPXF0s6gGr3NIiXdYH4qw4nFnLudwG/+FcRsGUk93S7JgyLAgsgU+hHNKe+IM5X5w7
 E07Q==
X-Gm-Message-State: AE9vXwMnora7euGHKjnI14ktjXhfHpjgaPguqqGlThutgf5rBvCFCenED5YDcALNqgdIWNgXV+R8KaqtpsH1dg==
X-Received: by 10.31.15.69 with SMTP id 66mr2379580vkp.41.1473933830689; Thu,
 15 Sep 2016 03:03:50 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.176.80.221 with HTTP; Thu, 15 Sep 2016 03:03:30 -0700 (PDT)
In-Reply-To: <22bc13ba-5bf7-3e94-6df1-62d33b50c7cc@kaod.org>
References: <1473921146-19509-1-git-send-email-clg@kaod.org>
 <1473921146-19509-5-git-send-email-clg@kaod.org>
 <CACPK8XeB+y5SVzJvoWSAr5hsufZw0hVm6RKUGVNtocawBWPQ7A@mail.gmail.com>
 <38b843b7-24ec-7089-154c-262106afd50c@kaod.org>
 <22bc13ba-5bf7-3e94-6df1-62d33b50c7cc@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 15 Sep 2016 19:33:30 +0930
X-Google-Sender-Auth: gB519AjSXKCU866sc9UMsuyOPs0
Message-ID: <CACPK8XcBd3jHNWjiO5_+hX_odhrwN=hqcAKRCGnQgjAaA4G8WQ@mail.gmail.com>
Subject: Re: [RFC PATCH linux dev-4.7 4/6] misc: Add Aspeed BT IPMI BMC driver
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 15 Sep 2016 10:03:54 -0000

On Thu, Sep 15, 2016 at 6:06 PM, C=C3=A9dric Le Goater <clg@kaod.org> wrote=
:
>>> I'm not sure there. When I open /dev/ttyUSB0 I'm talking to the USB0
>>> serial device. When I open /dev/mtd0, I'm talking to the mtd0 device.
>>> So when I open /dev/ipmi-bt-bmc, I would expect to talk to the BMC
>>> device?
>>
>> Yes. I went a little too far in the global rename. /dev/ipmi-bt-bmc make=
s
>
> I meant /dev/ipmi-bt-host ! :)

Hah good! I didn't follow at all. That makes a lot more sense.

Thanks for sending the patches out. I will hold off applying them
until you've got support from upstream.

Cheers,

Joel
