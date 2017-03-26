Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x230.google.com (mail-yw0-x230.google.com
 [IPv6:2607:f8b0:4002:c05::230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vrs3S51DwzDq95
 for <openbmc@lists.ozlabs.org>; Mon, 27 Mar 2017 09:17:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="AEcqXKHA"; 
 dkim-atps=neutral
Received: by mail-yw0-x230.google.com with SMTP id d191so20355882ywe.2
 for <openbmc@lists.ozlabs.org>; Sun, 26 Mar 2017 15:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=AoXi9LpwQsnf/fcv3SW2AAIA+sHXUH/Tk0ia1drRmfA=;
 b=AEcqXKHA5Q8t8mLICILYvjV80LCPc8LZsXXF1z5GB7Slnjw9Fvs5vVg5+xQblGz+R/
 MXgmEC+4oxwDQvVk3c6CX24fTjA2nRQmA7eGndYLqnKZQBDL0RwMKHXaN+OSrxHVHwbI
 fxz281telfzhaWfL0m6Rxehu9HkPNkQFMnYeOYqYhxzOHX23Ig9lVe4fI1iBfOT8fX6U
 a8Kcvi7s+KzBWWG+PL+K+gqNuJ5PrKny8U38+qHSvVtauzUcCno8KusVzEDjVvB1mzer
 KMHcLUVs7IKK3I3L/79461CX+79FitzcUJ9zFwkcy6umI4xGlLgi0n7Scj5gzk/GgTBF
 wBiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=AoXi9LpwQsnf/fcv3SW2AAIA+sHXUH/Tk0ia1drRmfA=;
 b=XnbDlG3wFt1qv1owLJC7jxiduOHD6fUg9P/7VLocSR4+2vjfPOozK3OOsUpjL7y5vK
 P4xG8pQlMh3SeQvhMuogJ4JE6KPWrLih1CWgrwH+tYGScU47RZcde+2+Eq+RDkizU8Ye
 cMtRHHRWd6Rf5Gq2nO7eUC3TW6ZURX3iGiQ0nyK+GcsQEgPFBWNnV/PgxLX2XHAYVT5S
 2HDZG+lzVQefdFrQNcZMM6dVKNIyvHZRitKHXwh2Xle3PkA5RaXgl9A9dXXtVqlpWEFJ
 HRBEnwJWeiit8aCeuWjE7can5/ZxS9GWxrw5xlkaUO4kMROX7gc7BZ8qnQeA1aYicSMv
 ljYQ==
X-Gm-Message-State: AFeK/H1cWpyNm9ODxHq6TGBh8M8dfWiSqHvSvaHEvxwFFFfcQbHQQzbR/7zBp0WjSNWiOr+JdSHDGvSsDEP5Cg==
X-Received: by 10.37.37.134 with SMTP id l128mr9928499ybl.17.1490566657992;
 Sun, 26 Mar 2017 15:17:37 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.59.17 with HTTP; Sun, 26 Mar 2017 15:17:17 -0700 (PDT)
In-Reply-To: <OF4AEF9BB3.2CC1F4C2-ON862580ED.007DF187-862580EF.00537731@notes.na.collabserv.com>
References: <OF4AEF9BB3.2CC1F4C2-ON862580ED.007DF187-862580EF.00537731@notes.na.collabserv.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 27 Mar 2017 08:47:17 +1030
X-Google-Sender-Auth: y8-6rgZjq7JGRW8OvfZJg8hkY0M
Message-ID: <CACPK8Xep2LQXwQVfwSrqp8TB7MXAqyiiJJKWBYt7T3BoG3vk9w@mail.gmail.com>
Subject: Re: netbooting with Fit images
To: Chris Austen <austenc@us.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Sun, 26 Mar 2017 22:17:41 -0000

On Mon, Mar 27, 2017 at 1:41 AM, Chris Austen <austenc@us.ibm.com> wrote:
> From a uboot prompt I use to be able to netboot the kernel and user space.
> Is there a new way to do that now with Fit images?

See the mailing list post I made on the 14th of Feburary:

 https://lists.ozlabs.org/pipermail/openbmc/2017-February/006537.html

Let me know if you have any further questions.

Cheers,

Joel
