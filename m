Return-Path: <geissonator@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::22b; helo=mail-oi1-x22b.google.com;
 envelope-from=geissonator@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="mOts0rZ/"; 
 dkim-atps=neutral
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4480Bx1zVSzDqNl
 for <openbmc@lists.ozlabs.org>; Wed, 27 Feb 2019 00:33:44 +1100 (AEDT)
Received: by mail-oi1-x22b.google.com with SMTP id g16so10327472oib.1
 for <openbmc@lists.ozlabs.org>; Tue, 26 Feb 2019 05:33:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=SKgnaJw+5hce81Gpv48h7V5F5I8KbpvgL4cyNlxTiOo=;
 b=mOts0rZ/rE8PVL8r1xnFXYly2U1v8JCv1kS+zmJ2O/BUC1XsaOkqgXZEJ0Mb6Qb8GG
 llXeIBMgEMZSVftcCiClpnn2XfN1DYc8yK59umUMfAO3OzeWarQ4DcVZk3zYNlctidup
 l3xJEjTOfAgSNg0bbVihKIHZTUx/jlqBxpteZ8FtsaTHVYiyXOu1TRuNeSj4iBm59aQG
 bctOB3Sda0STo1rsSv0DfTzo1yXLyr5x5V992QRYjqRHc++D5Sj3oRUw80hT737yh+PR
 HzzCy3EAOIanyCZcp/seOsTEHPsQ8iTPz6ZsuL5RaCvYs+obAQAguy9rHqSxrUMTsAuY
 zaeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=SKgnaJw+5hce81Gpv48h7V5F5I8KbpvgL4cyNlxTiOo=;
 b=K2GAgPAApO80vnYXK84AC2k7gIan1KtVGiaACCJX+P6Tn6YEzQq7rN+LqWx4wVWPgv
 Q7hIFIYQ8fopdMzSkVwCAhHtx4F03sb15JJq5HAfrwv2hjBzHAf4g2jzSDaCkZC2BXNj
 +S9po6Utmk62xkQgyH/M3N2t7wLhzZ0h4G+BWByb8pTtg5quVba1rNIG6PcokLT4WLh6
 m9B+ql1es14NNes363mt+doWVgM0JY7ri26NvTi4DXrLXPT2oXbF22U5EMWt4Axlq8rB
 o4dxHYW80B5+a717ZIVgj8d04CwOD9ICkZq2B18xTOMY0ucJEuSNGYnX0oXAWKjJDByL
 Dgzg==
X-Gm-Message-State: AHQUAua66GbOlQpUH2H+PbTHU0qahbB3b2puYUzMNolBQNPbUAE17qiM
 UaGFkVd/llpuvS9QN82vA7rAc069sqTxVPqifhVcVzDU
X-Google-Smtp-Source: AHgI3IbEbOYKwN0QqRZu/jnbPdjk1CFKFqnz2b4yuifwyViIMQquuhnM6b2MuUvFRV8jbeiYWyqTWWMScIr8GIge0nQ=
X-Received: by 2002:aca:cd:: with SMTP id 196mr2272181oia.42.1551188021386;
 Tue, 26 Feb 2019 05:33:41 -0800 (PST)
MIME-Version: 1.0
References: <517b868d.6e48.16928e5d24c.Coremail.fyczy@126.com>
In-Reply-To: <517b868d.6e48.16928e5d24c.Coremail.fyczy@126.com>
From: Andrew Geissler <geissonator@gmail.com>
Date: Tue, 26 Feb 2019 07:33:25 -0600
Message-ID: <CALLMt=p7NYz6FUY1oFkp=xVEA7RqVGBBPnEYFNHGBwpw8ogFOA@mail.gmail.com>
Subject: Re: couple questions for DBUS
To: George Liu <fyczy@126.com>
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 26 Feb 2019 13:33:46 -0000

On Tue, Feb 26, 2019 at 2:22 AM George Liu <fyczy@126.com> wrote:
>
> Hi All:
>     Customize the Dbus interface, add a new dbus object after receiving t=
he message via the yaml file configuration method, use busctl introspect co=
m.xxx.xxx /com/xxx/xx/xx/xx is correct, but use mapper get-service "/com/xx=
x/xx/xx/xx" prompt Error finding '/com/xxx/xx/xx/xx' service: No such file =
or directory
> Thanks!
>
A couple things to try. First ensure mapper is working as expected
with a command
like this:
  mapper get-service /xyz/openbmc_project/state/host0
  xyz.openbmc_project.State.Host

If you're new dbus object is not using the default  object base then
it's probably
the whitelist mapper feature (mapper ignores anything not on it's list).
Take a look at /etc/default/obmc/mapper

Here's the relevant field from our witherspoon system in that file:
MAPPER_INTERFACES=3D"xyz.openbmc_project org.openbmc
org.freedesktop.DBus.ObjectManager com.ibm org.open_power"

Andrew
