Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4010:c07::232; helo=mail-lf0-x232.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Oag1hj1v"; 
 dkim-atps=neutral
Received: from mail-lf0-x232.google.com (mail-lf0-x232.google.com
 [IPv6:2a00:1450:4010:c07::232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ytHq11SQMzDrpX
 for <openbmc@lists.ozlabs.org>; Fri,  8 Dec 2017 14:27:41 +1100 (AEDT)
Received: by mail-lf0-x232.google.com with SMTP id f20so10460233lfe.3
 for <openbmc@lists.ozlabs.org>; Thu, 07 Dec 2017 19:27:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=GOt8L/mmAB+ckV4W72/zAbADHrD7FnpIY9dllefi7Aw=;
 b=Oag1hj1v/x96/sHwiq04RursKQGI9A6S2xL2dg63w150QyotK1rH89l5fgF2S6WsI4
 he4DsH4xsD7CUVwQoJ0b+Io1gBFpv5rDNbDpsV/IggjjbKTsJt6st2OHc6vrQH7e9XVp
 /qU9512HnDJ2ey4So1Witcg+3W7QzPrzvqSb9QgytYnFTXVdXniKaabefuDFRmC3CnRb
 74hFIlEYmLp8sMF9usJbStLZYsLGY4A5Jkdg298VDEuFJtV2Gl6KVkJnwrjVSpm4w+BU
 9JArG+ULUvN7bhOPt1voCwx8u+qoFc5iAdQt4+21Y3Js+ltR3TUff5EaLfLSmk7sz6Py
 Wndw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=GOt8L/mmAB+ckV4W72/zAbADHrD7FnpIY9dllefi7Aw=;
 b=OKLrQWLP/tY8cVFudJCzpv8Yg/aQZoBYkcrgS1Bgfj+9sUq01f8a662F/p9vev1yVB
 8YxzK6M+x5HQkG34eYrlYRWRF44x0fUiK1uoLYTydYpUhoVWZlCBJl4ec09QCF/AUpU5
 7vvQkFHNQt/mIvxn8qGR6906fuUEDuexp7CcgrakRHLzflp+vq0hgboUYeOvr6EGIPi3
 pMu5FvnY7txpDvj3wR9T4t4jSuHINKLt3vGtfEo5vZ4vljCZo4AFj+WJb4oGlGZqcFz0
 B5lswAlgNPLz/zskJWnygmlKb6MkSJ5frl4W9uGTTgRwUOvCgJ4Zu6W0QDNrmW6zewk3
 V98w==
X-Gm-Message-State: AKGB3mKNKi4meWRI4CI1bo+Ll6TokVDteblAd2Y5rlqBnPdSudE/jtqi
 DGJAn1xk7qSDoYpd1oVZavCG9+3TWqGsod8jA+0X0Q==
X-Google-Smtp-Source: AGs4zMYWIOKEVG/cMhRgXZkkpGawEK+LPk/w8FwlMD8JCtR/P4ya/lUQmdTd3eWIM0ujzsoaUXGoa+0Cs+BAuxHegDc=
X-Received: by 10.46.64.6 with SMTP id n6mr2749468lja.129.1512703658100; Thu,
 07 Dec 2017 19:27:38 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.25.155.83 with HTTP; Thu, 7 Dec 2017 19:27:17 -0800 (PST)
In-Reply-To: <944d4309-19a4-ab99-fd58-ae6a36964ff1@linux.intel.com>
References: <1511897285-23022-1-git-send-email-james.feist@linux.intel.com>
 <1511897285-23022-2-git-send-email-james.feist@linux.intel.com>
 <CACPK8Xe9Uk3jPi3L6XR9SmXdU9Z7NZHSaYJdbPt-z5aQVV-_YQ@mail.gmail.com>
 <944d4309-19a4-ab99-fd58-ae6a36964ff1@linux.intel.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 8 Dec 2017 13:57:17 +1030
X-Google-Sender-Auth: JInCGcQojEgsAxq6rMZEPFtd18c
Message-ID: <CACPK8XeH0rsaxvt=6H0GUO0fkVwq8FUTTf-wa4DCBHasjukYXQ@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10 v2 2/2] ARM: dts: Add Wfp BMC Machine
To: James Feist <james.feist@linux.intel.com>
Cc: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Fri, 08 Dec 2017 03:27:42 -0000

On Thu, Nov 30, 2017 at 3:29 AM, James Feist
<james.feist@linux.intel.com> wrote:
> On 11/29/2017 01:20 AM, Joel Stanley wrote:
>>
>> On Wed, Nov 29, 2017 at 5:58 AM, James Feist
>> <james.feist@linux.intel.com> wrote:
>>>
>>> Wfp is a Intel system with an Aspeed ast2500 BMC.
>>
>>
>> Is WFP an acronym? It would be good to spell it out in the commit message.
>>
> It is not an acronym, it is a short name to describe current generation
> Intel boards.

Okay. Can you please update the commit message with this information,
and the long name?

Cheers,

Joel
