Return-Path: <mine260309@gmail.com>
Received: from mail-it0-x244.google.com (mail-it0-x244.google.com
 [IPv6:2607:f8b0:4001:c0b::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xCKSc6GBLzDrWL
 for <openbmc@lists.ozlabs.org>; Thu, 20 Jul 2017 00:40:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="uZpxpsAJ"; 
 dkim-atps=neutral
Received: by mail-it0-x244.google.com with SMTP id a62so150535itd.5
 for <openbmc@lists.ozlabs.org>; Wed, 19 Jul 2017 07:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=lIubyC7TQKrOmBvXa5gPDInn9Bf9twrVZAsIZ+kHDrE=;
 b=uZpxpsAJlHOfAgCi4U4V/r36xwNbiyl1PoEbLnIHcjYeydaBFCniNKNeg4JMoi8Xzn
 o6CZZoUr7TDgO8OxycMYSkmb372z4BGhRd6IkslBWWKgoPCj8wO9ibPSOPd5Y5FAXNzF
 KncT7CAv6Z5Up2Nc0qKoDs883iipFI4p+DK3gHIGrgDssHSgMnpFVvu/PaT6VqlRdPUr
 H+BonB/D5XluCsXmbPQdAiZU3RbWpkzsybFeOGxgQDyxkgN7GUT7Ift274PSWBB0a5fj
 DX/B7PBaJQLWWoaiDxIjat0GVKpNKZHc0pqURzaUG1VBARaMTxKEy1SC/aLKpXmuGNPc
 6fJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=lIubyC7TQKrOmBvXa5gPDInn9Bf9twrVZAsIZ+kHDrE=;
 b=VhFKgvxWh34N2Ua3uKVGuR+gLMuvUJ3CY7wMxcLjIxZUieMnQLwbWCMugsHfbUA0Ho
 HN3kIMnAUsXbjWdOeol00tVh+mesMpX8hImx9JCvXMd3otGeMtMZmV4/HAVGKmq9WKlH
 rFk+j177wjCT1DsrV/S6VWy0/+Sbr/UOOiOiR4bnnOt3eCzjqIP2kYB1LkL8NpURy0pw
 ayg7iOMYlHOiyK/Wp4b64E1aG/VCArc8hWdRTeqd0d0UpSyB9w5u+VIll/9zOdARnExt
 lxzg9aFAA8yJsumcotkYh0EEjgniQTSGVx4YoB2FusQsuflnU+dPeOVJ+UcJ8xLcaItT
 eR2w==
X-Gm-Message-State: AIVw113nmgnU6x/NSJLObbc6+fB/Wnf5cHY4qi0i4H08sLoKoXFB52i5
 dcfldudqurHG6d6RgyN/hyIF5QXrRQ==
X-Received: by 10.36.216.215 with SMTP id b206mr94509itg.23.1500475213738;
 Wed, 19 Jul 2017 07:40:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.79.30.7 with HTTP; Wed, 19 Jul 2017 07:40:13 -0700 (PDT)
In-Reply-To: <a4185d59-d251-68d6-8ed0-47aa6a26f1a1@linux.vnet.ibm.com>
References: <1499354901-23165-1-git-send-email-eajames@linux.vnet.ibm.com>
 <CACPK8Xf15Kwm1S924H0PRsuiAm8XGzGQ-DCf30upMDLjY-nBAA@mail.gmail.com>
 <20170707183720.GD22100@asimov.austin.ibm.com>
 <a4185d59-d251-68d6-8ed0-47aa6a26f1a1@linux.vnet.ibm.com>
From: Lei YU <mine260309@gmail.com>
Date: Wed, 19 Jul 2017 22:40:13 +0800
Message-ID: <CAARXrtk1UULC7d_0PwgPQkXd9+50Jnp89igRK6J4Qtp-LjbE5w@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10 v3] drivers/hwmon/occ: Add sysfs_notify on
 error
To: Eddie James <eajames@linux.vnet.ibm.com>
Cc: Patrick Williams <patrick@stwcx.xyz>, Joel Stanley <joel@jms.id.au>, 
 "Edward A. James" <eajames@us.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Wed, 19 Jul 2017 14:40:17 -0000

Tested-by: Lei YU <mine260309@gmail.com>

Without this patch, the occ hwmon sensor readings are all empty on P8.
With this patch the issue is fixed and all the readings are OK.


On Sat, Jul 8, 2017 at 3:36 AM, Eddie James <eajames@linux.vnet.ibm.com> wrote:
>
>
> On 07/07/2017 01:37 PM, Patrick Williams wrote:
>>
>> On Fri, Jul 07, 2017 at 04:06:30PM +0930, Joel Stanley wrote:
>>>
>>> On Fri, Jul 7, 2017 at 12:58 AM, Eddie James <eajames@linux.vnet.ibm.com>
>>> wrote:
>>>>
>>>> From: "Edward A. James" <eajames@us.ibm.com>
>>>> +void occ_set_error(struct occ *occ, int error)
>>>> +{
>>>> +       occ->error_count++;
>>>> +       if (occ->error_count > OCC_ERROR_COUNT_THRESHOLD)
>>>
>>> I think this policy can live in userspace. Instead of counting the
>>> errors in the kernel and only reporting after some threshold, report
>>> all of the errors.
>>>
>>> Userspace can then chose to do with this information what it wants,
>>> according to the policy of the system.
>>>
>> This retry / threshold count is in the OCC specification itself and is
>> not considered "policy of the system".  I believe the specification
>> requires not considering errors under a threshold count as actual
>> errors and if there is a successful communication the threshold count is
>> suppose to be reset.  How do we coordinate that with userspace keeping a
>> separate error policy?
>
>
> In addition, there are a variety of different error types reported from the
> driver, such as "OCC in safe state for one minute" and "OCCs present
> mismatch". Those shouldn't be a part of the error counting, according to the
> OCC spec.
>
> Thanks,
> Eddie
>
>>
>>
>
