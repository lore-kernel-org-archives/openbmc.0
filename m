Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x241.google.com (mail-yw0-x241.google.com
 [IPv6:2607:f8b0:4002:c05::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xCB9t5kSXzDrV5
 for <openbmc@lists.ozlabs.org>; Wed, 19 Jul 2017 19:12:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="ehp+Xxg5"; 
 dkim-atps=neutral
Received: by mail-yw0-x241.google.com with SMTP id v193so2308772ywg.0
 for <openbmc@lists.ozlabs.org>; Wed, 19 Jul 2017 02:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=MkDd2YPiwgyQnF1cWcp0HZCW8MdODXO/3wyL/dxyaNo=;
 b=ehp+Xxg5k8ENoVTac4lPqwl0UcWQWhQ2t1rGKBz2TneCWb3h3WIjBnt0sFlBwBo1TP
 ixMEb0Dv56O2lLw5W7AtjJjN46SSmnpXQVuW7kmkHmm5KxMOkfaoqSWXuuLbZ3uZ+Kcy
 a3Tysi9lJwBaLN3xu7hARNs8I85k3Dgy4CVRYmWM282gS8QlkgpJxACEolc2XVVHnjMw
 ZDaOFfJ6ZjxUk5WJAkcaQli0yxuoZhWKmB6yBEsUQ9KNGLNV1DP3JVFyZCoetRCZSKyR
 GRlfpvF8LCshHF3g/ANujRtGVdNnx3nMOY89cSpnC6c11heRl8WnhElhQZTBmZbr7a/1
 a6aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=MkDd2YPiwgyQnF1cWcp0HZCW8MdODXO/3wyL/dxyaNo=;
 b=hzFXkPPpRJS5rFH2f8ydnHVGXu0ZXfERCfj1jL3D8Xr430x4Hpfq7e6fQ4LmqJvji8
 McfRAOfGzBkml6Uju8DPS8Fkd8h6OVkUxw24QWqcD+8o2y3QdQbywMCH41PYGbj1hIhK
 KApyVL6xrCo7eVPrWpDynC4KpL1BeHtCrGmKJN5+sVFOdJJJlZYqOU8qE5Q1T//j2HOS
 Nt02m6I1Jfu7RessNda//3bh6O8tVTXHN51XQQ2eqGNsG+d+WXCBJE0tdMOZ+6deHiah
 ufDDVh4Cj3n68s6oe0ZgpCwquyCmyXpJyRZxJjnGeno/5IbG7aQqXMZqq0NxVP/F8jQU
 6Xzw==
X-Gm-Message-State: AIVw113Sq8Fn8iiSpw2Si1W055D9PE44A/AWI9B+N1oE9t4AbrGc7nO/
 wIIOB8r4N5tJdx7vBplbjb5MJlY/Ng==
X-Received: by 10.129.164.77 with SMTP id b74mr1299820ywh.235.1500455519230;
 Wed, 19 Jul 2017 02:11:59 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.170.177 with HTTP; Wed, 19 Jul 2017 02:11:38 -0700 (PDT)
In-Reply-To: <CAPH-5w4TQnpAby2q2nFi58iCUtB9c07mHx+nOHdAN4676OtN4w@mail.gmail.com>
References: <1499889964-23262-1-git-send-email-eajames@linux.vnet.ibm.com>
 <CACPK8XdMbJsov9o-OWHNw8RPwXSJgMuVrdouT5w8zQAne7omkQ@mail.gmail.com>
 <CAPH-5w4TQnpAby2q2nFi58iCUtB9c07mHx+nOHdAN4676OtN4w@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 19 Jul 2017 18:41:38 +0930
X-Google-Sender-Auth: 2k71tPLlpF6zwPfrCK87JM1uEts
Message-ID: <CACPK8XekADo4rSVkRAoUqYk=QWf-XDyyCMXp74KcY_xfpfE3kA@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10] ARM: dts: aspeed: Add FSI devices for Zaius
To: Xo Wang <xow@google.com>
Cc: Eddie James <eajames@linux.vnet.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 "Edward A. James" <eajames@us.ibm.com>
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
X-List-Received-Date: Wed, 19 Jul 2017 09:12:03 -0000

On Sat, Jul 15, 2017 at 8:24 AM, Xo Wang <xow@google.com> wrote:
> On Wed, Jul 12, 2017 at 6:04 PM, Joel Stanley <joel@jms.id.au> wrote:
>> On Thu, Jul 13, 2017 at 5:36 AM, Eddie James <eajames@linux.vnet.ibm.com> wrote:
>>> From: "Edward A. James" <eajames@us.ibm.com>
>>>
>>> Missing label, properties, and include file.
>>>
>>> Signed-off-by: Edward A. James <eajames@us.ibm.com>
>>
>> Hey Xo, can I get an ack on this?
>>
>> Cheers,
>>
>> Joel
>>
>
> Ah, missed this.
>
> Thanks.
>
> Acked-by: Xo Wang <xow@google.com>

Applied to dev-4.10.

Cheers,

Joel
