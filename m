Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x244.google.com (mail-yw0-x244.google.com
 [IPv6:2607:f8b0:4002:c05::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vPY6j6ScCzDq8X
 for <openbmc@lists.ozlabs.org>; Fri, 17 Feb 2017 10:59:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="rhcJ6Vj3"; 
 dkim-atps=neutral
Received: by mail-yw0-x244.google.com with SMTP id v73so2310724ywg.1
 for <openbmc@lists.ozlabs.org>; Thu, 16 Feb 2017 15:59:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=RHj/EORfvgi0W79i19iXo0+pZ2HdYVoKejDu/GwR9Q0=;
 b=rhcJ6Vj3XzbXlwaGTZl6ebBMAYQsxDhQ3VScHYMFNHn9G6RKOCErf6RYrSf5ndSHjp
 WcO/v19OMCLdsEr9LgltvAWqYRXCGt3BhcXSxSHWVbgdA0pseOfhsoX4CMEdYUNJm7h2
 C6f6uAyGNdYUCjfEHZYCIJ52778ZmopXtZhOMTuZacsLV83lqxSysHy4WRkmlaiKzKPA
 mYtFYO464d5N6owsrbKZQcxXkrwGpR3cKz9lmXT2RAse0nX2Tvy8osZtUgk97SaHrl0G
 U5F7OVX7otP7efU5VHe5EwC22Kop3yeg77Zj3Re1F4TT1S5sMVwh786LK+q0lU9a+HST
 mdvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=RHj/EORfvgi0W79i19iXo0+pZ2HdYVoKejDu/GwR9Q0=;
 b=PmJhzvXVEjlV2OcyY975QkSyzdx/DGQnUd3xKp2hsnG1PNQf3y185QpUdUn5vHrIzE
 kRvYqeCZB3KZtAtxoLGK1Ff5GVS8HRIm3ZGkVmBdaIXF6KLP8FLOxbuQQ56cv3AnlxuE
 SL7n9uasDfJmpRAnoSLGWEByZJAeVaZSS+15Ns4eaYfTRJnVURxSbbGl9COgmBkBIsSI
 zI0a3ClGTSkG0Kc8VUUwfbx92dyzgdNRaJiCJ2fMYjGTXDlYy8onPQnNRuUkfUCwV8H4
 GbbP8rwyOFnme6ZSFQf6z7r3un8JA4DXDNN3k9gdYZdneKngLWInrOKccGzITwuSxY5Y
 jzHg==
X-Gm-Message-State: AMke39lawn9XXWgwdog+OMIiUzu1XxjzF5QRPuH99FElsFfWRuDxNGOqXDbPLF6piJ+bdZYO3HQMMRnxzoCevA==
X-Received: by 10.129.73.65 with SMTP id w62mr3714810ywa.288.1487289579376;
 Thu, 16 Feb 2017 15:59:39 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.170.41 with HTTP; Thu, 16 Feb 2017 15:59:19 -0800 (PST)
In-Reply-To: <1487283983-23024-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1487283983-23024-1-git-send-email-eajames@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 17 Feb 2017 10:29:19 +1030
X-Google-Sender-Auth: OV5vNjSvPNUZ_KMrIXMWarYX1Zs
Message-ID: <CACPK8XdQSUa=s6Ou16rp_X=fhpDQt-hJ-cxzbn3FWZL2aDLdew@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.7] drivers: fsi: i2c: Change fsi irq enable
 behavior
To: Eddie James <eajames@linux.vnet.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Christopher Bostic <cbostic@linux.vnet.ibm.com>,
 "Edward A. James" <eajames@us.ibm.com>
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
X-List-Received-Date: Thu, 16 Feb 2017 23:59:42 -0000

On Fri, Feb 17, 2017 at 8:56 AM, Eddie James <eajames@linux.vnet.ibm.com> wrote:
> From: "Edward A. James" <eajames@us.ibm.com>
>
> Only enable fsi interrupt polling during an i2c operation. This will
> help with busy FSI bus.
>
> Signed-off-by: Edward A. James <eajames@us.ibm.com>

Applied to dev-4.7.

Cheers,

Joel

> ---
>  drivers/fsi/i2c/iic-fsi.c  | 30 +++++++++++++++++-------------
>  drivers/fsi/i2c/iic-int.h  |  2 ++
>  drivers/fsi/i2c/iic-mstr.c | 10 ++++++++++
>  3 files changed, 29 insertions(+), 13 deletions(-)
