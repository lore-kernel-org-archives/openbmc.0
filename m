Return-Path: <joel.stan@gmail.com>
Received: from mail-ua0-x241.google.com (mail-ua0-x241.google.com
 [IPv6:2607:f8b0:400c:c08::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ssqnN0l9BzDrc1
 for <openbmc@lists.ozlabs.org>; Mon, 10 Oct 2016 17:23:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=TOoGW4OR; 
 dkim-atps=neutral
Received: by mail-ua0-x241.google.com with SMTP id m26so3680480uaa.2
 for <openbmc@lists.ozlabs.org>; Sun, 09 Oct 2016 23:23:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=W7WJgQwwwXF/JA8KiMMvFRPd9Vy7uLEA38dwGeCPi/k=;
 b=TOoGW4OR2vf7S6AicpDCLpBSzPxQJ5+qgx9HIdU9MqkfnMlS2TavHsLdsjwvxpeSmt
 KNS0qcTumFZUKFuds3W+5A9i2kfWfTAsXkKVwrLiGlVVRLKrLw9MqrXbP5nDTTwEqv+Y
 jL+lStPgGy6OKuv/Q8BCAo5BmM+R0lk2YfKpK5oEv/SZznDtOd3DA9EeacUXwIJ0b4dj
 xeidntLTGybH9EwNWJ44Eu08GhUb+C+Ud+Ul6ve8s0Viz2k6l/k9khqXlr6zsWwzANUQ
 TMqC6513CGpy3/rYbl0CnL5UHCwQSH103xVYvNmtSWaMGGFkrkfG9tYYVktOv423x8Fd
 LU2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=W7WJgQwwwXF/JA8KiMMvFRPd9Vy7uLEA38dwGeCPi/k=;
 b=JrYdd8yZQf9UdPJW1VpPbYcs7VBwrZ95+qRRHC5/OC+448r34ILal8FqyauAmWzFjD
 wn6Gx0km5Ovbw8YNpMxxNlOMHwlCc4Y/8BKmd0pUlwDnm4KMTeC5XdfcVpjiZL8wD4ak
 GPbLv8TCHbGcGv1tgh7shAwPMDUQRdQh5kTEyGXglkYi3KpbrTuqaQgUuClY32IyNjlx
 oSe00lx9GlNY/5qO7Minw5OrtV4ub/lx8OCioBisN1VYt38RHA9i0yY0SAH+UgdwvVP8
 kDIOU6xmhszSpJz7JSQdw4kFZRzuSfVYXQwa5Q65lqJTenPMoq0ncUDCUYJGtlSTducm
 /dvw==
X-Gm-Message-State: AA6/9Rks8ub+aC8FOsZKfoYNJaq5GlIj3zMcDqjmbaNsURwe9nockK/xjwPeCRAKVRbw7Mxr5HwLsgiulM9PwQ==
X-Received: by 10.176.81.56 with SMTP id e53mr21656434uaa.160.1476080598236;
 Sun, 09 Oct 2016 23:23:18 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.176.7.8 with HTTP; Sun, 9 Oct 2016 23:22:57 -0700 (PDT)
In-Reply-To: <1475789205-19618-7-git-send-email-clg@kaod.org>
References: <1475789205-19618-1-git-send-email-clg@kaod.org>
 <1475789205-19618-7-git-send-email-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 10 Oct 2016 17:22:57 +1100
X-Google-Sender-Auth: MuMCUvzOFxrlS-tEwerk1ZXAPmc
Message-ID: <CACPK8Xcv4EnXoRg9Lf1Mu4i8S7eSNH=yV96x=KN2=L=Ts0wvPw@mail.gmail.com>
Subject: Re: [PATCH u-boot 06/12] aspeed: timer cleanups
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
X-List-Received-Date: Mon, 10 Oct 2016 06:23:20 -0000

On Fri, Oct 7, 2016 at 8:26 AM, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> The code should not use static as it is relocated at init time. Also
> add some definitions on the bits used to configure timer 1.
>

Unrelated to this patch; would reusing the Linux driver in u-boot be a
good idea?

> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  arch/arm/mach-aspeed/timer.c | 21 +++++++++++++++++----
>  1 file changed, 17 insertions(+), 4 deletions(-)
