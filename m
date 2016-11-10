Return-Path: <joel.stan@gmail.com>
Received: from mail-it0-x244.google.com (mail-it0-x244.google.com
 [IPv6:2607:f8b0:4001:c0b::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tDkfm2YdRzDvNk
 for <openbmc@lists.ozlabs.org>; Thu, 10 Nov 2016 11:38:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="IcKkIr90"; 
 dkim-atps=neutral
Received: by mail-it0-x244.google.com with SMTP id e187so94695itc.0
 for <openbmc@lists.ozlabs.org>; Wed, 09 Nov 2016 16:38:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=4hMsKi2F0iK0jLV4+E4G4ff9Pu49O7EFdNLm/gSyUD0=;
 b=IcKkIr90ckb9MQG/hdQ4ODhHiC/MBTANG2MRRySqtZSLmmXdw3hUepDyFbuapgfP1x
 AHYIAu3wpTv7zdrOgKZSzCaJ6hqDMhklS20UEgSsCsqFjXO7WtnLuPj66yDxPQYmlYB7
 xUJ9ctDMwBcw0TIbsln8B4QdAinZQ/Ep0UqW0GBaHmWtdk7ZcpWrw1DkRrUcm1Y7fd6U
 E0QhF+CvmVEyqd86OJOsWm9MQ3+tGCpEgGUJM4nDYv2G7T1Cz91RcjknNGURqve8egJZ
 GPjMKmyBuXGSMawdshlUbgYBQirZrPCdtKicwdFb/B9g1dc0Fzl+cFrQx1hYongwx12p
 kNAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=4hMsKi2F0iK0jLV4+E4G4ff9Pu49O7EFdNLm/gSyUD0=;
 b=CYTAoHyCTmmyG7cztyB6ZnI/8Mr0vz2MH1Tb/G61/iIOX6o1Zb6Eb+tcs6hTWVIOfa
 Eq2tVKTBhbkvXXKTEVn+BBH/kuK3TicVB7qGngpavvQvDrioAiUNedrIg6WjOvjWRtPC
 XQdzWqRtEWOwu6XUhU0+PIToLH8r9wVCmsLWNEfVia0kxBeu0J6G/oyQapbbbdJFqJ74
 MwrxrVJLfhX5OMZf4RsTtpQW8jPWnKn4JplEXT7DsQL9T6QngNDdXWh4VbWOKf9sJGQi
 4HAStHQKnglum/khyj0g3zSSsJfZ0efa+6Vv0aqGWcsMLf5xfuy/Us0KKPLoPgoIIW7N
 j9ew==
X-Gm-Message-State: ABUngvf+y+oVuMc10tcvnqjWQKG1LMIW6eKES61g7TLkAOpE5TprDMR3gtYmJfLx4debb2nHhfInoMktmyUrPA==
X-Received: by 10.202.92.198 with SMTP id q189mr1581185oib.6.1478738286593;
 Wed, 09 Nov 2016 16:38:06 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.182.97.41 with HTTP; Wed, 9 Nov 2016 16:37:46 -0800 (PST)
In-Reply-To: <1478679343-25354-1-git-send-email-clg@kaod.org>
References: <1478679343-25354-1-git-send-email-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 10 Nov 2016 11:07:46 +1030
X-Google-Sender-Auth: uxH2UplpIFpj5l4nsQhZKk5i050
Message-ID: <CACPK8Xcz8sVdP4-9aXY7-Pe-bOxQ6Gw-KCsCfjWmWNat5dxENg@mail.gmail.com>
Subject: Re: [PATCH v2 linux dev-4.7 0/7] Aspeed SMC improvements
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
X-List-Received-Date: Thu, 10 Nov 2016 00:38:09 -0000

On Wed, Nov 9, 2016 at 6:45 PM, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> Hello,
>
> Here is short serie improving the Aspeed SMC driver. There are a
> couple of fixes and also changes preparing ground for read
> optimization.
>
> Patch 1 and 2 are fixes for the current driver. When merging all the
> code before sending a v1 to mainline, a few minor errors slipped
> through.
>
> Patch 3 and 4 are cleanups.
>
> Patch 5 and 6 should not have any impacts as we are not using DMAs or
> fast reads, yet.
>
> Patch 7 is more important as the IO routines are completely reworked.
>
> I dropped the patch activating command mode for read. It is broken on
> the witherspoon because the size of the flash module is larger than
> the maximum allowable segment window for a CS. It would nice to
> activate it when possible but this requires more checks.
>
> I gave the patches a good test on a palmetto, an ast2500 evb and a
> witherspool and the overall result should be a v2 for upstream.

Thanks for these. I have applied them to dev-4.7.

Cheers,

Joel
