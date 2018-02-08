Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c09::244; helo=mail-qk0-x244.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="pspeltA2"; 
 dkim-atps=neutral
Received: from mail-qk0-x244.google.com (mail-qk0-x244.google.com
 [IPv6:2607:f8b0:400d:c09::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zcV1K6ndPzF0r5
 for <openbmc@lists.ozlabs.org>; Thu,  8 Feb 2018 18:19:01 +1100 (AEDT)
Received: by mail-qk0-x244.google.com with SMTP id p23so4453337qke.8
 for <openbmc@lists.ozlabs.org>; Wed, 07 Feb 2018 23:19:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=lFSSoUgTkxiUXgOkEqbo2rYB0xsJBZrgOoyATC+6BIc=;
 b=pspeltA22RbrSO7z0sFS030oo11VIghKdqDJPz0xjuE97daZI+toZcV0FkqI9tdkuB
 vNe5aRQdpSErAzDJT607xkZ7vfr8En6Mq0sFqjCoVald6zsJPEQ5pBhOBQarjkozMJ4b
 0EBcELxZcxNL0OpQ6RrD5Q38wNek3cfJ+zZLbu3oPU96nCWPVGOJHVglj1MU+lFjsrmq
 XjBpqLsT9OCX9r83BhZUsHUAxx8DEwr5Vl/6H4qe8IgVzAiXWNJYIopOdjIP+Boljk0p
 etL/HXWCTtRm3bw+SZ+QR3ngNkMR3sNF4Z1LBqoRPw86qlTQyN7T/O6GP8RBL2J6//rb
 Xs1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=lFSSoUgTkxiUXgOkEqbo2rYB0xsJBZrgOoyATC+6BIc=;
 b=G6bFrbr8EReH4mNiDTnfhrqNibVUxRnbNvYazyiyYVDd09FRm7r6ooKsqPbblq1eZe
 Di1lHHF5IRiaKQ5w34+f77vb6Ru9vFvv41pLWWvWCwkxpZznPUuAeEIWz+OUG4DjRRFe
 Bn8Pec8xyHhW7zZancS/xi5vuXhjdedZNQHAExfcs1mGxridHhTYtoDuQRBK1Wpi7ezU
 aZM4RsXwIKhEWEjUMtQwS3UwtGW8RCgsOfyNyYFdmj7fYljxRfnFrFvPCgbY4P5m847U
 a4hTFkn/+WPyvXgBtIf+NyRnFN4xylMHj++yefl9wANF/zvr63+OwhFFCkvBVHsfPkV9
 bjUg==
X-Gm-Message-State: APf1xPDX+VT9e3oAm67ihN8HTaNE5H3MZ0yAwMciiZlwWflwfRqNgZND
 ZFJhVlRLNsKJpsE29pVH3M0gWpz19xCSoTJv56w=
X-Google-Smtp-Source: AH8x226jjJsRXklo+JoS6N60e53UA05BK5iGtSoAtb1mk2iITCdZywHefQuygywxDrG7GzuMjlIGxR9Ijm17q2YlM28=
X-Received: by 10.55.133.197 with SMTP id h188mr12339430qkd.317.1518074338612; 
 Wed, 07 Feb 2018 23:18:58 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.200.49.179 with HTTP; Wed, 7 Feb 2018 23:18:38 -0800 (PST)
In-Reply-To: <53d8a2a9-5dbe-6684-044b-8272064a68ae@linux.vnet.ibm.com>
References: <CACPK8XeH9uS7G6_k1JLxfx3678U=Dkk_2SYyQSQuQk8GSJ9-Sw@mail.gmail.com>
 <53d8a2a9-5dbe-6684-044b-8272064a68ae@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 8 Feb 2018 17:48:38 +1030
X-Google-Sender-Auth: z5tJS3hn-Hvpa-ltz5B_nau6q4I
Message-ID: <CACPK8XeBU3L_Z9PiHrKdeOd414OUGtS7q9tDZ9a4-k+HcGNK-A@mail.gmail.com>
Subject: Re: Outstanding FSI core patches
To: Christopher Bostic <cbostic@linux.vnet.ibm.com>
Cc: Jeremy Kerr <jk@ozlabs.org>, eajames <eajames@linux.vnet.ibm.com>, 
 Andrew Jeffery <andrew@aj.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.25
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 08 Feb 2018 07:19:02 -0000

On Wed, Jan 31, 2018 at 7:48 AM, Christopher Bostic
<cbostic@linux.vnet.ibm.com> wrote:
> On 1/30/18 12:04 AM, Joel Stanley wrote:
>>
>>   https://github.com/shenki/linux/commits/fsi-next
>>
>> I sent out the no-scan-on-init patch today for review by the device tree
>> people.
>>
>> The rest have all been reviewed in the past. I intend to send them out
>> for Greg KH to pick up on your behalf. If you have any objections, or
>> would prefer to send them yourself, please let me know.
>
> No objections from me.  Thanks for taking care of this.

Thanks Chris.

>>
>> Christopher Bostic (3):
>>        fsi: core: Reduce console output during normal scan
>>        dt-bindings: fsi: Add optional property no-scan-on-init
>>        fsi: core: Add check for master property no-scan-on-init
>>
>> Eddie James (1):
>>        fsi: Fix one and two byte bus reads/writes
>>
>> Jeremy Kerr (6):
>>        fsi: Add fsi_master_rescan()
>>        fsi: master-gpio: Add locking during break and link enable
>>        fsi: master-gpio: Add external mode
>>        dt-bindings: fsi: Add specification for FSI busses
>>        fsi: Match fsi slaves and engines to available dt nodes

We need a fix for this one as it breaks the build when OF is not
enabled. I will coordinate with Jeremy and send out the series on
Monday, after -rc1 is tagged.

>>        fsi: master: Clarify master lifetimes & fix use-after-free in hub
>> master

Cheers,

Joel
