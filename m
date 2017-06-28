Return-Path: <bjwyman@gmail.com>
Received: from mail-qt0-x242.google.com (mail-qt0-x242.google.com
 [IPv6:2607:f8b0:400d:c0d::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wyVzL5PS3zDr27
 for <openbmc@lists.ozlabs.org>; Thu, 29 Jun 2017 04:03:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="dcHi/7oh"; 
 dkim-atps=neutral
Received: by mail-qt0-x242.google.com with SMTP id c20so8441667qte.0
 for <openbmc@lists.ozlabs.org>; Wed, 28 Jun 2017 11:03:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=LrqoPJagYIGITtJvmn8UJkGrzazg8GXEZHfbOEjieWs=;
 b=dcHi/7ohfJ7+oLtFUObJ4MxSpAHBuqxBiqfOnIVmcX+C2DXCJ621ohKLMIg/7WLsVM
 wBSVCpZawxlTSajkPp3Q/lEbv0kb2oTNT+Lr+fkdSJ9uzeR4ohuhFBi4OnD2RP9l+9qS
 0/ATlR6xynENXaJqR5xl1tytwgEvpKwiih4M1CTlF7frxe85/50VYNUW1/heoGz4bHMo
 JAhqjF6TD5z6hnUa6IRBK717C3b5yAn95RxaL6jnb5TQdn9HiN7fW3SH5IlIw9rJfJeU
 VwL5aiv9eZXAIOQtP1Wv7M8fTonGC1s6vrQzOhjRSrbSQ2q5GpqKhLjneI7+AQS4WqP7
 eNwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=LrqoPJagYIGITtJvmn8UJkGrzazg8GXEZHfbOEjieWs=;
 b=rsd6AE5XdjwAJ2F4ahVwfiudLvMTmo7iFZl73ONenJDwPQDJLuRL0krLkXURdTxOkh
 CDo46+hgI/z9V0t59Mq4fi6mQ3TfapOTPce/ltQGskGDCmvn13Pv8TlgT6SkgIw/dZnP
 fvK2MhDoAMGZaGdywzq8hUJ8pujAgCVAG4GUcih8GwJCqNDr7n/R+L1TkansPb1f+dA/
 GO+nYex3QJfF7JTrQVVc6A4aPGmxQznRLMyPgk546h6yKsJ66gNJB38mdqWL+eU0fTnp
 bwKx4zBYryp3mbxJgDiaBNPVIdltzmMCFjB+BrVeUmNJwxlD9H4o7ZBKDQtyc0xGCc9M
 a6BQ==
X-Gm-Message-State: AKS2vOwnhd2WVRy8ReKQlYG6YF/6gRYVcv5I6hR9MZ6VT2kuCGMjIzQT
 xjaNol42S8MhlYy1S9dXzPjG/ECBCQ==
X-Received: by 10.237.50.132 with SMTP id z4mr15484272qtd.31.1498673034719;
 Wed, 28 Jun 2017 11:03:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.97.4 with HTTP; Wed, 28 Jun 2017 11:03:54 -0700 (PDT)
In-Reply-To: <CACPK8Xf0p6EBNf2G1dhKCeT8KvsTpniVUePpVLYEh2eGw66ORA@mail.gmail.com>
References: <1498262178-27820-1-git-send-email-bjwyman@gmail.com>
 <CACPK8XcDD+0ZCytgx_xWf9L2Q9nW7fQp9pNtE9+285UrnQh80A@mail.gmail.com>
 <f8553d4f-c0b9-5cef-de01-067b313b10cb@kaod.org>
 <CACPK8Xf0p6EBNf2G1dhKCeT8KvsTpniVUePpVLYEh2eGw66ORA@mail.gmail.com>
From: Brandon Wyman <bjwyman@gmail.com>
Date: Wed, 28 Jun 2017 13:03:54 -0500
Message-ID: <CAK_vbW1Vk_AokYnPbvNqyBE3_PKFXmN+_krzedN-x4y03M8PAw@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10] Add fan card PCA9552 to Witherspoon
 devicetree
To: Joel Stanley <joel@jms.id.au>
Cc: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
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
X-List-Received-Date: Wed, 28 Jun 2017 18:04:01 -0000

On Tue, Jun 27, 2017 at 4:33 AM, Joel Stanley <joel@jms.id.au> wrote:
> On Tue, Jun 27, 2017 at 3:43 PM, C=C3=A9dric Le Goater <clg@kaod.org> wro=
te:
>> On 06/26/2017 08:16 AM, Joel Stanley wrote:
>>> Hello Brandon,
>>>
>>> On Sat, Jun 24, 2017 at 9:26 AM, Brandon Wyman <bjwyman@gmail.com> wrot=
e:
>>>> The Witherspoon OpenBMC system has a PCA9552 chip on the fan card that
>>>> is used for fan fault and identify LED control. Adding this chip and t=
he
>>>> LED lines to the device tree.
>>>
>>> Great first submission. One issue I found, please see below.
>>
>> Joel,
>>
>> haven't you merged the patch defining all the PCA9552 pins as GPIOS ?
>>
>> https://github.com/openbmc/linux/commit/db30464ee579176abc82d0fe95aa9b9f=
f76d0c3a
>
> Yeah. We have a few PCA955x devices in the system.
>
> There's the pca9552 used as GPIOs for the GPUs that you worked on the
> driver for. There's also a pca9551 that's used for driving LEDs, which
> is what Brandon is working on.
>
> Cheers,
>
> Joel
That is correct. There are two such PCA9552 devices on the Witherspoon
system. One is on I2C-11, the other is on I2C-3.
