Return-Path: <emilyshaffer@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400d:c0d::229; helo=mail-qt0-x229.google.com;
 envelope-from=emilyshaffer@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="oq/pUJaN"; 
 dkim-atps=neutral
Received: from mail-qt0-x229.google.com (mail-qt0-x229.google.com
 [IPv6:2607:f8b0:400d:c0d::229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41kpyx5s4vzF3HK
 for <openbmc@lists.ozlabs.org>; Tue,  7 Aug 2018 06:24:24 +1000 (AEST)
Received: by mail-qt0-x229.google.com with SMTP id b15-v6so15378051qtp.11
 for <openbmc@lists.ozlabs.org>; Mon, 06 Aug 2018 13:24:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=erCcpoNMHN1shaMUGrKtzayFMsG9BzFwd9GoPvJZXc8=;
 b=oq/pUJaN2nlDpXOkIQM0JKpDXoAtrS5fLMtQdCfzvMvGJNTrxR7GxEnQee1K6hN/Vv
 mnHroYZOWmtsalrQZV+4r4iuVI6KQ6EhMlO1niys8HVvQLVTu3k3FWTLGXesQBDv2aSZ
 O3pxQYZWBzkud0bZv9T0KOo5fwlEUKGtMA5r0k0sXk/Iz4v9MH+ntAxyhcPHOHXdWtlh
 a5mWM2RBUM7GAFUniLYyWwfwOhzbbJAQQMu9zWqM5N18eyBYBbeQZ10u7PRXsJsZfKtN
 av3O88Raart+BT8rkCbztpAAFCux3IV4a+pqrIU/Jf74DO6VWFkndl5GzRfhmB2BGdcn
 saYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=erCcpoNMHN1shaMUGrKtzayFMsG9BzFwd9GoPvJZXc8=;
 b=MouPe4/hpsbkRyD5gyD2Rjff4X+U6Ubu9EdhFLim1DU5PpggVnw3ruECCmWEMDR50V
 lu+M3ujFZKYGbUp03hplb2ImIcRiFQ9jHb/7NBqTDu+ji81g1l8JiL1UFWODSOP93EQ9
 ZZvbfYlP09YaVEdD4VNN9vWJpQl08HViUpWwrn8qkJjjpDCGHJEYUMGNS/+bunFMY0RL
 L1jvhwWeA/lWdGWWiJftZGwFiaCbvnhuuG9Eq4Fz2K3yQ9vetc6NV9k1AFBiZntp8Z+E
 E+bRdDCfMt8gtt0T0uQWWOyBd/kCno0GPwFmUZJ15zTTpGwRPB2WQLZK/v7rBVi0awnk
 jrtA==
X-Gm-Message-State: AOUpUlGgoPjvI6W4xLEg7Eu4hx1qGPvYSMotFaVcABg9wRrqHz+ELrKu
 v1LTWz09xIEOnyoTvvGOmUUC6vKgBx1UFwcw/KbPDQ==
X-Google-Smtp-Source: AAOMgpe7/zBq1iUC6LC3hc8eq295dSwFgFOdMkjK+/scD1UhboSPdxnhdVItfZKqUKJox1YVt4YlZIqMvFmVvF9J/Ho=
X-Received: by 2002:ac8:404c:: with SMTP id
 j12-v6mr16099259qtl.333.1533587061722; 
 Mon, 06 Aug 2018 13:24:21 -0700 (PDT)
MIME-Version: 1.0
References: <827e3381-14bf-d5dd-96fb-8b27b71fa8d1@linux.intel.com>
 <CAO=notxco-y-56q5kCeqwjeOcjeJ5mpq_LGjY=SsBKfR+q3uUA@mail.gmail.com>
In-Reply-To: <CAO=notxco-y-56q5kCeqwjeOcjeJ5mpq_LGjY=SsBKfR+q3uUA@mail.gmail.com>
From: Emily Shaffer <emilyshaffer@google.com>
Date: Mon, 6 Aug 2018 13:24:10 -0700
Message-ID: <CAJoAoZkWg-xj-w-m4HumLowT_T8kF13zseZRuuA=GUFWyZq0UA@mail.gmail.com>
Subject: Re: Proposal to change sensor interface to use double values
To: Patrick Venture <venture@google.com>
Cc: James Feist <james.feist@linux.intel.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="0000000000000c89320572ca10b6"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 06 Aug 2018 20:24:27 -0000

--0000000000000c89320572ca10b6
Content-Type: text/plain; charset="UTF-8"

Same, I'm ok with this.

On Mon, Aug 6, 2018 at 1:09 PM Patrick Venture <venture@google.com> wrote:

> On Mon, Aug 6, 2018 at 12:10 PM, James Feist
> <james.feist@linux.intel.com> wrote:
> > I've submitted a change to modify the sensor interface to remove scale,
> and
> > make the sensor value a double. The main reason for doing this is
> > simplification of the interface. In most usages, daemons pull the value,
> and
> > the scale, then immediately translate this value to a double. This could
> > easily be done once by the sensor producer instead of all daemons. The
> > counter example that was given was phosphor-fan-presence, but doing a
> quick
> > grep I can't find scale being used, so this might mean for a scaled fan
> you
> > have to factor that in to all configuration files, or scaled fans aren't
> > supported. The threshold interface is not usable independent from the
> value
> > interface, as the thresholds are affected by the same scale. Using a
> fixed
> > scale also won't work well for a logarithmic sensor, while floating point
> > would. Realistic precision should not be affected for any common sensor.
> We
> > also in the future may be interested in a daemon producing a threshold
> for a
> > sensor that another daemon owns. With the scale existing elsewhere, this
> > would not be trivial to map.
> >
> > Review for context: https://gerrit.openbmc-project.xyz/#/c/11739/
> >
> > This change is not ready to be submitted as is, but we would like to
> hear if
> > there are any major objections. If not, we would like to start an upgrade
> > path to support both interfaces until it is possible to make the switch.
> > Bmcweb already supports both. In most cases this is just pulling the
> value
> > using a visitor, and setting the scale to 0 if it does not exist. Max and
> > Min can also be used for IPMI scaling.
>
> I'm fine with this.  It saves everybody converting it to a double
> before using.  Further scaling, which can be necessary can be further
> done against the double.  For instance, with ipmi, to fit a value we
> sometimes scale again.
>
> >
> > Thanks,
> >
> > - James Feist
> >
> >
>

--0000000000000c89320572ca10b6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Same, I&#39;m ok with this.</div><br><div class=3D"gmail_q=
uote"><div dir=3D"ltr">On Mon, Aug 6, 2018 at 1:09 PM Patrick Venture &lt;<=
a href=3D"mailto:venture@google.com">venture@google.com</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex">On Mon, Aug 6, 2018 at 12:10 PM, James =
Feist<br>
&lt;<a href=3D"mailto:james.feist@linux.intel.com" target=3D"_blank">james.=
feist@linux.intel.com</a>&gt; wrote:<br>
&gt; I&#39;ve submitted a change to modify the sensor interface to remove s=
cale, and<br>
&gt; make the sensor value a double. The main reason for doing this is<br>
&gt; simplification of the interface. In most usages, daemons pull the valu=
e, and<br>
&gt; the scale, then immediately translate this value to a double. This cou=
ld<br>
&gt; easily be done once by the sensor producer instead of all daemons. The=
<br>
&gt; counter example that was given was phosphor-fan-presence, but doing a =
quick<br>
&gt; grep I can&#39;t find scale being used, so this might mean for a scale=
d fan you<br>
&gt; have to factor that in to all configuration files, or scaled fans aren=
&#39;t<br>
&gt; supported. The threshold interface is not usable independent from the =
value<br>
&gt; interface, as the thresholds are affected by the same scale. Using a f=
ixed<br>
&gt; scale also won&#39;t work well for a logarithmic sensor, while floatin=
g point<br>
&gt; would. Realistic precision should not be affected for any common senso=
r. We<br>
&gt; also in the future may be interested in a daemon producing a threshold=
 for a<br>
&gt; sensor that another daemon owns. With the scale existing elsewhere, th=
is<br>
&gt; would not be trivial to map.<br>
&gt;<br>
&gt; Review for context: <a href=3D"https://gerrit.openbmc-project.xyz/#/c/=
11739/" rel=3D"noreferrer" target=3D"_blank">https://gerrit.openbmc-project=
.xyz/#/c/11739/</a><br>
&gt;<br>
&gt; This change is not ready to be submitted as is, but we would like to h=
ear if<br>
&gt; there are any major objections. If not, we would like to start an upgr=
ade<br>
&gt; path to support both interfaces until it is possible to make the switc=
h.<br>
&gt; Bmcweb already supports both. In most cases this is just pulling the v=
alue<br>
&gt; using a visitor, and setting the scale to 0 if it does not exist. Max =
and<br>
&gt; Min can also be used for IPMI scaling.<br>
<br>
I&#39;m fine with this.=C2=A0 It saves everybody converting it to a double<=
br>
before using.=C2=A0 Further scaling, which can be necessary can be further<=
br>
done against the double.=C2=A0 For instance, with ipmi, to fit a value we<b=
r>
sometimes scale again.<br>
<br>
&gt;<br>
&gt; Thanks,<br>
&gt;<br>
&gt; - James Feist<br>
&gt;<br>
&gt;<br>
</blockquote></div>

--0000000000000c89320572ca10b6--
