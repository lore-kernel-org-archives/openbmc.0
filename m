Return-Path: <mine260309@gmail.com>
Received: from mail-qt0-x234.google.com (mail-qt0-x234.google.com
 [IPv6:2607:f8b0:400d:c0d::234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3v2j3d6vVtzDqQ3
 for <openbmc@lists.ozlabs.org>; Tue, 17 Jan 2017 18:51:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="qJnlgBwU"; 
 dkim-atps=neutral
Received: by mail-qt0-x234.google.com with SMTP id l7so143224350qtd.1
 for <openbmc@lists.ozlabs.org>; Mon, 16 Jan 2017 23:51:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=vMSGa6bBKORNVy40D3gAqYl9IrW1mkDRcSU7SzcWWBo=;
 b=qJnlgBwUrbbmde4iJQtP9BPqVg8VCGAEP7LN08NhwxWLchEGqR05amuoG2lIGgCHIC
 YhUgZkzM7WJDCmlRzbmWwcclADoP7+9BetQPiI0CuMQYltuU1xMbMJgJAo5xhdyUUZfj
 FGhBX0aEYs+tEKKtemT5X2zoOagyQ/jnKbumfkFot+v2iyx6mkSawVXgmg4M/yUZ340h
 jQAzSSg+AXUw8EqPqzKCDCoKRsdkSet/4kBjS2u0h0CW8UDBQyLCJubQiRevRuemGDaD
 xS6cD7FMIESp5Ic8UX/1FMCOnQU/zrMV0J4a/APKHJZXvxrgCOj4UkmIeeiG5Q4Rn3Ko
 Bj4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=vMSGa6bBKORNVy40D3gAqYl9IrW1mkDRcSU7SzcWWBo=;
 b=K9j/xiJpsCwsjc0Z8oYp+Pb4la5dIALd+HXMGl+spgIhvdWHl5gYeeRMKuTdojG7kG
 KMUjKCA9Qo5dvjCTDqlPOSPGpX7Q30dbSI5whtSh+6c8ljMOjZTS+4osu4IS60/YnxH8
 iyAFAUC1yZJwyPElhvhzMFEkIWqj38nOWu1rsUT+84e1Xr0WF5O1hn80cj/aWy6aoIVf
 uxovW6/lvJyidDw1sS7cAJ9syzJtXfEGWJbB524d6M43USTpFxmE7OfBB/CzN91UJioV
 nbWJWN+iWZZEBzcBEcoG7iT2I3G3QmRt+453nQJannql0TOWxwnU0M2kL53nIDWSJqsW
 Wr7w==
X-Gm-Message-State: AIkVDXINXKZIT1xiwBkj0ir2efaxaK9+FxbNXvOb3RGOIiJSKRB/fSuH5DAkM6cYVVNlE7AkzXJY8AKKfeFtWA==
X-Received: by 10.237.46.103 with SMTP id j94mr31393122qtd.103.1484639499642; 
 Mon, 16 Jan 2017 23:51:39 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.137.122 with HTTP; Mon, 16 Jan 2017 23:51:39 -0800 (PST)
In-Reply-To: <20170116194447.d3yzsldsu3qsl5sz@asimov>
References: <CAARXrtkPMixp9M0SYyaeP4_j83mRRXNG1O2Tf24rL5OH6CbJvg@mail.gmail.com>
 <20170116194447.d3yzsldsu3qsl5sz@asimov>
From: Mine <mine260309@gmail.com>
Date: Tue, 17 Jan 2017 15:51:39 +0800
Message-ID: <CAARXrtnHD0s=dMKJwy_XqJ==cpamDiVPn8c4K=+ZPso1d0gSBg@mail.gmail.com>
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
X-List-Received-Date: Tue, 17 Jan 2017 07:51:42 -0000

Hi Patrick,

On Tue, Jan 17, 2017 at 3:44 AM, Patrick Williams <patrick@stwcx.xyz> wrote=
:
>
> On Fri, Jan 13, 2017 at 03:42:50PM +0800, Mine wrote:
> > New Design
> >
> > Create two objects:
>
> You mean 'classes' or 'objects'?  I think you mean two classes, which
> initially we will only have 1 instance of each.  Please make sure the
> HostEpoch implementation can relatively-easily be enhanced to have
> multiple instances.

I should be meant to create two "instances" on the bus, eventually it looks
something like:
```
xyz.openbmc_project.Time.Manager
    /xyz/openbmc_project/time/host_epoch
        org.freedesktop.DBus.Peer
        org.freedesktop.DBus.Introspectable
        org.freedesktop.DBus.Properties
        xyz.openbmc_project.Time.EpochTime
    /xyz/openbmc_project/time/bmc_epoch
        org.freedesktop.DBus.Peer
        org.freedesktop.DBus.Introspectable
        org.freedesktop.DBus.Properties
        xyz.openbmc_project.Time.EpochTime

```
The service's BUSNAME is still `xyz.openbmc_project.Time.Manager`, and
it creates two objects, one for BmcEpoch and the other for HostEpoch, who
both implement xyz.openbmc_project.Time.EpochTime interface.

>
> >    - BmcEpoch
> >    - HostEpoch
> >
> > They both implements EpochTime interface.
> >
> > For BmcEpoch:
> >
> >    - When elapsed() is called, return BMC time;
> >    - When elapsed(us) is called, use above SetTime(=E2=80=9Cbmc=E2=80=
=9D) logic
> >
> > For HostEpoch:
> >
> >    - When elapsed() is called, return HOST time;
> >    - When elapsed(us) is called, use above SetTime(=E2=80=9Chost=E2=80=
=9D) logic.
>
> Seems ok.
>
> The errors also need to be converted to dbus-defined errors, right?
>
> > And there will be no =E2=80=9Ccurr_time_mode/owner=E2=80=9D or =E2=80=
=9Crequested_time_mode/owner=E2=80=9D
> > properties on DBUS.
>
> So these are only stored in phosphor-settingsd now or are they also used
> internally for decisions?  I believe the previous implementation had
> them exposed more for debug purposes.  Are you going to add them to the
> journal at least?

Yes, the time_mode and time_owner are still stored in
phosphor-settingsd, and they
are used internally by phosphor-time-manager, which will register
callback for the
settings' change and handled accordingly.
The difference from the previous implementation is that we do not expose th=
ese
settings in time-manager's DBus now.

What do you mean by "add them to the journal"?

>
> --
> Patrick Williams
