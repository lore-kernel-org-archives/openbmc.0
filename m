Return-Path: <emilyshaffer@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::835; helo=mail-qt1-x835.google.com;
 envelope-from=emilyshaffer@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="knqT9sJV"; 
 dkim-atps=neutral
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com
 [IPv6:2607:f8b0:4864:20::835])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44TKKb5h1DzDqBN
 for <openbmc@lists.ozlabs.org>; Wed, 27 Mar 2019 05:24:35 +1100 (AEDT)
Received: by mail-qt1-x835.google.com with SMTP id w30so15766189qta.8
 for <openbmc@lists.ozlabs.org>; Tue, 26 Mar 2019 11:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=3WfImMZ+Y4yJwLSaZQMEcRYTA2CAp9zXrkqb62orv1Y=;
 b=knqT9sJVhkrAKdeErlFBgdHyHI1PheePpLewT78s206RA+sqz8yukzIEejnIzeIgbE
 qGpNjRl/qFOo/RQuyTWBF0Sfi/PRVIuX2yLhLXim5vaJN/9Gx7OBQ6DpSjnW11hKMgr8
 RqVz7VEpEjgr21Sz/YcrQb95TfgwKygjHddYwatWady0k7OsUdxZI98at4UTyXw7uAGf
 7yOE1V3uQjg6XG47q4KiGIrUxiVlkTNMEXDqiZbYxRVM8c2Lhu2UyeUEoiU4s6kDucn/
 YzSijJyTHYHzIU2CwRgY55SJPz3/K/wbo/wVEtPSuq0McBtU9ULlx230macBvPvup0p/
 d+fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=3WfImMZ+Y4yJwLSaZQMEcRYTA2CAp9zXrkqb62orv1Y=;
 b=SMJJCMcivBbLGksIaVcbCTbvB7RovZsBAlhprguKdTpYjidl7G0bAyji1pDwqIyh95
 9X8AtNGL06T7jGXYrAl1ahJm0VqmHFeJFScI4jGLKRRkihQW3+OkaPO9qWtgoWsx3E9x
 L3qjOeFTxF20kYUj9RsaSjcZMwJDMwlpq2mZ+zE2NUlcn7DBleJhN01ydWVhBm83WVe/
 S7VbA2U0jin51aLEUtqJOEG4mVBdqeCAsUhk3eSR44euRLQAWGzBEZitwpIxwH0jp1Ju
 xWeDhoGtYY6bWiuJ2KfqQKknQc7BKV2Giydyp5c8CHE8tU8uc7ijaLgxCcMTzfsrmbvX
 Uj2Q==
X-Gm-Message-State: APjAAAV3ED52CAldBCHFfby+dr4861CJShs5S/FHRa2SVjAEAyUQCoZ0
 CmVVsagZ74zzZ4ijX+clhzUbCmuBpZLkdgz1eSfZOw==
X-Google-Smtp-Source: APXvYqzPuGypuBdd6/Wqwl8vjd5ZVii62ie8EyrPGpLPFS6pikCiP5eGWTQCqzpcvRNYV7MlSWbRuaAqENjau7FPvCw=
X-Received: by 2002:a0c:9121:: with SMTP id q30mr21976742qvq.94.1553624672077; 
 Tue, 26 Mar 2019 11:24:32 -0700 (PDT)
MIME-Version: 1.0
References: <e031e16dfaee4709825bce55601317c2@quantatw.com>
 <CAJoAoZ=b1MZsqBrE1vNEEpBPsNtta5D6qJuqDp-QOk=DROMZJQ@mail.gmail.com>
In-Reply-To: <CAJoAoZ=b1MZsqBrE1vNEEpBPsNtta5D6qJuqDp-QOk=DROMZJQ@mail.gmail.com>
From: Emily Shaffer <emilyshaffer@google.com>
Date: Tue, 26 Mar 2019 11:24:20 -0700
Message-ID: <CAJoAoZk6-dpEczjEKOyP28D9hUms6+LaXbsXxn8XDZHtRtCRWg@mail.gmail.com>
Subject: Re: discuss buildjson code
To: =?UTF-8?B?SGFuayBMaW91ICjlionmmYnnv7Ap?= <Hank.Liou@quantatw.com>
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
X-List-Received-Date: Tue, 26 Mar 2019 18:24:36 -0000

Speaking of making it easier on people, you could have also phrased
this concern as simply a commit to phosphor-pid-control. :)

On Tue, Mar 26, 2019 at 11:23 AM Emily Shaffer <emilyshaffer@google.com> wr=
ote:
>
> Hank,
>
> It looks like you're talking about this file:
> https://github.com/openbmc/phosphor-pid-control/blob/master/pid/buildjson=
.cpp
>
> Please include at least the project name and even better the source
> code link in the future. OpenBMC has >100 individual repositories and
> it's a lot to ask someone to identify a piece of code by the relative
> filepath within a project.
>
> You can also use the Blame button within github to show who made the
> changes at the lines you're worried about. I can see that pstrinkle
> (venture@google.com) just made the fix after reading your email today,
> though. https://github.com/openbmc/phosphor-pid-control/commit/e3eeef45a7=
22b57d4c3bb379df165e0bd14993bd
>
> As a rule of thumb, in the future when you write the list, please give
> as much information as you can to make it easier on people reading :)
>
> Emily
>
> On Mon, Mar 25, 2019 at 11:34 PM Hank Liou (=E5=8A=89=E6=99=89=E7=BF=B0) =
<Hank.Liou@quantatw.com> wrote:
> >
> > Hi all,
> >
> > I am reading at the source code of /pid/buildjson.cpp. Is there an erro=
r in line 59 and 69? To be precise, I think j should be p since only p has =
elements positiveHysteresis and negativeHysteresis.
> >
> > Sincerely,
> >
> > Hank Liou
> > Quanta Computer Inc.
>
>
>
> --
> Emily Shaffer



--=20
Emily Shaffer
