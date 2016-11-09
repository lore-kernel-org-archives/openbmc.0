Return-Path: <joel.stan@gmail.com>
Received: from mail-it0-x241.google.com (mail-it0-x241.google.com
 [IPv6:2607:f8b0:4001:c0b::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tDhfB6cHZzDvf5
 for <openbmc@lists.ozlabs.org>; Thu, 10 Nov 2016 10:07:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="y4vnYgcL"; 
 dkim-atps=neutral
Received: by mail-it0-x241.google.com with SMTP id q124so25079459itd.1
 for <openbmc@lists.ozlabs.org>; Wed, 09 Nov 2016 15:07:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=6Qcss0lGWFbue/evVomvOO+kdnyHpw8Xx+xcER5aFRs=;
 b=y4vnYgcL5Jq/cqa1ixEqRCbCTZ6i5h/fthcxrX6Km9jacqWYvDflCXmmPHDfhWsMHr
 zTDVanOJfudWOyv56r5CzTFwjKR3Pif7cbzOVKifS0CB6u4JPArW40VF0PFL58IiaPkR
 P9wPHmcUtkBlvAZ11/R4p4kXwCKMQt92S/7ZHiWn6vSat4aBGpQK2hgICDAJ8Yfsf1+X
 svSy06zebqt87yuxVkouIkJ+Rm95xQIFotXGtG+23txvPnxGEHYdcWQyxoqJW/RysSbg
 6An7e4vcSC/hUe5lo3aDUumJlXJuQm51GLWwQwNF28zXOd6FYCAX6oXbNLbcHF2v54IN
 H99g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=6Qcss0lGWFbue/evVomvOO+kdnyHpw8Xx+xcER5aFRs=;
 b=F+lfyPnoiyLk3ZoIiNB2L6WjTNbgimRxBnEx5Et/Urugb/cfs3KjPDVv+O8QMsnNhS
 M8413LPSLUkEaTdXIi4JOIMrMG/tvj+YHONbYFqV/2fGOpTPCOpxAXVOGn34E6GC6Tr/
 MGPEn1ZM8J7/wem+2VlBaZYM/3nmXdsTFXBrpkfyk2JT5VOeqwx/hmGcHdXUU91pW4Ns
 3PrQXgErnPJOUckzlZIWHJriaRXDOtuONR7VfesYU/L18B5MpUQxhF8eEqpYPARdIbgN
 adRVvDtaa0Ml1Dr4MSHpxAPoBq5Vt58Y6jQS0FBd2F2E4v2O13o7C3ckmhzwSabAHEsV
 lL3A==
X-Gm-Message-State: ABUngvcyX2My6jeEnv+Gmmi8yGE37nazBo4c/3yc9cZgSokh7CoLY7SmQqER9O/jpQSCx81QEHCXwQzKxNoRKg==
X-Received: by 10.202.79.203 with SMTP id d194mr810225oib.46.1478732849220;
 Wed, 09 Nov 2016 15:07:29 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.182.97.41 with HTTP; Wed, 9 Nov 2016 15:07:08 -0800 (PST)
In-Reply-To: <1478679343-25354-3-git-send-email-clg@kaod.org>
References: <1478679343-25354-1-git-send-email-clg@kaod.org>
 <1478679343-25354-3-git-send-email-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 10 Nov 2016 09:37:08 +1030
X-Google-Sender-Auth: 22-T8TI8wfXzHH8OhVWQPLcSrJ4
Message-ID: <CACPK8Xew0mdbExAaoJZyiw-DpH8rpEJag4fq0r0M5wFMc-bueA@mail.gmail.com>
Subject: Re: [PATCH v2 linux dev-4.7 2/7] mtd: spi-nor: aspeed: improve 4
 bytes mode
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Wed, 09 Nov 2016 23:07:31 -0000

On Wed, Nov 9, 2016 at 6:45 PM, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> The AST2400 SPI flash uses the CE0 control register to set 4Byte mode
> and the AST2500 FMC and AST2400 FMC flash controllers use the CE
> Control register for this purpose or they are strapped by hardware.
>
> Currently, the setting of the CE0 control register is done for all,
> which is incorrect, so fix that to keep only the AST2400 SPI. Luckily,
> the bogus setting has no impact on operations as bit 13 defines a SPI
> clock divisor.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
>
>  Changes since v1 :
>
>  - added a set_4b() ops
>  - removed the use of SZ_16M

Nice. Now even I understand what it's doing.

Reviewed by: Joel Stanley <joel@jms.id.au>
