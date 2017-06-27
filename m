Return-Path: <joel.stan@gmail.com>
Received: from mail-yb0-x242.google.com (mail-yb0-x242.google.com
 [IPv6:2607:f8b0:4002:c09::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wxgj70LFTzDqRW
 for <openbmc@lists.ozlabs.org>; Tue, 27 Jun 2017 19:33:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="r3gl/iir"; 
 dkim-atps=neutral
Received: by mail-yb0-x242.google.com with SMTP id i80so1075811yba.3
 for <openbmc@lists.ozlabs.org>; Tue, 27 Jun 2017 02:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=S5iqtUJ0frhwVh4nz9gkzl19es+nda7fH1DmdUcNvK4=;
 b=r3gl/iirm63cYKxB5zP0R3fHDurGnYhfSEhybyv7ms0oH/3K0S5mPcOXDetX93DBfs
 PqIvzZ6lzBcNNth5Bjn6byIfwJPcxlKyNN7yQTJPXZeejO0HqiEwWX5I6MiftsUDwq1P
 /KjdRGRIAkDH9326jCBThr9s2OsTAcQNtYvvIdKOt/Abx9xSTBOytmAbAE1YT5jgfKmc
 zaA2ed6ZSoAy8sFQwcxf1Y1MgHX7+gJR6YxS9gX7sFdDyUs7qQh53xAMr4yLiODNav81
 k5blii58ZYZhUQPUKsRHCj4h1zvYDts9g4rc70QddyFu02poU431eLjjMgwLbC0jcZX3
 KWSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=S5iqtUJ0frhwVh4nz9gkzl19es+nda7fH1DmdUcNvK4=;
 b=quI2pHtvxWXgDHuZgcrU022HSLKLUaxCLcSjBm7fXSXfG38ybNPkKfQ1toxOV0puNU
 bpGfvcNn5pv04++UEIsKSTl81OH3+BZua2HIrcKxfxjG8cawEof7GOBbv4zqEENbgVIW
 iLM/6Mo1kt/t+5j4X2B9kVzaraCkgTMCJYxwfkxRK2lI6o0Ob7LxrGma08hGne+QRbir
 5M2Vdg2t2DL5e89GYgej06H6V2c7WRh9eK/Ky0naFHbv38Zj93DSTV5EPwtAPT1fQz06
 8Ek8enx4POuRutftnL0orBmciKlywwqf0iRQ/CZqMpuIgDDP9Sj39ZFMzAxAGwkWByS3
 rsfA==
X-Gm-Message-State: AKS2vOz2tp9LnhOfWh/RbfoPi6kcEuoc7lbh1akW9rrw9rrjEZXnd2fu
 YNJATwJo6MpQ93VwxXsTU9oLcc3VaD1NYbw=
X-Received: by 10.37.83.66 with SMTP id h63mr3080812ybb.169.1498556023639;
 Tue, 27 Jun 2017 02:33:43 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.177.8 with HTTP; Tue, 27 Jun 2017 02:33:23 -0700 (PDT)
In-Reply-To: <f8553d4f-c0b9-5cef-de01-067b313b10cb@kaod.org>
References: <1498262178-27820-1-git-send-email-bjwyman@gmail.com>
 <CACPK8XcDD+0ZCytgx_xWf9L2Q9nW7fQp9pNtE9+285UrnQh80A@mail.gmail.com>
 <f8553d4f-c0b9-5cef-de01-067b313b10cb@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 27 Jun 2017 19:03:23 +0930
X-Google-Sender-Auth: DKZNxILRCBLxely1hnuetJWNBHo
Message-ID: <CACPK8Xf0p6EBNf2G1dhKCeT8KvsTpniVUePpVLYEh2eGw66ORA@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10] Add fan card PCA9552 to Witherspoon
 devicetree
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: Brandon Wyman <bjwyman@gmail.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Tue, 27 Jun 2017 09:33:47 -0000

On Tue, Jun 27, 2017 at 3:43 PM, C=C3=A9dric Le Goater <clg@kaod.org> wrote=
:
> On 06/26/2017 08:16 AM, Joel Stanley wrote:
>> Hello Brandon,
>>
>> On Sat, Jun 24, 2017 at 9:26 AM, Brandon Wyman <bjwyman@gmail.com> wrote=
:
>>> The Witherspoon OpenBMC system has a PCA9552 chip on the fan card that
>>> is used for fan fault and identify LED control. Adding this chip and th=
e
>>> LED lines to the device tree.
>>
>> Great first submission. One issue I found, please see below.
>
> Joel,
>
> haven't you merged the patch defining all the PCA9552 pins as GPIOS ?
>
> https://github.com/openbmc/linux/commit/db30464ee579176abc82d0fe95aa9b9ff=
76d0c3a

Yeah. We have a few PCA955x devices in the system.

There's the pca9552 used as GPIOs for the GPUs that you worked on the
driver for. There's also a pca9551 that's used for driving LEDs, which
is what Brandon is working on.

Cheers,

Joel
