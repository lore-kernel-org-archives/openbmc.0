Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4010:c07::231; helo=mail-lf0-x231.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="NoHDUOXZ"; 
 dkim-atps=neutral
Received: from mail-lf0-x231.google.com (mail-lf0-x231.google.com
 [IPv6:2a00:1450:4010:c07::231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yWJ4x1GfszDr5T
 for <openbmc@lists.ozlabs.org>; Tue,  7 Nov 2017 16:33:52 +1100 (AEDT)
Received: by mail-lf0-x231.google.com with SMTP id a16so13067966lfk.0
 for <openbmc@lists.ozlabs.org>; Mon, 06 Nov 2017 21:33:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=jureeQMGRc2ybqt9p0FyVjCaEHvoD6cWF22m8BaRyqY=;
 b=NoHDUOXZC8wzUhPnCuOPLNN52BHFsqnqOchW5Nh9gCaknCWJVBuXcuBrQov84I+6fV
 SUY2tm1hlj2V8UWVNpqOiV331S6iKO1UrfeVi9fIV2TWd/7/3T9Ch7zuFc+D5VIqsaa3
 SfqSsXyXthMIqwvCIksXCwWAwLI4YSPLZlcIwLfbMPBkt0eychy+2so3n8TnSaljRGa4
 kbP8dArrssI5rzmdDyDj7oGPO3UYxlQb5WVizMVnUGUPmllC/N+6jvV3TjfZ53M0KJFR
 0Hm+G796zQtWeEU8mGYnNsl1cVw04AyfSvZ2PvGjbzd8V9lvKFfYFCxzoxrMgqTKIZOz
 RflA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=jureeQMGRc2ybqt9p0FyVjCaEHvoD6cWF22m8BaRyqY=;
 b=ohIiCHFo6oU97WjmBR4f2HYlJHBOsbgyRnKI11RIV0KPLf+bWTOFIxOeI9yr0y9Ant
 76Y+a+Z+cGdhHC/AS/5bgNYnN09Ptq8TfmYIeGyccMAGEvUmagYSyO0cmnV+RELY7UaQ
 FX+PUQsUdOP/4D7yJL5ZEpOGz5f2LRy7Pcl6AlY6uY3Vj/Qj3FEYyha2wkgR6OREIua2
 2gGUdV/38bO2X+hoa/fi9lYMvpP4JktiA7sL3wWgRsO5qTVC2jgqLGwyGCpZhG3Jstk5
 2bkszrWXkdK5kBi7ffnQ7pTrEW2dFsq9oXrLLSt+FxP7TpqztzRXaKBFR3cz6n0f0vwi
 hiHw==
X-Gm-Message-State: AMCzsaVI2RTC2BFyjyvHqYSRhoWNve3V/RpA8MQPiTJOVKk2HSYlGlfx
 o0RbFIYfQARVIV1TwBrTaxf8CAAuli7mGFr+5oiCgqbQ
X-Google-Smtp-Source: ABhQp+SkmWAh71y/n3TltAUfNxoDXyeMKnRFOf5WvzhXU8OlzuHJFAiZjSZMlv19j2PT8juFqojIvHGfDnCZes8Jkpk=
X-Received: by 10.46.91.203 with SMTP id m72mr7266136lje.166.1510032828722;
 Mon, 06 Nov 2017 21:33:48 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.25.195.71 with HTTP; Mon, 6 Nov 2017 21:33:28 -0800 (PST)
In-Reply-To: <611925BD-F55E-4C9E-9BA0-51B771699D1A@fuzziesquirrel.com>
References: <611925BD-F55E-4C9E-9BA0-51B771699D1A@fuzziesquirrel.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 7 Nov 2017 16:03:28 +1030
X-Google-Sender-Auth: gu2j-79g1Zk9Bd2u6BaKeUZzELc
Message-ID: <CACPK8Xcm_W36Fs8zYp9J3coQZM71g3Dw3nJPDD_9cC0NKByFNQ@mail.gmail.com>
Subject: Re: OpenBMC 11/6 community telecon - Minutes
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: OpenBMC <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 07 Nov 2017 05:33:54 -0000

On Tue, Nov 7, 2017 at 3:00 PM, Brad Bishop <bradleyb@fuzziesquirrel.com> w=
rote:
> Discussed OpenBMC release support model.
>    - Currently strive to use stable releases from component projects (Yoc=
to,
> Linux) - have not always succeeded in practice.
>    - Work to do beyond this to establish a model.
>    - Backport security fixes directly upstream to Yocto, not OpenBMC,
> whenever possible.

I've posted some more detailed thoughts to the list on this topic:

 https://lists.ozlabs.org/pipermail/openbmc/2017-November/009843.html

> There was a question if anyone has ever run a security scan against OpenB=
MC.
> Yes - an example can be found here:
> https://github.com/openbmc/openbmc/issues/1229
>
> linux.conf.au in January.  Attend to learn about OpenBMC and OSS in gener=
al.

Please come! The OpenBMC kernel team will be there, along with other
contributors: both the ones you know, and future potential
contributors.

 https://linux.conf.au/  22-26 January 2018, Sydney, Australia

 https://rego.linux.conf.au/schedule

I will organise a BoF session during the week to chat about OpenBMC.
If there's enough interest we can look at spending a day before, after
(or during?) the conference to talk shop.

> Please let me know if anything is inaccurate or I=E2=80=99ve missed somet=
hing.

Thanks for taking minutes Brad!

Cheers,

Joel
