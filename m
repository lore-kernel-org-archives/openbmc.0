Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c0d::242; helo=mail-qt0-x242.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="QTLJp7Aw"; 
 dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="QGbgBknW"; 
 dkim-atps=neutral
Received: from mail-qt0-x242.google.com (mail-qt0-x242.google.com
 [IPv6:2607:f8b0:400d:c0d::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 404KbM1gM4zF1dp
 for <openbmc@lists.ozlabs.org>; Mon, 19 Mar 2018 13:22:39 +1100 (AEDT)
Received: by mail-qt0-x242.google.com with SMTP id h4so10718051qtn.13
 for <openbmc@lists.ozlabs.org>; Sun, 18 Mar 2018 19:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=6+xmZNelnyGXAFsPYMhOcOXrWpVWMdgJKEq0ueXp3+U=;
 b=QTLJp7AwFZwUFlUOdPSpj+zyAWCixF6UG6une9oTLklpTjq0byvagLAz6FpqVn99yZ
 VNZEC9b0q/SbCg3nsJlfFWNmX3SMoW2aYQMyq8k3yOpB6rMKUq2RmcIP9Mz03nzO0LsO
 SWGR5nlZ0TSt6oisuwGg2C8nNHU9GxXiDSyHyLC7wbBkeR/Ec3MdN81p5VWGYxsSlT6L
 znFy0DixJbI9OjMv/uN3y2Z1GSJA9R23GCZWU3l1ZDu+7vmPbYgK23XPVlQVhKDxlYsF
 ta4bICETTdLdeywsvXI7Y6fN9Ke/meuC8y0Jxu8NIn4OJNJAzGKTXd9Z2BoUimC3cbPb
 I6xA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=6+xmZNelnyGXAFsPYMhOcOXrWpVWMdgJKEq0ueXp3+U=;
 b=QGbgBknWdZ6iaQvzys1ravLXWr800ODyM4AYyoneGrXec+0U0T9zgev3NFY+qzQCVx
 72pzRK1NF3/T4SzdEMd0q/A+bGTZps7X36TRN2BLsKkNAu4Lj9DK2tckBsYtZBq1caAg
 Gg8C6bDsen4UXavdtG8VI09FuXEPiOANJa4GQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=6+xmZNelnyGXAFsPYMhOcOXrWpVWMdgJKEq0ueXp3+U=;
 b=B7PiMTSZ1kaQQ9R6ng3YYwmLD5OHmVp+hjEUS68Y+SbWuL0bxkuuQJi4lAH4XqQ8DH
 YYAS6hEkGoVAksBud8zB6u4qfM2qYrc0G00VHFNUP/TM/ZwEtVVNhloqXtgyWcYg4Xdj
 4eL/4H73H8IiYq+zHd/fo7YE3okZjdTCHtsaGH2iY1npk+u5YivNW7HmOG/K+X3wb4AW
 l86hJkrpno5hO47qrBwcVlsiLephQHr7LEf8ijS0Xiq98LukoG7/XJ6NSLq/uAQ2wuJu
 EzJe2CZrj520kBitDJ2ydrtm0WGF4X2r3UN0ZSqDoPb870qBF4Hkey1B9Cytlt8tqCH4
 DIIQ==
X-Gm-Message-State: AElRT7H9RVncboCzcWmWhiT/dpLh7ym8AWO6FLrZ9Cbh2jtvMavndUMB
 GQFua8HwJmiOj4/7C2HOEfK5QYkoxZZzZ9i+yzKB0B/f
X-Google-Smtp-Source: AG47ELu2LIcma9p21ohCxyPw7MMaJSajWqBpFeLzVwjYCIvsQRVpUAWZzOe/jz9jHsU/XDV+hQaNhvri96GN+GZdR2Q=
X-Received: by 10.237.36.74 with SMTP id s10mr15615438qtc.23.1521426156791;
 Sun, 18 Mar 2018 19:22:36 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.200.63.197 with HTTP; Sun, 18 Mar 2018 19:22:16 -0700 (PDT)
In-Reply-To: <1520975208-6406-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1520975208-6406-1-git-send-email-eajames@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 19 Mar 2018 12:52:16 +1030
X-Google-Sender-Auth: DCzY__EsYPszu6CK748BwTYcEW8
Message-ID: <CACPK8XfhcXoFh7u3Jw+ia9b+d5gDEp-jV1vcFHQdywzd5NqYig@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.13 v2 0/2] hwmon: (ucd9000) Add gpio and
 debugfs interfaces
To: Eddie James <eajames@linux.vnet.ibm.com>
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
X-List-Received-Date: Mon, 19 Mar 2018 02:22:39 -0000

On Wed, Mar 14, 2018 at 7:36 AM, Eddie James <eajames@linux.vnet.ibm.com> wrote:
> The ucd9000 series chips have gpio pins. Add a gpio chip interface to the ucd
> device so that users can query and set the state of the gpio pins.
>
> Add a debugfs interface using the existing pmbus debugfs directory to provide
> MFR_STATUS and the status of the gpi faults to users.
>
> Christopher Bostic (2):
>   hwmon: (ucd9000) Add gpio chip interface
>   hwmon: (ucd9000) Add debugfs attributes to provide mfr_status

Thanks, I merged in v7 of the upstream commit.

Cheers,

Joel

>
>  drivers/hwmon/pmbus/ucd9000.c | 341 +++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 340 insertions(+), 1 deletion(-)
>
> --
> 1.8.3.1
>
