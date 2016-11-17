Return-Path: <joel.stan@gmail.com>
Received: from mail-it0-x230.google.com (mail-it0-x230.google.com
 [IPv6:2607:f8b0:4001:c0b::230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tK9TN0fS9zDvrH
 for <openbmc@lists.ozlabs.org>; Thu, 17 Nov 2016 17:00:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="qiIIHXS4"; 
 dkim-atps=neutral
Received: by mail-it0-x230.google.com with SMTP id l8so115818917iti.1
 for <openbmc@lists.ozlabs.org>; Wed, 16 Nov 2016 22:00:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=qZrUnNPMagRVQsRcEZbPI2N0wFBGUztzyyMHvw2XkWw=;
 b=qiIIHXS4Z2zHjc8PYE5ITZQhfWTvkSyCOcoyCkv3fL/toxtzvF+HKnKH1k2qLLJiwS
 +Nk8scB4Csz0gP9wirpZls9bL54aeYEj+rWAv5Dpi88Hps7eW6AqrXun/2y8jtJp/qeH
 I2KJVacS/fP/08Sb+P1VDbGJz/AOzSWJAmxc3f6kFnBM2gYZoLLv3gKpo7VF+fxsJx6A
 GQTjBXQvPg1GcrY1EbyHtYO2HNHo8bJP1iP9ddZWYZv8SnN3pm5dBsmDuizO180zMM5y
 iO13aHIcRJUkr8vWxNEuXCpmIP2iLYssXhEaHrr+uL54E1gJafvm+mf2NsfliIE2J1Y/
 C+zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=qZrUnNPMagRVQsRcEZbPI2N0wFBGUztzyyMHvw2XkWw=;
 b=axuZ/VC4tyZGn5w4bYsruqdPu5+nmum1FxrGtg8xq9KQJshQf8QFq4VAx23ABKSq/u
 DMPPbnkn/XZlvgOfUAfbMtcD7mdS6uJlOPj9RSnvMzcAwpHOjuJTqb7kb7FVGJkPzUVD
 NJKWOAqm+3XvNpEvAnceAu8YNwrt62EJ6CwNtVWsWOE8agS6bxwdisZp2/Q4Eltf1wni
 OcVlhfnOBIlm9JPh/c2GhatJDemCSm6Mz7hLPVGuYomPsdKunSVp63rfXlpr9cz6qWXK
 fE32Dc8OJEkm47cuOmxS+/9A2BganfosklnWHkFDACAagcAsRz26xQxiIGesEnt67g9Y
 xgKw==
X-Gm-Message-State: ABUngvfNr0vGkQTAKfA1Y2ShYJ4pkD58jNrxqXlenguFQ78jn9UApZZYRwBOrQZKMPxrz3kdn3RUOW0wsuuo0w==
X-Received: by 10.157.63.199 with SMTP id i7mr545549ote.63.1479362422290; Wed,
 16 Nov 2016 22:00:22 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.182.97.41 with HTTP; Wed, 16 Nov 2016 22:00:01 -0800 (PST)
In-Reply-To: <C160D2872FE0DE4683E1910F9BF8294157425819@avsrvexchmbx2.microsemi.net>
References: <C160D2872FE0DE4683E1910F9BF82941574257CE@avsrvexchmbx2.microsemi.net>
 <CACPK8Xf5OMSNxDN1xnFwSYYbkUSJ9OC_UfD1zFbgu3ZizSJdtg@mail.gmail.com>
 <C160D2872FE0DE4683E1910F9BF82941574257FF@avsrvexchmbx2.microsemi.net>
 <CACPK8Xfm=Uaa9vp9aS7Lx-rwCGXHyGCgo=ayF_L6W6wM3HWCjA@mail.gmail.com>
 <C160D2872FE0DE4683E1910F9BF8294157425819@avsrvexchmbx2.microsemi.net>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 17 Nov 2016 16:30:01 +1030
X-Google-Sender-Auth: T79x-XADNYVWUxEuacULpamXAYI
Message-ID: <CACPK8XeVPCQfgcPCHBFFP=4WmpeK1gCYJANybh2hN=KbwG8fbg@mail.gmail.com>
Subject: Re: Query on image deployment on ASPEED board
To: Arjun Padmanabhan <arjun.padmanabhan@microsemi.com>
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, 
 Balaji Marimuthu <balaji.marimuthu@microsemi.com>
Content-Type: text/plain; charset=UTF-8
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
X-List-Received-Date: Thu, 17 Nov 2016 06:00:24 -0000

On Thu, Nov 17, 2016 at 3:42 PM, Arjun Padmanabhan
<arjun.padmanabhan@microsemi.com> wrote:
>> If you have a flash programmer available you can put the palmetto-flash =
image on there. I recommend taking a back up of the flash in case it does n=
ot work.
>
> Netboot with tftp is for an emulator or we can netboot with tftp from boa=
rd itself?
> I don=E2=80=99t have a flash programmer. If I want to boot the image from=
 ASPEED board, I would be needing one?
> Any other way is there to boot the image from board?

Yes, you can tftp an image over the network. Power up the board, and
stop u-boot before it loads the kernel. From there you can specify
your tftp server and use u-boot's commands to load an image into
memory.

u-boot can then boot from this image in memory, or you can write it to
flash. Be aware that if the system crashes while re-flashing u-boot
you will need an external programmer to recover.
