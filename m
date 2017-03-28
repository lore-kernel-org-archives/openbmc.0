Return-Path: <mine260309@gmail.com>
Received: from mail-it0-x243.google.com (mail-it0-x243.google.com
 [IPv6:2607:f8b0:4001:c0b::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vscJq0LP0zDqY6
 for <openbmc@lists.ozlabs.org>; Tue, 28 Mar 2017 14:46:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Xk/JZUpL"; 
 dkim-atps=neutral
Received: by mail-it0-x243.google.com with SMTP id 190so1081993itm.3
 for <openbmc@lists.ozlabs.org>; Mon, 27 Mar 2017 20:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=KQuNiJvXreIwBHY8l4KA0B/anXXdUfycAuSmdNHGLh0=;
 b=Xk/JZUpLx5BsAlshje5wsQ7qIosvSnG3IExNFjFAZ5wtKcaIaRd46XiobsnKrFN4lg
 58/52N3hmSGCV4uADQ0VoOHl+JV86tdRztQI03Y/l/3iELpGKA2xe9lHKG8hUSrNJLTb
 m3NIeVJCpeCnW42Zugm9cOpFehWrrzsTgz61tbKogUotMq+bVFISKuzQdx0V2ZgUzwri
 vmYsQjaKVO3uaE0OXpnSni8oRLCcqW1IKcpHJ+r1NOo9h40kdCebKWtTq1I30GTJnMn7
 0vEwDZh1H4aqLLsEZph0I+kJKv9feJs3q/KzlGM0f1GPtiuLmkbnQ8hVpFHALW2yCBkI
 DuAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=KQuNiJvXreIwBHY8l4KA0B/anXXdUfycAuSmdNHGLh0=;
 b=pglRxp+EagTRJnXOQmuM/mruJGevW9Gt8yTr6QOMaV1di/L/n93OqjpZfkRJbs8tK2
 /HAw7Y9mQGeDQCRmk1vDXMurN2bmyEnkC+8XMCIWVggJklgnUxDlVil4O0swJtF6GYmg
 tsaRLecsJ818v+27q9MbXZBZADmWUuYAeUBhuEX1xco9jX+nMwK5VTkYSr8cdROz1xAR
 IdEwlQC9t3dW3HXoy/YTacCfazKNmANkXqkbiwLWiG9pLgd3kktzlwZcXackgSdV17jT
 8FsRhdBkylIIGD0Aw7gaslM5bJrlSbPcbkqzqlDGgamHT5E/o0iS8Z2W/FFPqrxESiRC
 MAKw==
X-Gm-Message-State: AFeK/H2w7xnRToL76oF97gtjpBAY5he7zbmiDRRS4f2xgwrousmy2ov5nZ1DQQtYel/h5PvNVBt2oPMRlxC79Q==
X-Received: by 10.107.19.222 with SMTP id 91mr26716965iot.211.1490672808357;
 Mon, 27 Mar 2017 20:46:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.79.33.70 with HTTP; Mon, 27 Mar 2017 20:46:47 -0700 (PDT)
In-Reply-To: <1490611143.3177.76.camel@kernel.crashing.org>
References: <OF3D2CC421.3C763A88-ON862580EB.006DE8D6-862580EB.0078D20E@notes.na.collabserv.com>
 <1490611143.3177.76.camel@kernel.crashing.org>
From: Lei YU <mine260309@gmail.com>
Date: Tue, 28 Mar 2017 11:46:47 +0800
Message-ID: <CAARXrtk0WCV92OaeYWZkwzbL-6aPoGcFQHeTJ7gohkRm58p97w@mail.gmail.com>
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
X-List-Received-Date: Tue, 28 Mar 2017 03:46:51 -0000

I have a one-line-command util to upload and update OBMC image, which
needs to be
refactored so it fits different usages and handles different errors.
I can work on this during the "possible" hackathon.

On Mon, Mar 27, 2017 at 6:39 PM, Benjamin Herrenschmidt
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
