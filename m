Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x22a.google.com (mail-yw0-x22a.google.com
 [IPv6:2607:f8b0:4002:c05::22a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wydFR0fwQzDr24
 for <openbmc@lists.ozlabs.org>; Thu, 29 Jun 2017 08:46:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZVXIYVjC"; 
 dkim-atps=neutral
Received: by mail-yw0-x22a.google.com with SMTP id j11so30379565ywa.2
 for <openbmc@lists.ozlabs.org>; Wed, 28 Jun 2017 15:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=QTMjAbsll8U1j2HtbMBDNu57u2ZWFOZDeJOzmko2dvU=;
 b=ZVXIYVjCGExmSKW8gpdEbC9L2i2/gO4Coc77i+xBJOWFwRqrHigkoMfJUHf0so8Q80
 GBVoV8SP3YCYAgh2UYMjv4jZ9SNXJaT7H/68GwTX/0V3xLhsJZqWawrEkmFaeAV3I1hQ
 0L1gx4eAgB/hwZe/pTd/QU9RaYkY0w3+KY5UDjTqJ6cpqliKFiqE0kenex3VBlZM7muA
 TOwgt5eEndw6qLMNmAF76kyoPsP/UqkH/8/Sw91j1xwb6ztBT++WaQDA7vKlprAiispu
 bUVRdQsxklV7T5KaqWufrmrhZcrQKmbZYpw/L64nukgf+E32Q8urj9zqIw0VtXVDqCnO
 qHfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=QTMjAbsll8U1j2HtbMBDNu57u2ZWFOZDeJOzmko2dvU=;
 b=WNucoNsPtEULRu3LODbtJ48U5Fj4wqdeQKsz0ryUgVyp5+JRa8gHihurRNjCFjOya7
 hzrChMOjr2NbQZ6gMahUQrV13i3SkKhoK6MiVDctfDqj+crEQptIlAoPOgkj4wPjYcf2
 DzY+E5rBbRSr7URE+ITbTTh5mPNklBOTdu5eY4/3JEm7IO6WN3POw7cbH/os0Vau688x
 gU/OrjvKyxR9YrFZFaWgfrYnqm2DEt70I3kgvjeooChB7Nh/sbhB5+h1pbqKe8UudjKM
 fQAj1ag6k/Ah73sxC/yHx5wuASAteOQqhKrQ8EeDln3ziIfmNxe7azR23M//kvwjAm9Y
 5iCg==
X-Gm-Message-State: AKS2vOxM/dqt0fUJymPM7R2dw0dwNMG/nGkw94Pld0B61m66XYWrzfIB
 EC5Nw2OT56fkuaaVqrmGFCJXIKegKg==
X-Received: by 10.13.208.67 with SMTP id s64mr10140362ywd.43.1498689992658;
 Wed, 28 Jun 2017 15:46:32 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.177.8 with HTTP; Wed, 28 Jun 2017 15:46:12 -0700 (PDT)
In-Reply-To: <6058006f-ad66-d053-550f-6962725b55e9@linux.vnet.ibm.com>
References: <1498505585-1820-1-git-send-email-eajames@linux.vnet.ibm.com>
 <CACPK8XeOHwzMjMm7N4GU159QckNV=WvX=5C5RLWOr7DQ5yFF=g@mail.gmail.com>
 <6058006f-ad66-d053-550f-6962725b55e9@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 29 Jun 2017 08:16:12 +0930
X-Google-Sender-Auth: 87lSBq_JTI2z2j3-dgLU14vDOWM
Message-ID: <CACPK8XeSLsXU+FMm-t_gE+J3zOkGTAaG80JO0H_-gQQoxK4e=g@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10] arm/dts: Add I2C master and ports to FSI
 cfam
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
X-List-Received-Date: Wed, 28 Jun 2017 22:46:35 -0000

On Wed, Jun 28, 2017 at 11:39 PM, Eddie James
<eajames@linux.vnet.ibm.com> wrote:
>
>
> On 06/27/2017 11:57 PM, Joel Stanley wrote:
>>
>> On Tue, Jun 27, 2017 at 5:03 AM, Eddie James <eajames@linux.vnet.ibm.com>
>> wrote:
>>>
>>> From: "Edward A. James" <eajames@us.ibm.com>
>>>
>>> FSI I2C master algorithm probes port devices based on dts.
>>
>> Do you need all 28 ports enabled?
>
>
> I think so. All of those are valid I2C busses on P9. I'm not sure who uses
> them all.

Convention has been to only enable the buses that are active. Set the
default to be status = "disabled"; and then in the .dts files for each
machine that uses these will set the status = "okay".

I know that the Cronus tools use one of these for updating the SBE EEPROM.

Cheers,

Joel
