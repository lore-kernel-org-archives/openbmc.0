Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4010:c07::241; helo=mail-lf0-x241.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Uff7jQ5C"; 
 dkim-atps=neutral
Received: from mail-lf0-x241.google.com (mail-lf0-x241.google.com
 [IPv6:2a00:1450:4010:c07::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ygF5d3zy7zDrT9
 for <openbmc@lists.ozlabs.org>; Mon, 20 Nov 2017 14:47:01 +1100 (AEDT)
Received: by mail-lf0-x241.google.com with SMTP id f134so8463665lfg.8
 for <openbmc@lists.ozlabs.org>; Sun, 19 Nov 2017 19:47:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=gzVV1+c/LODtBvSWYQnlsWejQUzLLdP6zXKcCK1h2L4=;
 b=Uff7jQ5Ci7YAMJqMR29+DhXOK12IbaBzql29Xk+/FimP4ofcMS9N/Ei6MNHrGJa8cL
 XFwxoG5tASJLgojwLCE/a1y3eeqhdEYlTsDz2yvs3O8Ane7QrU/h8uCVGe92vly8+mvd
 MftebsZ8QGe0PEu/mSPpORANlnf96pPbaqB4XZt0dvU+qRFsXeccjWDiNV9hG1zTDR4Q
 l1vUg8rMJteT9Yfy5C8FIwNCWseAHA2orqUSOXjEaWy47hFPv6Hd4AkRfMOeJszVBpam
 Tjja8til/vRD5+3Ti3jBewKZDCdy2QZnAGuxxa5/WEcO1NYzJzUAJRJWd6509jgJei0y
 GG2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=gzVV1+c/LODtBvSWYQnlsWejQUzLLdP6zXKcCK1h2L4=;
 b=rWpWbGoJOCcb3hFOm1BLiIlO1SfYrB6wozCx+imPWGhbid1dMwQw+rEoUsr4TPZAPa
 1YJyGM31tMMcO0VKw/mkbzU40GMryshsI6IXefpgEDd2XTbEw9EEgV4+NHkq1wUm4v5y
 7qVKeh3rSYLyfZzku/R1xMskeuh2nwY6xMtZo0UiJS7TJt2zbxwb87WamaLHns/bjP5/
 HNCehcIKwkrIH+OZA0Zc1u0wnhNhgqIFhIjod+IiO5FvcR2z3LKzE1ziLLd10QXm9l2g
 Wf0gPkQk8RnEMOKmJ8dQrYEWUrd6llQuc9raMnwvF7ehH3WShVyK42WOWnTgvpRaWaXY
 Q+2w==
X-Gm-Message-State: AJaThX6kpfVkOB+3y0XLchGyaeKCp2jbwKFkbh7dgt+ewS/nbj7h8/iu
 ZKwjJahBs/ZoPr5Ta+RYkw++1ST2Uu9hHgO8L7A=
X-Google-Smtp-Source: AGs4zMYyuE7IU54gxscS2BCVbUOAlJn4nn9jsfxGaXZ5BujrQDmdgi5ZUeASg0FT8jSwzPkKKivQsqAjaLdjqOzviWA=
X-Received: by 10.25.87.12 with SMTP id l12mr3043026lfb.111.1511149616488;
 Sun, 19 Nov 2017 19:46:56 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.25.155.4 with HTTP; Sun, 19 Nov 2017 19:46:36 -0800 (PST)
In-Reply-To: <e72e3ba8-2948-e9c1-39c2-e7c674e9115b@linux.intel.com>
References: <595016cc-32ac-c0fb-43fb-ecfc5cd45989@linux.intel.com>
 <CACPK8XdCXhaZ3gsX3V5PMu1OHD1AtbZHe+C-a4+qrSxZiufang@mail.gmail.com>
 <e72e3ba8-2948-e9c1-39c2-e7c674e9115b@linux.intel.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 20 Nov 2017 14:16:36 +1030
X-Google-Sender-Auth: lCApotMTD6EKMGppUxgpZhhp7pQ
Message-ID: <CACPK8Xe7VyCDg+Enm6s4W68TQAz60SUf+tqqD2-qG1Djnerecg@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10 1/1] Rename aspeed-bmc-opp-flash-layout.dtsi
To: James Feist <james.feist@linux.intel.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Mon, 20 Nov 2017 03:47:02 -0000

On Sat, Nov 18, 2017 at 3:59 AM, James Feist
<james.feist@linux.intel.com> wrote:
> On 11/14/2017 04:39 PM, Joel Stanley wrote:
>>
>> On Wed, Nov 15, 2017 at 6:04 AM, James Feist
>> <james.feist@linux.intel.com> wrote:
>>>
>>> Rename aspeed-bmc-opp-flash-layout.dtsi to openbmc-flash-layout.dtsi
>>> as this file is not open power specific.
>>
>>
>> Looks good to me! I'll give others a chance to comment before merging.
>>
>>>
>>> Signed-off-by: Feist, James <james.feist@linux.intel.com>
>>
>>
>> Hrm, why does it put your name like that? Can you correct your gitconfig?
>
>
> Will do, let me know if you require a new patch. Will fix for future
> patch-sets.

That's fine, I can fix it up when I apply.

However, I was unable to apply your patch:

 Applying: Rename aspeed-bmc-opp-flash-layout.dtsi
 error: corrupt patch at line 173
 Patch failed at 0001 Rename aspeed-bmc-opp-flash-layout.dtsi

I notice this patch has some strange whitespace. I suggest you use git
send-email to post patches to the list, as this stops your email
client from breaking things. If you really don't want to use
send-email, please take a look at the information here:

  https://www.kernel.org/doc/html/latest/process/email-clients.html#email-clients

Another nit: convention is to use some prefixes to indicate which part
of the kernel you're using. Take a look at what others have done:

$ git log --oneline  arch/arm/boot/dts/
67f0843b79e7 ARM: dts: aspeed: romulus: Fix identify LED
6b6e0a3593d3 ARM: dts: aspeed: romulus: Add aspeed fan tach
75c4ae797517 ARM: dts: aspeed: Use new occ-hwmon driver for P8 systems
53bc8cfca31d ARM: dts: aspeed: Add aspeed-lpc-snoop g4 and bmc-quanta-q71l

I'd suggest something like: "ARM: dts: aspeed: Rename OpenBMC flash layout"

Cheers,

Joel
