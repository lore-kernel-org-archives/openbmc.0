Return-Path: <venture@google.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400c:c08::233; helo=mail-ua0-x233.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="inPDuxuz"; 
 dkim-atps=neutral
Received: from mail-ua0-x233.google.com (mail-ua0-x233.google.com
 [IPv6:2607:f8b0:400c:c08::233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ydHVz3jjkzDrD1
 for <openbmc@lists.ozlabs.org>; Fri, 17 Nov 2017 10:28:42 +1100 (AEDT)
Received: by mail-ua0-x233.google.com with SMTP id q18so291609uaa.0
 for <openbmc@lists.ozlabs.org>; Thu, 16 Nov 2017 15:28:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=o2nFB1oky6Jwj4A3unOxOk2JBhR+qFyucekLevfw3ag=;
 b=inPDuxuzoWZ2xQfQbHPp68wEIfJ1oqq1G+SpT36gJYLAmVQzS2jbunnHHzT7MOLJPb
 5hqecAylEZ9sis+8eQ4w5c0b2aBqW9/lcbhM2c07fv52fSCw/KXz0BSh4gliSXl8O98E
 069NtwmAE+HFrAd2XMAw1dI7ZnOwM060eVu+2vTPRRknnqTcID1WANz36oFJmjiG+1Ip
 PsCLPTW1fKsexTtUzXTOhJTBsEr39nFJ7vsLlMiacHFYavzk/0luJhzbmtcasaOf+ebI
 l2pTj9tBvbAgQBLDhmroMGsWc/08Sf6E5hkU1EIVmAStC4EEA9DAxWg/bPyNDzPqmjpA
 cD+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=o2nFB1oky6Jwj4A3unOxOk2JBhR+qFyucekLevfw3ag=;
 b=RFkuljDos2K/V0riC/IJBpIyzpynJvH3aSI9uiy5e0OoTqPapA5HDCvuv7ZDuryYfE
 ifKFWTIkmOoD/mqiKnDXsbO11bsBhlqZo5Z8Ym7yVRMvHqsQNJOhgPADT0Euw3/cru7K
 EBD4zAGdwJs7lRpXyQV9gA6aD0x4hr3sgO2WWBt+JOa8/7O+6k4D6jYtIAJLADMqwh0U
 dRiPHogJ5gKVzBRsVGfHvQRdX8zaugqV2msAJq1SVR4SmOu5N417GgLz2HXnc35Q58NP
 WwIuFZ9xZGkK63Ory5jGQ6HKF33wRK5mEaUgvZYoMQFT3AVzRqI6hNq96TqBcksoRHcc
 5TOw==
X-Gm-Message-State: AJaThX7OZlFj2+NbUZpLDP2Kto0CNw1KV8JsZ/17/khEeLr34o5F9AoF
 9cbuJsfUA2x4ue0WlAueFZaRVSRMBzqGsMVZOtmnXw==
X-Google-Smtp-Source: AGs4zMYw+9BFOgpMMAOyw53uDsSsxTpHIbpiSxPVag4JoW710EzdHo1aNw2COEfCWhG43sn0wl3Uk1Rr1V985fiXEho=
X-Received: by 10.176.71.226 with SMTP id w34mr3289680uac.33.1510874919338;
 Thu, 16 Nov 2017 15:28:39 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.94.150 with HTTP; Thu, 16 Nov 2017 15:28:18 -0800 (PST)
In-Reply-To: <20171116171412.GD113334@mauery>
References: <C599FC839619124CAC44E062ABB7DFE2C9F407C2@ORSMSX101.amr.corp.intel.com>
 <14315ca0-3c06-5aa3-5b57-d5e3888fd957@ozlabs.org>
 <20171116171412.GD113334@mauery>
From: Patrick Venture <venture@google.com>
Date: Thu, 16 Nov 2017 15:28:18 -0800
Message-ID: <CAO=notwuzbeXZLD7HePcFJ0xqMQRh0hTcOLtjR_qD60SMdL45Q@mail.gmail.com>
Subject: Re: HPM firmware update
To: Vernon Mauery <vernon.mauery@linux.intel.com>
Cc: Jeremy Kerr <jk@ozlabs.org>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, 
 "Mihm, James" <james.mihm@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 16 Nov 2017 23:28:44 -0000

I hate to jump in, but we have a downstream implementation that lets
the platform specify the data channel but uses OEM IPMI commands to
control the transfer, including setting it up and triggering events
related to the update.  We do this to support multiple platforms, such
as uploading the image over PCI or LPC, and also allows us to stage
the file for cryptographic signature verification.

It's very similar to the latest email above.

On Thu, Nov 16, 2017 at 9:14 AM, Vernon Mauery
<vernon.mauery@linux.intel.com> wrote:
> On 16-Nov-2017 11:14 AM, Jeremy Kerr wrote:
>>
>> Hi James,
>>
>>> I=E2=80=99ve started looking at using the PICMG HPM specification that =
was
>>> recommended as the preferred API for performing firmware updates. This
>>> is not an open specification, and goes against the principles of the
>>> openbmc project.
>>
>>
>> Yes, that's very true. My previous experience is on the client-side of
>> HPM, which is implemented in ipmitool already.
>>
>>> The HPM specification must also be purchased from the PICMG standards
>>> organization, and contains patent liabilities. I think using HPM is a
>>> non-starter.
>>
>>
>> We could always request DMTF to make it more widely available. However,
>> unless that does change, I'd agree with you that we'd want to avoid
>> HPM.1.
>
>
> We don't have to go with HPM though. Our prior version of BMC used a fair=
ly
> straight-forward model that is not too different than the HPM model, thou=
gh
> it was developed in-house. It is pretty generic and could be used to
> transfer any payload over a variety of transports.
>
> If we can define our own 'standard' for OpenBMC firmware update methods,
> then we can implement that in ipmitool (like the dell oem commands or
> something).
>
> An overview goes something like this:
>
> 1) enter FW transfer mode
> 2) optionally send parameters (no-rollback, deferred reboot, debug, etc.)
> 3) <make a choice for either IPMI streaming or other transport>
>         a) for streaming
>                 i) write data blocks as IPMI FW command
>         b) for usb mass storage
>                 i) send plug-in IPMI command
>                 ii) host-side mount usb mass storage device, writes fw im=
age
>                 iii) send plug-out IPMI command
>                 iv) send 'set uri command' (usb://...)
>         c) for network transport
>             i) send 'set uri command' (http(s)://..., tftp://..., ftp://.=
..)
> 4) send transfer complete IPMI command
> 5) check status
>         status moves from download -> verify -> program -> ready
>         status can move to error from any state
> 6) once status moves to ready, firmware update is finished, ready to
> reboot.
> 7) send exit fw transfer mode IPMI command. This causes the BMC to
> reboot unless a deferred reboot has been selected.
>
>
> This mostly describes what the IPMI control does, which is pretty generic=
.
> The trickiest bit is offering multiple mechanisms for transport because I=
PMI
> is not the most efficient method to transport (unless you use 64kB payloa=
ds
> during the streaming phase. Even then, the TCP protocols are faster becau=
se
> of round-trip timing (only need an ack rather than a full trip through th=
e
> IPMI command lookup and execution process.) USB is pretty fast, but not
> available for every system.
>
> --Vernon
