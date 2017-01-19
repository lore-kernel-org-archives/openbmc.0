Return-Path: <mine260309@gmail.com>
Received: from mail-qt0-x22c.google.com (mail-qt0-x22c.google.com
 [IPv6:2607:f8b0:400d:c0d::22c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3v3qZV2SrKzDqJs
 for <openbmc@lists.ozlabs.org>; Thu, 19 Jan 2017 14:48:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Ui+szs4l"; 
 dkim-atps=neutral
Received: by mail-qt0-x22c.google.com with SMTP id k15so46881921qtg.3
 for <openbmc@lists.ozlabs.org>; Wed, 18 Jan 2017 19:48:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=gxVn2OmDxcMJZyyGoS3w927Ko8wZIsFr6ad/vbrFEkw=;
 b=Ui+szs4l/ZOPaY4R1C1uT4C6tsqpeOttcxxsrSyTPFXcp6OrytWVLwUcrQuQe1pQlS
 Ws0lFM9WKX2f55vs0p4B9wwr2EfHnM1iFJ+ZEzo2XDV5/SgRnMxVPw9jk8zXXphKEgdm
 VTMpTK274+LBj7AC/H5BGYItcBG2PM6lMzsC3iY1FXK7Kfik2uFqTgQuLJ4VwnltWFnU
 LYwxRl2SsC28O1o4+JOO+aSPA38PGRRXrj50BXCGIt7ofpj39OuneBM1XkBlXRXGoxOo
 9Xk13wgRc2zvvDDgn14Z/nPqXCFf7BE16abUE6DoTmWnOGiOdW0w/O6MoDN7u5gjZhAJ
 JmZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=gxVn2OmDxcMJZyyGoS3w927Ko8wZIsFr6ad/vbrFEkw=;
 b=roahjhcSoU0uUs7FqM/iR5s3yYGcHGXxyCRjwhs/MbFsfoIJPMjjc5ATg5GoBPFwCX
 xLIS26RnkAQI+3tYGJ3zrCaYUYr12v3kQLjLLjG45jRcudFD5SG083lLNN23qLZ26CQn
 hU+XnaElOJkk3jirx25w116SBP8zXxQhG6cDto2pe8KmTcB2Qk+CQonHmdmJV5K0r5Ma
 sjFwOv+8CJoMx1DdhW3N1GF/s6MQgtP5zYH12CXnYl9+imhjseojVtHKJFYKosbslOQV
 dQ3Ugx3ILS2juQw458JAguWE9YEWQ+tJYKgiQNsq7bPQIwAEpef62JEG53BWZoCAa7xy
 WRng==
X-Gm-Message-State: AIkVDXKGDnmjGhvfGEnf1oqJpMf6g4RAblfn+g13eFcN5+HsoTXJgtXGXFlFoDc88vKcyTdbu0cdDX6X3fm6dA==
X-Received: by 10.237.47.33 with SMTP id l30mr6321837qtd.62.1484797728024;
 Wed, 18 Jan 2017 19:48:48 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.137.122 with HTTP; Wed, 18 Jan 2017 19:48:47 -0800 (PST)
In-Reply-To: <20170118144408.GA5120@heinlein.lan>
References: <CAARXrtkPMixp9M0SYyaeP4_j83mRRXNG1O2Tf24rL5OH6CbJvg@mail.gmail.com>
 <20170116194447.d3yzsldsu3qsl5sz@asimov>
 <CAARXrtnHD0s=dMKJwy_XqJ==cpamDiVPn8c4K=+ZPso1d0gSBg@mail.gmail.com>
 <20170118144408.GA5120@heinlein.lan>
From: Mine <mine260309@gmail.com>
Date: Thu, 19 Jan 2017 11:48:47 +0800
Message-ID: <CAARXrtmRRC0ix9cXbe=PKdmw_cs=Eend52A1NKy-9WGa0hJwRA@mail.gmail.com>
Subject: Re: RFC: new design of phosphor-time-manager on sdbusplus
To: Patrick Williams <patrick@stwcx.xyz>
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
X-List-Received-Date: Thu, 19 Jan 2017 03:48:51 -0000

On Wed, Jan 18, 2017 at 10:44 PM, Patrick Williams <patrick@stwcx.xyz> wrot=
e:
>
> On Tue, Jan 17, 2017 at 03:51:39PM +0800, Mine wrote:
> > On Tue, Jan 17, 2017 at 3:44 AM, Patrick Williams <patrick@stwcx.xyz> w=
rote:
> > > On Fri, Jan 13, 2017 at 03:42:50PM +0800, Mine wrote:
>
> > I should be meant to create two "instances" on the bus, eventually it l=
ooks
> > something like:
> > ```
> > xyz.openbmc_project.Time.Manager
> >     /xyz/openbmc_project/time/host_epoch
> >         org.freedesktop.DBus.Peer
> >         org.freedesktop.DBus.Introspectable
> >         org.freedesktop.DBus.Properties
> >         xyz.openbmc_project.Time.EpochTime
> >     /xyz/openbmc_project/time/bmc_epoch
> >         org.freedesktop.DBus.Peer
> >         org.freedesktop.DBus.Introspectable
> >         org.freedesktop.DBus.Properties
> >         xyz.openbmc_project.Time.EpochTime
>
> There isn't a reason to name the object path "epoch".  /time/bmc and
> /time/host0 is probably more appropriate.

OK.

>
> > > > And there will be no =E2=80=9Ccurr_time_mode/owner=E2=80=9D or =E2=
=80=9Crequested_time_mode/owner=E2=80=9D
> > > > properties on DBUS.
> > >
> > > So these are only stored in phosphor-settingsd now or are they also u=
sed
> > > internally for decisions?  I believe the previous implementation had
> > > them exposed more for debug purposes.  Are you going to add them to t=
he
> > > journal at least?
> >
> > Yes, the time_mode and time_owner are still stored in
> > phosphor-settingsd, and they
> > are used internally by phosphor-time-manager, which will register
> > callback for the
> > settings' change and handled accordingly.
> > The difference from the previous implementation is that we do not expos=
e these
> > settings in time-manager's DBus now.
>
> There are two aspects for consideration here:
>
>     1. The current time manager defers changing the host policies until
>        the next boot.  We need to continue this behavior.
>
>     2. If the process restarts we need it to go back into the "current
>        state" and not the "requested state".  How do we make this
>        happen?  The current implementation might also have a flaw here
>        so maybe we log it as an issue for follow up.
>

This is the part I did not understand well on the previous "requested"
and "current" mode.
My consideration/question (for previous code) is:
It has two settings of time mode/owner, one in settingsd, the other in
timemanager, then
which service is *really* responsible for the setting?
E.g. if current time owner is BMC, and mode is NTP,. when settingsd
set time owner to HOST:
1. timemanager save the owner to requested_owner;
2. If host is off, it defers the change, then:
   * In settingsd, owner is HOST, mode is NTP;
   * In timemanager, current owner is BMC, requested owner is HOST, mode is=
 NTP
   It's kindly of complicated and confusing;
3. If host is on, it sets the owner to HOST, and change the mode to
MANUAL (it has specific
comments to indicates that HOST and NTP are exclusive), then:
   * In settingsd, owner is HOST, mode is MANUAL;
   * In timemanager, current owner is HOST, requested owner is HOST,
mode is MANUAL
   So changing settingsd time owner also affects settingsd mode.
   It looks as if timemanager is responsible for the setting.

I feel this piece of logic is too complicated, it's better that we
simplifies it:
1. Enforce that settingsd is the owner of settings, timemanager shall not m=
odify
    settingsd's settings, but only register callbacks on changes.
2. Combine the time mode/owner into:
   * BMC_NTP  =3D=3D> Both Bmc/Host Epoch return the same time as BMC's NTP=
 time;
                              Setting epoch is not allowed
   * BMC_MANUAL =3D=3D> Both Bmc/Host Epoch return the same BMC time;
                                    Setting BMC epoch is allowed,
setting HOST epoch is not allowed
   * HOST_MANUAL =3D=3D> Both Bmc/Host Epoch return the same HOST time;
                                      Settings BMC epoch is not
allowed, settings HOST epoch is allowed
                                      (It looks like BMC_MANUAL and
HOST_MANUAL can be merged as MANUAL?
                                       since they are actually the same)
   * SPLIT_NTP  =3D=3D> Bmc and Host Epoch are separated;
                                BMC uses NTP time, and setting is not allow=
ed;
                                Host epoch can be get and set;
   * SPLIT_MANUAL =3D=3D> Bmc and Host Epoch are separated
                                      Both can be get and set.

What's your opinion?

> > What do you mean by "add them to the journal"?
>
> Use phosphor-logging.

Yes, the code uses phosphor-logging to send log to journal.

>
> --
> Patrick Williams
