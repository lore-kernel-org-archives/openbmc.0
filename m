Return-Path: <joel.stan@gmail.com>
Received: from mail-yb0-x233.google.com (mail-yb0-x233.google.com
 [IPv6:2607:f8b0:4002:c09::233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xCg3v4XBbzDrCy
 for <openbmc@lists.ozlabs.org>; Thu, 20 Jul 2017 13:53:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="TUcuu2Vr"; 
 dkim-atps=neutral
Received: by mail-yb0-x233.google.com with SMTP id v129so1086014ybv.5
 for <openbmc@lists.ozlabs.org>; Wed, 19 Jul 2017 20:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=sTglC2u4OpIcmzZBBZfgs35SiOiGAR3STSZbySieNfA=;
 b=TUcuu2Vr+bH918YoRPzg/4y37eKOPgfDZkVgzCaHcg+kY4zSD1n+zUPrl6kEmALVdt
 0qOoC490xcyp46YjhRnl7XwzSzjzE5AISHJX7KQhdDg08wfolzvdazc3OvMoBGGESdxN
 FVKsKowWePzvZyzufxpywWEac2tWzoUNZX5Qur3eOWd69SWgCrAQxedJ75oe5Ay0fFeO
 w4n7lYpNgTZrtkliO1YuyuGe0UGhl/n5gCya675SB2H/B7NgkVuVu1UD6MfoaIg1q7Kt
 4xSUnleI7MreennXFRQ66FDJgB10NJR6ZDovk8RzcljxVDXpYOCuV9FBvawW7Ti3xxBv
 5b0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=sTglC2u4OpIcmzZBBZfgs35SiOiGAR3STSZbySieNfA=;
 b=EQC5eaZW1WO40DrxqdcXRg242PNjwOVSta0yoDN74svHoqfKGZPgUmdGc1yQXa9yWQ
 9En5VqsdogMH9ugJ/iBeYaJKp176BC1knwdO0wrLbdEvrx6j1rm9kWKn7HRPJ+fEdtRg
 JZEfMgM5O05OMooWWtB9ySLHspHGhtuNAzFh6880LlftJRnzEsJcvwOSPeBVKOJ9gz6a
 whmP78iRTnofTxUclNPogNvSS+9Ar9jJUifBLFkFnmxcs/kdfgPM5tLfAtK9YL0qN4zj
 Rm8WNDdO0gThJ3Y5Ej1ncCokswRjiBLHSKDLqdnfwklVzrcnuzuNrryOzXQnfTnHaUa8
 CdJg==
X-Gm-Message-State: AIVw112LSbBw49/Mt+KaBLpHK+aqNUEunG21VCCcx6uJhJFQKydqSHkF
 bZJ6LP/QmS5aNIkXibC5vOtlYC2WluDV8Ck=
X-Received: by 10.37.230.141 with SMTP id d135mr2029116ybh.281.1500522808666; 
 Wed, 19 Jul 2017 20:53:28 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.170.177 with HTTP; Wed, 19 Jul 2017 20:53:08 -0700 (PDT)
In-Reply-To: <c1102639-5e4c-fd43-f941-e676560a2590@linux.vnet.ibm.com>
References: <20170718204324.32945-1-cbostic@linux.vnet.ibm.com>
 <20170718204324.32945-2-cbostic@linux.vnet.ibm.com>
 <CACPK8XcGBH8NOu0BvpmWarJKaD5nG+jUhVz7fFpamx-oX_fBHA@mail.gmail.com>
 <c1102639-5e4c-fd43-f941-e676560a2590@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 20 Jul 2017 13:23:08 +0930
X-Google-Sender-Auth: 3ZTAufyHM25JLKpNbu-jyT8qKGk
Message-ID: <CACPK8XfXagO06-o+p6vC6093kqRamhfhogV=Tx7NVabis5=VVg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] ARM: dts: aspeed: Add gpio-keys-polled for fan
 presence
To: Christopher Bostic <cbostic@linux.vnet.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Thu, 20 Jul 2017 03:53:32 -0000

On Thu, Jul 20, 2017 at 1:24 AM, Christopher Bostic
<cbostic@linux.vnet.ibm.com> wrote:
>
>
> On 7/19/17 4:28 AM, Joel Stanley wrote:
>>
>> On Wed, Jul 19, 2017 at 6:13 AM, Christopher Bostic
>> <cbostic@linux.vnet.ibm.com> wrote:
>>>
>>> +       gpio-keys-polled {
>>> +               compatible = "gpio-keys-polled";
>>> +               #address-cells = <1>;
>>> +               #size-cells = <0>;
>>> +               #poll-interval = <100>;
>>
>> Are you sure that this needs to be polled this often?
>>
>> We should consider how much traffic this generates on the bus (how
>> often it is contended), and how that fits in with other devices on
>> that master. If you've done these calculations then please amend your
>> commit message with that information.
>
> Discussed with Brad Bishop and Matt Spinler - agreed to increase period to 1
> second.

Okay. You forgot to add this to the commit message.

Cheers,

Joel
