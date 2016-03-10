Return-Path: <joel.stan@gmail.com>
Received: from mail-oi0-x241.google.com (mail-oi0-x241.google.com
 [IPv6:2607:f8b0:4003:c06::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 8DEAC1A0007
 for <openbmc@lists.ozlabs.org>; Thu, 10 Mar 2016 13:58:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=tKTqoHKN; 
 dkim=pass (1024-bit key;
 unprotected) header.d=jms.id.au header.i=@jms.id.au header.b=dQf7N3w9; 
 dkim-atps=neutral
Received: by mail-oi0-x241.google.com with SMTP id c129so3991482oif.3
 for <openbmc@lists.ozlabs.org>; Wed, 09 Mar 2016 18:58:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=6aIDFEdgk3+VCdJyez1drWzoYmprL3hgm3LtaqeSacI=;
 b=tKTqoHKNkG0qXL8d8tOOP53J4He7tBffv7Tjokl5dGpWJhh0NFAY+lCitGJ/9U1UEN
 Wd8IAIqoXdFagcZt01RidkFALquU8CdIchQ3CaMMWVOxNSMx3yba9cobCzBPLl7yE6Pp
 SUYsios1FJkkAJxLyCy7sGoAJRaAH6yADRhkPgEgSXxqgpd2QTvdhMcvUwpfkudiEzuL
 bKoBcfTESKQQmYWhvt/6v1SOjPRCpwsfTnAsYSlUuAHicn4shM8yvHqwy3eyN4+kQTZD
 sZSoTBwvf2xDk807oA2huhZDra8fP8eaWRQBExPlpMeDE0WHWaNZ4uxf2/fB9Dw7FPNl
 Rh7A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=6aIDFEdgk3+VCdJyez1drWzoYmprL3hgm3LtaqeSacI=;
 b=dQf7N3w9BX6nBBk60/RmNba85QeHoW1ql4OYKyAW6oMxcEaQqPflPAuhg3/5RKRekr
 qseG9f6sefhPoFk/l/yu80ThwoF8q4lqGUvP0I+eaTxJ3NjbIktnDqOYY0X1ONZLuNpO
 xhbjnQFxH3nfta27t7AzH2FsBnt1AR5pAkrs0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=6aIDFEdgk3+VCdJyez1drWzoYmprL3hgm3LtaqeSacI=;
 b=RutO9ZT6tL1VyG3Mljg23EFDeQsLSJCSiNOFCEWlWSs/OdAJdMj/lKLbcqJHvhWuDZ
 M1dlyYrgUpKJ4BDjU3SCUxgoATzbcI9lKKRiQ8vDJNRYrs327gGBT5gttbYXZtFmOtq6
 f/jsP7lgv9U0OwFuaehPwrd6X6rBkGATLr4duoxfvydSRjI9nnjtJw4YITbKWDYHJF6H
 4OoLJLwtMWD0ZQqfSN0ZK9P0Efh9BWnthRkmO8gkanjpZG34XHgkfETSWG6NH3h9axvT
 lim/tDYmwaor/HhUt+ai864R25xxWMjjZIdb0kNE8nqtLMG0aVjIvn4/5Kp1NhXMXqJm
 7Efg==
X-Gm-Message-State: AD7BkJI8Q0nq/a4JFK3RrAsk8LnSCB4ytUZmawhHycE6TsTnfrfpW5OmmshG1UuWBaK7Qv5iyffzFL5zZUKstw==
X-Received: by 10.202.77.81 with SMTP id a78mr598784oib.71.1457578711570; Wed,
 09 Mar 2016 18:58:31 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.60.246.10 with HTTP; Wed, 9 Mar 2016 18:58:12 -0800 (PST)
In-Reply-To: <20160309103826.2b356b38@camb691>
References: <1456999831-12589-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1456999831-12589-3-git-send-email-openbmc-patches@stwcx.xyz>
 <20160309103826.2b356b38@camb691>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 10 Mar 2016 13:28:12 +1030
X-Google-Sender-Auth: PO9FzHHmmNhqlnGskb26jYQ3bR4
Message-ID: <CACPK8XeAhb6cXQT0hV4B9oXWO5+KYxZzX3u9+kXFWmMHuGWyXw@mail.gmail.com>
Subject: Re: [PATCH linux v2 2/2] hwmon: Hide error message in OCC hwmon driver
To: Cyril Bur <cyrilbur@gmail.com>
Cc: adamliyi <adamliyi@msn.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 OpenBMC Patches <openbmc-patches@stwcx.xyz>
Content-Type: text/plain; charset=UTF-8
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 10 Mar 2016 02:58:36 -0000

Hey Adam,

On Wed, Mar 9, 2016 at 10:08 AM, Cyril Bur <cyrilbur@gmail.com> wrote:
> Patch looks good. I'm not super sure the "ERROR:" string is needed in front of
> all the messages, I suspect it will be obvious. However I'm far more in favour
> of consistency ("ERROR:" everywhere) and you've done that so its fine with me.

These are good fixes. In addition to the fixes you have made and
Cyrils suggested improvements, you could perhaps better handle the
case where the host is powered off by detecting a lack of any i2c
response and aborting early.

Cheers,

Joel
