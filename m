Return-Path: <mine260309@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4001:c06::229; helo=mail-io0-x229.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="pY/sPx7d"; 
 dkim-atps=neutral
Received: from mail-io0-x229.google.com (mail-io0-x229.google.com
 [IPv6:2607:f8b0:4001:c06::229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40wl5T6cGPzDrRY
 for <openbmc@lists.ozlabs.org>; Wed, 30 May 2018 19:04:13 +1000 (AEST)
Received: by mail-io0-x229.google.com with SMTP id t6-v6so2192054iob.10
 for <openbmc@lists.ozlabs.org>; Wed, 30 May 2018 02:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=nubo9UYT9ojG0rJM0SX5ko02GRNToCNkziCu3QNsqSo=;
 b=pY/sPx7d25ls+K+du3YlMWckCtBqWoHYumOhjLhpSVTpHpKr23IP++SzbVWDnUTAvE
 5A+Y3OlsSglxO2cAsuDh7Or3tbCHSpINOUx+4TlzhGTUuir5IO9RM8Xmz/ZS5DqxAPIP
 Y82WL3x4BnuIzOkX5mIzC63vFYXA6jZY2HD4C5klJ3rutsh3uwC/ePIKHe4eY//4gRWi
 Gvf0lkOW4V4vmfHfOeHEzU8B8kkwNlJ7Meqi+sifELFkiBwZJjprjLon+tpjd/+Z94m6
 L7wLJ3WiEoeJGyNrxvkDi+nrbyBMJictz7ApuXmj6SRx2O3ioEQ6Y/G6G4ZOU6QL/OHS
 3fYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=nubo9UYT9ojG0rJM0SX5ko02GRNToCNkziCu3QNsqSo=;
 b=jKGrFbAN0im1VK1WMsdIzBE5LJTri7V+c6aXLrQnPK6I/bTSx1soitu4u0RefUfsu7
 8HA5Prq4bx1KBz0fMYX//pI7m6F6aRgVu/Hpei3B6l2RxbI7uaZpx6p+0v0WN1Qwok9i
 N+qwftGQ5xsMYhnheBH5ay6JAHQmETXOESCy/u8502dvwNa2dhBiGBmREXMekalMPIxE
 zpLo8dTv5mOuOkjp8hta1s4rEG26GjABQAHc+ljmNcxDeWfPRlCe2AvgUttg0Gpccekr
 fc4qmV+uvtcBzvPMD8qZ1jtK/y9CbQ4KdxozlmyXXbcsrnZdjBtFaR6bJMMpoGdmd8Gn
 oqkQ==
X-Gm-Message-State: ALKqPweafGDEaDqgx5gpsa5IvTaS/dwVD2RYyBEsDcY7hTL4mMdeAEsD
 Iuzvic0BFR2QQqg98mAteLfIsujf4KbACcZHl1Y=
X-Google-Smtp-Source: ADUXVKILCP/pjYNu6JWkgZzOxUI2p0dh9L0UjEVPf93qB8jNk4h4dYsmCwnrZE4/DGyNS4LIFhMHjLQerdyPUvdsOFk=
X-Received: by 2002:a6b:a50c:: with SMTP id
 o12-v6mr1456246ioe.16.1527671051167; 
 Wed, 30 May 2018 02:04:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4f:558a:0:0:0:0:0 with HTTP; Wed, 30 May 2018 02:04:10
 -0700 (PDT)
In-Reply-To: <CAG9c7cB8S=VL6g2Z6dXmC55P-3CW+p+wURH=Qgy-sZXL6b9deA@mail.gmail.com>
References: <CAG9c7cB8S=VL6g2Z6dXmC55P-3CW+p+wURH=Qgy-sZXL6b9deA@mail.gmail.com>
From: Lei YU <mine260309@gmail.com>
Date: Wed, 30 May 2018 17:04:10 +0800
Message-ID: <CAARXrtkSDZQU_m5CD+7aprwZ33NH3gZ6z5hJVZ57rDJ-QXq5ow@mail.gmail.com>
Subject: Re: Unable to find mtd partition for image-bmc
To: Henbin Chang <henbinchang@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 30 May 2018 09:04:14 -0000

On Wed, May 30, 2018 at 4:10 PM, Henbin Chang <henbinchang@gmail.com> wrote:
> Hi,
> I followed the instructions described in the the below doc to update OpenBMC
> FW via REST.
>
> https://github.com/openbmc/docs/blob/master/code-update/code-update.md
>
> And I got the below error message.
>
> {
>   "data": "Verify error: update: --no-flash --ignore-mount --no-save-files
> --no-restore-files --no-clean-saved-files\nERROR: Unable to find mtd
> partition for image-bmc.\n\n",
>   "message": "200 OK",
>   "status": "ok"
> }
>
> Does anyone have the suggestion?

As the message indicates, the update script fails to find a mtd partition for
"image-bmc".
What is your devices's mtd parts?
The expected OpenBMC flash layout is like this:

# ls -l /dev/mtd/
total 0
lrwxrwxrwx    1 root     root             7 May 30 06:47 bmc -> ../mtd0
lrwxrwxrwx    1 root     root             7 May 30 06:47 kernel -> ../mtd3
lrwxrwxrwx    1 root     root             7 May 30 06:47 pnor -> ../mtd6
lrwxrwxrwx    1 root     root             7 May 30 06:47 rofs -> ../mtd4
lrwxrwxrwx    1 root     root             7 May 30 06:47 rwfs -> ../mtd5
lrwxrwxrwx    1 root     root             7 May 30 06:47 u-boot -> ../mtd1
lrwxrwxrwx    1 root     root             7 May 30 06:47 u-boot-env -> ../mtd2

For "image-bmc" it will update the partition labeled "bmc", which is mtd0.

>
> Thanks.
