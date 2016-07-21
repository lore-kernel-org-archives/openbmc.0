Return-Path: <joel.stan@gmail.com>
Received: from mail-qt0-x22f.google.com (mail-qt0-x22f.google.com
 [IPv6:2607:f8b0:400d:c0d::22f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rwKCk1svJzDqVF
 for <openbmc@lists.ozlabs.org>; Fri, 22 Jul 2016 02:36:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=zKQEBrg/; 
 dkim-atps=neutral
Received: by mail-qt0-x22f.google.com with SMTP id u25so47058547qtb.1
 for <openbmc@lists.ozlabs.org>; Thu, 21 Jul 2016 09:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=IcbFz9JPRTS4ZEPc7afjHXJrbqZGzTEW42R8arJy1IU=;
 b=zKQEBrg/fjyC2qG1JOlzpUGsKCAYgI434WsN8Q0UugLEMvoEQnglYH/iu0kz73wu0M
 gwpwqIliEPYjM3hRhSJGLzOQqJAD5RcxDDnClqFBhITbWmYyiINj0+iwRU29cD4cvF10
 VMd4QSjeyNRZ3AHoh3wwYQReY6JMcFuJQudPjI76FpvfKL2j8RwP3inAEsH0pkhxXzBb
 N7DGGmzd6R4Peik2FSFxpvFIl+VUWDsd108fFsBhfmUDtNJhyjCtnAECNtErkZqujrDY
 tMR4wdtTUoe8djD1jDTSo8/ATheJDyyLWH1jOoltygq1JyIOWJD2IgWa8cY9siSd1wfK
 tLig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=IcbFz9JPRTS4ZEPc7afjHXJrbqZGzTEW42R8arJy1IU=;
 b=XAp39D+anCKNNP3148y3VT40YFoKX///BFBKsdlYENtKNxQ9DtJhHvUOnNnMpMy7vP
 gknoxnvBSoGN5nAEUXURCT+OdFZbpYiQNfWGgz7+tdYwglGhzG4kjLlZLHhszeoyw74W
 rbUC73663RNlVeFv+vquSsX1Ndhw+aaWj09TGU6dgnIFaEy1SCpt3JCBbtXFVo5XAyBg
 u3d5rPzhernlP9KyQuxhFKsuZCMaOStLHKZeal/FJmzUbbw7A4WQ+GQnsxTEI0RpmLpa
 QCvyZB3T6enXh6lW4GklOUCoq0WWwSVL2RgJSWwyW2zMspnO+CG1ZpVRcfX9PYJFr8Tj
 S+7A==
X-Gm-Message-State: AEkoouszVArPy/J5GhxbIdnUpzR4X17MEmw3s1ervvaEp60QIgbJ1Mk/54toLKeMbqOfUcEVnXm5sIzZykygvQ==
X-Received: by 10.200.44.213 with SMTP id 21mr11700982qtx.91.1469118959267;
 Thu, 21 Jul 2016 09:35:59 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.237.37.141 with HTTP; Thu, 21 Jul 2016 09:35:39 -0700 (PDT)
In-Reply-To: <DB4PR05MB0941FC06CBEC427C99A40C80D5090@DB4PR05MB0941.eurprd05.prod.outlook.com>
References: <DB4PR05MB0941FC06CBEC427C99A40C80D5090@DB4PR05MB0941.eurprd05.prod.outlook.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 22 Jul 2016 02:05:39 +0930
X-Google-Sender-Auth: bg1hqGZY-e8poywojxzVW-7H75k
Message-ID: <CACPK8Xf-jSXs=EcF3tQrC7xeFkKXOhXxPxz=6pBQ9408-uhcHA@mail.gmail.com>
Subject: Re: Aspeed 2500 EVB i2c transaction time out
To: Shay Slobodkin <shays@mellanox.com>
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 21 Jul 2016 16:36:02 -0000

Hello Shay,

On Thu, Jul 21, 2016 at 8:26 PM, Shay Slobodkin <shays@mellanox.com> wrote:
> Hi,
>
> We faced an i2c transaction time-out issue on Aspeed 2500 EVB board.
>
> It happens when we try to connect on board LM75 at 0x4d driver to bus 7.
>
> We used https://github.com/openbmc/linux/tree/dev-4.6 kernel and also tri=
ed
> https://github.com/shenki/linux/tree/dev-4.7 kernel.

I know that communication with the lm75 does work - I've had it
working here on a my ast2500evb-ddr4.

The state of these two kernel trees is not great at this time. I plan
to push a new tree next week based on the released 4.7 kernel with our
new pinmux driver, which is the correct way to ensure pins are
configured correctly.

If you can wait until then you should have more success. Sorry for the hass=
le.

Cheers,

Joel

>
>
>
> We also tried to change i2c timeout counter (I2CD08) from 3 bits to 5 bit=
s,
> according to Aspeed AST2400 to AST2500 migration guideline, but it didn=
=E2=80=99t
> help.
>
>
>
> Is that a known issue?
>
> Is there a known solution you can point us to?
>
>
>
>
>
> Thanks for the assistance,
>
> Shay
>
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
>
