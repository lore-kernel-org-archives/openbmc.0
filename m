Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x241.google.com (mail-yw0-x241.google.com
 [IPv6:2607:f8b0:4002:c05::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wDb2B605nzDq5b
 for <openbmc@lists.ozlabs.org>; Fri, 28 Apr 2017 10:54:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="pU5ZskKX"; 
 dkim-atps=neutral
Received: by mail-yw0-x241.google.com with SMTP id u70so3948966ywe.1
 for <openbmc@lists.ozlabs.org>; Thu, 27 Apr 2017 17:54:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=ZEbZTN74VtLaUWPNpBLQONGj7g3CmuezePI6alGE0qU=;
 b=pU5ZskKX6V0QnHOHc1qQdDEI1XOm2ePFDX5jrZoFVOgyL28/pQD78BzWEIMdlW5nuD
 1pU3WC0cpMhLasJC0dPR/8R41UUHzBmQI5KwHyF+bCrKpQyvIdg4Kb0z9j14G3whGrU3
 JHb2mqj9PadyhKROygpdZ7h9NWeXrPXURn5zNFRArViTfCld5t/iTg/U4Np3jyFFrsI1
 vFYp/qOAAl2b33G8KE6a+OaRTrcGXc/RugsI4DvA6ls0L16aybWi3F51zfJ4snZb9vyr
 XhcWmGy3+x7Q4XS1FWthXQqyWZZjG7lScubP/cZo1+Vi78DBh0S1KxYPQpXCuATrOrBS
 wqnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=ZEbZTN74VtLaUWPNpBLQONGj7g3CmuezePI6alGE0qU=;
 b=Ans6gkRQVitEY8qHFHnk5juADqFi+MjWP8frYBB0mc4xnLRCorgyK0Uhs7+ybQ+I8l
 gWzAGLRd8FpRQ2Lmv39PWO5TM/ypYvBKjlE/68J0O5x5ePIhL5FnnFW8STlJ75Dc6cKm
 vHGXzwBSSwehzG0g75Gk5yLJSi00kuCxxZHA/CYRucHycuhyTz2J5FZxLv2iy2QN/LOi
 H+s41nNSG6NHHnLfLbxwa4f0L9CZ4zXPRObue+1exHZExqLD2oSfIrxdsMRJv8jxb9vg
 X+QrDp7biIFFEcuYnyEJdu6bd7uNkmKW5StJynfZgbgyQpbiwE1fL5CTwIWgatqqoggL
 lM7g==
X-Gm-Message-State: AN3rC/6kEuz5xhZomAYepH3Ko2GF+QRBNqhsBglwhC91zt/INH1CsKpN
 V6yuQOMs00EEkLeBQ5N/alz7id+tXg==
X-Received: by 10.13.225.193 with SMTP id k184mr6737226ywe.178.1493340896497; 
 Thu, 27 Apr 2017 17:54:56 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.171.70 with HTTP; Thu, 27 Apr 2017 17:54:35 -0700 (PDT)
In-Reply-To: <becffa12-8c7b-abc4-1d25-3ea8db09da42@kaod.org>
References: <20170427060823.32226-1-andrew@aj.id.au>
 <20170427060823.32226-10-andrew@aj.id.au>
 <becffa12-8c7b-abc4-1d25-3ea8db09da42@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 28 Apr 2017 10:24:35 +0930
X-Google-Sender-Auth: KVd65axUf59-PLzNoNxOt1xdCfk
Message-ID: <CACPK8Xd81RGaWY3mvJFeYdd9KdPDsbdcFDhv-SKTaD6u3PaJCw@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10 09/10] aspeed: witherspoon: Remove manual
 CS decoding window configuration
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Lei YU <mine260309@gmail.com>, Rick Altherr <raltherr@google.com>,
 Xo Wang <xow@google.com>
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
X-List-Received-Date: Fri, 28 Apr 2017 00:54:59 -0000

On Thu, Apr 27, 2017 at 4:26 PM, C=C3=A9dric Le Goater <clg@kaod.org> wrote=
:
> On 04/27/2017 08:08 AM, Andrew Jeffery wrote:
>> This is now handled by the SMC driver
>>
>> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
>
> Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>

Applied to dev-4.10.

Cheers,

Joel
