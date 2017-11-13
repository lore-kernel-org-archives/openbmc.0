Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4010:c07::22a; helo=mail-lf0-x22a.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="HnBKS8Ua"; 
 dkim-atps=neutral
Received: from mail-lf0-x22a.google.com (mail-lf0-x22a.google.com
 [IPv6:2a00:1450:4010:c07::22a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yZrVn0r3LzDq78
 for <openbmc@lists.ozlabs.org>; Mon, 13 Nov 2017 11:05:04 +1100 (AEDT)
Received: by mail-lf0-x22a.google.com with SMTP id a2so16433273lfh.11
 for <openbmc@lists.ozlabs.org>; Sun, 12 Nov 2017 16:05:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=qPIJcHr+5PFlKjeRkOTy7XHI+gFJ+bZ2TmD+9gJ+gds=;
 b=HnBKS8UawJZuPC+fH9psUm83sH/Cxr7uTQ4sAQrhfy2/DirCi+oBR5Ga4zEMGc+M/C
 ETFZVE/2LFhgak90f8YLUsM1PoSvyekEJtpKrZtfSggAQd1Ukl0d7UHfVHp4PMcCDzGX
 5YwWWpiHNvGVa+BSEVilJcBJJ9LgL3KX4tY6bfVnHoZeBbg4lEE9h+Sn54f/wTDN5JzO
 mTrNn/+HicwheoM+JpdlBO4cNV/1OueyAWso/9L4nn000ehh8jpgpxN7s1vz+EKI9xWJ
 YpyTp6PoGUyoeayvYKXdPii/XgII/Rq4OqTPy4OsEcQ2+PXYlIGz/zUH0UQ6A8aOGFFr
 OlFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=qPIJcHr+5PFlKjeRkOTy7XHI+gFJ+bZ2TmD+9gJ+gds=;
 b=kvQ2b9oNwJwhbeW/SSNs2o6s4W5QzZfIf5Id9MMLpCxz+ok/NEP15Jg+oQ4ttU8Gfk
 SYdKtO7Vz01/7g2v1XtavKD0OazhmSy2PZdyzRgPww4ZN+ftS6rfOPL8Cd81osJY9t3V
 R0Zt/Z9Vt2BdRL8TKqe8wqfvraCnCH2bJrY1q5115rzz9Wtp+zZkH4JQCfQPYBrrBDQY
 OdTbkwbhW5+nRVyx/3BbzC9wAQeksIDMthS89XqkPIOvLhQtnr1V0Eqn545uwD6RJvZt
 RegmtQw4mfn1o1laKvSqHadpHNwmNkMWgNbIroz8wkk7yp1Z3kKI/Rq7IY9BPPv0nvW6
 J7JA==
X-Gm-Message-State: AJaThX51fm4SgRkx3fze+rc0cV2QAxM41chR1dFB/oG3JrX1t1rOA4P6
 xbiNTrSONliWBSswkOoN9dp2TzInu8qILV3IkRo=
X-Google-Smtp-Source: AGs4zMYLAJHFU4JtKsxqLyWKE4ieVym9jVyYiBxR5Gvo23LbYGeZhVMXOZqrBoeB1SKqP5yTT2N8hw/uLaWe72cykyk=
X-Received: by 10.46.64.82 with SMTP id n79mr2800659lja.129.1510531500290;
 Sun, 12 Nov 2017 16:05:00 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.25.155.4 with HTTP; Sun, 12 Nov 2017 16:04:39 -0800 (PST)
In-Reply-To: <CAARXrtk4bb33pS3MPE58dkx1N+QUjhtm-fvfKEKkV+eTZLODsQ@mail.gmail.com>
References: <39E6480C5A587146BAA4D885C7BCF7EEC6AA69BA@IEC1-EX2010-MX4.iec.inventec>
 <CAARXrtk4bb33pS3MPE58dkx1N+QUjhtm-fvfKEKkV+eTZLODsQ@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 13 Nov 2017 10:34:39 +1030
X-Google-Sender-Auth: rZJRiWxP7gque-r9nUwAInZ_uSU
Message-ID: <CACPK8XeLABuZwhCij_oHe11QNb_pRcBtLShgWMbb9DM0w8zhaA@mail.gmail.com>
Subject: Re: Create new platform for arm system
To: Lei YU <mine260309@gmail.com>
Cc: =?UTF-8?B?Q2hlbi5LZW5ZWSDpmbPmsLjnh58gVEFP?= <Chen.KenYY@inventec.com>, 
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Mon, 13 Nov 2017 00:05:06 -0000

Hello Ken,

On Fri, Nov 10, 2017 at 1:30 PM, Lei YU <mine260309@gmail.com> wrote:
>> Could anyone help to review this structure and tell me how to separate this
>> code will be good to reviewer?
>>
>> As I know, the kernel patch should not in machine file.
>>

I am the maintainer for the OpenBMC kernel. We would be happy to help
you get your changes into our kernel tree, and from there upstream.
Where possible we will ask you to submit them upstream first.

Do you have a git tree with your changes published? If so, I can take
a look and make recommendations.

The kernel follows a similar process to the upstream kernel
development process. We ask you to submit your patches to the mailing
list, where they will be reviewed and then merged.

Cheers,

Joel
