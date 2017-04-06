Return-Path: <peterh@google.com>
Received: from mail-io0-x22f.google.com (mail-io0-x22f.google.com
 [IPv6:2607:f8b0:4001:c06::22f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vz54n10QBzDqKL
 for <openbmc@lists.ozlabs.org>; Thu,  6 Apr 2017 11:40:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="RQUPsB5C"; 
 dkim-atps=neutral
Received: by mail-io0-x22f.google.com with SMTP id f84so21179063ioj.0
 for <openbmc@lists.ozlabs.org>; Wed, 05 Apr 2017 18:40:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=Lsmuj/dO15YjWW/cVCDfHZ2EbxmjLSUrUe57PB5SKvw=;
 b=RQUPsB5CcuSjjtJUg8N2Tf295QUy5AuP7WkA/iEhSP4zyaxbcPTgEdmBK7+g+kwxm0
 FK45HIgvmqSS2CxRV+aky3YZxifKVJZyGbBTS34ODgxV3TDkbK/2vbTDJZTHwrQ9lhLk
 UaxtYUVLLTgfAy0SpsVi2ttUtKUtIfFOV1o2niSModTChCkXV9rkVEroBYr48F7GUdv5
 sAOADaVu2R97sWoBSihZUu0GC42Je06ToQKrDTVHRuaExamZptO+iyzsdfPKPckSCWVK
 0w7NomGH5SXHW8MldfTcrNT5pFAWKweOZR0AuYL4/8f4jesfrFB9eZm1djv484EAceqs
 zfPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=Lsmuj/dO15YjWW/cVCDfHZ2EbxmjLSUrUe57PB5SKvw=;
 b=msDTykfxTPdevZINGoPtAfdl3rAIWhQSjkW6eVIcMtZg1JDyxSIGovAQF2g9D1q5Cu
 hwyp+KPFHpggcoBGnSAGcn6g3PjMJ5qFnCJF8Q80Yat9LholhBCiWxcIMZF79xaT/1To
 sr9yuP2riQNGGVrTSB+23T2KyYF2xHtHwwmT4AeNRyKBhcZFqWgaJ2LCWEbJYJSFto/z
 recMLXWf5L5ffv/+0PZtxIbh4g3spX+dwC2Dh5kj/wtaGq5DbtuWpDkXKHRccFUjw1aW
 +00ApsPTOOOhqd4e2sLrk0vIcZT5vOlik6xOkOYDaPd+eVDNYOy81V432sl1rMtKsKGg
 UNCQ==
X-Gm-Message-State: AFeK/H166UuDlmPca5Aefa/A31Y0dpewMCDEfIHj2NwGp/eT8nRSFFVwwkWTLzGyOeN5Atm+RCXHSl4rSOSSIcsK
X-Received: by 10.107.6.13 with SMTP id 13mr30981825iog.72.1491442822141; Wed,
 05 Apr 2017 18:40:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.36.84.202 with HTTP; Wed, 5 Apr 2017 18:40:21 -0700 (PDT)
From: Peter Hanson <peterh@google.com>
Date: Wed, 5 Apr 2017 18:40:21 -0700
Message-ID: <CAPozSNp_S_-N8YV=ruAzYVxWy4FgcJvyK27HFb0YL-mNYP22xA@mail.gmail.com>
Subject: Plans for BMC i2c to host bridge via IPMI
To: OpenBMC <openbmc@lists.ozlabs.org>, gBMC <gbmc-team@google.com>
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
X-List-Received-Date: Thu, 06 Apr 2017 01:40:25 -0000

Ave!

This email captures proposed actions from an exchange earlier today on
the #openbmc IRC channel.

Basic goal is to reach devices on a BMC I2C bus from IPMI commandline at host.

I2C commands and responses to be carried as OEM extension messages,
i.e., Network Function Codes 2Eh / 2Fh in the Intel specification.
Those message forms require a three byte IANA Enterprise Number, and
our original plan used Google's code.

We would like to carry the feature in OpenBmc, so I wanted to confirm
if this is acceptable, and/or what modifications would be needed.

Decisions:

1. Ok to use OEM extensions. Patrick noted that OpenBmc already uses
some, albeit under the IBM IANA Enterprise Number.

2. Switch to OpenBmc IANA Enterprise Number when available.

3. Patrick proposed to create a new phosphor-ipmi-oemproviders repo to
hold the code, message documentation, etc.

4. All uses of the OpenBmc IANA shall be enumerated in place - almost
certainly an include file in the new repo - so we don't end up with
conflicting uses.

Actions:

A1. peterh: send this email to the mailing list.
A2. stwcx: request IANA Enterprise Number.
A3. stwcx: create new phosphor-ipmi-oemproviders repo.
A4. peterh+brendanhiggins: propose detailed message designs.
A5. peterh: {net-ipmid,host-ipmi} += support for these commands.

A key point of this email is to reap your collective wisdom, so please
if you have something to contribute, please do. In particular,
Patrick, please correct anything I misunderstood or incorrectly
extrapolated from the chat.

  -- peterh
