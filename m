Return-Path: <mine260309@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4001:c0b::241; helo=mail-it0-x241.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="uaWmfBUD"; 
 dkim-atps=neutral
Received: from mail-it0-x241.google.com (mail-it0-x241.google.com
 [IPv6:2607:f8b0:4001:c0b::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40scf10NdfzF1fl
 for <openbmc@lists.ozlabs.org>; Fri, 25 May 2018 17:03:04 +1000 (AEST)
Received: by mail-it0-x241.google.com with SMTP id q72-v6so5629768itc.0
 for <openbmc@lists.ozlabs.org>; Fri, 25 May 2018 00:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=uPkTBXKUoav9Fs6PX+nM9IeXol27DMybN2CziGeqor4=;
 b=uaWmfBUDb/aah9OgNsd/WGBPra/Wb1GBFeTzlW1l4WMBHHujL6Up6En75VD/tREFf6
 iDYYeJ98LNvqq9Np72hWojakXlFXIQ6V4GWda6aOXrPPVTKx4AaldDMX6YaU27UiUtdK
 WOxa2T5jLsqgLVJ2ntV9/BYU0T1Pb3gp/ImlxJttNeI9LqaMItiB5Afc5n8etWDS8UKh
 Besx9bM4GmrWBZHf8NCoNZpEXtIOO7+4/KpYxf0XgAUHFMbADV2p4qyuss45cG/ddaBp
 lr50XbEOAnjygWCxuMO1Ea8lbR7HbOudy1UGi9Xtz8DdDiLG1mi4HD2o92bfREh5Q/Y0
 gJGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=uPkTBXKUoav9Fs6PX+nM9IeXol27DMybN2CziGeqor4=;
 b=d5BmBsG0y+hSaXR/ZEcGc3Ltl7tavft5N3X2Z2xHrI8QbyBUjgZbV4uJhaJiSrU5zl
 4cl7L+HNpZW2vpCcmMrac61kFGZk6VQeODc2/5xb1NinQwRRN+GqYa7jEZDAlzOmbxFZ
 KHjEgiFcyrbRiatYhYgNP5lAaYJ2+suM63Efp3Vyx5SXDtL5SBmNBvsjNrXNv96Mm1h5
 v1Q/LIusMiCCA3OXSTWtX+I8Z1c4ECsJZCbKxKIQsjEoFv6Qpv7DDCgR3WYdUcazCuls
 kykqiBKEFC4BusFmjU+zLTCIb0sOsy5wvWsMKTOjvNz16IRA7k637p24dJGMW24/WZck
 kmhg==
X-Gm-Message-State: ALKqPwd6DFn4S+LOaOBQqP6FNL16icaLfsQQ9HhyOV6bT5BphP7igeLM
 uL1CkUYBRK6ynQN2cZf106ZVtV2VTytll+4NgJk=
X-Google-Smtp-Source: AB8JxZqky+EbrNi4dQVsxKe8peBBW+FMwBtKBP7yvnFUZ3QlTUJ4xbk43QGQmiWedP5txOojJeZYs7YsNeEoPEKTxFs=
X-Received: by 2002:a24:e08f:: with SMTP id
 c137-v6mr951590ith.114.1527231781894; 
 Fri, 25 May 2018 00:03:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4f:558a:0:0:0:0:0 with HTTP; Fri, 25 May 2018 00:03:01
 -0700 (PDT)
In-Reply-To: <e852980c650798a5b6b431324d9918a4@linux.vnet.ibm.com>
References: <874lm8pjd7.fsf@linux.vnet.ibm.com>
 <e1431b039c817b23b49b6f5833760152@linux.vnet.ibm.com>
 <CAARXrtn6M=tzE-yMJWN4yaSHZJUYksMT=vMvVymY0kvgQJ4bfQ@mail.gmail.com>
 <MWHPR21MB0864432C6CB8EF9A575589B0D6930@MWHPR21MB0864.namprd21.prod.outlook.com>
 <20180516160209.GB105329@mauery>
 <CAARXrtksFbirzq70cLzvWRcxKxOT9rGYKPMa-+UQcMpvx0=ycw@mail.gmail.com>
 <435d4ae31bb1d8c4c06ec95cca51b5d2@linux.vnet.ibm.com>
 <20180518210254.GC105329@mauery>
 <CAARXrtnTfgsFNvB4UTBw0_3QodeuCdmG51kAbtdEAMBffffsFQ@mail.gmail.com>
 <20180522153024.GD105329@mauery> <20180522182824.GE105329@mauery>
 <e852980c650798a5b6b431324d9918a4@linux.vnet.ibm.com>
From: Lei YU <mine260309@gmail.com>
Date: Fri, 25 May 2018 15:03:01 +0800
Message-ID: <CAARXrtkuy5vugFJd7BtLwha1L_OQb3ptXxM3dOSh36zwpm2JxA@mail.gmail.com>
Subject: Re: BMC Image Signing Proposal
To: Adriana Kobylak <anoo@linux.ibm.com>
Cc: Vernon Mauery <vernon.mauery@linux.intel.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 25 May 2018 07:03:06 -0000

On Fri, May 25, 2018 at 1:12 AM, Adriana Kobylak <anoo@linux.ibm.com> wrote:
> On 2018-05-22 13:28, Vernon Mauery wrote:
>>
>>
>> One other thought I had was that we could make the manifest a JSON
>> file which makes for very simple parsing (since the parser is already
>> written).  Then we could go with something like this:
>>
>
> That's a good option, at least for the write to flash piece. We could
> even extend the manifest to include the names of the service files to
> delete/clean up the flash. Most of the rest of the code manages the
> D-Bus objects so that'd be common with all flash layouts.
>
> Another option, or combination with a json manifest, would be to have
> different repos or different subdirectories for specific implementations.
>
>
> Lei, thinking we could convert Romulus to ubi, and use the PNOR chip
> to store the alternate BMC version. I think that'd be more straight fwd
> and the advantage would be that the interfaces are tested and verified.
> And on the side we can continue this discussion on how to make the
> code more modular to support other layouts and we can start making
> the changes but at least we can get Romulus using signature validation
> in the mean time.

By default Romulus has a single 32MiB for BMC and 64MiB for PNOR, there is not
enough room for Romulus to enable ubi with alternative BMC.
So I am afraid that it can not enable ubifs.

But I do have enabled image signature verification on fixed layout and tested
on Romulus.

The related changes are:
https://gerrit.openbmc-project.xyz/#/c/10765/
https://gerrit.openbmc-project.xyz/#/c/10801/
https://gerrit.openbmc-project.xyz/#/c/10768/
https://gerrit.openbmc-project.xyz/#/c/10800/

I have tested on Romulus that:
* Code update successful with valid image, both REST API and in WebUI;
* Code update failure with invalid image (signature verify failure), if
   FieldMode is enabled;

I you think that is OK, we can merge the changes, as it adds the new features
(code update and signature verify in phosphor-software-manager) without
breaking existing services.
It could be a start point for phosphor-software-manager to handle both ubifs
and non-ubifs.

Then we can continue to work on enhancing/refactoring to make it more generic
as Vernon suggested.
